<?php

namespace App\Entity;

use App\Repository\PostRepository;
use Cocur\Slugify\Slugify;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Video;
use App\Entity\Image;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use DateTime;
use Symfony\Component\Serializer\Annotation\MaxDepth;

#[ORM\Entity(repositoryClass: PostRepository::class)]
#[UniqueEntity(fields: ["title"], message: "Ce titre existe déjà.")]
#[ORM\HasLifecycleCallbacks]

class Post
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]

    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $title;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $content = null;

    #[ORM\Column(type: 'datetime')]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(type: 'datetime', nullable: true)]
    private ?\DateTimeInterface $updatedAt = null;

    #[ORM\ManyToOne(inversedBy: 'posts')]
    #[ORM\JoinColumn(nullable: false)]
    #[MaxDepth(2)]
    private ?User $author = null;

    #[ORM\OneToMany(mappedBy: 'post', targetEntity: Comment::class)]
    #[MaxDepth(2)]
    private Collection $comments;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $mainImage = null;

    #[ORM\OneToMany(mappedBy: 'post', targetEntity: Image::class, cascade: ["persist", "remove"])]
    #[MaxDepth(2)]
    private Collection $images;

    #[ORM\OneToMany(mappedBy: 'post', targetEntity: Video::class, cascade: ["persist", "remove"])]
    #[MaxDepth(2)]
    private Collection $videos;


    #[ORM\Column(length: 255)]
    private ?string $groupe = null;

    #[ORM\Column(length: 255, unique: true)]
    private ?string $slug;

    public function __construct()
    {
        $this->comments = new ArrayCollection();
        $this->videos = new ArrayCollection();
        $this->images = new ArrayCollection();
        $this->updatedAt = new DateTime();
        $this->createdAt = new DateTime();
    }
    #[ORM\PrePersist]
    #[ORM\PreUpdate]
    public function prePersistOrUpdate()
    {
        $slugify = new Slugify();
        $this->slug = $slugify->slugify($this->title);
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }


    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): static
    {
        $this->slug = $slug;

        return $this;
    }

    public function getMainImage(): ?string
    {
        return $this->mainImage;
    }

    public function setMainImage(string $mainImage): static
    {
        $this->mainImage = $mainImage;

        return $this;
    }


    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(string $content): static
    {
        $this->content = $content;

        return $this;
    }

    public function getCreatedAt(): ?\DateTime
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTime $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): static
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getAuthor(): ?User
    {
        return $this->author;
    }

    public function setAuthor(?User $author): static
    {
        $this->author = $author;

        return $this;
    }


    /**
     * @return Collection<int, Comment>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): static
    {
        if (!$this->comments->contains($comment)) {
            $this->comments->add($comment);
            $comment->setPost($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): static
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getPost() === $this) {
                $comment->setPost(null);
            }
        }

        return $this;
    }


    /**
         * @return Collection<int, Image>
         */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function setImages(Collection $images): static
    {
        $this->images = $images;

        return $this;
    }

    public function addImages(Image $image): static
    {
        if (!$this->images->contains($image)) {
            $this->images->add($image);
            $image->setPost($this);
        }

        return $this;
    }

    public function removeImage(Image $image): static
    {
        if ($this->videos->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getPost() === $this) {
                $image->setPost(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Video>
     */
    public function getVideos(): Collection
    {
        return $this->videos;
    }

    public function setVideos(Collection $videos): static
    {
        $this->videos = $videos;

        return $this;
    }

    public function addVideos(Video $video): static
    {
        if (!$this->videos->contains($video)) {
            $this->videos->add($video);
            $video->setPost($this);
        }

        return $this;
    }

    public function removeVideos(Video $video): static
    {
        if ($this->videos->removeElement($video)) {
            // set the owning side to null (unless already changed)
            if ($video->getPost() === $this) {
                $video->setPost(null);
            }
        }

        return $this;
    }


    public function getGroupe(): ?string
    {
        return $this->groupe;
    }

    public function setGroupe(string $groupe): static
    {
        $this->groupe = $groupe;

        return $this;
    }
}
