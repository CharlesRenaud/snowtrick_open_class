<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Form\ResetPasswordType;
use App\Security\LoginFormAuthenticator;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;
use App\Service\MailerService;
use App\Repository\UserRepository;
use Symfony\Component\Mailer\MailerInterface;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(
        Request $request,
        UserPasswordHasherInterface $userPasswordHasher,
        EntityManagerInterface $entityManager,
        MailerInterface $mailerInterface,
        UserRepository $userRepository,
        MailerService $mailerService
    ): Response {
        if ($this->getUser()) {
            return $this->redirectToRoute('homepage');
        }

        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $token = bin2hex(random_bytes(16));

            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            $user->setName($form->get('name')->getData());

            $user->setVerificationToken($token);


            $entityManager->persist($user);
            $entityManager->flush();
            $email = $user->getEmail();

            $mailerService->sendRegistrationConfirmationEmail($email, $token);

            $this->addFlash("success", "Registration validated, log in and don't forget to validate your account on your email!");
            return $this->redirectToRoute('app_login', ['email' => $email], Response::HTTP_SEE_OTHER);
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

    #[Route('/verify/{token}', name: 'user_verify')]
    public function verifyUser(
        Request $request,
        $token,
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        UserAuthenticatorInterface $userAuthenticator,
        LoginFormAuthenticator $authenticator,
    ): Response {

        $user = $userRepository->findUserByVerificationToken($token);

        if (!$user) {
            throw $this->createNotFoundException('User not find');
        }
        $token = bin2hex(random_bytes(16));

        if (!$user->isVerified()) {
            $user->setIsVerified(true);
            $user->setRoles(["ROLE_USER"]);
            $user->setVerificationToken($token);
            $entityManager->persist($user);
            $entityManager->flush();

            $userAuthenticator->authenticateUser(
                $user,
                $authenticator,
                $request
            );
        }

        return $this->redirectToRoute('homepage');
    }

    #[Route('/forgot-password', name: 'forgot_password')]
    public function forgotPassword(Request $request, UserRepository $userRepository, MailerService $mailerService, EntityManagerInterface $entityManager): Response
    {
        if ($this->getUser()) {
            return $this->redirectToRoute('homepage');
        }

        if ($request->isMethod('POST')) {
            $email = $request->request->get('email');
            $user = $userRepository->findOneBy(['email' => $email]);

            if ($user) {

                $mailerService->sendPasswordReset($user->getEmail(), $user->getVerificationToken());

                $this->addFlash('success', 'A password reset email has been sent to your address.');
            } else {
                $this->addFlash('error', 'No user found with this email.');
            }
        }

        return $this->render('registration/forgot_password.html.twig');
    }

    #[Route('/reset-password/{token}', name: 'user_reset_password')]
    public function changePassword(
        Request $request,
        $token,
        UserRepository $userRepository,
        EntityManagerInterface $entityManager,
        UserPasswordHasherInterface $userPasswordHasher
    ): Response {
        $user = $userRepository->findUserByVerificationToken($token);

        if (!$user) {
            return $this->redirectToRoute('homepage');
        }

        $form = $this->createForm(ResetPasswordType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $token = bin2hex(random_bytes(16));

            $hashedPass = $userPasswordHasher->hashPassword(
                $user,
                $form->get('plainPassword')->getData()
            );

            $user->setPassword($hashedPass);
            $user->setPlainPassword(null);
            $user->setVerificationToken($token);

            $entityManager->flush();

            return $this->redirectToRoute('homepage');
        }
        $this->addFlash('success', 'New password set');
        return $this->render('registration/change_password.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
