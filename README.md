```
# SnowTricks

## Prérequis
Avant de pouvoir mettre en place SnowTricks, assurez-vous de disposer des outils suivants :

- **PHP ^8**
- **Composer**
- **Mysql**

## Étape 1 : Installation des dépendances
Ouvrez un terminal dans le dossier du projet et exécutez la commande suivante :

```bash
$ composer install
```

## Étape 2 : Connexion à la base de données
Après avoir lancé la commande `composer install`, éditez le fichier `.env` pour y ajouter la configuration de la base de données.

## Étape 3 : Configuration de la base de données
Une fois que le fichier `.env` est configuré, exécutez la commande suivante pour initialiser la base de données :

```bash
$ php bin/console doctrine:database:create
```

Ensuite, démarrez le serveur Web Symfony :

```bash
$ php bin/console server:start
```

## Étape 4 : Découverte de SnowTricks !
Une fois que le serveur est lancé, ouvrez votre navigateur et accédez à l'adresse `http://127.0.0.1` pour explorer le site.
```
