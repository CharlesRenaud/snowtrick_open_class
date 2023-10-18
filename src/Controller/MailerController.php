<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;

class MailerController extends AbstractController
{
    #[Route('/send-registration-confirmation/{userId}/{token}', name: 'send_registration_confirmation')]
    public function sendRegistrationConfirmationEmail(MailerInterface $mailer, UserRepository $userRepository, int $userId, string $token): Response
    {
        // Vous devez récupérer l'utilisateur en fonction de l'ID ou d'une autre manière appropriée
        $user = $userRepository->find($userId);

        if (!$user) {
            throw $this->createNotFoundException('Utilisateur non trouvé');
        }

        $email = (new TemplatedEmail())
            ->from('renaudcharlespro@gmail.com')
            ->to($user->getEmail())
            ->subject('Confirmation d\'inscription')
            ->htmlTemplate('emails/registration_confirmation.html.twig')
            ->context([
                'user' => $user->getEmail(),
                'token' => $token, // Ajoutez le token au contexte du modèle
            ]);

        $mailer->send($email);

        // Vous pouvez renvoyer une réponse pour indiquer que l'e-mail a été envoyé avec succès
        return new Response('E-mail de confirmation envoyé');
    }
}

