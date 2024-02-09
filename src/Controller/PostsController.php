<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\Image;
use App\Form\PostType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use DateTime;
use App\Service\FileUploader;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;
use App\Security\PostVoter;
use Symfony\Component\HttpFoundation\File\UploadedFile;

#[Route('/post')]
class PostsController extends AbstractController
{
    private $authorizationChecker;

    public function __construct(AuthorizationCheckerInterface $authorizationChecker)
    {
        $this->authorizationChecker = $authorizationChecker;
    }

    #[Route('/new', name: 'app_posts_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, FileUploader $fileUploader, SessionInterface $session): Response
    {
        // Vérifiez l'accès en utilisant le Voter
        $this->denyAccessUnlessGranted(PostVoter::NEW , new Post());

        $post = new Post();
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $post->setAuthor($this->getUser());

            $images = $form->get('images')->getData();

            foreach ($images as $image) {
                $imageFilename = $fileUploader->upload($image->getUploadedFile());
                $image->setLink($imageFilename);
                $image->setPost($post);
                $post->addImages($image);
            }

            $videos = $form->get('videos')->getData();

            foreach ($videos as $video) {
                $post->addVideos($video);
                $video->setPost($post); // Assurez-vous que la vidéo est associée au post
            }

            $mainImage = $form->get('mainImage')->getData();
            $mainImageFileName = $fileUploader->upload($mainImage);
            $post->setMainImage($mainImageFileName);

            $entityManager->persist($post);
            $entityManager->flush();

            $this->addFlash('success', 'La publication de la nouvelle figure a été créée avec succès.');
            return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('posts/new.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_posts_show', methods: ['GET'])]
    public function show(Post $post): Response
    {
        return $this->render('posts/show.html.twig', [
            'post' => $post,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_posts_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response
    {
        // Vérifiez l'accès en utilisant le Voter
        $this->denyAccessUnlessGranted(PostVoter::EDIT, $post);

        // Créez le formulaire en passant les données du post, y compris les images existantes
        $form = $this->createForm(PostType::class, $post);

        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            $mainImage = $form->get('mainImage')->getData();
            if ($mainImage !== null) {
                // Si une nouvelle image principale a été téléchargée, supprimez l'ancienne
                $existingMainImage = $post->getMainImage();
                if ($existingMainImage) {
                    $fileUploader->remove($existingMainImage);
                }
                // Téléchargez la nouvelle image principale et mettez à jour l'entité
                $mainImageFileName = $fileUploader->upload($mainImage);
                $post->setMainImage($mainImageFileName);
            }

            $images = $form->get('images')->getData();
            foreach ($images as $image) {
                if ($image->getUploadedFile() !== null) {
                    $imageFilename = $fileUploader->upload($image->getUploadedFile());
                    $image->setLink($imageFilename);
                    $image->setPost($post);
                    $post->addImages($image);
                }
            }


            $videos = $form->get('videos')->getData();

            foreach ($videos as $video) {
                if ($video->getTitle() === null) {
                    $post->removeVideos($video);
                } else {
                    $post->addVideos($video);
                    $video->setPost($post);
                }
            }

            $post->setUpdatedAt(new DateTime);

            // Flush pour enregistrer les modifications
            $entityManager->persist($post);
            $entityManager->flush();

            $this->addFlash('success', 'Modification de la figure effectué.');
            return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
        }

        // Récupérer tous les groupes uniques
        $allPosts = $entityManager->getRepository(Post::class)->findAll();
        $groups = ["Empty"];
        foreach ($allPosts as $post) {
            $group = $post->getGroupe();
            if (!in_array($group, $groups)) {
                $groups[] = $group;
            }
        }

        return $this->render('posts/edit.html.twig', [
            'post' => $post,
            'allGroups' => $groups,
            'form' => $form->createView(),
        ]);
    }


    #[Route('/{id}', name: 'app_posts_delete', methods: ['POST'])]
    public function delete(Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response
    {
        // Vérifiez l'accès en utilisant le Voter
        $this->denyAccessUnlessGranted(PostVoter::DELETE, $post);

        if ($this->isCsrfTokenValid('delete' . $post->getId(), $request->request->get('_token'))) {
            // Remove images associated with the post from the server
            $images = $post->getImages();
            foreach ($images as $image) {
                $fileUploader->remove($image->getTitle());
            }

            // Remove the post itself
            $entityManager->remove($post);
            $entityManager->flush();
        }

        $this->addFlash('success', 'Suppression de la figure effectuée.');
        return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
    }

}


