<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;

class MailerController extends AbstractController
{
    #[Route('/send-registration-confirmation/{userId}/{token}', name: 'send_registration_confirmation')]
    public function sendRegistrationConfirmationEmail(MailerInterface $mailer, UserRepository $userRepository, int $userId, string $token): Response
    {
        $user = $userRepository->find($userId);

        if (!$user) {
            throw $this->createNotFoundException('User not find');
        }

        $email = (new TemplatedEmail())
            ->from('renaudcharlespro@gmail.com')
            ->to($user->getEmail())
            ->subject('Register confirmation')
            ->htmlTemplate('emails/registration_confirmation.html.twig')
            ->context([
                'user' => $user->getEmail(),
                'token' => $token,
            ]);

        $mailer->send($email);

        return new Response('Confirmation email send');
    }
}
