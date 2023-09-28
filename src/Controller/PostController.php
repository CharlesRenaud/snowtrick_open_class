<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PostController extends AbstractController
{

    #[Route('/', name: 'homepage')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig', [
            'variable' => 'Valeur de la variable à passer au modèle Twig',
        ]);
    }

    /*
    #[Route("/post/{id}", name: "post_detail")]
    public function detail($id): Response
    {
        // Logique de la page de détails d'un post

        return $this->render('post/detail.html.twig', [
            'postId' => $id,
        ]);
    }*/

    #[Route("/post/create", name: "post_create")]
    public function create(): Response
    {
        // Logique de la création d'un post

        return $this->render('post/create.html.twig', [
            'variable' => 'Valeur de la variable à passer au modèle Twig',
        ]);
    }

    #[Route("/post/{id}/edit", name: "post_edit")]
    public function edit($id): Response
    {
        // Logique de l'édition d'un post

        return $this->render('post/edit.html.twig', [
            'postId' => $id,
        ]);
    }

    
}
