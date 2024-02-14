<?php

namespace App\Service;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;

class MailerService extends AbstractController
{
    private $userRepository;
    private $mailer;

    public function __construct(MailerInterface $mailer)
    {
        $this->mailer = $mailer;
    }
    public function sendRegistrationConfirmationEmail(string $userEmail, string $token): Response
    {

        $email = (new TemplatedEmail())
            ->from('renaudcharlespro@gmail.com')
            ->to($userEmail)
            ->subject('Confirmation d\'inscription')
            ->htmlTemplate('emails/registration_confirmation.html.twig')
            ->context([
                'user' => $userEmail,
                'token' => $token,
            ]);

        $this->mailer->send($email);

        return new Response('E-mail de confirmation envoyé');
    }

    public function sendPasswordReset(string $userEmail, string $token): Response
    {

        $email = (new TemplatedEmail())
            ->from('renaudcharlespro@gmail.com')
            ->to($userEmail)
            ->subject('Reset du mot de passe')
            ->htmlTemplate('emails/reset_password.html.twig')
            ->context([
                'user' => $userEmail,
                'token' => $token,
            ]);

        $this->mailer->send($email);

        return new Response('E-mail de confirmation envoyé');
    }
}
