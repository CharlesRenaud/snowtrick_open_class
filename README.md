SnowTricks
Prérequis
Pour pouvoir mettre en place SnowTricks vous aurez besoin des outils suivants :

PHP ^8
Composer
1 - Installer les dépendances
Depuis un terminal dans le dossier du projet, lancez la commande suivante :

$ composer install
2 - Connecter la base de données
Une fois composer install lancé, éditez le fichier .env pour y ajouter la configuration à la base de données.

3 - Configurer la base de données
Une fois le fichier .env configuré, lancez la commande suivante pour initialiser la base de données :

$ php bin/console doctrine:database:create

Puis le serveur Web de Symfony :

$ php bin/console server:start
4 - Découvrir SnowTricks !
Une fois le serveur lancé, vous pouvez vous rendre sur 127.0.0.1 pour naviguer sur le site.
