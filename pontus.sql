-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 30 maj 2020 kl 14:04
-- Serverversion: 10.4.11-MariaDB
-- PHP-version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `pontus`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `anamn` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumpning av Data i tabell `admin`
--

INSERT INTO `admin` (`id`, `anamn`, `hash`) VALUES
(1, 'karim', '$2y$10$5BTvjy5if2LwDo3HOVsxoetXhbG5Yjn7CCUXNHjgloEhQiVLf4yYm'),
(2, 'laura', '$2y$10$x1WDXzplAkuo3EGkpz.uYu8ibZALfOROVF2/8WL4Oc7c2MeIZeFzy'),
(3, 'pontus', '$2y$10$GdOkFXJANZ2BGcXYV.Qsy.qlWTgU1z4KV6ddD.IgmeQ/lIPLwu5xG'),
(4, 'pontus', '$2y$10$P/WA5kBwleTYpeXMK1spxen3s4eFszhMbIhcnZSHK1GJFisbt2rNa');

-- --------------------------------------------------------

--
-- Tabellstruktur `blog`
--

CREATE TABLE `blog` (
  `id` int(4) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `rubrik` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inlagg` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumpning av Data i tabell `blog`
--

INSERT INTO `blog` (`id`, `datum`, `rubrik`, `inlagg`) VALUES
(11, '2020-01-13 07:34:47', 'Besök av rektor ', 'Ingrid tittar på en webblektion idag'),
(12, '2020-01-13 12:07:34', 'Tränat hämta från databas', 'Idag har vi tränat att hämta data frånn en tabell.\r\nSamma 4 steg som tidigare. Sen SQL satsen &#34;SELECT * FROM blog&#34;.'),
(13, '2020-01-17 07:45:07', 'Fredag', 'Idag ska vi implementera en fritextsökning.'),
(14, '2020-01-17 07:46:35', 'Fredag', 'Idag ska vi också implementera ett lösenordsskydd på admin! '),
(15, '2020-05-01 06:42:27', 'Testar OOP PHP', 'class Blogg\r\n{\r\n    private $conn;\r\n\r\n    /* Konstruktorn */\r\n    public function __construct($conn)\r\n    {\r\n        $this->conn = $conn;\r\n    }'),
(16, '2020-05-01 06:43:59', 'Testar bloggen som OOP', '    public function skriva($rubrik, $inlägg)\r\n    {\r\n        $sql = &#34;INSERT INTO blog (rubrik, inlagg) VALUES (&#39;$rubrik&#39;, &#39;$inlägg&#39;)&#34;;\r\n        $result = $this->conn->query($sql);\r\n\r\n        /* Gick det bra? */\r\n        if (!$result) {\r\n            die(&#34;Något blev fel med SQL-satsen.&#34;);\r\n        }\r\n\r\n        $this->conn->close();\r\n\r\n        /* Returnerar id på registrerade posten i tabellen */\r\n        return $this->conn->insert_id;\r\n    }'),
(17, '2020-05-01 06:45:37', 'Testar OOP PHP', '\r\n    public function skriva($rubrik, $inlägg)\r\n    {\r\n        $sql = &#34;INSERT INTO blog (rubrik, inlagg) VALUES (&#39;$rubrik&#39;, &#39;$inlägg&#39;)&#34;;\r\n        $result = $this->conn->query($sql);\r\n\r\n        /* Gick det bra? */\r\n        if (!$result) {\r\n            die(&#34;Något blev fel med SQL-satsen.&#34;);\r\n        }\r\n\r\n        /* Returnerar id på registrerade posten i tabellen */\r\n        return $this->conn->insert_id;\r\n\r\n        $this->conn->close();\r\n    }'),
(18, '2020-05-08 08:49:09', 'TEST', 'sdgfsdfsdfsdf'),
(19, '2020-05-08 08:51:30', 'TEST', 'zlatan');

-- --------------------------------------------------------

--
-- Tabellstruktur `pong`
--

CREATE TABLE `pong` (
  `id` int(11) NOT NULL,
  `namn` varchar(255) DEFAULT NULL,
  `poäng` int(11) DEFAULT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `pong`
--

INSERT INTO `pong` (`id`, `namn`, `poäng`, `datum`) VALUES
(1, 'Pontus', 23, '2020-03-20 09:01:52'),
(15, 'Pontus', 23, '2020-03-23 07:42:42'),
(16, 'Pontus', 23, '2020-03-23 07:43:30'),
(17, 'Ida', 42, '2020-03-23 07:45:24'),
(18, 'Ida', NULL, '2020-03-23 07:46:06'),
(19, 'Pontus', 23, '2020-03-23 07:46:28'),
(20, 'Pontus', 23, '2020-03-23 07:46:35'),
(21, 'Pontus', NULL, '2020-03-23 08:09:43'),
(22, 'Pontus', NULL, '2020-03-23 08:09:49'),
(23, 'Pontus', NULL, '2020-03-23 08:09:51'),
(24, 'Pontus', NULL, '2020-03-23 08:17:12'),
(25, 'Pontus', NULL, '2020-03-23 08:17:14'),
(26, 'Pontus', NULL, '2020-03-23 08:17:16'),
(27, 'Pontus', NULL, '2020-03-23 08:17:16'),
(28, 'Pontus', NULL, '2020-03-23 08:20:26'),
(29, 'Pontus', NULL, '2020-03-23 08:20:29'),
(30, 'Pontus', NULL, '2020-03-23 08:20:30'),
(31, 'Pontus', NULL, '2020-03-23 08:20:30'),
(32, 'Pontus', NULL, '2020-03-23 08:23:04'),
(33, 'Pontus', NULL, '2020-03-23 08:23:06'),
(34, 'Pontus', NULL, '2020-03-23 08:23:12'),
(35, 'Pontus', NULL, '2020-03-23 08:23:14'),
(36, 'Pontus', NULL, '2020-03-23 08:23:18'),
(37, 'Pontus', NULL, '2020-03-23 08:23:18'),
(38, 'Pontus', NULL, '2020-05-14 11:48:54'),
(39, 'Pontus', NULL, '2020-05-14 11:49:21'),
(40, 'Pontus', NULL, '2020-05-14 11:49:24'),
(41, 'Pontus', NULL, '2020-05-14 11:53:52'),
(42, 'Pontus', NULL, '2020-05-14 11:54:33'),
(43, 'Pontus', NULL, '2020-05-14 11:54:36'),
(44, 'Pontus', NULL, '2020-05-14 11:55:17'),
(45, 'Pontus', NULL, '2020-05-14 11:56:16'),
(46, 'Pontus', NULL, '2020-05-14 11:56:19'),
(47, 'Pontus', NULL, '2020-05-14 11:56:29'),
(48, 'Pontus', NULL, '2020-05-14 11:56:32'),
(49, 'Pontus', NULL, '2020-05-14 11:56:35'),
(50, 'Pontus', NULL, '2020-05-14 11:57:32'),
(51, 'Pontus', NULL, '2020-05-14 11:57:56'),
(52, 'Pontus', NULL, '2020-05-14 11:57:57'),
(53, 'Pontus', NULL, '2020-05-14 11:57:59'),
(54, 'Pontus', NULL, '2020-05-14 11:57:59'),
(55, 'Pontus', NULL, '2020-05-14 11:58:01'),
(56, 'Pontus', NULL, '2020-05-14 11:58:01'),
(57, 'Pontus', NULL, '2020-05-14 11:58:04'),
(58, 'Pontus', NULL, '2020-05-14 11:58:04'),
(59, 'Pontus', NULL, '2020-05-14 11:58:05'),
(60, 'Pontus', NULL, '2020-05-14 11:58:05'),
(61, 'Pontus', NULL, '2020-05-14 11:58:21'),
(62, 'Pontus', NULL, '2020-05-14 11:58:23'),
(63, 'Pontus', NULL, '2020-05-14 11:58:26'),
(64, 'Pontus', NULL, '2020-05-14 11:59:21'),
(65, 'Pontus', NULL, '2020-05-14 11:59:27'),
(66, 'Pontus', NULL, '2020-05-14 11:59:31'),
(67, 'Pontus', NULL, '2020-05-14 12:00:05'),
(68, 'Pontus', NULL, '2020-05-14 12:00:10'),
(69, 'Pontus', NULL, '2020-05-14 12:00:29'),
(70, 'Pontus', NULL, '2020-05-14 12:00:45'),
(71, 'Pontus', NULL, '2020-05-14 12:01:31'),
(72, 'Pontus', NULL, '2020-05-14 12:01:44'),
(73, 'Pontus', NULL, '2020-05-14 12:01:58'),
(74, 'Pontus', NULL, '2020-05-14 12:02:10'),
(75, 'Pontus', NULL, '2020-05-14 12:02:24'),
(76, 'Pontus', NULL, '2020-05-14 12:02:32'),
(77, 'Pontus', NULL, '2020-05-14 12:02:39'),
(78, 'Pontus', NULL, '2020-05-14 12:02:48'),
(79, 'Pontus', NULL, '2020-05-14 12:03:53'),
(80, 'Pontus', NULL, '2020-05-14 12:04:11'),
(81, 'Pontus', NULL, '2020-05-14 12:05:02'),
(82, 'Pontus', NULL, '2020-05-14 12:05:14'),
(83, 'Pontus', NULL, '2020-05-14 12:06:46'),
(84, 'Pontus', NULL, '2020-05-14 12:06:51'),
(85, 'Pontus', NULL, '2020-05-14 12:06:54'),
(86, 'Pontus', NULL, '2020-05-14 12:06:54'),
(87, 'Pontus', NULL, '2020-05-14 12:07:29'),
(88, 'Pontus', NULL, '2020-05-14 12:07:38'),
(89, 'Pontus', NULL, '2020-05-14 12:07:41'),
(90, 'Pontus', NULL, '2020-05-14 12:07:49'),
(91, 'Pontus', NULL, '2020-05-14 12:09:03'),
(92, 'Pontus', NULL, '2020-05-14 12:09:05'),
(93, 'Pontus', NULL, '2020-05-14 12:09:07'),
(94, 'Pontus', NULL, '2020-05-14 12:09:08'),
(95, 'Pontus', NULL, '2020-05-14 12:09:08'),
(96, 'Pontus', NULL, '2020-05-14 12:09:09'),
(97, 'Pontus', NULL, '2020-05-14 12:09:42'),
(98, 'Pontus', NULL, '2020-05-14 12:10:44'),
(99, 'Pontus', NULL, '2020-05-14 12:10:46'),
(100, 'Pontus', NULL, '2020-05-14 12:10:49'),
(101, 'Pontus', NULL, '2020-05-14 12:10:53'),
(102, 'Pontus', NULL, '2020-05-14 12:11:46'),
(103, 'Pontus', NULL, '2020-05-14 12:12:14'),
(104, 'Pontus', NULL, '2020-05-14 12:12:16'),
(105, 'Pontus', NULL, '2020-05-14 12:12:18'),
(106, 'Pontus', NULL, '2020-05-14 12:12:20'),
(107, 'Pontus', NULL, '2020-05-14 12:12:24'),
(108, 'Pontus', NULL, '2020-05-14 12:12:38'),
(109, 'Pontus', NULL, '2020-05-14 12:24:07'),
(110, 'Pontus', NULL, '2020-05-14 12:24:10'),
(111, 'Pontus', NULL, '2020-05-14 12:24:14'),
(112, 'Pontus', NULL, '2020-05-14 12:24:22'),
(113, 'Pontus', NULL, '2020-05-14 12:36:20'),
(114, 'Pontus', NULL, '2020-05-14 12:36:28'),
(115, 'Pontus', NULL, '2020-05-14 12:36:33'),
(116, 'Pontus', NULL, '2020-05-14 12:36:33'),
(117, 'Pontus', NULL, '2020-05-14 12:36:34'),
(118, 'Pontus', NULL, '2020-05-14 12:36:37'),
(119, 'Pontus', NULL, '2020-05-14 12:36:38'),
(120, 'Pontus', NULL, '2020-05-14 12:36:39'),
(121, 'Pontus', NULL, '2020-05-14 12:36:42'),
(122, 'Pontus', NULL, '2020-05-14 12:36:43'),
(123, 'Pontus', NULL, '2020-05-14 12:36:44'),
(124, 'Pontus', NULL, '2020-05-14 12:36:45'),
(125, 'Pontus', NULL, '2020-05-14 12:36:46'),
(126, 'Pontus', NULL, '2020-05-14 12:36:47'),
(127, 'Pontus', NULL, '2020-05-14 12:36:47'),
(128, 'Pontus', NULL, '2020-05-14 12:36:47'),
(129, 'Pontus', NULL, '2020-05-14 12:36:47'),
(130, 'Pontus', NULL, '2020-05-14 12:36:47'),
(131, 'Pontus', NULL, '2020-05-14 12:36:47'),
(132, 'Pontus', NULL, '2020-05-14 12:36:47'),
(133, 'Pontus', NULL, '2020-05-14 12:36:47'),
(134, 'Pontus', NULL, '2020-05-14 12:36:47'),
(135, 'Pontus', NULL, '2020-05-14 12:36:47'),
(136, 'Pontus', NULL, '2020-05-14 12:36:48'),
(137, 'Pontus', NULL, '2020-05-14 12:36:49'),
(138, 'Pontus', NULL, '2020-05-14 12:36:51'),
(139, 'Pontus', NULL, '2020-05-14 12:36:51'),
(140, 'Pontus', NULL, '2020-05-14 12:36:51'),
(141, 'Pontus', NULL, '2020-05-19 10:44:43'),
(142, 'Pontus', NULL, '2020-05-19 10:44:48'),
(143, 'Pontus', NULL, '2020-05-19 10:44:54'),
(144, 'Pontus', NULL, '2020-05-19 10:44:56'),
(145, 'Pontus', NULL, '2020-05-19 10:44:56'),
(146, 'Pontus', NULL, '2020-05-19 10:44:56'),
(147, 'Pontus', NULL, '2020-05-19 10:44:56'),
(148, 'Pontus', NULL, '2020-05-19 10:44:56'),
(149, 'Pontus', NULL, '2020-05-19 10:44:56'),
(150, 'Pontus', NULL, '2020-05-19 11:12:44'),
(151, 'Pontus', NULL, '2020-05-19 11:12:54'),
(152, 'Pontus', NULL, '2020-05-19 11:15:14'),
(153, 'Pontus', NULL, '2020-05-19 11:24:32'),
(154, 'Pontus', NULL, '2020-05-19 11:24:38'),
(155, 'Pontus', NULL, '2020-05-19 11:29:52'),
(156, 'Pontus', NULL, '2020-05-19 11:29:53'),
(157, 'Pontus', NULL, '2020-05-19 11:29:54'),
(158, 'Pontus', NULL, '2020-05-19 11:29:54'),
(159, 'Pontus', NULL, '2020-05-19 11:29:55'),
(160, 'Pontus', NULL, '2020-05-19 11:30:15'),
(161, 'Pontus', NULL, '2020-05-19 11:30:16'),
(162, 'Pontus', NULL, '2020-05-19 11:30:16'),
(163, 'Pontus', NULL, '2020-05-19 11:30:17'),
(164, 'Pontus', NULL, '2020-05-19 11:30:17'),
(165, 'Pontus', NULL, '2020-05-19 11:30:18'),
(166, 'Pontus', NULL, '2020-05-19 11:30:18'),
(167, 'Pontus', NULL, '2020-05-19 11:30:19'),
(168, 'Pontus', NULL, '2020-05-19 11:30:19'),
(169, 'Pontus', NULL, '2020-05-19 11:30:19'),
(170, 'Pontus', NULL, '2020-05-19 11:30:20'),
(171, 'Pontus', NULL, '2020-05-19 11:30:20'),
(172, 'Pontus', NULL, '2020-05-19 11:30:21'),
(173, 'Pontus', NULL, '2020-05-19 11:30:21'),
(174, 'Pontus', NULL, '2020-05-19 11:30:22'),
(175, 'Pontus', NULL, '2020-05-19 11:30:22'),
(176, 'Pontus', NULL, '2020-05-19 11:30:22'),
(177, 'Pontus', NULL, '2020-05-19 11:30:22'),
(178, 'Pontus', NULL, '2020-05-19 11:30:22'),
(179, 'Pontus', NULL, '2020-05-19 11:30:22'),
(180, 'Pontus', NULL, '2020-05-19 11:30:23'),
(181, 'Pontus', NULL, '2020-05-19 11:30:23'),
(182, 'Pontus', NULL, '2020-05-19 11:30:23'),
(183, 'Pontus', NULL, '2020-05-19 11:30:23'),
(184, 'Pontus', NULL, '2020-05-19 11:30:38'),
(185, 'Pontus', NULL, '2020-05-19 11:30:46'),
(186, 'Pontus', NULL, '2020-05-19 11:30:49'),
(187, 'Pontus', NULL, '2020-05-19 11:31:31'),
(188, 'Pontus', NULL, '2020-05-19 11:32:01'),
(189, 'Pontus', NULL, '2020-05-19 11:32:04'),
(190, 'Pontus', NULL, '2020-05-19 11:32:05'),
(191, 'Pontus', NULL, '2020-05-19 11:32:08'),
(192, 'Pontus', NULL, '2020-05-19 11:33:08'),
(193, 'Pontus', NULL, '2020-05-19 11:33:13'),
(194, 'Pontus', NULL, '2020-05-19 11:33:15'),
(195, 'Pontus', NULL, '2020-05-19 11:33:18'),
(196, 'Pontus', NULL, '2020-05-19 11:33:20'),
(197, 'Pontus', NULL, '2020-05-19 11:33:51'),
(198, 'Pontus', NULL, '2020-05-19 11:33:59'),
(199, 'Pontus', NULL, '2020-05-19 11:34:29'),
(200, 'Pontus', NULL, '2020-05-19 11:35:14'),
(201, 'Pontus', NULL, '2020-05-19 11:35:16'),
(202, 'Pontus', NULL, '2020-05-19 11:35:18'),
(203, 'Pontus', NULL, '2020-05-19 11:35:19'),
(204, 'Pontus', NULL, '2020-05-19 11:36:35'),
(205, 'Pontus', NULL, '2020-05-19 11:36:40'),
(206, 'Pontus', NULL, '2020-05-19 11:36:42'),
(207, 'Pontus', NULL, '2020-05-19 11:36:42'),
(208, 'Pontus', NULL, '2020-05-19 11:36:52'),
(209, 'Pontus', NULL, '2020-05-19 11:36:54'),
(210, 'Pontus', NULL, '2020-05-19 11:37:02'),
(211, 'Pontus', NULL, '2020-05-19 11:37:08'),
(212, 'Pontus', NULL, '2020-05-19 11:38:15'),
(213, 'Pontus', NULL, '2020-05-19 11:38:19'),
(214, 'Pontus', NULL, '2020-05-19 11:38:20'),
(215, 'Pontus', NULL, '2020-05-19 11:38:35'),
(216, 'Pontus', NULL, '2020-05-19 11:38:40'),
(217, 'Pontus', NULL, '2020-05-19 11:38:47'),
(218, 'Pontus', NULL, '2020-05-19 11:39:12'),
(219, 'Pontus', NULL, '2020-05-19 11:39:18'),
(220, 'Pontus', NULL, '2020-05-19 11:39:55'),
(221, 'Pontus', NULL, '2020-05-19 11:41:00'),
(222, 'Pontus', NULL, '2020-05-19 11:41:01'),
(223, 'Pontus', NULL, '2020-05-19 11:41:02'),
(224, 'Pontus', NULL, '2020-05-19 11:41:02'),
(225, 'Pontus', NULL, '2020-05-19 11:41:55'),
(226, 'Pontus', NULL, '2020-05-19 11:42:07'),
(227, 'Pontus', NULL, '2020-05-19 11:42:09'),
(228, 'Pontus', NULL, '2020-05-19 11:42:10'),
(229, 'Pontus', NULL, '2020-05-19 11:43:31'),
(230, 'Pontus', NULL, '2020-05-19 11:43:44'),
(231, 'Pontus', NULL, '2020-05-19 11:44:56'),
(232, 'Pontus', NULL, '2020-05-19 11:45:03'),
(233, 'Pontus', NULL, '2020-05-19 11:45:04'),
(234, 'Pontus', NULL, '2020-05-19 11:45:20'),
(235, 'Pontus', NULL, '2020-05-19 11:46:10'),
(236, 'Pontus', NULL, '2020-05-19 11:46:12'),
(237, 'Pontus', NULL, '2020-05-19 11:46:12'),
(238, 'Pontus', NULL, '2020-05-19 11:47:22'),
(239, 'Pontus', NULL, '2020-05-19 11:47:26'),
(240, 'Pontus', NULL, '2020-05-19 11:47:28'),
(241, 'Pontus', NULL, '2020-05-19 11:47:29'),
(242, 'Pontus', NULL, '2020-05-19 11:47:36'),
(243, 'Pontus', NULL, '2020-05-19 11:47:37'),
(244, 'Pontus', NULL, '2020-05-19 11:47:38'),
(245, 'Pontus', NULL, '2020-05-19 11:48:14'),
(246, 'Pontus', NULL, '2020-05-19 11:48:16'),
(247, 'Pontus', NULL, '2020-05-19 11:48:20'),
(248, 'Pontus', NULL, '2020-05-19 11:48:21'),
(249, 'Pontus', NULL, '2020-05-19 11:48:24'),
(250, 'Pontus', NULL, '2020-05-19 11:49:39'),
(251, 'Pontus', NULL, '2020-05-19 11:50:00'),
(252, 'Pontus', NULL, '2020-05-19 11:50:19'),
(253, 'Pontus', NULL, '2020-05-19 11:50:30'),
(254, 'Pontus', NULL, '2020-05-19 11:50:52'),
(255, 'Pontus', NULL, '2020-05-19 11:50:53'),
(256, 'Pontus', NULL, '2020-05-19 11:50:54'),
(257, 'Pontus', NULL, '2020-05-19 11:50:54'),
(258, 'Pontus', NULL, '2020-05-19 11:50:54'),
(259, 'Pontus', NULL, '2020-05-19 11:50:55'),
(260, 'Pontus', NULL, '2020-05-19 11:51:33'),
(261, 'Pontus', NULL, '2020-05-19 11:51:40'),
(262, 'Pontus', NULL, '2020-05-19 11:52:06'),
(263, 'Pontus', NULL, '2020-05-19 11:52:11'),
(264, 'Pontus', NULL, '2020-05-19 11:52:12'),
(265, 'Pontus', NULL, '2020-05-19 11:52:12'),
(266, 'Pontus', NULL, '2020-05-19 11:52:12'),
(267, 'Pontus', NULL, '2020-05-19 11:52:13'),
(268, 'Pontus', NULL, '2020-05-19 11:52:13'),
(269, 'Pontus', NULL, '2020-05-19 11:52:13'),
(270, 'Pontus', NULL, '2020-05-19 11:52:13'),
(271, 'Pontus', NULL, '2020-05-19 11:52:13'),
(272, 'Pontus', NULL, '2020-05-19 11:52:13'),
(273, 'Pontus', NULL, '2020-05-19 11:52:14'),
(274, 'Pontus', NULL, '2020-05-19 11:52:14'),
(275, 'Pontus', NULL, '2020-05-19 11:52:15'),
(276, 'Pontus', NULL, '2020-05-19 11:53:34'),
(277, 'Pontus', NULL, '2020-05-19 11:53:38'),
(278, 'Pontus', NULL, '2020-05-19 11:54:28'),
(279, 'Pontus', NULL, '2020-05-19 11:54:35'),
(280, 'Pontus', NULL, '2020-05-19 11:55:21'),
(281, 'Pontus', NULL, '2020-05-19 11:55:26'),
(282, 'Pontus', NULL, '2020-05-19 11:55:56'),
(283, 'Pontus', NULL, '2020-05-19 11:55:58'),
(284, 'Pontus', NULL, '2020-05-19 11:55:59'),
(285, 'Pontus', NULL, '2020-05-19 11:56:19'),
(286, 'Pontus', NULL, '2020-05-19 12:04:13'),
(287, 'Pontus', NULL, '2020-05-19 12:04:23'),
(288, 'Pontus', NULL, '2020-05-19 12:07:08'),
(289, 'Pontus', NULL, '2020-05-19 12:07:26'),
(290, 'Pontus', NULL, '2020-05-19 12:07:30'),
(291, 'Pontus', NULL, '2020-05-19 12:12:28'),
(292, 'Pontus', NULL, '2020-05-19 12:16:09'),
(293, 'Pontus', NULL, '2020-05-19 12:24:56'),
(294, 'Pontus', NULL, '2020-05-19 12:26:39'),
(295, 'Pontus', NULL, '2020-05-19 12:26:54');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `pong`
--
ALTER TABLE `pong`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT för tabell `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT för tabell `pong`
--
ALTER TABLE `pong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
