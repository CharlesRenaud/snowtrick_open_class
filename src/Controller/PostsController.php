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
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;
use App\Security\PostVoter;

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
        $this->denyAccessUnlessGranted(PostVoter::NEW, new Post());

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
                $video->setPost($post);
            }

            $mainImage = $form->get('mainImage')->getData();
            if ($mainImage) {
                $mainImageFileName = $fileUploader->upload($mainImage);
                $post->setMainImage($mainImageFileName);
            }

            $entityManager->persist($post);
            $entityManager->flush();

            $this->addFlash('success', 'The publication of the new figure has been successfully created.');
            return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
        }

        $allPosts = $entityManager->getRepository(Post::class)->findAll();
        $groups = ["Type"];
        foreach ($allPosts as $postTime) {
            $group = $postTime->getGroupe();
            if (!in_array($group, $groups)) {
                $groups[] = $group;
            }
        }

        return $this->render('posts/new.html.twig', [
            'allGroups' => $groups,
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('/{slug}', name: 'app_posts_show', methods: ['GET'])]
    public function show(Post $post): Response
    {

        return $this->render('posts/show.html.twig', [
            'post' => $post,
        ]);
    }

    #[Route('/{slug}/edit', name: 'app_posts_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response
    {
        $this->denyAccessUnlessGranted(PostVoter::EDIT, $post);
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        $user = $this->getUser();

        if ($form->isSubmitted() && $form->isValid()) {
            $mainImage = $form->get('mainImage')->getData();
            if ($mainImage !== null) {
                $existingMainImage = $post->getMainImage();
                if ($existingMainImage) {
                    $fileUploader->remove($existingMainImage);
                }
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

            $post->setUpdatedAt(new DateTime());
            $post->setAuthor($user);

            $entityManager->persist($post);
            $entityManager->flush();

            $this->addFlash('success', 'The modification of the figure has been completed.');
            return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
        }

        $allPosts = $entityManager->getRepository(Post::class)->findAll();
        $groups = ["Type"];
        foreach ($allPosts as $postTime) {
            $group = $postTime->getGroupe();
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
        $this->denyAccessUnlessGranted(PostVoter::DELETE, $post);

        if ($this->isCsrfTokenValid('delete' . $post->getId(), $request->request->get('_token'))) {

            $comments = $post->getComments();

            foreach ($comments as $comment) {
                $entityManager->remove($comment);
            }
            $images = $post->getImages();
            foreach ($images as $image) {
                $fileUploader->remove($image->getLink());
            }

            $mainImage = $post->getMainImage();
            if ($mainImage) {
                $fileUploader->remove($mainImage);
            }

            $entityManager->remove($post);
            $entityManager->flush();

            $this->addFlash('success', "The post has been deleted.");

            return $this->redirectToRoute('homepage');
        }

        $this->addFlash('success', 'Jeton CSRF invalide.');

        return $this->redirectToRoute('homepage');
    }
}
