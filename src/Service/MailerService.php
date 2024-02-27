<?php

namespace App\Service;

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
            ->subject('Register confirmation')
            ->htmlTemplate('emails/registration_confirmation.html.twig')
            ->context([
                'user' => $userEmail,
                'token' => $token,
            ]);

        $this->mailer->send($email);

        return new Response('Register confimration email send');
    }

    public function sendPasswordReset(string $userEmail, string $token): Response
    {

        $email = (new TemplatedEmail())
            ->from('renaudcharlespro@gmail.com')
            ->to($userEmail)
            ->subject('Password reset')
            ->htmlTemplate('emails/reset_password.html.twig')
            ->context([
                'user' => $userEmail,
                'token' => $token,
            ]);

        $this->mailer->send($email);

        return new Response('Password reset email send');
    }
}
