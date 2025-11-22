<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230928191524 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comment CHANGE created_at created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\'');
        $this->addSql('ALTER TABLE post CHANGE created_at created_at VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE user DROP name, DROP created_at, DROP updated_at, CHANGE email email VARCHAR(180) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE user ADD name VARCHAR(255) NOT NULL, ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME DEFAULT NULL, CHANGE email email VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE post CHANGE created_at created_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE comment CHANGE created_at created_at DATETIME NOT NULL');
    }
}
