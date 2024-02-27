-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306:3306
-- Généré le : mar. 27 fév. 2024 à 17:12
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

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `post_id`, `author_id`, `content`, `created_at`) VALUES
(30, 101, 58, 'Meilleur blog de snow', '2024-02-13 06:32:26'),
(32, 101, 75, 'J\'ai modifié la figure ! ', '2024-02-13 06:46:00'),
(43, 101, 58, 'dernier 11', '2024-02-13 06:54:54'),
(46, 101, 58, 'la forme ? ', '2024-02-13 06:59:03'),
(48, 101, 58, 'Trop facile de monter', '2024-02-13 06:59:09'),
(81, 101, 58, 'plus de commentaire encore', '2024-02-13 07:33:21'),
(82, 101, 58, 'encore plus', '2024-02-13 07:33:50'),
(83, 101, 58, 'c\'est la teuf', '2024-02-13 07:33:57'),
(84, 101, 58, 'vraimet ? ', '2024-02-13 07:34:28'),
(85, 101, 58, 'c\'est facile pour lui', '2024-02-13 07:34:37'),
(86, 101, 58, 'plus de comm', '2024-02-13 07:34:53'),
(87, 101, 58, 'toujours plus ', '2024-02-13 07:34:57'),
(88, 100, 58, 'yes ', '2024-02-13 07:52:01'),
(89, 87, 58, 'Yes ! ', '2024-02-13 09:49:56'),
(90, 109, 58, 'la force', '2024-02-13 11:55:41'),
(91, 109, 58, 'trop bien les commentaires ', '2024-02-13 16:21:51'),
(92, 109, 58, 'c\'est de la balle', '2024-02-13 16:22:35'),
(93, 109, 58, 'J\'adore le concept', '2024-02-13 16:23:36'),
(94, 100, 58, 'frais ! ', '2024-02-13 17:55:58'),
(95, 109, 58, 'commmmmmm ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo', '2024-02-13 18:10:16'),
(96, 109, 76, 'Trop cool', '2024-02-13 18:54:13'),
(97, 109, 58, 'Je commente !', '2024-02-13 19:08:16'),
(98, 109, 58, 'super', '2024-02-13 19:08:33'),
(99, 109, 58, 'test ', '2024-02-13 19:08:36'),
(100, 109, 58, 'pro ', '2024-02-13 19:08:39'),
(106, 109, 58, 'prout', '2024-02-13 19:34:02'),
(107, 109, 58, 'foot de rue', '2024-02-13 19:34:06'),
(108, 95, 58, 'test', '2024-02-14 12:58:29'),
(109, 95, 58, 'tester', '2024-02-14 13:11:19'),
(110, 95, 58, 'bien !', '2024-02-14 13:11:37');

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
(101, 87, 'frontside-1-65c9b16c66c04.jpg'),
(102, 87, 'frontside-2-65c9b16c66d91.jpg'),
(103, 87, 'frontside-3-65c9b16c66e96.jpg'),
(104, 87, 'frontside-4-65c9b16c66f08.jpg'),
(105, 87, 'frontside-5-65c9b16c66f67.jpg'),
(106, 88, 'backflip-1-65c9b2fdcba3c.jpg'),
(107, 88, 'backflip-2-65c9b2fdcbb4f.jpg'),
(108, 88, 'backflip-3-65c9b2fdcbc19.jpg'),
(109, 88, 'backflip-4-65c9b2fdcbd28.jpg'),
(110, 88, 'backflip-5-65c9b2fdcbdab.jpg'),
(111, 89, 'method-grab-1-65c9b4425edc4.jpg'),
(112, 89, 'method-grab-2-65c9b4425f153.jpg'),
(113, 89, 'method-grab-3-65c9b4425f1b2.jpg'),
(114, 89, 'method-grab-4-65c9b4425f201.jpg'),
(115, 89, 'method-grab-5-65c9b4425f2a5.jpg'),
(116, 90, 'tail-grab-1-65c9b5e3dde7d.jpg'),
(117, 90, 'tail-grab-2-65c9b5e3ddf52.jpg'),
(118, 90, 'tail-grab-3-65c9b5e3ddfad.jpg'),
(119, 90, 'tail-grab-4-65c9b5e3de032.jpg'),
(120, 90, 'tail-grab-5-65c9b5e3de077.jpg'),
(121, 91, 'indy-grab-1-65c9b70fbc5ab.jpg'),
(122, 91, 'indy-grab-2-65c9b70fbc6b7.jpg'),
(123, 91, 'indy-grab-3-65c9b70fbc7b1.jpg'),
(124, 91, 'indy-grab-4-65c9b70fbc832.jpg'),
(125, 91, 'indy-grab-5-65c9b70fbc8b0.jpg'),
(126, 91, 'indy-grab-main-65c9b70fbc919.jpg'),
(127, 92, 'frontside-boardslide-1-65c9b849e5ac5.jpg'),
(128, 92, 'frontside-boardslide-2-65c9b849e5c69.jpg'),
(129, 92, 'frontside-boardslide-3-65c9b849e5cf2.jpg'),
(130, 92, 'frontside-boardslide-4-65c9b849e5d70.jpg'),
(131, 92, 'frontside-boardslide-5-65c9b849e5e02.jpg'),
(132, 93, 'backside-540-1-65c9ba715cad7.jpg'),
(133, 93, 'backside-540-2-65c9ba715cbeb.jpg'),
(134, 93, 'backside-540-3-65c9ba715cc76.jpg'),
(135, 93, 'backside-540-4-65c9ba715ccce.jpg'),
(136, 93, 'backside-540-5-65c9ba715cd35.webp'),
(137, 94, 'nose-press-65c9bc3bd786d.webp'),
(138, 94, 'nose-press-2-65c9bc3bd7aa2.webp'),
(139, 94, 'nose-press-3-65c9bc3bd7bbc.webp'),
(140, 94, 'nose-press-4-65c9bc3bd7cca.webp'),
(141, 94, 'nose-press-5-65c9bc3bd7d97.jpg'),
(142, 95, '50-50-1-65c9bdb564069.webp'),
(143, 95, '50-50-2-65c9bdb56427a.webp'),
(144, 95, '50-50-3-65c9bdb56439d.jpg'),
(145, 95, '50-50-4-65c9bdb564452.jpg'),
(146, 95, '50-50-5-65c9bdb5644e2.avif'),
(147, 96, 'frontside-360-1-65c9bf025f9bd.jpg'),
(148, 96, 'frontside-360-2-65c9bf025fb29.webp'),
(149, 96, 'frontside-360-3-65c9bf025fcd1.webp'),
(150, 96, 'frontside-360-4-65c9bf025fde3.jpg'),
(151, 96, 'frontside-360-5-65c9bf025fe71.jpg'),
(152, 97, 'stalefish-grab-1-65c9c02569642.jpg'),
(153, 97, 'stalefish-grab-2-65c9c02569757.avif'),
(154, 97, 'stalefish-grab-3-65c9c02569924.jpg'),
(155, 97, 'stalefish-grab-4-65c9c0256999b.avif'),
(156, 97, 'stalefish-grab-5-65c9c02569af3.webp'),
(157, 98, 'japan-air-1-65c9c27e6c0f7.jpg'),
(158, 98, 'japan-air-2-65c9c27e6c1fd.jpg'),
(159, 98, 'japan-air-3-65c9c27e6c287.jpg'),
(160, 98, 'japan-air-4-65c9c27e6c361.jpg'),
(161, 98, 'japan-air-5-65c9c27e6c3ea.jpg'),
(162, 99, 'cab-540-1-65c9c43ca269a.jpg'),
(163, 99, 'cab-540-2-65c9c43ca2801.jpg'),
(164, 99, 'cab-540-3-65c9c43ca288f.webp'),
(165, 99, 'cab-540-4-65c9c43ca2ab7.jpg'),
(166, 99, 'cab-540-5-65c9c43ca2b27.webp'),
(167, 100, 'rodeo-1-65c9c61a0712c.webp'),
(168, 100, 'rodeo-3-65c9c6310e691.jpg'),
(169, 100, 'rodeo-4-65c9c63ee0070.jpg'),
(170, 100, 'rodeo-5-65c9c63ee033c.jpg'),
(171, 100, 'rodeo-2-65c9c659831a0.jpg'),
(172, 101, 'method-air-1-65c9c75ca8b0b.jpg'),
(173, 101, 'method-air-2-65c9c75ca8bf3.jpg'),
(174, 101, 'method-air-3-65c9c75ca8c83.jpg'),
(175, 101, 'method-air-4-65c9c75ca8ce9.jpg'),
(176, 101, 'method-air-5-65c9c75ca8dd9.jpg'),
(210, 109, 'ollie-1-65cb1e94be045.jpg'),
(211, 109, 'ollie-2-65cb80c7ab560.jpg'),
(212, 109, 'ollie-3-65cb1e94c30fe.jpg'),
(213, 109, 'ollie-4-65cb1e94c3208.png'),
(214, 109, 'ollie-5-65cb1e94c3383.jpg');

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
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `author_id`, `title`, `content`, `created_at`, `updated_at`, `groupe`, `main_image`, `slug`) VALUES
(87, 58, 'Frontside 180', '# Mastering the Frontside 180: Turning with Style\r\n\r\nIn the world of snowboard freestyle, the Frontside 180 is an iconic maneuver that combines style and technique. It\'s a basic yet essential move, allowing riders to turn in the air with fluidity and elegance. In this article, we\'ll explore the details of this classic maneuver.\r\n\r\n## What is the Frontside 180?\r\n\r\nThe Frontside 180 is a snowboarding maneuver where the rider rotates their body and board 180 degrees clockwise (for a regular rider) while in the air. This move is often performed during jumps or rotations on features in a snowpark.\r\n\r\n## How to Perform a Frontside 180?\r\n\r\n1. **Positioning:** Start with a centered position on your board, with knees slightly bent. Ensure you have good weight distribution between both feet.\r\n\r\n2. **Approach:** Gain momentum by riding down the slope at a moderate to high speed. Bend your knees slightly to absorb bumps and prepare for the jump.\r\n\r\n3. **Takeoff:** As you approach the jump, compress your board by bending your knees further. This will generate energy for the jump.\r\n\r\n4. **Impulse:** At the lip of the jump, push down firmly on the tail of your board to initiate the jump. Jump upwards while keeping your body upright and the board parallel to the ground.\r\n\r\n5. **Rotation:** While in the air, use your shoulders and hips to initiate a 180-degree rotation clockwise. Keep your head and eyes focused on the landing to maintain control.\r\n\r\n6. **Landing:** Anticipate your landing by gradually bringing your board back to a normal position. Bend your knees to absorb the impact and ensure a smooth landing.\r\n\r\n## Tips for Improving Your Frontside 180\r\n\r\n- Practice rotating 180 degrees on flat terrain before attempting it on jumps or features.\r\n  \r\n- Focus on the movement of your shoulders and hips to initiate and control the rotation.\r\n  \r\n- Work on your timing to synchronize the rotation with the impulse of the jump.\r\n\r\nIn conclusion, the Frontside 180 is a fundamental figure in the repertoire of any freestyle snowboarder. By understanding the mechanics of this maneuver and practicing regularly, you can add a touch of style to your riding and push your limits on the snow.', '2024-02-12 06:49:32', '2024-02-12 07:02:51', 'Base Trick', 'frontside-main-65c9b16c66ff5.jpg', 'frontside-180'),
(88, 58, 'Backflip', '# The Backflip in Snowboarding: Diving into Adrenaline\r\n\r\nThe Backflip is one of the most iconic and spectacular maneuvers in snowboard freestyle. This daring move involves performing a complete backward rotation in the air, giving the rider a sense of weightlessness and adrenaline rush. In this article, we\'ll explore the details of this epic figure.\r\n\r\n## What is the Backflip?\r\n\r\nThe Backflip is a snowboarding maneuver where the rider performs a complete backward rotation while airborne. It\'s an advanced maneuver that requires courage, technique, and self-confidence. Riders often execute Backflips during freestyle sessions in snow parks or backcountry descents.\r\n\r\n## How to Perform a Backflip?\r\n\r\n1. **Preparation:** Before attempting a Backflip, make sure you have solid snowboarding experience and good jump control.\r\n\r\n2. **Approach:** Gain momentum by riding down the slope at a moderate to high speed. Bend your knees slightly to absorb bumps and irregularities in the terrain.\r\n\r\n3. **Takeoff:** As you approach the jump, bend your knees further to compress your board and build energy for the jump.\r\n\r\n4. **Impulse:** At the launch point, push firmly on the tail of your board to lift off the ground. Jump upward while keeping your body straight and the board parallel to the ground.\r\n\r\n5. **Rotation:** While in the air, tilt your head and shoulders backward to initiate the rotation. Engage your core muscles to create a compact and controlled rotation.\r\n\r\n6. **Eye Focus:** Keep your eyes focused on the ground to help maintain your orientation and control the rotation.\r\n\r\n7. **Landing:** Anticipate your landing by gradually bringing your board back to the normal position. Bend your knees to absorb the impact and cushion the landing.\r\n\r\n## Tips for Safely Performing a Backflip\r\n\r\n- Start by practicing on a trampoline or in a foam pit to get familiar with the rotation movement.\r\n  \r\n- Practice performing Backflips on small jumps before attempting them on larger ones.\r\n  \r\n- Always wear a helmet and appropriate protective gear when practicing acrobatic maneuvers.\r\n\r\nIn conclusion, the Backflip is a snowboarding figure that embodies the spirit of progression, courage, and daring in freestyle snowboarding. With regular practice, good technique, and a positive attitude, you can master this epic maneuver and push your limits on the snow.', '2024-02-12 06:56:13', '2024-02-12 07:02:59', 'Jump Trick', 'backflip-main-65c9b2fdcbe91.jpg', 'backflip'),
(89, 58, 'Method Grab', '# The Method Grab: Elegance and Style in the Air\r\n\r\nThe Method Grab is one of the most stylish and iconic maneuvers in snowboard freestyle. This bold move combines the elegance of the grab with the fluidity of rotation, creating a unique and impressive visual aesthetic. In this article, we\'ll dive into the details of this classic figure.\r\n\r\n## What is the Method Grab?\r\n\r\nThe Method Grab is a snowboarding maneuver where the rider extends the back leg while grabbing the heel edge of the board with the back hand and bending the front leg. This figure is characterized by its amplitude, symmetry, and grace, and it\'s often performed on large jumps in snow parks or backcountry terrain.\r\n\r\n## How to Perform a Method Grab?\r\n\r\n1. **Approach:** Start by gaining momentum as you descend the slope at a moderate to high speed. Look for an appropriate jump with enough space to execute the maneuver.\r\n\r\n2. **Preparation:** Bend your knees slightly to absorb bumps and irregularities in the terrain. Keep your shoulders aligned with the direction of your trajectory.\r\n\r\n3. **Takeoff:** At the moment of takeoff, push firmly on the tail of your board to lift off the ground. Jump upward while keeping your body straight and the board parallel to the ground.\r\n\r\n4. **Grab:** Once in the air, extend the back leg and bend the front leg. Reach for the heel edge of your board with your back hand and grip it firmly.\r\n\r\n5. **Position:** Ensure you adopt a symmetrical and balanced position in the air. Extend your arms and legs to maximize the amplitude of the figure.\r\n\r\n6. **Hold:** Maintain the grab for as long as possible while retaining control of your rotation.\r\n\r\n7. **Landing:** Anticipate your landing by gradually bringing your board back to the normal position. Bend your knees to absorb the impact and cushion the landing.\r\n\r\n## Tips for Perfecting Your Method Grab\r\n\r\n- Practice the grab on small jumps before attempting larger ones. Focus on the precision and timing of the grab.\r\n\r\n- Work on the fluidity of your movement by combining the grab with a smooth and symmetrical rotation.\r\n\r\n- Visualize the figure before executing it and keep your eyes on your landing point to maintain balance and stability.\r\n\r\nIn conclusion, the Method Grab is a snowboarding figure that embodies the elegance, style, and technical mastery of the rider. With practice and determination, you can add this classic maneuver to your repertoire and impress your friends on the snowboard slopes.', '2024-02-12 07:01:38', '2024-02-12 07:08:46', 'Grab Trick', 'method-grab-main-65c9b4425f340.jpg', 'method-grab'),
(90, 58, 'Tail Grab', '# Perfecting the Tailgrab: Adding Style to Your Snowboard Tricks\r\n\r\nThe Tailgrab is a classic snowboarding trick that adds flair and style to your riding. It\'s a fundamental grab trick that involves reaching down and grabbing the tail of your snowboard while in the air. In this article, we\'ll explore the details of this stylish maneuver and how to master it.\r\n\r\n## What is the Tailgrab?\r\n\r\nThe Tailgrab is a snowboarding trick where the rider reaches down and grabs the tail of their snowboard with their back hand while in mid-air. This grab adds style and flair to jumps and tricks, and it\'s a staple in the repertoire of any freestyle snowboarder.\r\n\r\n## How to Perform a Tailgrab?\r\n\r\n1. **Approach:** Start by riding with moderate speed towards a jump or feature in the terrain park. Choose a suitable takeoff point with enough space to execute the trick.\r\n\r\n2. **Takeoff:** As you approach the lip of the jump, bend your knees and compress your snowboard. This will help generate upward momentum for the jump.\r\n\r\n3. **Launch:** At the lip of the jump, extend your legs explosively to launch yourself into the air. As you leave the ground, reach down with your back hand and grab the tail of your snowboard.\r\n\r\n4. **Grab:** Extend your arm to reach for the tail of your snowboard, and grab it firmly. Try to get a solid grip on the tail to maintain control throughout the trick.\r\n\r\n5. **Hold:** Maintain the grab for as long as possible while in the air. Focus on keeping your body stable and balanced.\r\n\r\n6. **Release:** As you begin to descend, release the grab and prepare for landing.\r\n\r\n7. **Landing:** As you approach the landing, bring your snowboard back to a level position. Bend your knees to absorb the impact and ensure a smooth landing.\r\n\r\n## Tips for Perfecting Your Tailgrab\r\n\r\n- Practice the tailgrab on small jumps before attempting it on larger features. Focus on timing and precision.\r\n  \r\n- Keep your eyes focused on the landing throughout the trick to maintain balance and control.\r\n  \r\n- Experiment with different variations of the tailgrab, such as tweaking the grab or combining it with spins.\r\n\r\nIn conclusion, the Tailgrab is a stylish and versatile snowboarding trick that adds flair to your riding. By mastering the technique and practicing regularly, you can add this classic grab to your repertoire and impress your friends on the slopes.', '2024-02-12 07:08:35', '2024-02-12 07:08:35', 'Grab Trick', 'tail-grab-main-65c9b5e3de0f4.jpg', 'tail-grab'),
(91, 58, 'Indy Grab', '# Perfecting the Indy Grab: Adding Style and Flair to Your Riding\r\n\r\nThe Indy Grab is a stylish and iconic snowboarding trick that adds flair and creativity to your riding. This grab trick involves reaching down and grabbing the toe edge of the snowboard between the bindings with the back hand while in mid-air. In this article, we\'ll explore the details of the Indy Grab and how to master it.\r\n\r\n## What is the Indy Grab?\r\n\r\nThe Indy Grab is a snowboarding trick where the rider reaches down with their back hand and grabs the toe edge of the snowboard between the bindings while in mid-air. This grab adds style and creativity to jumps and tricks, and it\'s a favorite among freestyle snowboarders for its visual appeal and versatility.\r\n\r\n## How to Perform an Indy Grab?\r\n\r\n1. **Approach:** Start by riding with moderate speed towards a jump or feature in the terrain park. Choose a suitable takeoff point with enough space to execute the trick.\r\n\r\n2. **Takeoff:** As you approach the lip of the jump, bend your knees and compress your snowboard. This will help generate upward momentum for the jump.\r\n\r\n3. **Launch:** At the lip of the jump, extend your legs explosively to launch yourself into the air. As you leave the ground, reach down with your back hand and grab the toe edge of your snowboard between the bindings.\r\n\r\n4. **Grab:** Extend your arm to reach for the toe edge of your snowboard, and grab it firmly between the bindings. Try to get a solid grip on the edge to maintain control throughout the trick.\r\n\r\n5. **Hold:** Maintain the grab for as long as possible while in the air. Focus on keeping your body stable and balanced.\r\n\r\n6. **Release:** As you begin to descend, release the grab and prepare for landing.\r\n\r\n7. **Landing:** As you approach the landing, bring your snowboard back to a level position. Bend your knees to absorb the impact and ensure a smooth landing.\r\n\r\n## Tips for Perfecting Your Indy Grab\r\n\r\n- Practice the Indy Grab on small jumps before attempting it on larger features. Focus on timing and precision.\r\n  \r\n- Keep your eyes focused on the landing throughout the trick to maintain balance and control.\r\n  \r\n- Experiment with different variations of the Indy Grab, such as tweaking the grab or combining it with spins.\r\n\r\nIn conclusion, the Indy Grab is a stylish and versatile snowboarding trick that adds flair to your riding. By mastering the technique and practicing regularly, you can add this classic grab to your repertoire and impress your friends on the slopes.', '2024-02-12 07:13:35', '2024-02-12 07:13:35', 'Grab Trick', 'indy-grab-main-65c9b70fbca02.jpg', 'indy-grab'),
(92, 58, 'Frontside Boardslide', '# Mastering the Frontside Boardslide: Adding Technical Skill to Your Snowboarding\r\n\r\nThe Frontside Boardslide is a classic and technical snowboarding trick that adds style and challenge to your riding. This maneuver involves sliding along a rail or box with the snowboard perpendicular to the feature, with the rider\'s front side facing downhill. In this article, we\'ll delve into the details of the Frontside Boardslide and how to master it.\r\n\r\n## What is the Frontside Boardslide?\r\n\r\nThe Frontside Boardslide is a snowboarding trick where the rider approaches a rail or box in the terrain park and slides along it with the snowboard perpendicular to the feature. The rider\'s front side faces downhill during the slide, adding an element of technical difficulty and style to the trick.\r\n\r\n## How to Perform a Frontside Boardslide?\r\n\r\n1. **Approach:** Approach the rail or box with moderate speed and confidence. Align yourself perpendicular to the feature, with your front foot slightly in front of the rail.\r\n\r\n2. **Ollie onto the Feature:** As you reach the takeoff point, perform an Ollie to lift yourself onto the rail or box. Aim to land with your snowboard centered and parallel to the feature.\r\n\r\n3. **Engage the Boardslide:** Once on the rail or box, shift your weight slightly towards your front foot to engage the frontside boardslide. Keep your body centered over the feature and your knees bent for balance.\r\n\r\n4. **Slide Along the Feature:** Maintain your balance and control as you slide along the rail or box. Keep your eyes focused on the end of the feature to maintain your trajectory.\r\n\r\n5. **Prepare for Landing:** As you approach the end of the feature, prepare to dismount by shifting your weight slightly back towards your rear foot.\r\n\r\n6. **Dismount:** As your snowboard reaches the end of the rail or box, shift your weight back and ollie off the feature to land smoothly on the snow.\r\n\r\n## Tips for Perfecting Your Frontside Boardslide\r\n\r\n- Start with small, low-risk features before progressing to larger rails or boxes.\r\n  \r\n- Focus on keeping your movements smooth and controlled throughout the slide.\r\n  \r\n- Experiment with different approaches and angles to find what feels most comfortable for you.\r\n\r\nIn conclusion, the Frontside Boardslide is a challenging and rewarding snowboarding trick that adds technical skill and style to your riding. With practice and determination, you can master this maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 07:18:49', '2024-02-12 07:18:49', 'Slide Trick', 'frontside-boardslide-main-65c9b849e5ea5.jpg', 'frontside-boardslide'),
(93, 58, 'Backside 540', '# Mastering the Backside 540: Pushing the Limits of Rotation\r\n\r\nThe Backside 540 is an advanced snowboarding trick that showcases agility, skill, and aerial prowess. This maneuver involves rotating the snowboarder 540 degrees clockwise (for a regular rider) while in mid-air, adding a high degree of technical difficulty and style to their riding. In this article, we\'ll explore the details of the Backside 540 and how to master it.\r\n\r\n## What is the Backside 540?\r\n\r\nThe Backside 540 is a snowboarding trick where the rider rotates their body and snowboard 540 degrees clockwise (for a regular rider) while in mid-air. This maneuver requires precise timing, coordination, and commitment, as the rider executes multiple rotations before landing.\r\n\r\n## How to Perform a Backside 540?\r\n\r\n1. **Approach:** Begin by riding towards the jump or feature with confidence and speed. Choose a takeoff point that provides enough height and distance for the trick.\r\n\r\n2. **Takeoff:** As you approach the lip of the jump, bend your knees and compress your snowboard to generate upward momentum. Aim to take off from the jump with a slight heel edge carve.\r\n\r\n3. **Launch:** At the lip of the jump, extend your legs explosively to propel yourself into the air. As you leave the ground, initiate the rotation by winding up your upper body and shoulders.\r\n\r\n4. **Rotation:** Tuck your knees towards your chest and begin the backside rotation by turning your head and shoulders towards your backside. Use your arms to help generate momentum and control the rotation.\r\n\r\n5. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the rotation to maintain orientation and balance. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n6. **Stomping the Landing:** As you complete the rotation, extend your legs to prepare for landing. Aim to land with your snowboard flat and perpendicular to the slope. Bend your knees upon impact to absorb the landing and maintain control.\r\n\r\n## Tips for Perfecting Your Backside 540\r\n\r\n- Start by practicing backside spins on smaller jumps before attempting the Backside 540 on larger features.\r\n  \r\n- Focus on generating rotational momentum with your upper body and shoulders, while keeping your lower body compact and controlled.\r\n  \r\n- Visualize the trick in your mind before attempting it, and stay committed throughout the rotation.\r\n\r\nIn conclusion, the Backside 540 is an advanced snowboarding trick that requires skill, determination, and commitment. With practice and perseverance, you can master this impressive maneuver and elevate your riding to new heights.', '2024-02-12 07:28:01', '2024-02-12 07:28:01', 'Jump Trick', 'backside-540-main-65c9ba7162a79.webp', 'backside-540'),
(94, 58, 'Nose Press', '# Mastering the Nose Press: Achieving Balance and Control\r\n\r\nThe Nose Press is a stylish and technical snowboarding trick that demonstrates balance, control, and finesse on the snow. This maneuver involves riding along a rail or box with the snowboard\'s nose (front) pressed against the feature, while the tail (back) is lifted off the snow. In this article, we\'ll explore the details of the Nose Press and how to master it.\r\n\r\n## What is the Nose Press?\r\n\r\nThe Nose Press is a snowboarding trick where the rider rides along a rail or box with the snowboard\'s nose pressed against the feature. This creates a stylish and visually appealing maneuver that showcases the rider\'s ability to maintain balance and control in a challenging position.\r\n\r\n## How to Perform a Nose Press?\r\n\r\n1. **Approach:** Approach the rail or box with moderate speed and confidence. Align yourself perpendicular to the feature, with your front foot slightly in front of the rail.\r\n\r\n2. **Ollie onto the Feature:** As you reach the takeoff point, perform an Ollie to lift yourself onto the rail or box. Aim to land with your snowboard\'s nose pressed against the feature and your weight centered over the front foot.\r\n\r\n3. **Engage the Nose Press:** Once on the rail or box, shift your weight forward onto your front foot to engage the nose press. Keep your body centered over the feature and your knees bent for balance.\r\n\r\n4. **Maintain Balance:** Focus on keeping your weight centered over the front foot and maintaining pressure on the nose of the snowboard. Use subtle adjustments in your body position to maintain balance and control.\r\n\r\n5. **Slide Along the Feature:** Ride smoothly along the rail or box, keeping the nose pressed against the feature. Keep your eyes focused on the end of the feature to maintain your trajectory.\r\n\r\n6. **Prepare for Landing:** As you approach the end of the feature, prepare to dismount by shifting your weight slightly back towards your rear foot.\r\n\r\n7. **Dismount:** As your snowboard reaches the end of the rail or box, shift your weight back and ollie off the feature to land smoothly on the snow.\r\n\r\n## Tips for Perfecting Your Nose Press\r\n\r\n- Start with small, low-risk features before progressing to larger rails or boxes.\r\n  \r\n- Focus on keeping your movements smooth and controlled throughout the press.\r\n  \r\n- Experiment with different approaches and angles to find what feels most comfortable for you.\r\n\r\nIn conclusion, the Nose Press is a stylish and technical snowboarding trick that adds finesse and flair to your riding. With practice and determination, you can master this maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 07:35:39', '2024-02-12 07:35:39', 'Rail Trick', 'nose-press-main-65c9bc3bd7e10.avif', 'nose-press'),
(95, 58, '50-50', '# Mastering the 50-50: Perfecting Rail Riding Basics\r\n\r\nThe 50-50 is one of the foundational rail tricks in snowboarding, essential for mastering rail riding basics. In this maneuver, the rider slides straight along a rail or box with the snowboard parallel to the feature. Let\'s explore the details of this trick and how to master it.\r\n\r\n## What is the 50-50?\r\n\r\nThe 50-50 is a snowboarding trick where the rider slides straight along a rail or box with the snowboard parallel to the feature. This trick is named \"50-50\" because the rider\'s weight is evenly distributed over both feet, with each foot representing 50% of the weight.\r\n\r\n## How to Perform a 50-50?\r\n\r\n1. **Approach:** Ride toward the rail or box with moderate speed and confidence. Position yourself perpendicular to the feature, with your snowboard centered and aligned.\r\n\r\n2. **Ollie onto the Feature:** As you reach the takeoff point, perform an Ollie to lift yourself onto the rail or box. Aim to land with your snowboard flat and parallel to the feature.\r\n\r\n3. **Engage the 50-50:** Once on the rail or box, center your weight over the snowboard and align it parallel to the feature. Keep your knees bent and your body centered for balance.\r\n\r\n4. **Slide Along the Feature:** Ride smoothly along the rail or box, keeping your snowboard parallel and centered. Use subtle adjustments in your body position to maintain balance and control.\r\n\r\n5. **Prepare for Landing:** As you approach the end of the feature, prepare to dismount by shifting your weight slightly back towards your rear foot.\r\n\r\n6. **Dismount:** As your snowboard reaches the end of the rail or box, shift your weight back and ollie off the feature to land smoothly on the snow.\r\n\r\n## Tips for Perfecting Your 50-50\r\n\r\n- Start with small, low-risk features before progressing to larger rails or boxes.\r\n  \r\n- Focus on keeping your movements smooth and controlled throughout the slide.\r\n  \r\n- Experiment with different approaches and angles to find what feels most comfortable for you.\r\n\r\nIn conclusion, the 50-50 is a fundamental rail trick in snowboarding, essential for mastering rail riding basics. With practice and determination, you can master this maneuver and build a solid foundation for more advanced rail tricks on the slopes.', '2024-02-12 07:41:57', '2024-02-12 07:41:57', 'Rail Trick', '50-50-main-65c9bdb5645c4.webp', '50-50'),
(96, 58, 'Frontside 360', '# Mastering the Frontside 360: Dynamic Rotation and Style\r\n\r\nThe Frontside 360 is a classic snowboarding trick that combines dynamic rotation with style and finesse. In this maneuver, the rider rotates their body 360 degrees clockwise (for a regular rider) while in mid-air, adding flair and creativity to their riding. Let\'s explore the details of this iconic trick and how to master it.\r\n\r\n## What is the Frontside 360?\r\n\r\nThe Frontside 360 is a snowboarding trick where the rider rotates their body 360 degrees clockwise (for a regular rider) while in mid-air. This trick is typically performed off jumps or natural features, and it\'s known for its smooth and stylish appearance.\r\n\r\n## How to Perform a Frontside 360?\r\n\r\n1. **Approach:** Ride toward the jump or feature with moderate speed and confidence. Position yourself for takeoff, ensuring a good line and trajectory.\r\n\r\n2. **Takeoff:** As you reach the lip of the jump, compress your snowboard and prepare for takeoff. Use your legs to generate upward momentum.\r\n\r\n3. **Launch:** Spring off the lip of the jump with power and confidence. As you leave the ground, initiate the rotation by turning your head and shoulders in the direction of the spin (clockwise for regular riders).\r\n\r\n4. **Rotation:** Use your arms and shoulders to lead the rotation, aiming to complete a full 360-degree turn in the air. Keep your body compact and controlled throughout the spin.\r\n\r\n5. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the rotation. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n6. **Landing:** As you complete the rotation, extend your legs to prepare for landing. Aim to land with your snowboard flat and parallel to the slope. Bend your knees upon impact to absorb the landing and maintain control.\r\n\r\n## Tips for Perfecting Your Frontside 360\r\n\r\n- Practice on smaller jumps before attempting the Frontside 360 on larger features.\r\n- Focus on generating rotational momentum with your upper body while keeping your lower body compact and controlled.\r\n- Visualize the trick in your mind before attempting it, and stay committed throughout the rotation.\r\n\r\nIn conclusion, the Frontside 360 is a stylish and dynamic snowboarding trick that showcases skill, creativity, and style. With practice and determination, you can master this impressive maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 07:47:30', '2024-02-13 04:37:11', 'Base Trick', 'frontside-360-main-65c9bf025ff0a.jpg', 'frontside-360'),
(97, 58, 'Stalefish Grab', '# Mastering the Stalefish Grab: Adding Flair and Style to Your Riding\r\n\r\nThe Stalefish Grab is a stylish and eye-catching snowboarding trick that adds flair and creativity to your riding. This grab trick involves reaching back and grabbing the heel edge of the snowboard between the bindings with the trailing hand while in mid-air. Let\'s explore the details of this classic grab and how to master it.\r\n\r\n## What is the Stalefish Grab?\r\n\r\nThe Stalefish Grab is a snowboarding trick where the rider reaches back with their trailing hand and grabs the heel edge of the snowboard between the bindings while in mid-air. This grab adds a stylish and dynamic element to jumps and tricks, and it\'s a favorite among freestyle snowboarders for its visual appeal and versatility.\r\n\r\n## How to Perform a Stalefish Grab?\r\n\r\n1. **Approach:** Ride toward the jump or feature with moderate speed and confidence. Position yourself for takeoff, ensuring a good line and trajectory.\r\n\r\n2. **Takeoff:** As you reach the lip of the jump, compress your snowboard and prepare for takeoff. Use your legs to generate upward momentum.\r\n\r\n3. **Launch:** Spring off the lip of the jump with power and confidence. As you leave the ground, extend your trailing hand back and reach for the heel edge of the snowboard between the bindings.\r\n\r\n4. **Grab:** Grab the heel edge of the snowboard firmly between the bindings with your trailing hand. Try to get a solid grip on the edge to maintain control throughout the trick.\r\n\r\n5. **Hold:** Maintain the grab for as long as possible while in the air. Focus on keeping your body stable and balanced.\r\n\r\n6. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the grab. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n7. **Landing:** As you begin to descend, release the grab and prepare for landing. Extend your legs to absorb the impact and ensure a smooth landing.\r\n\r\n## Tips for Perfecting Your Stalefish Grab\r\n\r\n- Practice on smaller jumps before attempting the Stalefish Grab on larger features.\r\n- Focus on reaching back and grabbing the heel edge of the snowboard firmly between the bindings.\r\n- Experiment with different variations of the grab, such as tweaking the grab or combining it with spins.\r\n\r\nIn conclusion, the Stalefish Grab is a stylish and versatile snowboarding trick that adds flair and creativity to your riding. With practice and determination, you can master this grab and add it to your repertoire of tricks on the slopes.', '2024-02-12 07:52:21', '2024-02-12 07:52:21', 'Grab Trick', 'stalefish-grab-main-65c9c02569c14.jpg', 'stalefish-grab'),
(98, 58, 'Japan Air', '# Mastering the Japan Air: Adding Style and Flair to Your Riding\r\n\r\nThe Japan Air is a stylish and visually striking snowboarding trick that combines grab technique with aerial finesse. This maneuver involves grabbing the toe edge of the snowboard with the front hand while extending the back leg straight out behind the rider, creating a distinctive and stylish pose in the air. Let\'s explore the details of this trick and how to master it.\r\n\r\n## What is the Japan Air?\r\n\r\nThe Japan Air is a snowboarding trick where the rider grabs the toe edge of the snowboard with the front hand while simultaneously extending the back leg straight out behind them. This grab creates a stylish and visually appealing pose in the air, adding flair and creativity to jumps and tricks.\r\n\r\n## How to Perform a Japan Air?\r\n\r\n1. **Approach:** Ride toward the jump or feature with moderate speed and confidence. Position yourself for takeoff, ensuring a good line and trajectory.\r\n\r\n2. **Takeoff:** As you reach the lip of the jump, compress your snowboard and prepare for takeoff. Use your legs to generate upward momentum.\r\n\r\n3. **Launch:** Spring off the lip of the jump with power and confidence. As you leave the ground, extend your front hand toward the toe edge of the snowboard.\r\n\r\n4. **Grab:** Grab the toe edge of the snowboard with your front hand, reaching across your body. At the same time, extend your back leg straight out behind you, creating a stylish and balanced pose in the air.\r\n\r\n5. **Hold:** Maintain the grab for as long as possible while maintaining control of your rotation. Focus on keeping your body stable and balanced.\r\n\r\n6. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the trick. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n7. **Landing:** As you complete the grab, prepare for landing by bringing your snowboard back to a level position. Aim to land with your snowboard flat and parallel to the slope. Bend your knees upon impact to absorb the landing and maintain control.\r\n\r\n## Tips for Perfecting Your Japan Air\r\n\r\n- Practice grabbing the toe edge of the snowboard with your front hand while riding on flat terrain before attempting the Japan Air.\r\n- Focus on extending your back leg straight out behind you to create a stylish and balanced pose in the air.\r\n- Visualize the trick in your mind before attempting it, and stay committed throughout the grab.\r\n\r\nIn conclusion, the Japan Air is a stylish and visually striking snowboarding trick that adds flair and creativity to your riding. With practice and determination, you can master this impressive maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 08:02:22', '2024-02-12 08:02:22', 'Grab Trick', 'japan-air-main-65c9c27e6c465.jpg', 'japan-air'),
(99, 58, 'Cab 540', '# Mastering the Cab 540: Adding Style and Complexity to Your Riding\r\n\r\nThe Cab 540 is a stylish and complex snowboarding trick that combines rotation, grabs, and technical skill. In this maneuver, the rider rotates their body 540 degrees (one and a half full rotations) while in mid-air, adding flair and creativity to their riding. Let\'s explore the details of this trick and how to master it.\r\n\r\n## What is the Cab 540?\r\n\r\nThe Cab 540 is a snowboarding trick where the rider rotates their body 540 degrees (one and a half full rotations) while in mid-air. This trick is typically performed off jumps or natural features, and it\'s known for its combination of style and technical difficulty.\r\n\r\n## How to Perform a Cab 540?\r\n\r\n1. **Approach:** Ride toward the jump or feature with moderate speed and confidence. Position yourself for takeoff, ensuring a good line and trajectory.\r\n\r\n2. **Takeoff:** As you reach the lip of the jump, compress your snowboard and prepare for takeoff. Use your legs to generate upward momentum.\r\n\r\n3. **Launch:** Spring off the lip of the jump with power and confidence. As you leave the ground, initiate the rotation by winding up your upper body and shoulders.\r\n\r\n4. **Rotation:** Tuck your knees toward your chest to initiate the spin. Use your arms and shoulders to lead the rotation, aiming to complete one and a half rotations (540 degrees) in the air.\r\n\r\n5. **Grab:** Extend one hand toward the tail of your snowboard and grab it firmly. Aim to grab the tail with your back hand, reaching across your body for the grab.\r\n\r\n6. **Hold:** Maintain the grab for as long as possible while maintaining control of your rotation. Focus on keeping your body compact and stable in the air.\r\n\r\n7. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the rotation. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n8. **Landing:** As you complete the rotation, extend your legs to prepare for landing. Aim to land with your snowboard flat and parallel to the slope. Bend your knees upon impact to absorb the landing and maintain control.\r\n\r\n## Tips for Perfecting Your Cab 540\r\n\r\n- Practice on smaller jumps before attempting the Cab 540 on larger features.\r\n- Focus on generating rotational momentum with your upper body while keeping your lower body compact and controlled.\r\n- Visualize the trick in your mind before attempting it, and stay committed throughout the rotation.\r\n\r\nIn conclusion, the Cab 540 is a dynamic and stylish snowboarding trick that requires skill, precision, and commitment. With practice and determination, you can master this impressive maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 08:09:48', '2024-02-12 08:09:48', 'Jump Trick', 'cab-540-main-65c9c43ca2c80.webp', 'cab-540'),
(100, 58, 'Rodeo', '# Mastering the Rodeo: Defying Gravity with Style\r\n\r\nThe Rodeo is an advanced and gravity-defying snowboarding trick that showcases style, skill, and aerial prowess. In this maneuver, the rider performs a backflip while simultaneously executing a 360-degree rotation, resulting in a dynamic and visually stunning trick. Let\'s delve into the details of this impressive maneuver and how to master it.\r\n\r\n## What is the Rodeo?\r\n\r\nThe Rodeo is a snowboarding trick where the rider combines a backflip with a 360-degree rotation. This trick is often performed on large jumps in the terrain park or in backcountry terrain, and it requires a high level of skill, confidence, and commitment.\r\n\r\n## How to Perform a Rodeo?\r\n\r\n1. **Approach:** Ride toward the jump or feature with confidence and speed. Position yourself for takeoff, ensuring a good line and trajectory.\r\n\r\n2. **Takeoff:** As you reach the lip of the jump, compress your snowboard and prepare for takeoff. Use your legs to generate upward momentum.\r\n\r\n3. **Launch:** Spring off the lip of the jump with power and confidence. As you leave the ground, initiate the backflip by tucking your knees toward your chest.\r\n\r\n4. **Rotation:** Simultaneously initiate the 360-degree rotation by turning your head and shoulders in the direction of the spin. Use your arms and shoulders to lead the rotation, aiming to complete a full rotation while upside down.\r\n\r\n5. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the rotation. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n6. **Unwind:** As you spot the landing, begin to unwind the rotation and prepare for landing. Extend your legs to bring your snowboard back to a level position.\r\n\r\n7. **Landing:** Aim to land with your snowboard flat and parallel to the slope. Bend your knees upon impact to absorb the landing and maintain control.\r\n\r\n## Tips for Perfecting Your Rodeo\r\n\r\n- Practice on smaller jumps before attempting the Rodeo on larger features.\r\n- Focus on generating rotational momentum with your upper body while keeping your lower body compact and controlled.\r\n- Visualize the trick in your mind before attempting it, and stay committed throughout the rotation.\r\n\r\nIn conclusion, the Rodeo is an advanced snowboarding trick that pushes the limits of style, skill, and creativity. With practice, determination, and a fearless attitude, you can master this impressive maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 08:17:00', '2024-02-12 08:19:47', 'Jump Trick', 'rodeo-main-65c9c5ec8f2d0.jpg', 'rodeo'),
(101, 75, 'Method Airs', '# Mastering the Method Air: Iconic Style and Grace in the Air\r\n\r\nThe Method Air is one of the most iconic and stylish snowboarding tricks, known for its combination of grace, amplitude, and technical skill. In this maneuver, the rider performs a stylish grab while arching their back and extending their legs, creating a visually stunning and expressive movement in the air. Let\'s explore the details of this classic trick and how to master it.\r\n\r\n## What is the Method Air?\r\n\r\nThe Method Air is a snowboarding trick where the rider performs a grab while arching their back and extending their legs, creating a distinctive and stylish shape in the air. This trick is often performed off jumps or natural features, and it\'s renowned for its aesthetic appeal and technical difficulty.\r\n\r\n## How to Perform a Method Air?\r\n\r\n1. **Approach:** Ride toward the jump or feature with moderate speed and confidence. Position yourself for takeoff, ensuring a good line and trajectory.\r\n\r\n2. **Takeoff:** As you reach the lip of the jump, compress your snowboard and prepare for takeoff. Use your legs to generate upward momentum.\r\n\r\n3. **Launch:** Spring off the lip of the jump with power and confidence. As you leave the ground, extend your legs and arch your back, creating a stylish and exaggerated posture in the air.\r\n\r\n4. **Grab:** Reach down with one hand (typically the back hand) and grab the heel edge of your snowboard between the bindings. Aim to grab the board as close to the center as possible.\r\n\r\n5. **Hold:** Maintain the grab for as long as possible while maintaining control of your body position. Focus on keeping your back arched and your legs extended to maximize the aesthetic appeal of the trick.\r\n\r\n6. **Spotting the Landing:** Keep your eyes focused on the landing spot throughout the trick. Spotting the landing will help you time your movements for a smooth landing.\r\n\r\n7. **Landing:** As you prepare to land, release the grab and prepare to absorb the impact. Aim to land with your snowboard flat and parallel to the slope. Bend your knees upon impact to absorb the landing and maintain control.\r\n\r\n## Tips for Perfecting Your Method Air\r\n\r\n- Practice on smaller jumps before attempting the Method Air on larger features.\r\n- Focus on creating a stylish and exaggerated posture in the air, with a deep arch in your back and fully extended legs.\r\n- Visualize the trick in your mind before attempting it, and stay committed throughout the execution.\r\n\r\nIn conclusion, the Method Air is a timeless snowboarding trick that showcases style, grace, and technical skill. With practice and determination, you can master this iconic maneuver and add it to your repertoire of tricks on the slopes.', '2024-02-12 08:21:48', '2024-02-13 06:45:38', 'Jump Trick', 'method-air-main-65c9c70cc1924.jpg', 'method-airs'),
(109, 58, 'Ollie', '# Mastering the Ollie: The Foundation of Snowboard Freestyle\r\n\r\nSnowboarding is a dynamic and versatile sport that offers a multitude of opportunities for expression on the snow. Among the essential basic techniques to master for any aspiring snowboarder looking to explore the world of freestyle is the Ollie. This maneuver, though simple in appearance, is the foundation upon which many other tricks are built. In this article, we\'ll delve into the details of this essential technique.\r\n\r\n## What is the Ollie?\r\n\r\nThe Ollie is a fundamental snowboarding maneuver that involves jumping by applying pressure on the tail of the board to lift it off the ground. Initially popularized by skateboarders, this technique has become an essential element of the repertoire of any freestyle snowboarder.\r\n\r\n## How to Perform an Ollie?\r\n\r\n1. **Positioning:** Start with a centered position on your board, with knees slightly bent. Ensure a good weight distribution between both feet.\r\n\r\n2. **Flexing:** Bend your knees to compress the board. You should feel tension in your legs.\r\n\r\n3. **Pressure:** Once flexed, apply firm and quick pressure on the tail of your board with your back leg. This will create the necessary impulse to lift the board off the ground.\r\n\r\n4. **Lift-off:** While applying this pressure, jump with your board by leaning slightly back. You should feel the board lift under your feet.\r\n\r\n5. **Leveling:** While in the air, extend your legs to allow the board to stabilize. Try to keep your board as parallel to the ground as possible.\r\n\r\n6. **Landing:** Anticipate your landing by slightly bending your knees to absorb the impact. Try to land with both feet simultaneously for a smooth landing.\r\n\r\n## Tips for Improving Your Ollie\r\n\r\n- Practice finding the right balance between the pressure applied to the tail of the board and the impulse of the jump. It may take some practice to master coordination.\r\n\r\n- Keep your eyes focused on your landing spot. Clear vision will help you maintain balance and anticipate your landing.\r\n\r\n- Be patient and persistent. As with any new skill, mastering the Ollie takes time and regular practice.\r\n\r\nIn conclusion, the Ollie is more than just a simple snowboarding trick; it\'s the foundation upon which all freestyle riding is built. By understanding and mastering this technique, you open the door to an infinite world of possibilities on the snow. So, grab your board, find a slope, and start jumping. The sky is literally the limit!', '2024-02-13 08:47:32', '2024-02-13 15:46:31', 'Jump Trick', 'ollie-main-65cb1e94c349d.jpg', 'ollie');

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
(58, 'renaudcharlespro@gmail.com', '$2y$13$KuJHB9nw6QUdw/lr2OblTO57oXqchGOBk3SmQ7IT.WVr/0Jrel6qC', '[\"ROLE_ADMIN\"]', 1, 'd8d5857a218090607949c3fdd2619dd3', 'Charles Renaud', NULL, 'admin-65ccb5cd430b9.png'),
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
(74, 'renaudcharlespro@gmail.comokok', '$2y$13$rZMXSj0HaezCbvPpUwzokuIHnMuFcpfLStNBCMVaN0S/sgwv47E3e', '[\"ROLE_VISITOR\"]', 0, '17d02cfee957559435edefba75d63e0d', 'Charles Renaud', NULL, '/images/anim-redirection.gif'),
(75, 'cocasag337@fkcod.com', '$2y$13$C.3thdkrIoEaBRKlQe/IH.W0aX37MUMqsSfWFXDD0M9rBfBNMb4BC', '[\"ROLE_USER\"]', 1, 'a485a52c0cafc734cfc9b70c516e14c6', 'Francis Snow', NULL, 'user-default-icon-65cb01a504529.png'),
(76, 'jeantest@gmail.com', '$2y$13$WBZ.Qm0TQKin/tZ6MHxG/./ABa5hbILAc9rgQe82qvJvNMG7K3cNO', '[\"ROLE_VISITOR\"]', 0, 'df3e23fab8d24db1725d6d4c1014ddaf', 'Jean test', NULL, 'user-default-icon.png');

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
(68, NULL, NULL),
(69, NULL, NULL),
(70, NULL, NULL),
(71, NULL, NULL),
(72, NULL, NULL),
(73, NULL, NULL),
(74, NULL, NULL),
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
(104, NULL, NULL),
(105, NULL, NULL),
(106, NULL, NULL),
(107, NULL, NULL),
(108, NULL, NULL),
(109, NULL, NULL),
(111, NULL, NULL),
(112, NULL, NULL),
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
(138, NULL, NULL),
(144, 'https://youtu.be/C0CW3Qbonnk?si=d3qCuNDRB3peh1C5', 87),
(145, 'https://youtu.be/JMS2PGAFMcE?si=knPABbiN_eUgyXJ1', 87),
(146, 'https://youtu.be/hHkQ-OzCIW0?si=nVymLoAV4nA5mCod', 87),
(147, 'https://youtu.be/GnYAlEt-s00?si=fy6-EtFQ2tx07Zis', 87),
(148, 'https://youtu.be/uJMIf-6wi38?si=4GNyN-ek9ZA6DXnt', 87),
(149, 'https://youtu.be/hW_RhD0D-Ew?si=LmGFL9wjNJzDGOyB', 88),
(150, 'https://youtu.be/SlhGVnFPTDE?si=HB9zKJ49D0FlVJU2', 88),
(151, 'https://youtu.be/edHdcgnFKe8?si=VG6Azzz2rHedY7ON', 88),
(152, 'https://youtu.be/mGt3hOHhzjo?si=JZcCl9z6imE0ZVVF', 88),
(153, 'https://youtu.be/W853WVF5AqI?si=0Wb6xzaggKbLHuD7', 88),
(154, 'https://youtu.be/lunYxCQrs1E?si=QA_DKrVa7Vb29OYe', 89),
(155, 'https://youtu.be/_hxLS2ErMiY?si=GRhiwAAAb-MuTM6a', 89),
(156, 'https://youtu.be/6a7H05dTLF8?si=3nqiCG0BNHbsdTC6', 89),
(157, 'https://youtu.be/CA5bURVJ5zk?si=SMswlE1Av9Qc7K86', 89),
(158, 'https://youtu.be/RJc5cYp7HNA?si=ChS1HL-J6UA3fWnz', 89),
(159, 'https://youtu.be/YAElDqyD-3I?si=KA8IhuUy9AxhGxr3', 90),
(160, 'https://youtu.be/gbjwHZDaJLE?si=zGqwQ12inUvRXil0', 90),
(161, 'https://youtu.be/id8VKl9RVQw?si=ie-huWnWCy_lPcUR', 90),
(162, 'https://youtu.be/OMCqVJ8rmyQ?si=hx_tJek_PHeytNTc', 90),
(163, 'https://youtu.be/_Qq-YoXwNQY?si=0Xq4IRhkAEbwdP17', 90),
(164, 'https://youtu.be/B2iRSUyBG24?si=JmQpfgbAa95ceaY6', 91),
(165, 'https://youtu.be/6yA3XqjTh_w?si=kxNNd3JSDI4EgOiK', 91),
(166, 'https://youtu.be/4AlDWWsprZM?si=W005ouNKoj65TAb8', 91),
(167, 'https://youtu.be/G_MEz7oJzro?si=a-QPLtT37WxrAWPV', 91),
(168, 'https://youtu.be/6QsLhWzXGu0?si=bRFqZaxTF5pPIhwq', 91),
(169, 'https://youtu.be/WRjNFodnOHk?si=ITjo8iQFTTq5onKb', 92),
(170, 'https://youtu.be/muN3UNMA5hA?si=BDbnQLHXIXJusUax', 92),
(171, 'https://youtu.be/ex-uSF5K4Vk?si=1pXzJj4oou8FmT-n', 92),
(172, 'https://youtu.be/2MfXjNC15Sg?si=HCjhxFrB6S4ODIqx', 92),
(173, 'https://youtu.be/xczPvfa2LIk?si=ewP17W8vulU3EUtN', 92),
(174, 'https://youtu.be/cdekJgZs9qY?si=xspCVn1dmhyYBvmX', 93),
(175, 'https://youtu.be/5b3YQ774XOY?si=yuh0FALWsWY7scds', 93),
(176, 'https://youtu.be/t8IXNXx68PU?si=2EXzpLJ8a2Hxv87W', 93),
(177, 'https://youtu.be/GIton7lWDVc?si=EZ8Z_WXr4ZUq9ETn', 93),
(178, 'https://youtu.be/IXC_BNYIUOo?si=rnDliilDeUlG-pkH', 93),
(179, 'https://youtu.be/Px2YuKQVS_g?si=0lE6SunBqPQI_9hG', 94),
(180, 'https://youtu.be/gyz_C5xmflI?si=98zADwq3cH0uoowz', 94),
(181, 'https://youtu.be/ehmIHFnNrjM?si=p-apU5CPF8b25KHB', 94),
(182, 'https://youtu.be/879Ks7phGqA?si=U9a7-b6MCGrKsZtW', 94),
(183, 'https://youtu.be/_GPtkZIqZkU?si=Zs1iH-1xa1YrtV6z', 94),
(184, 'https://youtu.be/Bj3EmTrlEbw?si=e9Aievavht3JFocp', 95),
(185, 'https://youtu.be/e-7NgSu9SXg?si=owA4ynDj7mPgZp9k', 95),
(186, 'https://youtu.be/97g33ytDI2Y?si=sJYE_-NlyZLY6NuS', 95),
(187, 'https://youtu.be/DTiFs30PA5k?si=tMRHN_ckBVudrGQM', 95),
(188, 'https://youtu.be/hT_x4FcJzAE?si=xvg9Zc1L6vlgqLdP', 95),
(189, 'https://youtu.be/9T5AWWDxYM4?si=fmkzbCQap8C6kjF2', 96),
(190, 'https://youtu.be/grXpguVaqls?si=U97mPjQ7dP_b1h5j', 96),
(191, 'https://youtu.be/XKoj-e52w30?si=RllxMBElU66Loom9', 96),
(192, 'https://youtu.be/wQHk67wrQCg?si=-XTYfSSz3QQh96Sm', 96),
(193, 'https://youtu.be/SLncsNaU6es?si=gPf6Dcbv7H5I9ywg', 96),
(194, 'https://youtu.be/f9FjhCt_w2U?si=n5nI-53BmR6dxS_g', 97),
(195, 'https://youtu.be/xXCCGYqAWqI?si=u-5CPu6dk7wgJVqE', 97),
(196, 'https://youtu.be/wWmqtgDutls?si=7xcJuJaKaXDMCTIM', 97),
(197, 'https://youtu.be/51sQRIK-TEI?si=l0k1xKxjewto4VB4', 97),
(198, 'https://youtu.be/f0PyFsOcnIw?si=5Jqj0LCOQOYf8SQ6', 97),
(199, 'https://youtu.be/vxBfXyQ_MB4?si=4P1q6BenyZSDjoQr', 98),
(200, 'https://youtu.be/jH76540wSqU?si=_cjDf3aKRTuRRoaI', 98),
(201, 'https://youtu.be/CzDjM7h_Fwo?si=RKt3bTCtKpAhuy_e', 98),
(202, 'https://youtu.be/I7N45iRPrhw?si=xmAjc8NunChxL_GQ', 98),
(203, 'https://youtu.be/X_WhGuIY9Ak?si=G9ZADMWsgSAKMXrm', 98),
(204, 'https://youtu.be/5jRNvYmG6Bs?si=p1pbN6CgWSwDneDL', 99),
(205, 'https://youtu.be/IYJv66_Usys?si=YGC8CaaRhcSzlI3M', 99),
(206, 'https://youtu.be/p4mTzbidCGY?si=lsMLOWMsro9nZTYC', 99),
(207, 'https://youtu.be/nnH1RnH4MJ4?si=Alr-tlPvyrMKHTn5', 99),
(208, 'https://youtu.be/BdkZe7-1mA0?si=YgKEw7SjVxFmuFTh', 99),
(209, 'https://youtu.be/QX6yvs6uTVg?si=flSu8geZebWbAoBN', 100),
(210, 'https://youtu.be/vf9Z05XY79A?si=lDtzSl1o1j9K7vFD', 100),
(211, 'https://youtu.be/kgOy_DKdPyo?si=08QfFDDCvCYqRE-I', 100),
(212, 'https://youtu.be/32y1VcGgm-Y?si=dqYaGPmqVqgk4L_C', 100),
(213, 'https://youtu.be/rAKPgW4yhJc?si=q8-CQ3jO-8-nxWyu', 100),
(214, 'https://youtu.be/lunYxCQrs1E?si=IGseqmb4qSIqOIH_', 101),
(215, 'https://youtu.be/RJc5cYp7HNA?si=bcqYKwZ4Il4FqItD', 101),
(216, 'https://youtu.be/qMsN26DBLVo?si=h3sYDwOmmXnc9uJO', 101),
(217, 'https://youtu.be/_hxLS2ErMiY?si=fwu2DiS8sBIL2cmN', 101),
(218, 'https://youtu.be/JGeEbI7n9zw?si=GXmAEDniiFFSM2s9', 101),
(219, NULL, NULL),
(220, NULL, NULL),
(221, NULL, NULL),
(223, NULL, NULL),
(224, NULL, NULL),
(227, NULL, NULL),
(228, NULL, NULL),
(229, NULL, NULL),
(230, NULL, NULL),
(231, NULL, NULL),
(232, NULL, NULL),
(233, NULL, NULL),
(234, NULL, NULL),
(235, NULL, NULL),
(236, NULL, NULL),
(237, NULL, NULL),
(238, NULL, NULL),
(239, NULL, NULL),
(240, NULL, NULL),
(241, NULL, NULL),
(242, NULL, NULL),
(243, NULL, NULL),
(244, NULL, NULL),
(245, NULL, NULL),
(246, NULL, NULL),
(247, NULL, NULL),
(248, NULL, NULL),
(249, NULL, NULL),
(250, NULL, NULL),
(251, NULL, NULL),
(252, NULL, NULL),
(253, NULL, NULL),
(254, NULL, NULL),
(255, NULL, NULL),
(256, NULL, NULL),
(257, NULL, NULL),
(258, NULL, NULL),
(259, NULL, NULL),
(260, NULL, NULL),
(261, NULL, NULL),
(262, NULL, NULL),
(263, NULL, NULL),
(264, NULL, NULL),
(265, NULL, NULL),
(267, NULL, NULL),
(269, 'https://youtu.be/coBcTxy8cOY?si=QQOkKfViibaN00-i', 109),
(270, 'https://youtu.be/kOyCsY4rBH0?si=XHyf6ktNC5OFG716', 109),
(271, 'https://youtu.be/9Bhh28m_yBM?si=aA6Y00_VF_aYrXTR', 109),
(272, 'https://youtu.be/AnI7qGQs0Ic?si=lQdOWS0r3TlSv_MW', 109),
(273, 'https://youtu.be/aAefkzI-zS0?si=rsdZp6pVFIOIHAdO', 109);

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
  ADD UNIQUE KEY `UNIQ_5A8A6C8D989D9B62` (`slug`),
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

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
