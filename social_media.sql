-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2022 at 10:56 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_media`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_01_27_171056_create_pages_table', 1),
(5, '2022_01_27_172142_create_posts_table', 1),
(6, '2022_01_27_172618_create_page_follow_table', 1),
(7, '2022_01_27_172848_create_person_follow_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'Sarwat\'s photography page', 1, '2022-01-28 15:50:48', '2022-01-28 15:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `page_follow`
--

CREATE TABLE `page_follow` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_follow`
--

INSERT INTO `page_follow` (`id`, `follower_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-01-28 16:16:40', '2022-01-28 16:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_follow`
--

CREATE TABLE `person_follow` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `person_follow`
--

INSERT INTO `person_follow` (`id`, `follower_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-01-28 16:15:33', '2022-01-28 16:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_content`, `page_id`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'Welcome everyone. I just opened this new page.', 1, NULL, '2022-01-28 15:54:33', '2022-01-28 15:54:33'),
(2, 'Hi guys! My name is Sarwat. I just joined this social network. Please follow me.', NULL, 1, '2022-01-28 15:58:41', '2022-01-28 15:58:41'),
(3, 'This is the first post of Wz5O9uC0tj.', NULL, 2, '2022-01-28 16:05:15', '2022-01-28 16:05:15'),
(4, 'Bla Bla Bla.', NULL, 2, '2022-01-28 18:19:00', '2022-01-28 18:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sarwat', 'Osman', 'sarwat@gmail.com', '$2y$10$sVlb5hD7YYC5YsKhmdo8IOVe8ljPulgxXhzYGmo95vTewzn22kOqO', NULL, '2022-01-28 15:44:46', '2022-01-28 15:44:46'),
(2, '0C1ugtXOns', 'PkzYTCAIOBA5', 'Wz5O9uC0tj@gmail.com', '$2y$10$sP8Z.X9tSTQ1VMTZe8chKe1aRtwo5bIsX2d2h5Mv99TtDagtc.vyi', NULL, '2022-01-28 15:44:47', '2022-01-28 15:44:47'),
(3, 'v1NwznwIis', 'm6xpjw3JLix2', 'cZxppQXO7s@gmail.com', '$2y$10$Q7kxwtAxuwm0bo7OfWKOLuoDakaXme.6/UopFiHELn/Bd3HEydCSO', NULL, '2022-01-28 15:44:47', '2022-01-28 15:44:47'),
(4, 'uhxFXklijj', 'pTrDWup0BTF5', '1NNUOEB1Mh@gmail.com', '$2y$10$Yobw91rncMrBqjOmqZMzieyVjwE.FyfBbP4JZLsF7GwNp0vXvjC12', NULL, '2022-01-28 15:44:47', '2022-01-28 15:44:47'),
(5, '85xl51EbpO', 'bxuMqZ8J4k1Z', 'LNNcGdPHD5@gmail.com', '$2y$10$pJ7oCGcvpmyLfyX.S38wBO/i7bCBHyqfrmrhA69bpGoaGq9X..Oee', NULL, '2022-01-28 15:44:47', '2022-01-28 15:44:47'),
(6, 'WqyKy5umjj', 'Q5Z7syk6No24', 'yIzNrcQM0x@gmail.com', '$2y$10$w6YfDLyGG94mSbDMZrBvHuzq4CZJmx63GYSn0In8AwEUygvLXaKha', NULL, '2022-01-28 15:44:47', '2022-01-28 15:44:47'),
(7, 'zmf7IMQpwv', 'ISJ2Sx5bhKp2', 'FMud49q0XK@gmail.com', '$2y$10$wcJSIHZylCpEy6uljoJUz.Q4eaI934J1rb9lzm2eRZYjwjVqThFVm', NULL, '2022-01-28 15:44:48', '2022-01-28 15:44:48'),
(8, 'WQzzDvNaHB', '6JxjtrRL3Xsu', '1R7oWiuOvv@gmail.com', '$2y$10$WdrGOxDVKU/22NhXLS/8EO5ARszFvvljfTTK5WOwt896kZV.c9JOK', NULL, '2022-01-28 15:44:48', '2022-01-28 15:44:48'),
(9, 'AHo8SQgsiP', 'G7Zh7sXbXLfy', 'ol15kc5WCz@gmail.com', '$2y$10$ohcokUfvoxiBtwxMOprplOv.PdGZqkdmb8afkrJcYzcXJ2BRr6iXu', NULL, '2022-01-28 15:44:48', '2022-01-28 15:44:48'),
(10, 'MCGEO3BNh5', 'nbxLOcL0dzw3', 'kSGD9eNbgQ@gmail.com', '$2y$10$MiE3FyRpugJlIrxVkG.a0uxFTLQ26eInT6J15apQBU5xSmruqeTI2', NULL, '2022-01-28 15:44:49', '2022-01-28 15:44:49'),
(11, 'LocHUyVbTx', '3Ukg5iDWAmcf', 't4bS8sdH77@gmail.com', '$2y$10$eUWg5EP/Z76YRSeY0/hp7O.22n7a4swnGbZyV2BzjGRpGm/GcQK3C', NULL, '2022-01-28 15:44:49', '2022-01-28 15:44:49'),
(12, 'YsB6RwJafa', '3mQPvJjJuv3w', 'WDu0GPpr68@gmail.com', '$2y$10$I0tIoEyxg53KisBidHs/euW0jAJq350Khl/xqnAEb1dFGJS/oo.lW', NULL, '2022-01-28 15:44:49', '2022-01-28 15:44:49'),
(13, 'yg6pmuEm6G', 'AG4Z6bKGYbtH', '718f48ElFo@gmail.com', '$2y$10$Hu4f6pFM2Z5S4kNwVgZ8yedRZ8K.XHb9bhNhhCLDR1ojJ6MYmSiHW', NULL, '2022-01-28 15:44:49', '2022-01-28 15:44:49'),
(14, 'KWbXdybGdV', 'pdIGomuz55jL', 'FARvfx9PzI@gmail.com', '$2y$10$XZFKSoUc5uWc73xDY9kINuLMN7P4UveXXNu4Ds87KxYfuourCxWmS', NULL, '2022-01-28 15:44:50', '2022-01-28 15:44:50'),
(15, 'dV0G1r2R16', '0NA0Hga3jGd6', 'QfgwKnQXoY@gmail.com', '$2y$10$G79DZgtZEZCw1hlZn6s9LO3vVbu6A1Tnj/dioeB.fYHDd9WBS8OO2', NULL, '2022-01-28 15:44:50', '2022-01-28 15:44:50'),
(16, 'zqPyAyLbvg', 'QPe4fuxzvg9H', '7rFVeB64hU@gmail.com', '$2y$10$bZ1OqLoLoIeM0r1mt2knneS3R.pBpXwW0KrGc6e4jNUkC/5JyckUK', NULL, '2022-01-28 15:44:50', '2022-01-28 15:44:50'),
(17, 'ouz6NV7nL5', 't8tOGhkD0p0F', 'it6fmqpmda@gmail.com', '$2y$10$Bn1dhdbiIkcsbLHqfSy7ZePF5ua6PyC/25Q.eFCkLCdIWNpCotHgm', NULL, '2022-01-28 15:44:50', '2022-01-28 15:44:50'),
(18, 'iTYCWidJ3S', 'rQyNFH05m3sW', 'u40X4WZBk3@gmail.com', '$2y$10$5NDuCyTRoL6/mEp3zoHuYeRXQvQ1KZM4.t.HT6w9TZWg65y8r1yHW', NULL, '2022-01-28 15:44:50', '2022-01-28 15:44:50'),
(19, 'uqeGj9ikNb', 't9CwB1ijL3Zw', 'ywELVeVYY2@gmail.com', '$2y$10$IzU75XWjImTFsFmyaFiThuzPBneXsbbzC/eUy6GLGUsVAm1MsI0de', NULL, '2022-01-28 15:44:51', '2022-01-28 15:44:51'),
(20, 'BL31trNex5', 'F7AxQx7k2tBH', 'pDP1PEdCI5@gmail.com', '$2y$10$5hEzSk1S7K3HhANXBMxRc.HA/hSHseZiJRfQuCjRuMAVjAnXysGr2', NULL, '2022-01-28 15:44:51', '2022-01-28 15:44:51'),
(21, 'vbilM1LL5K', 'BXgawLuFL3cO', 'Birpiavvaf@gmail.com', '$2y$10$mMOsOOwxzl4gZYLx3jnCRekFUmIR/fntsnzpCyVnTn/8ptxVFNCy6', NULL, '2022-01-28 15:44:51', '2022-01-28 15:44:51'),
(22, 'John', 'Smith', 'john@gmail.com', '$2y$10$kk.m.ZSnzTGDl3eXYQfOOuMvsL736fkEiqvOxrruU8w3pjyA.ywIK', NULL, '2022-01-28 19:09:45', '2022-01-28 19:09:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_follow`
--
ALTER TABLE `page_follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `person_follow`
--
ALTER TABLE `person_follow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_follow`
--
ALTER TABLE `page_follow`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person_follow`
--
ALTER TABLE `person_follow`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
