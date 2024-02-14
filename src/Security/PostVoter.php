<?php

namespace App\Security;

use App\Entity\Post;
use App\Entity\User;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;

class PostVoter extends Voter
{
    public const NEW = 'new';
    public const EDIT = 'edit';
    public const DELETE = 'delete';

    protected function supports(string $attribute, mixed $subject): bool
    {
        return in_array($attribute, [self::NEW, self::EDIT, self::DELETE]) && $subject instanceof Post;
    }

    protected function voteOnAttribute(string $attribute, mixed $subject, TokenInterface $token): bool
    {
        $user = $token->getUser();

        if (!$user instanceof User) {
            return false;
        }

        $post = $subject;

        switch ($attribute) {
            case self::NEW:
                // Autoriser l'accès à l'action new pour tous les utilisateurs connectés
                return true;

            case self::EDIT:
                // Autoriser l'accès à l'action edit seulement si l'utilisateur est le propriétaire du post
                //return $user === $post->getAuthor();
                return true;


            case self::DELETE:
                // Autoriser l'accès à l'action delete seulement si l'utilisateur est le propriétaire du post
                //return $user === $post->getAuthor();
                return true;


            default:
                return false;
        }
    }
}
