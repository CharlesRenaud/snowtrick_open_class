<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use DateTime;
use App\Service\FileUploader;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Filesystem\Filesystem;

#[Route('/posts')]
class PostsController extends AbstractController
{

    #[Route('/new', name: 'app_posts_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, FileUploader $fileUploader, SessionInterface $session): Response
    {
        $post = new Post();
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $post->setUpdatedAt(new DateTime);
            $post->setCreatedAt(new DateTime);
            $post->setAuthor($this->getUser());
            // Accédez aux données du formulaire pour coverImgs et videos
            $coverImgs = $form->get('coverImgs')->getData();
            $array_imgs = [];

            foreach ($coverImgs as $coverImg) {
                $imageFileName = $fileUploader->upload($coverImg);
                array_push($array_imgs, $imageFileName);
            }

            $post->setCoverImgs($array_imgs);

            $videos = $form->get('videos')->getData();

            foreach ($videos as $video) {
                $post->addVideos($video);
                $video->setPost($post); // Assurez-vous que la vidéo est associée au post
            }
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
        // Récupérez les images existantes du post
        $existingImagesData = $post->getCoverImgs();

        // Créez le formulaire en passant les données du post, y compris les images existantes
        $form = $this->createForm(PostType::class, $post);

        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {
            // Récupérez les nouvelles images du formulaire
            $newCoverImgs = $form->get('coverImgs')->getData();

            // Récupérez les index des images à supprimer depuis le champ caché du formulaire
            $imagesToDeleteIndexes = $request->request->get('imagesToDeleteIndexes');

            if (strlen($imagesToDeleteIndexes) > 0) {
                $indexes = explode(',', $imagesToDeleteIndexes);

                // Créez un tableau temporaire pour stocker les images à conserver
                $tempExistingImagesData = [];

                foreach ($existingImagesData as $index => $existingImage) {
                    if (!in_array($index, $indexes)) {
                        // L'index n'est pas dans le tableau des indices à supprimer, conservez l'image
                        $tempExistingImagesData[] = $existingImage;
                    } else {
                        // Supprimez le fichier du système de fichiers en utilisant le service FileUploader
                        $fileUploader->remove($existingImage);
                    }
                }

                // Attribuez le tableau temporaire à $existingImagesData
                $existingImagesData = $tempExistingImagesData;
            }

            // Traitez les nouvelles images comme suit
            foreach ($newCoverImgs as $newCoverImg) {
                // Téléchargez et ajoutez les nouvelles images au tableau
                $imageFileName = $fileUploader->upload($newCoverImg);
                $existingImagesData[] = $imageFileName;
            }

            // Mettez à jour les images du post
            $post->setCoverImgs($existingImagesData);

            $videos = $form->get('videos')->getData();

            foreach ($videos as $video) {
                if ($video->getTitle() === null) {
                    // La vidéo a un titre nul, nous la supprimons du tableau
                    $post->removeVideos($video);
                } else {
                    // La vidéo a un titre, nous l'ajoutons au post
                    $post->addVideos($video);
                    $video->setPost($post); // Assurez-vous que la vidéo est associée au post
                }
            }

            $post->setUpdatedAt(new DateTime);

            // Flush pour enregistrer les modifications
            $entityManager->persist($post);
            $entityManager->flush();

            $this->addFlash('success', 'Modification de la figure effectué.');
            return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('posts/edit.html.twig', [
            'post' => $post,
            'form' => $form->createView(),
        ]);
    }



    
    #[Route('/{id}', name: 'app_posts_delete', methods: ['POST'])]
    public function delete(Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response
    {
        if ($this->isCsrfTokenValid('delete' . $post->getId(), $request->request->get('_token'))) {
            // Remove images associated with the post from the server
            $coverImgs = $post->getCoverImgs();
            foreach ($coverImgs as $coverImg) {
                $fileUploader->remove($coverImg);
            }
    
            // Remove the post itself
            $entityManager->remove($post);
            $entityManager->flush();
        }
    
        $this->addFlash('success', 'Suppression de la figure effectuée.');
        return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
    }
    
}
