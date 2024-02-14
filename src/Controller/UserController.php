<?php 

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use App\Service\FileUploader;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Form\UserImageType;
use Symfony\Component\Routing\Annotation\Route;


class UserController extends AbstractController
{
    #[Route(path: '/user/edit-img', name: 'app_edit_image')]
    public function editUserImage(Request $request, FileUploader $fileUploader, EntityManagerInterface $entityManager)
    {
        $user = $this->getUser();
        $form = $this->createForm(UserImageType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $imageFile = $form['image']->getData();

            if ($imageFile) {
                $newFilename = $fileUploader->upload($imageFile);
                $user->setImage($newFilename);

                $entityManager->persist($user);
                $entityManager->flush();
            }

            return $this->redirectToRoute('homepage');
        }

        return $this->render('user/edit_image.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
