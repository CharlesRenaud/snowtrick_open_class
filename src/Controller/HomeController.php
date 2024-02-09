<?php

namespace App\Controller;


use App\Repository\PostRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class HomeController extends AbstractController
{
    #[Route('/home', name: 'homepage', methods: ['GET'])]
    public function index(Request $request, PostRepository $postRepository): Response
    {   
        
        $posts = $postRepository->findBy(
            [],
            ['createdAt' => 'DESC'],
            15,
        );

        return $this->render('posts/index.html.twig', [
            'posts' => $posts,
        ]);
    }
}
