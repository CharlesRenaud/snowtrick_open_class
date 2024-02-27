<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use App\Entity\Post;
use App\Repository\ImageRepository;
use Symfony\Component\HttpFoundation\File\UploadedFile;

#[ORM\Entity(repositoryClass: ImageRepository::class)]
class Image
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $link = null;

    #[ORM\ManyToOne(targetEntity: Post::class, inversedBy: 'images')]
    #[ORM\JoinColumn(name: 'post_id', referencedColumnName: 'id', nullable: true)]
    private ?Post $post = null;
    private ?UploadedFile $uploadedFile = null;
    public function getUploadedFile(): ?UploadedFile
    {
        return $this->uploadedFile;
    }

    public function setUploadedFile(?UploadedFile $uploadedFile): self
    {
        $this->uploadedFile = $uploadedFile;

        return $this;
    }
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLink(): ?string
    {
        return $this->link;
    }

    public function setLink(?string $link): self
    {
        $this->link = $link;

        return $this;
    }

    public function getPost(): ?Post
    {
        return $this->post;
    }

    public function setPost(?Post $post): self
    {
        $this->post = $post;

        return $this;
    }
}
