-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306:3306
-- Généré le : dim. 11 fév. 2024 à 07:41
-- Version du serveur : 8.0.34-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `snowtricks_bdd_2023`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `author_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230925134754', '2023-09-25 15:48:27', 280),
('DoctrineMigrations\\Version20230925144847', '2023-09-25 16:49:08', 72),
('DoctrineMigrations\\Version20230925144932', '2023-09-25 16:49:36', 62),
('DoctrineMigrations\\Version20230925145243', '2023-09-25 16:52:47', 34),
('DoctrineMigrations\\Version20230928191524', '2023-09-28 21:15:28', 153),
('DoctrineMigrations\\Version20230928193455', '2023-09-28 21:34:58', 25),
('DoctrineMigrations\\Version20230929141438', '2023-09-29 16:14:50', 101),
('DoctrineMigrations\\Version20230929151355', '2023-09-29 17:13:58', 27),
('DoctrineMigrations\\Version20230929154431', '2023-09-29 17:44:33', 63),
('DoctrineMigrations\\Version20230930125809', '2023-09-30 14:58:16', 105),
('DoctrineMigrations\\Version20231004112555', '2023-10-27 18:49:02', 19);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `post_id`, `link`) VALUES
(3, 72, 'cork-65a81d4565a9a.jpg'),
(25, 79, 'ollie-65b14f105283a.jpg'),
(26, 79, 'methodgrab-65b14f1052ac5.jpg'),
(27, 79, 'fontside360-65b14f1052b81.jpg'),
(31, 78, 'ollie-65b2e00431925.jpg'),
(63, 81, 'cork-65b94a2802623.jpg'),
(80, 82, 'bonus10-65c5da8e0fdf8.png');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `groupe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `author_id`, `title`, `content`, `created_at`, `updated_at`, `groupe`, `main_image`) VALUES
(66, 58, 'Nose Press', 'Un Nose Press est une figure où le rider maintient la partie avant de sa planche en contact avec la neige tout en levant la partie arrière. Cela exige un contrôle fin et une bonne répartition du poids.', '2023-12-08 01:46:58', '2024-02-06 18:57:54', 'Tricks de Contrôle et d\'Équilibre', ''),
(67, 58, 'Tailslide 270 Out', 'Le Tailslide 270 Out consiste à glisser sur un rail avec la partie arrière de la planche, puis à effectuer une rotation de 270 degrés pour sortir du slide. C\'est une combinaison de contrôle, équilibre et style.', '2023-12-08 01:47:18', '2024-01-17 17:09:34', 'Tricks de Contrôle et d\'Équilibre', 'backside180-65a7fbbe4a3e0.jpg'),
(68, 58, 'Test', 'test', '2024-01-17 17:02:00', '2024-01-17 17:03:28', 'Tricks de Sauts et Rotations', 'indygrab-65a7fa50537d6.jpg'),
(69, 58, 'tricky', 'yes tricks', '2024-01-17 17:03:50', '2024-02-06 18:02:24', 'Trick de fou', ''),
(70, 58, 'ok', 'ok', '2024-01-17 17:58:21', '2024-01-17 17:58:21', 'Tricks de Sauts et Rotations', 'fontside360-65a8072dc1d1e.jpg'),
(71, 58, 'okok', 'okokok', '2024-01-17 19:22:27', '2024-02-09 05:54:51', 'Tricks de Style et d\'Esthétique', 'fontside360-65a81ae37c4e3.jpg'),
(72, 58, 'okokokokok', 'okokokokok', '2024-01-17 19:32:37', '2024-02-09 05:55:02', 'Tricks de Sauts et Rotations', 'indygrab-65a81d4565c64.jpg'),
(73, 58, 'plplplpl', 'plplplpl', '2024-01-17 20:02:06', '2024-02-09 05:55:13', 'Tricks de Base', ''),
(74, 58, 'Tricks', 'de folie', '2024-01-17 20:19:54', '2024-02-09 07:19:03', 'Tricks de Contrôle et d\'Équilibre', 'fond-65c5c3d7a362d.jpg'),
(75, 58, 'Test 2', 'super', '2024-01-17 20:35:24', '2024-01-17 20:35:24', 'Tricks de Sauts et Rotations', 'indygrab-65a82bfc457d5.jpg'),
(76, 58, 'ijkokokokok', 'okokokok', '2024-01-17 21:16:05', '2024-02-09 05:55:41', 'Tricks de Style et d\'Esthétique', 'tailpress-65a835855af50.jpg'),
(77, 58, 'okokok', 'okokok', '2024-01-17 21:19:11', '2024-02-09 05:55:56', 'Tricks de Sauts et Rotations', 'tailpress-65a8363f8ad9a.jpg'),
(78, 58, 'Debug video', 'okokokokokok', '2024-01-17 21:19:58', '2024-02-09 05:56:01', 'Tricks de Contrôle et d\'Équilibre', 'cab540-65a8366e5257e.jpg'),
(79, 58, 'okokokokokok', 'okokokokoko', '2024-01-17 21:23:56', '2024-02-09 07:16:53', 'Tricks de Style et d\'Esthétique', 'bonus15-65c5c355e1a0b.webp'),
(81, 58, 'Tricks 200s', 'yes la forme', '2024-01-24 19:05:29', '2024-02-09 04:39:10', 'Tricks de Sauts et Rotations', 'bonus-65c59e5eaf570.webp'),
(82, 58, 'Yes', 'La classe', '2024-02-06 18:10:08', '2024-02-09 08:55:58', 'Tricks de Contrôle et d\'Équilibre', 'didi-65c5bd97e4398.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plain_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`, `is_verified`, `verification_token`, `name`, `plain_password`, `image`) VALUES
(58, 'renaudcharlespro@gmail.com', '$2y$13$cNU6ON8MBSOsIl0dleqV7.tB7f/VKg02qwcbvPefik81z92jxRg9K', '[\"ROLE_USER\"]', 1, '383787f63891c331c506176556354ed3', 'Charles Renaud', NULL, 'admin-65c5bd6b938dc.png'),
(59, 'stef@gail.com', '$2y$13$KiiKnc8inJa2AdqFQYlNd.YPpzRo4xz/EuKiwLHHu4m.rXysotSLG', '[\"ROLE_VISITOR\"]', 0, '6bb9ce27bce85563dfd5b92a9e3e6b39', 'stef', NULL, '/images/anim-redirection.gif'),
(60, 'renaudcharlespro@gmail.coms', '$2y$13$XOPACEGEummTTbtL.YAbSeivIUD0ChCnt3XrhLhbfPW9ineLD5E7.', '[\"ROLE_VISITOR\"]', 0, 'd5de5eda6b7da26095470a2d7be73543', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(61, 'test@gmail.coms', '$2y$13$VlpbuiLCfzzt6aBSJ4wpA.ZcEJ1tY3nhXnDJI2DgOZ1Q4GAk8Tbfa', '[\"ROLE_VISITOR\"]', 0, '6813249710ca73789a1280fd81c78165', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(62, 'renaudcharlespro@gmail.comss', '$2y$13$gc9CWDNbOqmFVK93YA22KOKVEhCA1tOWSA1gx0DiTBce.1FzkBGkO', '[\"ROLE_VISITOR\"]', 0, '6d04d993bec6b89860f24c11c590ae7d', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(63, 'renaudcharlespro@gmail.comsss', '$2y$13$eD6lHoArJAdiKSMb8DU9GOt8TlMb/f.0eWldj5KatbjUYrXhW3XFi', '[\"ROLE_VISITOR\"]', 0, '5cd71cb885baaf8c467d848c74a7130d', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(64, 'test@gmail.comss', '$2y$13$eGlfzVXYjH7vTbRXak4NUOLGBeQMBVeN.LzwCnEIdbcg09WtMwZbi', '[\"ROLE_VISITOR\"]', 0, '8c9c01cdbd2122aee1f34549330836e7', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(65, 'renaudcharlespro@gmail.comd', '$2y$13$VX9zFAd5r2NX2Luk9uzvTeDOz3gxTbl3SMMMCp.pRc.LVlNjQPxJq', '[\"ROLE_VISITOR\"]', 0, '469528e8919039b3a4c377e3568d2288', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(66, 'renaudcharlespro@gmail.comso', '$2y$13$L3Y2ZzUPZHw0uDjHWf2fI.wlsjFW58GWd/A7VB58n0Wmy5erE17Uq', '[\"ROLE_VISITOR\"]', 0, '356af95c69cae34b5e2fb6ea4b217d3b', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(67, 'renaudcharlespro@gmail.comok', '$2y$13$nVsZCcdilFpgRiTduiRM9.4iguPcnMNAtmHLOBrh3Ysli0SriIb16', '[\"ROLE_VISITOR\"]', 0, 'b290cb51f5a7523497f0c4e1e52797e9', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(68, 'renaudcharlespro@gmail.comokoikok', '$2y$13$XnxJibycn4zIJQ6G6bz9XuR82BB6vTwryOFZ4RgDQZJ3Jxl8bonx6', '[\"ROLE_VISITOR\"]', 0, 'a998fd3d793f920099743193d6036080', 'Charles Renaudd', NULL, '/images/anim-redirection.gif'),
(69, 'test@gmail.comom', '$2y$13$qekudn0/1YDUjJyi5MmAoeKMsAytzUlc5fptyXD6C7GJqqhHsrsoe', '[\"ROLE_VISITOR\"]', 0, 'e19d4b0a73915d9335f4b95c31144ec0', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(70, 'test@gmail.comsok', '$2y$13$jKtprHNGYTmtj7qoLC0sN.s/Qq8ZtoUQCy1Z5HHbpBsqYcdpDoOFK', '[\"ROLE_VISITOR\"]', 0, '5b8ed32ecc47e06417aeffc2f7296988', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(71, 'test@gmail.comokokok', '$2y$13$cveEOwkpu/p./.2YGYOzluWNrDiJkDyZx.Ri972/ZTIIZIXDcrVB.', '[\"ROLE_VISITOR\"]', 0, '4795f01d849604fea593b3d0b4d35f60', 'Charles Renaudd', NULL, '/images/anim-redirection.gif'),
(72, 'stefion@gmail.comss', '$2y$13$2uuuwz/W2b/JAoAAOqgQUufSHEj8j.uP7fksMMaCS.0/wPonA9AgG', '[\"ROLE_VISITOR\"]', 0, '1119818032a788eb4728ae0305881bb4', 'stefion', NULL, '/images/anim-redirection.gif'),
(73, 'renaudcharlespro@gmail.comcom', '$2y$13$w0xhjGlRvRpPEQJzjd1w4eYOyqxq/v7d/q9WrVpdaew8FKmU.tm4C', '[\"ROLE_VISITOR\"]', 0, '527bd743a3c604fad83ec35e63ab6c4c', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(74, 'renaudcharlespro@gmail.comokok', '$2y$13$rZMXSj0HaezCbvPpUwzokuIHnMuFcpfLStNBCMVaN0S/sgwv47E3e', '[\"ROLE_VISITOR\"]', 0, '17d02cfee957559435edefba75d63e0d', 'Charles Renaud', NULL, '/images/anim-redirection.gif');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`id`, `title`, `post_id`) VALUES
(38, NULL, NULL),
(59, 'https://youtu.be/T92n4e5bEpE', 68),
(60, 'https://youtu.be/T92n4e5bEpE', 69),
(61, 'https://youtu.be/T92n4e5bEpE', 70),
(62, 'https://youtu.be/T92n4e5bEpE', 71),
(63, 'https://youtu.be/T92n4e5bEpE', 72),
(64, 'https://youtu.be/T92n4e5bEpE', 74),
(65, 'https://youtu.be/T92n4e5bEpE', 75),
(66, 'https://youtu.be/5jRNvYmG6Bs', 78),
(67, 'okokokok', 79),
(68, NULL, NULL),
(69, NULL, NULL),
(70, NULL, NULL),
(71, NULL, NULL),
(72, NULL, NULL),
(73, NULL, NULL),
(74, NULL, NULL),
(75, 'https://youtu.be/T92n4e5bEpE', 78),
(76, 'https://youtu.be/T92n4e5bEpE', 78),
(77, 'https://www.youtube.com/embed/My007vQdlto?si=Tej9Ct5_eJ_-jYJe', 78),
(78, 'https://www.youtube.com/embed/My007vQdlto?si=Tej9Ct5_eJ_-jYJe', 78),
(79, 'https://www.youtube.com/embed/My007vQdlto?si=Tej9Ct5_eJ_-jYJe', 78),
(80, NULL, NULL),
(81, NULL, NULL),
(82, NULL, NULL),
(83, NULL, NULL),
(84, NULL, NULL),
(85, NULL, NULL),
(86, NULL, NULL),
(87, NULL, NULL),
(88, NULL, NULL),
(89, NULL, NULL),
(90, NULL, NULL),
(91, NULL, NULL),
(92, NULL, NULL),
(93, NULL, NULL),
(94, NULL, NULL),
(95, NULL, NULL),
(96, NULL, NULL),
(97, NULL, NULL),
(98, NULL, NULL),
(99, NULL, NULL),
(100, NULL, NULL),
(101, NULL, NULL),
(102, NULL, NULL),
(103, 'https://youtu.be/hW_RhD0D-Ew?si=1uRjULSPNSwf_yTs', 81),
(104, NULL, NULL),
(105, NULL, NULL),
(106, NULL, NULL),
(107, NULL, NULL),
(108, NULL, NULL),
(109, NULL, NULL),
(110, 'https://www.youtube.com/embed/My007vQdlto?si=Tej9Ct5_eJ_-jYJe', 81),
(111, NULL, NULL),
(112, NULL, NULL),
(113, 'https://youtu.be/Gg6aAKt1Of4?si=ZibexM_cOswDRnXe', 81),
(114, NULL, NULL),
(115, NULL, NULL),
(116, NULL, NULL),
(117, NULL, NULL),
(118, NULL, NULL),
(119, NULL, NULL),
(120, NULL, NULL),
(121, NULL, NULL),
(122, NULL, NULL),
(123, NULL, NULL),
(124, NULL, NULL),
(125, NULL, NULL),
(126, NULL, NULL),
(127, NULL, NULL),
(128, NULL, NULL),
(129, NULL, NULL),
(130, NULL, NULL),
(131, NULL, NULL),
(132, NULL, NULL),
(133, NULL, NULL),
(134, NULL, NULL),
(135, NULL, NULL),
(136, NULL, NULL),
(137, 'https://youtu.be/fuhE6PYnRMc?si=DjpqAj2RABd7S2v2', 82),
(138, NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`),
  ADD KEY `IDX_9474526CF675F31B` (`author_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045F4B89032C` (`post_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A8A6C8DF675F31B` (`author_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CC7DA2C4B89032C` (`post_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045F4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
