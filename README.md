# SnowTricks

## Prérequis
Avant de pouvoir mettre en place SnowTricks, assurez-vous de disposer des outils suivants :

- **PHP ^8**
- **Composer**
- **Mysql**

## Étape 1 : Installation des dépendances
Ouvrez un terminal dans le dossier du projet et exécutez la commande suivante :

```
$ composer install
```

## Étape 2 : Connexion à la base de données
Après avoir lancé la commande `composer install`, éditez le fichier `.env` pour y ajouter la configuration de la base de données.

## Étape 3 : Configuration de l'environnement
Une fois que le fichier `.env` est configuré, 
```
APP_ENV=dev
APP_SECRET= 32_length
DATABASE_URL="mysql://bdd_user:password@127.0.0.1:3306/bdd_name?serverVersion=8.0.32&charset=utf8mb4"
MESSENGER_TRANSPORT_DSN=doctrine://default?auto_setup=0
MAILER_DSN=gmail+smtp://username:password@gmail.com

```
Il faut importer le fichier snowtricks_bdd_2024.sql dans phpmyadmin.

Ensuite, démarrez le serveur Web Symfony :
```
$ symfony serve
```

## Étape 4 : Découverte de SnowTricks !
Une fois que le serveur est lancé, ouvrez votre navigateur et accédez à l'adresse `http://127.0.0.1` pour explorer le site.
