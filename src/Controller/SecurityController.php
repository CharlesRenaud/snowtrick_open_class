<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SecurityController extends AbstractController
{

    #[Route('/register', name: 'user_register')]
    public function register(): Response
    {

        return $this->render('security/register.html.twig', [
            'variable' => 'Valeur de la variable à passer au modèle Twig',
        ]);
    }

    #[Route("/login", name: "user_login")]
    public function login(): Response
    {

        return $this->render('security/login.html.twig', [
            'variable' => 'Valeur de la variable à passer au modèle Twig',
        ]);
    }

    
}
