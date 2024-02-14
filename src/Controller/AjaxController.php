<?php

namespace App\Controller;

use App\Repository\ImageRepository;
use App\Repository\UserRepository;
use App\Entity\Comment;
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
use App\Repository\CommentRepository;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;

class AjaxController extends AbstractController
{
    #[Route('/add-comment/{id}', name: 'ajax_add_comment', methods: ['POST'])]
    public function addComment(
        Request $request,
        PostRepository $postRepository,
        EntityManagerInterface $entityManager,
        string $id
    ): JsonResponse {

        $user = $this->getUser();
        if ($user) {
            $data = json_decode($request->getContent(), true);

            $post = $postRepository->find($id);

            if (!$post) {
                return new JsonResponse(["status" => "error", "message" => "Post not found"], 404);
            }

            $comment = new Comment();
            $comment->setPost($post);
            $comment->setAuthor($user);
            $comment->setContent(strip_tags($data['comment']));
            $comment->setCreatedAt(new \DateTimeImmutable());

            $post->addComment($comment);

            $entityManager->persist($comment);
            $entityManager->persist($post);
            $entityManager->flush();

            $responseData = [
                "status" => "ok",
                "comment" => [
                    "id" => $comment->getId(),
                    "author" => [
                        "name" => $comment->getAuthor()->getName(),
                        "image" => $comment->getAuthor()->getImage(),
                        'role' => $user->getRoles()
                    ],
                    "content" => $comment->getContent(),
                    "createdAt" => $comment->getCreatedAt()->format('Y-m-d H:i:s')
                ],
            ];

            return new JsonResponse($responseData);
        } else {
            return new JsonResponse(["status" => "not connected"]);

        }
    }

    #[Route('/get-comments/{id}', name: 'ajax_get_comments', methods: ['GET'])]
    public function getComments(
        PostRepository $postRepository,
        CommentRepository $commentRepository,
        string $id
    ): JsonResponse {

        $user = $this->getUser();

        if (!$user) {
            $userRoles = ["ROLE_VISITOR"];
        } else {
            $userRoles = $user->getRoles();
        }

        $post = $postRepository->find($id);

        $comments = $commentRepository->findBy(['post' => $post], ['createdAt' => 'ASC']);

        $responseData = [
            'status' => 'ok',
            'comments' => [],
        ];

        foreach ($comments as $comment) {
            $responseData['comments'][] = [
                'id' => $comment->getId(),
                'author' => [
                    'name' => $comment->getAuthor()->getName(),
                    'image' => $comment->getAuthor()->getImage(),
                    'role' => $userRoles
                ],
                'content' => $comment->getContent(),
                'createdAt' => $comment->getCreatedAt()->format('Y-m-d H:i:s'),
            ];
        }

        return new JsonResponse($responseData);

    }


    #[Route('/delete-comment', name: 'ajax_delete_comment', methods: ['POST'])]
    public function deleteComment(
        Request $request,
        PostRepository $postRepository,
        CommentRepository $commentRepository,
        EntityManagerInterface $entityManager
    ): JsonResponse {

        $user = $this->getUser();
        $userRoles = $user->getRoles();

        if (in_array('ROLE_ADMIN', $userRoles)) {

            $data = json_decode($request->getContent(), true);

            if (!isset($data['postId']) || !isset($data['commentId'])) {
                return new JsonResponse(["status" => "error", "message" => "Missing postId or commentId"], 400);
            }

            $postId = $data["postId"];
            $commentId = $data["commentId"];

            $post = $postRepository->find($postId);

            $commentIdAsString = (string) $commentId;

            $comment = $commentRepository->find($commentIdAsString);

            if (!$post || !$comment) {
                return new JsonResponse(["status" => "error", "message" => "Post or comment not found"], 404);
            }
            $post->removeComment($comment);
            $entityManager->remove($comment);

            $entityManager->persist($post);
            $entityManager->flush();

            return new JsonResponse(["status" => "ok"]);
        } else {
            return new JsonResponse(["status" => "not admin"]);
        }
    }



    #[Route('/change-profile-image', name: 'ajax_change_profile_image', methods: ['POST'])]
    public function changeProfileImage(
        Request $request,
        UserRepository $userRepository,
        EntityManagerInterface $entity,
        FileUploader $fileUploader
    ): JsonResponse {

        $user = $this->getUser();
        if ($user) {
            $userImage = $user->getImage();

            $uploadedFile = $request->files->get('profile_image');

            if ($userImage && $uploadedFile !== "/images/anim-redirection.gif") {
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
        } else {
            return new JsonResponse(["status" => "not user"]);

        }
    }

    #[Route('/delete-image/{id}', name: 'ajax_delete_image', methods: ['POST'])]
    public function deleteImage(
        Request $request,
        string $id,
        ImageRepository $imageRepository,
        EntityManagerInterface $entity,
        FileUploader $fileUploader
    ): JsonResponse {
        $user = $this->getUser();
        if ($user) {
            $image = $imageRepository->find($id);
            $fileUploader->remove($image->getLink());
            $entity->remove($image);
            $entity->flush();

            return new JsonResponse(["status" => "ok"]);
        } else {
            return new JsonResponse(["status" => "not user"]);
        }
    }

    #[Route('/delete-main-image/{id}', name: 'ajax_delete_main_image', methods: ['POST'])]
    public function deleteMainImage(
        Request $request,
        string $id,
        PostRepository $postRepository,
        EntityManagerInterface $entity,
        FileUploader $fileUploader
    ): JsonResponse {
        $user = $this->getUser();
        if ($user) {
            $post = $postRepository->find($id);
            $existingMainImage = $post->getMainImage();
            if ($existingMainImage) {
                $fileUploader->remove($existingMainImage);
                $post->setMainImage("");
                $entity->flush();
            }
            return new JsonResponse(["status" => "ok"]);
        }
        return new JsonResponse(["status" => "not user"]);

    }


    #[Route('/load-more-posts', name: 'ajax_load_more_posts', methods: ['GET'])]
    public function loadMorePostsAction(
        Request $request,
        PostRepository $postRepository,
        CsrfTokenManagerInterface $csrfTokenManagerInterface
    ): JsonResponse {
        $user = $this->getUser();

        if (!$user) {
            $roles = ["ROLE_VISITOR"];
        } else {
            $roles = $user->getRoles();
        }
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


            $postsArray = [];

            foreach ($posts as $post) {
                // Générer un jeton CSRF unique pour chaque post
                $csrfToken = $csrfTokenManagerInterface->getToken('delete' . $post->getId())->getValue();

                $postData = $serializer->serialize(
                    $post,
                    'json',
                    [AbstractNormalizer::IGNORED_ATTRIBUTES => ['password', 'plainPassword', 'userIdentifier', 'verified', 'roles', 'verificationToken']]
                );

                // Inclure le jeton CSRF dans les données du post
                $postDataArray = json_decode($postData, true);
                $postDataArray['csrf_token'] = $csrfToken;
                $postsArray['roles'] = $roles;
                $postsArray[] = $postDataArray;
            }
            return new JsonResponse($postsArray, 200);
        } catch (\Exception $e) {
            return new JsonResponse(['error' => $e->getMessage()], JsonResponse::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
