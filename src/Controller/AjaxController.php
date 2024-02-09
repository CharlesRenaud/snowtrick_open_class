<?php

namespace App\Controller;

use App\Repository\ImageRepository;
use App\Repository\UserRepository;
use App\Service\FileUploader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\PostRepository;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use App\Entity\Image;

class AjaxController extends AbstractController
{
    #[Route('/change-profile-image', name: 'ajax_change_profile_image', methods: ['POST'])]
    public function changeProfileImage(
        Request $request,
        UserRepository $userRepository,
        EntityManagerInterface $entity,
        FileUploader $fileUploader
    ): JsonResponse {

        $user = $this->getUser();
        $userImage = $user->getImage();

        $uploadedFile = $request->files->get('profile_image');

        dump($uploadedFile);

        if($userImage && $uploadedFile !== "/images/anim-redirection.gif") {
           $fileUploader->remove($userImage);
        }

        if ($uploadedFile) {
            $newFilename = $fileUploader->upload($uploadedFile);
            $user->setImage($newFilename);
            $entity->persist($user);
            $entity->flush();

            return new JsonResponse(['status' => 'ok']);
        }


        return new JsonResponse(["status" => "ok"]);
    }

    #[Route('/delete-image/{id}', name: 'ajax_delete_image', methods: ['POST'])]
    public function deleteImage(
        Request $request,
        string $id,
        ImageRepository $imageRepository,
        EntityManagerInterface $entity,
        FileUploader $fileUploader
    ): JsonResponse {
        $image = $imageRepository->find($id);
        $fileUploader->remove($image->getLink());
        $entity->remove($image);
        $entity->flush();

        return new JsonResponse(["status" => "ok"]);
    }

    #[Route('/delete-main-image/{id}', name: 'ajax_delete_main_image', methods: ['POST'])]
    public function deleteMainImage(
        Request $request,
        string $id,
        PostRepository $postRepository,
        EntityManagerInterface $entity,
        FileUploader $fileUploader
    ): JsonResponse {
        $post = $postRepository->find($id);
        $existingMainImage = $post->getMainImage();
        if ($existingMainImage) {
            $fileUploader->remove($existingMainImage);
            $post->setMainImage("");
            $entity->flush();
        }
        return new JsonResponse(["status" => "ok"]);
    }

    #[Route('/load-more-posts', name: 'ajax_load_more_posts', methods: ['GET'])]
    public function loadMorePostsAction(
        Request $request,
        PostRepository $postRepository,
    ): JsonResponse {

        $encoders = [new XmlEncoder(), new JsonEncoder()];
        $normalizers = [
            new ObjectNormalizer(null, null, null, null, null, null, [
                AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object) {
                    return $object->getId();
                },
            ])
        ];
        $serializer = new Serializer($normalizers, $encoders);

        try {
            $offset = $request->query->getInt('offset', 0);

            if ($offset < 0) {
                return new JsonResponse(['error' => 'Invalid offset'], JsonResponse::HTTP_BAD_REQUEST);
            }

            $posts = $postRepository->findBy(
                [],
                ['createdAt' => 'DESC'],
                15,
                $offset
            );

            $postsArray = $serializer->serialize(
                $posts,
                'json',
                [AbstractNormalizer::IGNORED_ATTRIBUTES => ['password', 'plainPassword', 'userIdentifier', 'verified', 'roles', 'verificationToken']]
            );

            return new JsonResponse($postsArray, 200);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => $e->getMessage()], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}


