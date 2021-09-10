-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2021 at 06:57 PM
-- Server version: 8.0.26-0ubuntu0.21.04.3
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Wheel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verified` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `email_verified` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile`, `new_email`, `new_mobile_number`, `city`, `address`, `profile`, `mobile_verified`, `email_verified`, `mobile_verified_at`, `email_verified_at`, `password`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'BBBS', 'admin@spiderhit.com', '', NULL, NULL, NULL, NULL, NULL, 'No', 'No', NULL, NULL, '$2y$10$TrqfIeAravmwf51HOe53den2cNBw2QEkaEYwntaTPxibkNAwkLv1y', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `name` text,
  `slug` text,
  `degrees` text,
  `count` bigint DEFAULT NULL,
  `ntimes` bigint DEFAULT NULL,
  `comment` text,
  `status` enum('show','hide') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `degrees`, `count`, `ntimes`, `comment`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'White', 'white', '{\"0\":\"360\",\"1\":\"180\"}', 2, 3, '[360,180]', NULL, '2021-08-23 17:01:22', '2021-08-23 17:01:22'),
(2, 'Blue', 'blue', '{\"0\":\"90\",\"1\":\"270\"}', 2, 2, '[90,270]', NULL, '2021-08-23 17:01:49', '2021-08-23 17:01:49'),
(3, 'Red', 'red', '{\"0\":\"120\",\"1\":\"300\"}', 2, 10, '[120,300]', NULL, '2021-08-23 17:02:07', '2021-08-23 17:02:07'),
(4, 'Green', 'green', '{\"0\":\"60\",\"1\":\"240\"}', 2, 15, '[60,240]', NULL, '2021-08-23 17:02:35', '2021-08-23 17:02:35'),
(5, 'Black', 'black', '{\"0\":\"150\",\"1\":\"330\"}', 2, 3, '[150,330]', NULL, '2021-08-23 17:03:02', '2021-08-23 17:03:02'),
(6, 'Yellow', 'yellow', '{\"0\":\"30\",\"1\":\"210\"}', 2, 2, '[30,210]', NULL, '2021-08-23 17:03:17', '2021-08-23 17:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `dailyBonus`
--

CREATE TABLE `dailyBonus` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `days` int DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gamePlays`
--

CREATE TABLE `gamePlays` (
  `id` int NOT NULL,
  `game_id` bigint DEFAULT NULL,
  `players` bigint DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  `time_left` bigint DEFAULT NULL,
  `comment` text,
  `result_time` bigint DEFAULT NULL,
  `result` bigint DEFAULT NULL,
  `status` enum('started','stopped','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gamePlays`
--

INSERT INTO `gamePlays` (`id`, `game_id`, `players`, `time`, `time_left`, `comment`, `result_time`, `result`, `status`, `startTime`, `endTime`, `createdAt`, `updatedAt`) VALUES
(1, 1, NULL, 60, 0, NULL, 0, 5, 'closed', NULL, NULL, '2021-09-10 13:22:06', '2021-09-10 13:23:06'),
(2, 1, NULL, 60, 0, NULL, 0, 5, 'closed', NULL, NULL, '2021-09-10 13:23:06', '2021-09-10 13:24:07'),
(3, 1, NULL, 60, 0, NULL, 0, 1, 'closed', NULL, NULL, '2021-09-10 13:24:06', '2021-09-10 13:25:07'),
(4, 1, NULL, 60, 0, NULL, 0, 6, 'closed', NULL, NULL, '2021-09-10 13:25:06', '2021-09-10 13:26:07'),
(5, 1, NULL, 60, 0, NULL, 0, 5, 'closed', NULL, NULL, '2021-09-10 13:26:06', '2021-09-10 13:27:07'),
(6, 1, NULL, 60, 18, NULL, NULL, NULL, 'started', NULL, NULL, '2021-09-10 13:27:06', '2021-09-10 13:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `gamePositions`
--

CREATE TABLE `gamePositions` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `game_id` bigint DEFAULT NULL,
  `game_play_id` bigint DEFAULT NULL,
  `option` varchar(300) DEFAULT NULL,
  `ntimes` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `comment` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gamePositions`
--

INSERT INTO `gamePositions` (`id`, `user_id`, `game_id`, `game_play_id`, `option`, `ntimes`, `amount`, `comment`, `createdAt`, `updatedAt`) VALUES
(1, 3, 1, 1, '2', 2, 10, NULL, '2021-09-10 13:22:24', '2021-09-10 13:22:24'),
(2, 3, 1, 1, '1', 3, 10, NULL, '2021-09-10 13:22:37', '2021-09-10 13:22:37'),
(3, 3, 1, 1, '5', 3, 10, NULL, '2021-09-10 13:22:47', '2021-09-10 13:22:47'),
(4, 3, 1, 3, '2', 2, 10, NULL, '2021-09-10 13:24:11', '2021-09-10 13:24:11'),
(5, 3, 1, 3, '1', 3, 10, NULL, '2021-09-10 13:24:12', '2021-09-10 13:24:12'),
(6, 3, 1, 3, '6', 2, 10, NULL, '2021-09-10 13:24:17', '2021-09-10 13:24:17'),
(7, 3, 1, 3, '5', 3, 10, NULL, '2021-09-10 13:24:17', '2021-09-10 13:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text,
  `description` text,
  `status` enum('show','hide') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20210817144233-create-user.js'),
('20210820163540-create-transactions.js'),
('20210821054753-create-game.js'),
('20210821055623-create-game-plays.js'),
('20210821183644-create-wallet-history.js'),
('20210821185033-create-game-position.js'),
('20210823105647-create-color.js'),
('20210823182021-create-withdraw-request.js'),
('20210825092218-create-setting.js');

-- --------------------------------------------------------

--
-- Table structure for table `Settings`
--

CREATE TABLE `Settings` (
  `id` int NOT NULL,
  `name` text,
  `slug` text,
  `option` bigint DEFAULT NULL,
  `comment` text,
  `status` enum('show','hide') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `name` text,
  `slug` text,
  `option` bigint DEFAULT NULL,
  `comment` text,
  `status` enum('show','hide') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `slug`, `option`, `comment`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Registration Bonus', 'registration_bonus', 2, NULL, 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(2, 'Recharge Bonus', 'recharge_bonus', 5, NULL, 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(3, 'Daily Bonus', 'daily_bonus', 5, NULL, 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(4, 'Refer Bonus', 'refer_bonus', 20, NULL, 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(5, 'Refer Register Bonus', 'refer_register_bonus', 20, NULL, 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(6, 'Gulkan Points', 'gulkan_points_percent', 1, '1 %', 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(7, 'Gulkan Redeem Percent', 'gulkan_redeem_percent', 50, '50 %', 'show', '2021-08-25 00:00:00', '2021-08-25 00:00:00'),
(8, 'Maximum Withdrawls per DAy', 'max_withdrawls_per_day', 5, '5', 'show', '2021-08-31 00:00:00', '2021-08-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `city_id` bigint DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_care_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_line_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` double(8,2) DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gameServerStatus` enum('start','stop') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `android_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ios_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customer_app_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `store_app_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `franchise_app_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `city_id`, `logo`, `site_logo`, `payment_barcode`, `upi`, `favicon`, `site_name`, `admin_logo`, `address`, `email`, `phone`, `customer_care_no`, `help_line_no`, `gst`, `delivery_charge`, `company`, `currency`, `created_at`, `updated_at`, `site_url`, `gameServerStatus`, `android_url`, `ios_url`, `customer_app_url`, `store_app_url`, `franchise_app_url`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'sitesetting/a94855adb80fd11799bd8ee1735d1fa0.jpeg', 'sitesetting/24af713a53219a5267937550408cfdef.png', 'app/site_setting//fTJ72LyGFTBktaWXlSTIzzKzsnwMpj2UKskdRkcv.jpg', '8977440439@ybl', NULL, 'Bigg Winner', NULL, '19-4-802,Anantapur.\r\nSSDOFOSD', 'teja@gmail.com', '9876543210', '9876543210', '9876543210', '9876543210', NULL, 'Nayaa Jewellery', '₹', NULL, '2021-07-28 08:14:20', 'https://www.orderchey.com', 'start', 'https://play.google.com/store/apps/details?id=app.orderchey.customer', 'https://play.google.com/store/apps/details?id=app.orderchey.customer', 'https://play.google.com/store/apps/details?id=app.orderchey.customer', 'https://play.google.com/store/apps/details?id=app.orderchey.store', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` enum('credit','debit') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `wallet` double DEFAULT '0',
  `earnings` double DEFAULT '0',
  `gulkan_points` double DEFAULT '0',
  `profilePic` text,
  `password` varchar(255) DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `token` longtext,
  `mobile_verified` enum('yes','no') DEFAULT 'no',
  `bankAccountNumber` text,
  `bankAccountName` text,
  `bankIFSC` text,
  `bankName` text,
  `bankAddress` text,
  `UPI` text,
  `your_id` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `referral_id` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `wallet`, `earnings`, `gulkan_points`, `profilePic`, `password`, `otp`, `token`, `mobile_verified`, `bankAccountNumber`, `bankAccountName`, `bankIFSC`, `bankName`, `bankAddress`, `UPI`, `your_id`, `referral_id`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(1, '434', NULL, '602371759', NULL, NULL, 0, NULL, '$2b$10$HW.7T1rsc5Mh2GX1izMjuOchCv/CL77s7cKkyr50bDZqJU95Z4zWa', 329146, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-21 19:12:45', '2021-08-21 19:12:45', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(2, 'R', NULL, '6302371759', 0, 29078, 393, 'image.png', '$2b$10$kW0EEoWj3LAs4cjD8rk.vecSoxoyAo6QvngD0uVlQpvVlTTmiDzd.', 892169, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAka1cwRUVvV2ozTEFzNGNqRDhyay52ZWNTb3hveUFvNlF2bmdEMHVWbFFwdlZsVFRtaUR6ZC4iLCJ1c2VySWQiOjIsImlhdCI6MTYzMTEwMzU0OSwiZXhwIjoxNjMyMzk5NTQ5fQ.ag-x-wh2jIjuZcmXWImDvtmMTSQNX2KIFMdzvEp0IbA', 'no', '32028436969weu75', 'venkateswara rao3', 'SBIN00136164', 'hdfc', 'PAMIDI', 'venkeynot@oksbi', NULL, NULL, '2021-08-21 19:16:30', '2021-09-09 05:28:38', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(3, 'Raju', NULL, '9876543210', 930, 30, 0, 'ddcb8e274432f6636f245d58763bc36b.jpeg', '$2b$10$kW0EEoWj3LAs4cjD8rk.vecSoxoyAo6QvngD0uVlQpvVlTTmiDzd.', 917121, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAka1cwRUVvV2ozTEFzNGNqRDhyay52ZWNTb3hveUFvNlF2bmdEMHVWbFFwdlZsVFRtaUR6ZC4iLCJ1c2VySWQiOjMsImlhdCI6MTYzMTI3Njg1MywiZXhwIjoxNjMyNTcyODUzfQ.PmHMghbN12xBGRUqRpgpwMIJvavbL3Cp-VOn_Tz_jps', 'yes', '8911966856655', 'Hello', 'Udggdhssh', 'Ahdfhf', 'Sbdudidud', 'Dbdhddhes', '343434343', NULL, '2021-08-23 05:43:21', '2021-09-10 13:24:46', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(4, 'Hello', NULL, '9876543220', NULL, NULL, NULL, NULL, '$2b$10$aTyTCFsBPzKjpAGSDNVKkOQwNpd6mnkUAoM6HZ6JH7lRxSW3EH7Ca', 848173, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAkYVR5VENGc0JQektqcEFHU0ROVktrT1F3TnBkNm1ua1VBb002SFo2Skg3bFJ4U1czRUg3Q2EiLCJ1c2VySWQiOjQsImlhdCI6MTYyOTg3MDk0OCwiZXhwIjoxNjMxMTY2OTQ4fQ.Cy6Jz84Jaaw1nNTx7bMddlEx77F6-lA0vyGBXUQEZZk', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-25 05:54:57', '2021-08-25 05:55:48', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(5, '434', NULL, '6023717593', NULL, NULL, NULL, NULL, '$2b$10$.5vYf5QS1evHB6iNvJ2I.em2lXhVdb8cZ8pPFroIswpnj5DnWJlG.', 146545, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-30 06:57:53', '2021-08-30 06:57:53', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(6, '434', NULL, '6023717594', NULL, NULL, NULL, NULL, '$2b$10$OmkS.ldiEnsR1RruSb22Xuc7ORrBF2kUrFBCeGG7j0duaGhmabm.i', 631970, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-30 06:59:25', '2021-08-30 06:59:25', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(7, '434', NULL, '6023717595', NULL, NULL, NULL, NULL, '$2b$10$wX41gMiYlNoHy96ZosubS.bY/YrEHctuzB9QvlArMTzHc3/yfyoMC', 433747, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-30 07:18:29', '2021-08-30 07:18:29', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(8, '434', NULL, '6023717596', 2, NULL, NULL, NULL, '$2b$10$jJGqlO.M/XY1d4V/kJpmjuVYKgqzqIcfChJFKE/S9RshiQ8EOE0Iu', 188766, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-30 07:19:22', '2021-08-30 07:19:22', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(9, '434', NULL, '6023717597', 2, NULL, NULL, NULL, '$2b$10$o26iYJ7C.ijLuFzyYGUTR.WIxXT5AoBYLP3.RNE9IBiY/p9nQruUq', 773537, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-30 07:20:13', '2021-08-30 07:20:13', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(10, NULL, NULL, '9876543211', 0, 0, 0, NULL, '$2b$10$F7jzwwujBlD2r39lKt8zz.A5X3P2tAi8ueUUpYwuLRk37GRMB/.4m', 527935, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 14:24:05', '2021-09-08 14:24:05', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(11, NULL, NULL, '9876543213', 0, 0, 0, NULL, '$2b$10$.4IMpX5N1NR0kycZ33xoNO75RsihXrvZx.V2sF9sbFKlNzVeW2wHK', 510435, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 14:24:26', '2021-09-08 14:24:26', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(12, NULL, NULL, '1234567890', 0, 0, 0, NULL, '$2b$10$goQa1wIdzeGfjiNWgPAnseqHs3IbJdinsD/lgn//Np3y1S3uNvPQa', 115711, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:14:11', '2021-09-08 15:14:11', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(13, NULL, NULL, '1234567899', 0, 0, 0, NULL, '$2b$10$3WIZScXvEJb8662ZAGwmSesouRJZvYMT/MdB5Df1JaEe.nj8SypC2', 898687, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:15:10', '2021-09-08 15:15:10', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(14, NULL, NULL, '12345678998', 0, 0, 0, NULL, '$2b$10$rTPVXc2cP9u3ziyOIi8bGunZbM/UqgznmU6HrECxeZsBqb9tWZvti', 189112, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:15:44', '2021-09-08 15:15:44', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(15, NULL, NULL, '91777043102', 0, 0, 0, NULL, '$2b$10$4XOBiV63OMqEUND6YmP0CO31Snd9ui1F.loJC3wvzo9ga7eTGxhau', 945656, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:16:35', '2021-09-08 15:16:35', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(16, NULL, NULL, '12345678999', 0, 0, 0, NULL, '$2b$10$nVvua1HloCTkuHhxctFL5ei/hGTYudPcnHvPXo2M.o4y5rGMb6mfe', 793924, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:19:59', '2021-09-08 15:19:59', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(17, NULL, NULL, '', 0, 0, 0, NULL, '$2b$10$/T7yEGxQrUgXD4W5h3lqcuVKOqEhzqz1er9xs/DYHkGVWwuu6mDsi', 786771, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:20:10', '2021-09-08 15:20:10', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(18, NULL, NULL, '3216549870', 0, 0, 0, NULL, '$2b$10$cvcnDJjk/FWEJhXxoXBB2euO5l4rY02deurrL6.id3x7DNdzOJcea', 949617, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:21:37', '2021-09-08 15:21:37', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(19, NULL, NULL, '978754545455', 0, 0, 0, NULL, '$2b$10$5n/kGxM5bFiAlpXuLd8wu.eIFpbneI2UU5Bv9TVy7TwOUqRmPfpDq', 516562, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:22:37', '2021-09-08 15:22:37', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(20, NULL, NULL, '98775757575', 0, 0, 0, NULL, '$2b$10$51JHZqYG1wtJW/lOBESMH.6s5Ros22Uh9MDEOxcZ5g.VlxRVV5.5S', 251942, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 15:23:26', '2021-09-08 15:23:26', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(21, NULL, NULL, '34343434', 0, 0, 0, NULL, '$2b$10$tLJU5rpX8q410DqdQIPpYe9TgjLDXdwAbAf0FSCts1xUVJ9Grj4o.', 130992, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 16:05:48', '2021-09-08 16:05:48', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(22, NULL, NULL, '343434', 0, 0, 0, NULL, '$2b$10$WoVyLO.BNYBLDMpLssuSuuvAicTmq6B7uYp1fN.N/Q.Ta6zL7Q/k2', 664777, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 16:16:39', '2021-09-08 16:16:39', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(23, NULL, NULL, '57656', 0, 0, 0, NULL, '$2b$10$EIuqEMbkFINX6i71gmegIur6TRwZ7NTmNCuqtq4/LDVmOkNFFNmze', 358582, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 16:17:18', '2021-09-08 16:17:18', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(24, NULL, NULL, '3434', 0, 0, 0, NULL, '$2b$10$FjRjlOd5pfRDKSDbawd4M.SqAEPkgVQww44/ghQT2BhrIVeZpKRI.', 409658, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 16:17:37', '2021-09-08 16:17:37', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(25, NULL, NULL, '45545', 0, 0, 0, NULL, '$2b$10$/R3JNJFJZLj8DY7.YF3p7ePS5f/eEys42ssS/DPjzZE.gwNSz.eWC', 882689, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:06:43', '2021-09-08 17:06:43', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(26, NULL, NULL, '343434344', 0, 0, 0, NULL, '$2b$10$Vo2XwrvqA/ankOCwIx1Jne7gA5pbXsL6eLjuXrYDWG5ubQCcXLzju', 115091, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:14:33', '2021-09-08 17:14:33', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(27, NULL, NULL, '3434344343', 0, 0, 0, NULL, '$2b$10$TipBIiHFnappOR6/Aa1vpePl4YvUCSmbiasJqtXwbSUED.VLiuGl2', 658702, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:15:08', '2021-09-08 17:15:08', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(28, NULL, NULL, '4343434', 0, 0, 0, NULL, '$2b$10$1KmHz6o2sUle60NDAr9LqOlax/XZR8gnYC8If9a4k9Yd0h7tzK5S.', 637276, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:19:54', '2021-09-08 17:19:54', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(29, NULL, NULL, '232332323', 0, 0, 0, NULL, '$2b$10$eVPPTAd5OJh7lYPdugPxv.2JpIEkECUYkxo9jC54JrN1.qH4NMFgW', 853203, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:24:05', '2021-09-08 17:24:05', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(30, NULL, NULL, '2232332323', 0, 0, 0, NULL, '$2b$10$k7tOsP1WiE2Iv2uWA1J1x.MWD7fnRWmb8Ka8DpGMfB0oPHNOv0vsy', 252999, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:27:53', '2021-09-08 17:27:53', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(31, NULL, NULL, '5454545454', 0, 0, 0, NULL, '$2b$10$kKlQ4ucK9r54EJBnn7G54eNvKmRwVC01cUB9cfNOxZAOv/1hMDsvq', 860883, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:31:09', '2021-09-08 17:31:09', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(32, NULL, NULL, '434343443', 0, 0, 0, NULL, '$2b$10$97xX2vKkk9FWsQ1c/Q3JSuCkoVPdxV/Fbx.hbjmtT3eG71ieUoMRW', 538453, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:31:43', '2021-09-08 17:31:43', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(33, NULL, NULL, '43434343', 0, 0, 0, NULL, '$2b$10$EU7RcC1AuxWX20tXILEjVOdBZtZBPmmqjXm8jMiKiuOyvP3fL8WAm', 876813, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-08 17:32:25', '2021-09-08 17:32:25', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(34, NULL, NULL, '42434343', 0, 0, 0, NULL, '$2b$10$jGvyCjw9Vw2Z20QN91lYJOPBlO4yTvinHF5.OcQXapgM4kSSchmSO', 205016, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 03:53:30', '2021-09-09 03:53:30', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(35, NULL, NULL, '43434343434', 0, 0, 0, NULL, '$2b$10$ACqfJSv/jopCvJySWd.FeuBP2gyJ81YtpN075ImUF0/vkhgukjzhC', 117571, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 03:54:23', '2021-09-09 03:54:23', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(36, NULL, NULL, '4343434343443', 0, 0, 0, NULL, '$2b$10$n0VGZhLXeizYcZOmSKZP8uOZR9iKkPdz/6S2wRreAEuh7OxoWQQ/W', 841276, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 03:55:29', '2021-09-09 03:55:29', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(37, NULL, NULL, '43434343434434', 0, 0, 0, NULL, '$2b$10$Q1g1Eid.4oPqyPBMQjsUCOb.kCOtYmmtUx8PWtyK15KdfRCMzalHS', 905898, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:24:06', '2021-09-09 04:24:06', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(38, NULL, NULL, '4343434343443443', 0, 0, 0, NULL, '$2b$10$X9TpA9TWNRDwlZxBCmap0uLIEcxT7ZFRoK/bMRzUkEqwh6Xt/QPoS', 314573, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:24:20', '2021-09-09 04:24:20', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(39, NULL, NULL, '43434', 0, 0, 0, NULL, '$2b$10$oxoMEBMD37849yDi9x2Zt./bL8RRXirkWWuJXIyJAjaU2d5cP0SWi', 826067, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:29:16', '2021-09-09 04:29:16', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(40, NULL, NULL, '434343433', 0, 0, 0, NULL, '$2b$10$ckvsD3vnSY4/YhOw38qOj.F6VUU8Tj58/iL.rjbvb.Pkfy3MGnNGy', 174891, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:34:30', '2021-09-09 04:34:30', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(41, NULL, NULL, '434343434343434', 0, 0, 0, NULL, '$2b$10$xpndgxAHA/5ZB7vzwOjkHusmwnn6cPIf9WwzIICmGhyGFZcuCvrSC', 340176, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:39:00', '2021-09-09 04:39:00', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(42, NULL, NULL, '43434343434343422', 0, 0, 0, NULL, '$2b$10$mQ95X32nbZMtEx35QSnqRuI9baNG4hNN./0ctI1hRzL9rtT9IcM/6', 552773, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:40:35', '2021-09-09 04:40:35', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(43, NULL, NULL, '545454545', 0, 0, 0, NULL, '$2b$10$hRf.nHepUtcoLOhEY6V73.HyXpXPgZJjWpvzpvDaJ4pjDEtAd4y1W', 234198, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:41:26', '2021-09-09 04:41:26', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(44, NULL, NULL, '43434344', 0, 0, 0, NULL, '$2b$10$mCx9Zd4pFqd384NKxAaO2.xfxanM4fqRds6sc8pZ/3Nlmzge7ansG', 633939, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:42:55', '2021-09-09 04:42:55', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(45, NULL, NULL, '65656', 0, 0, 0, NULL, '$2b$10$bPEgvRQmKdxvSyCKuyXGcOavYC55mzNlh7VsRG1FMCH8tvhn1jz8a', 249155, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:43:09', '2021-09-09 04:43:09', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(46, NULL, NULL, '9434434343434', 0, 0, 0, NULL, '$2b$10$ux/OG.I43iV2qPYkNkeF/e0y..FYGI3jtjz877g5CjaGT0La57adm', 542704, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:43:48', '2021-09-09 04:43:48', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(47, NULL, NULL, '545454', 0, 0, 0, NULL, '$2b$10$oqVLn90N.L60UTKegsRoku/7E5kLKIej1QbbptiqaBKy7vvFICali', 270169, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:44:34', '2021-09-09 04:44:34', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(48, NULL, NULL, '656565656', 0, 0, 0, NULL, '$2b$10$irdnIvaHhGiNGH5Wiay.iOxGO9VHjxt..2BDFJhgHmFy6LHAsFI7i', 822216, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:45:06', '2021-09-09 04:45:06', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(49, NULL, NULL, '4343443', 0, 0, 0, NULL, '$2b$10$WcWIRLB81UK4DZNdRH09CeXaTQTJ/09BbQ6uKhR3UBWvT7OSBMVci', 375414, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:48:34', '2021-09-09 04:48:34', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(50, NULL, NULL, '3434343434', 0, 0, 0, NULL, '$2b$10$8Fv7WebuA1MemWWdrDzTbOSxtAxyxN7si09T8fyuY06EpzRJc0RVW', 138417, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:52:02', '2021-09-09 04:52:02', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(51, NULL, NULL, '4343434343434', 0, 0, 0, NULL, '$2b$10$NKicb3wN4.SKuquUKShQq.ueWAFy34zw1VprfcaouNpxszLxgElsm', 290896, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:53:06', '2021-09-09 04:53:06', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(52, NULL, NULL, '232323232', 0, 0, 0, NULL, '$2b$10$XeaDbtGUbawfU/MQU/xJ/uL/aGccSZKUt9obFewLvpeP8Mu8LYVSO', 479688, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:54:16', '2021-09-09 04:54:16', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(53, NULL, NULL, '23232323', 0, 0, 0, NULL, '$2b$10$XIfjKNeseYoPkiWwKvA6C.vBagG0VU3HCaTFYJMNHlkiyc0wQwtP6', 596803, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 04:56:32', '2021-09-09 05:00:52', '2021-09-09 07:42:58', '2021-09-09 07:42:58'),
(54, NULL, NULL, '8712103633', 99994088, 3948, 39, NULL, '$2b$10$e1M.b1VGX8OuQQMfeNi1wuIJ.Xm6Q6eHwforCQC/JHeuKuTti9B7y', 264394, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAkZTFNLmIxVkdYOE91UVFNZmVOaTF3dUlKLlhtNlE2ZUh3Zm9yQ1FDL0pIZXVLdVR0aTlCN3kiLCJ1c2VySWQiOjU0LCJpYXQiOjE2MzEyNTkzMzcsImV4cCI6MTYzMjU1NTMzN30.T_aBbOEgqf46oV2SRFp5If_TueAUymfsRV-sMbLvU7w', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 09:43:28', '2021-09-10 08:01:45', '2021-09-09 09:43:28', '2021-09-09 09:43:28'),
(55, NULL, NULL, '7075650803', 0, 0, 0, NULL, '$2b$10$XFpokQrXrhvKMbafLyqN5OvgWt5QaQv8QhZ9tfy8TtJPuh7Orh8Em', 262292, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 10:03:22', '2021-09-09 10:03:49', '2021-09-09 10:03:22', '2021-09-09 10:03:22'),
(56, NULL, NULL, '9876541230', 0, 0, 0, NULL, '$2b$10$W/otQ2JKP23DYDyHoQjijeAihngNTjR2ZMYrOnMW4B7k7B6dgrNvS', 315939, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2021-09-09 10:17:01', '2021-09-09 10:17:25', '2021-09-09 10:17:01', '2021-09-09 10:17:01'),
(57, NULL, NULL, '7788994455', 0, 0, 0, NULL, '$2b$10$QAcQdOflTqmWXL9EGSWf.ONXwXgAEx4mgauEB/Q1/dvwoWjAvZTB.', 996245, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 11:42:36', '2021-09-09 11:42:36', '2021-09-09 11:42:36', '2021-09-09 11:42:36'),
(58, NULL, NULL, '123456789994', 0, 0, 0, NULL, '$2b$10$YhtI44g0LBBfX/gXm8PXdOM0ExL6B9dL.pHbe6.q0BQFfnuCMg2Q.', 182431, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 11:46:06', '2021-09-09 11:46:06', '2021-09-09 11:46:06', '2021-09-09 11:46:06'),
(59, NULL, NULL, '7788994477', 200, 0, 0, NULL, '$2b$10$uz7EyXfga2aWO6xJa9OPde7QDFFdEE4Zhd8Qbl3FQc076ijIz9Rzy', 182277, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, 'SSS98489', '3', '2021-09-09 11:47:58', '2021-09-09 12:47:04', '2021-09-09 11:47:58', '2021-09-09 11:47:58'),
(60, NULL, NULL, '7894477889', 2, 0, 0, NULL, '$2b$10$MKLM9ipKnn5I/aITAnMt5.2O7WBc1ykomR6xqf.m45R8zF3kNLoO.', 573199, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:27:11', '2021-09-09 12:27:11', '2021-09-09 12:27:11', '2021-09-09 12:27:11'),
(61, NULL, NULL, '7894477881', 2, 0, 0, NULL, '$2b$10$yqFQfIDjUSlZRHRkESO0..aDhxQuVfUl8R7hvFUPNAU7/l0k.t0iu', 603625, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:27:24', '2021-09-09 12:27:24', '2021-09-09 12:27:24', '2021-09-09 12:27:24'),
(62, NULL, NULL, '9988777788', 2, 0, 0, NULL, '$2b$10$DxQH5MR1DE54yczpxPoIP.pdmdotNmpcw2bQ/B34j5iDUX44mwJUa', 210352, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:27:42', '2021-09-09 12:27:42', '2021-09-09 12:27:42', '2021-09-09 12:27:42'),
(63, NULL, NULL, '9638527410', 2, 0, 0, NULL, '$2b$10$PpNS36kyCKDt4pfziOyhOuUimg.gFxlU12WjsZdfX0/2OpsbMFz9e', 963669, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:28:11', '2021-09-09 12:28:12', '2021-09-09 12:28:11', '2021-09-09 12:28:11'),
(64, NULL, NULL, '9516238740', 2, 0, 0, NULL, '$2b$10$TTTuMsMQnLIru/kSfFnG/ObV4lPhDLM3MuOtbZSmS7ORwYBSDs4C2', 965485, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:28:28', '2021-09-09 12:28:29', '2021-09-09 12:28:28', '2021-09-09 12:28:28'),
(65, NULL, NULL, '9516238741', 2, 0, 0, NULL, '$2b$10$mhd0DSjtfSmVcKtgm.Binuj5TDrsHweN8rggeO0VC8K98QeV2Haea', 487958, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:29:03', '2021-09-09 12:29:03', '2021-09-09 12:29:03', '2021-09-09 12:29:03'),
(66, NULL, NULL, '9516238742', 4, 0, 0, NULL, '$2b$10$xvbBRGfGV0/7m0kheyJdfegv0AtZBPJ5JzoLsJbRmau.U1oa8B1T6', 136976, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:30:22', '2021-09-09 12:30:23', '2021-09-09 12:30:22', '2021-09-09 12:30:22'),
(67, NULL, NULL, '9516238744', 22, 0, 0, NULL, '$2b$10$JL/YywYtPjGM/Dd1RWTjs.LrQuY.vvbXGDVs4Kdlt0klqHIVvf7je', 710319, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:33:15', '2021-09-09 12:33:16', '2021-09-09 12:33:15', '2021-09-09 12:33:15'),
(68, NULL, NULL, '9854623178', 22, 0, 0, NULL, '$2b$10$wdajo5w8P1ELcDowPeW1MuozHlYE8yeRvpWGZ8qjC8/6Ifnjs/q/y', 272118, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:38:34', '2021-09-09 12:38:35', '2021-09-09 12:38:34', '2021-09-09 12:38:34'),
(69, NULL, NULL, '8899557744', 0, 0, 0, NULL, '$2b$10$jEtgEayOmzIeVh0gmkxQAOaw1Cob0CeAIIHRJYmRVz5VmSNyCRjne', 441572, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:40:19', '2021-09-09 12:40:19', '2021-09-09 12:40:19', '2021-09-09 12:40:19'),
(70, NULL, NULL, '8899557741', 0, 0, 0, NULL, '$2b$10$OG1cDPbv3dlKBz3eZ5XfJuOQUyPW3FoNrgZv2GxIvFftz0vsNxp5K', 438327, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:40:49', '2021-09-09 12:40:49', '2021-09-09 12:40:49', '2021-09-09 12:40:49'),
(71, NULL, NULL, '8899557742', 0, 0, 0, NULL, '$2b$10$yD9FAHOogVZnAVi3n.sdsehFkhU/Ah015KrnFH5BJbXOMJsg9z/pG', 921140, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:41:12', '2021-09-09 12:41:12', '2021-09-09 12:41:12', '2021-09-09 12:41:12'),
(72, NULL, NULL, '8899557743', 0, 0, 0, NULL, '$2b$10$jpQ0OGfWmL4WthP5uuKsWuqUCSEYXJQR0pVeCaw0cNs1SMFnW4mEy', 226344, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:42:21', '2021-09-09 12:42:21', '2021-09-09 12:42:21', '2021-09-09 12:42:21'),
(73, NULL, NULL, '7788994471', 0, 0, 0, NULL, '$2b$10$SK6KGvvZXHUO2sOZwEK6H.KFwNG/eKd9u20YbQnkoYRUGtS8MebfK', 998157, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:42:39', '2021-09-09 12:42:39', '2021-09-09 12:42:39', '2021-09-09 12:42:39'),
(74, NULL, NULL, '987681654', 0, 0, 0, NULL, '$2b$10$zq/Nc/4lKjqKlG0MU0EhQ.K9GFuIrbvkZlUUCVaFIvvlWf.ZqW9mG', 207622, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:43:06', '2021-09-09 12:43:06', '2021-09-09 12:43:06', '2021-09-09 12:43:06'),
(75, NULL, NULL, '9877889944', 0, 0, 0, NULL, '$2b$10$Rg6jmyfPgMkWaTAL5ByRLOC8MX06iUw1ZyZeYL3NeOJ6yc09KbaTS', 199042, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NULL', '2021-09-09 12:45:40', '2021-09-09 12:45:40', '2021-09-09 12:45:40', '2021-09-09 12:45:40'),
(76, NULL, NULL, '6897541230', 2, 0, 0, NULL, '$2b$10$zfga9m35UVP/rnjsQCUOkeRtO12bUWvVaiCImIajzcb3ISCuUKyCu', 816231, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2021-09-09 12:46:27', '2021-09-09 12:46:27', '2021-09-09 12:46:27', '2021-09-09 12:46:27'),
(77, NULL, NULL, '6985741230', 22, 0, 0, NULL, '$2b$10$K8oo2wK1hY0b3ZEm.vjXRO.BfY2JrPhqWo09/gzDOT/tOAv.4.WnK', 831043, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '59', '2021-09-09 12:47:04', '2021-09-09 12:47:05', '2021-09-09 12:47:04', '2021-09-09 12:47:04'),
(78, 'Suresh', NULL, '7411122189', 2, 0, 0, NULL, '$2b$10$DNYgX3Pwh1NWYxE8jGbun.VQjYDLi/6F7x7RU1nDaGBTaEFqu1r4i', 559828, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAkRE5ZZ1gzUHdoMU5XWXhFOGpHYnVuLlZRallETGkvNkY3eDdSVTFuRGFHQlRhRUZxdTFyNGkiLCJ1c2VySWQiOjc4LCJpYXQiOjE2MzEyNzI1NDcsImV4cCI6MTYzMjU2ODU0N30.6mC3rhlqX8f6VXXJhHMYTiL6eWQxenfTyWtlHqfuNyM', 'no', NULL, NULL, NULL, NULL, NULL, NULL, '678598858', NULL, '2021-09-10 11:14:49', '2021-09-10 11:15:47', '2021-09-10 11:14:49', '2021-09-10 11:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `walletHistories`
--

CREATE TABLE `walletHistories` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `game_id` bigint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `credit_debit` enum('credit','debit') DEFAULT NULL,
  `type` enum('game','bonus','deposit') DEFAULT NULL,
  `wallet_type` enum('wallet','earnings','gulkan_points') DEFAULT NULL,
  `comment` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `walletHistories`
--

INSERT INTO `walletHistories` (`id`, `user_id`, `game_id`, `amount`, `balance`, `credit_debit`, `type`, `wallet_type`, `comment`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(1, 3, 1, -10, 990, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:22:24', '2021-09-10 13:22:24', '2021-09-10 13:22:24', '2021-09-10 13:22:24'),
(2, 3, 1, -10, 980, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:22:37', '2021-09-10 13:22:37', '2021-09-10 13:22:37', '2021-09-10 13:22:37'),
(3, 3, 1, -10, 970, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:22:47', '2021-09-10 13:22:47', '2021-09-10 13:22:47', '2021-09-10 13:22:47'),
(4, 3, 1, -10, 960, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:24:11', '2021-09-10 13:24:11', '2021-09-10 13:24:11', '2021-09-10 13:24:11'),
(5, 3, 1, -10, 950, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:24:12', '2021-09-10 13:24:12', '2021-09-10 13:24:12', '2021-09-10 13:24:12'),
(6, 3, 1, -10, 940, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:24:16', '2021-09-10 13:24:16', '2021-09-10 13:24:16', '2021-09-10 13:24:16'),
(7, 3, 1, -10, 930, 'debit', 'game', 'wallet', NULL, '2021-09-10 13:24:17', '2021-09-10 13:24:17', '2021-09-10 13:24:17', '2021-09-10 13:24:17'),
(8, 3, 3, 30, 960, 'credit', 'game', 'earnings', NULL, '2021-09-10 13:24:47', '2021-09-10 13:24:47', '2021-09-10 13:24:47', '2021-09-10 13:24:47'),
(9, 3, 1, 0.3, 960.3, 'credit', 'bonus', 'gulkan_points', NULL, '2021-09-10 13:24:47', '2021-09-10 13:24:47', '2021-09-10 13:24:47', '2021-09-10 13:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawRequests`
--

CREATE TABLE `withdrawRequests` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `bankDetails` text,
  `comment` text,
  `status` enum('pending','hold','rejected','completed','failed') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `admins_new_email_unique` (`new_email`),
  ADD UNIQUE KEY `admins_new_mobile_number_unique` (`new_mobile_number`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dailyBonus`
--
ALTER TABLE `dailyBonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gamePlays`
--
ALTER TABLE `gamePlays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gamePositions`
--
ALTER TABLE `gamePositions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Settings`
--
ALTER TABLE `Settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `walletHistories`
--
ALTER TABLE `walletHistories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawRequests`
--
ALTER TABLE `withdrawRequests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dailyBonus`
--
ALTER TABLE `dailyBonus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gamePlays`
--
ALTER TABLE `gamePlays`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gamePositions`
--
ALTER TABLE `gamePositions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Settings`
--
ALTER TABLE `Settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `walletHistories`
--
ALTER TABLE `walletHistories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `withdrawRequests`
--
ALTER TABLE `withdrawRequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
