-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2021 at 11:41 AM
-- Server version: 8.0.27-0ubuntu0.21.04.1
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
-- Table structure for table `adminEarnings`
--

CREATE TABLE `adminEarnings` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `day` bigint DEFAULT NULL,
  `business` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminEarnings`
--

INSERT INTO `adminEarnings` (`id`, `date`, `day`, `business`, `amount`, `comment`, `createdAt`, `updatedAt`) VALUES
(2, '2021-11-02', 1, NULL, 0, NULL, '2021-11-03 00:12:12', '2021-11-03 18:11:09'),
(3, '2021-11-03', 1, NULL, 0, NULL, '2021-11-03 18:07:35', '2021-11-03 18:08:35'),
(4, '2021-11-04', 1, NULL, 261845, NULL, '2021-11-04 09:21:48', '2021-11-04 17:20:22'),
(5, '2021-11-05', 1, NULL, 580, NULL, '2021-11-05 12:25:36', '2021-11-05 12:52:33'),
(6, '2021-11-08', 1, NULL, 47912, NULL, '2021-11-08 12:05:20', '2021-11-08 17:32:57'),
(7, '2021-11-09', 1, NULL, 980, NULL, '2021-11-09 15:11:30', '2021-11-09 16:03:43'),
(8, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:26:57', '2021-11-11 16:07:54'),
(9, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:26:58', '2021-11-11 15:26:58'),
(10, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:26:59', '2021-11-11 15:26:59'),
(11, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:27:56', '2021-11-11 15:27:56'),
(12, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:28:56', '2021-11-11 15:28:56'),
(13, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:28:57', '2021-11-11 15:28:57'),
(14, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:29:56', '2021-11-11 15:29:56'),
(15, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:30:56', '2021-11-11 15:30:56'),
(16, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:31:57', '2021-11-11 15:31:57'),
(17, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:31:57', '2021-11-11 15:31:57'),
(18, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:32:56', '2021-11-11 15:32:56'),
(19, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:33:56', '2021-11-11 15:33:56'),
(20, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:34:56', '2021-11-11 15:34:56'),
(21, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:34:57', '2021-11-11 15:34:57'),
(22, '2021-11-11', 1, NULL, 0, NULL, '2021-11-11 15:35:58', '2021-11-11 15:35:58'),
(23, '2021-11-15', 1, -9223372036854775808, 0, NULL, '2021-11-15 11:54:30', '2021-11-15 13:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `new_mobile_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile_verified` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'No',
  `email_verified` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'No',
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile`, `new_email`, `new_mobile_number`, `city`, `address`, `profile`, `mobile_verified`, `email_verified`, `mobile_verified_at`, `email_verified_at`, `password`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'BBBS', 'admin@bigspingame.com', '', NULL, NULL, NULL, NULL, NULL, 'No', 'No', NULL, NULL, '$2y$10$TrqfIeAravmwf51HOe53den2cNBw2QEkaEYwntaTPxibkNAwkLv1y', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_general_ci,
  `slug` text COLLATE utf8mb4_general_ci,
  `color` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `degrees` text COLLATE utf8mb4_general_ci,
  `count` bigint DEFAULT NULL,
  `ntimes` bigint DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `status` enum('show','hide') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `color`, `degrees`, `count`, `ntimes`, `comment`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'White', 'white', '#efede1', '{\"0\":\"30\",\"1\":\"90\",\"2\":\"150\",\"3\":\"240\",\"4\":\"300\"}', 2, 2, '[360,180]', 'show', '2021-08-23 17:01:22', '2021-08-23 17:01:22'),
(2, 'Blue', 'blue', '#33a2ea', '{\"0\":\"60\",\"1\":\"120\",\"2\":\"210\",\"3\":\"270\",\"4\":\"330\"}', 2, 2, '[90,270]', 'show', '2021-08-23 17:01:49', '2021-08-23 17:01:49'),
(3, 'Red', 'red', '#fe6263', '{\"0\":\"360\",\"1\":\"180\",\"2\":\"360\",\"3\":\"180\",\"4\":\"360\"}', 2, 10, '[120,300]', 'show', '2021-08-23 17:02:07', '2021-08-23 17:02:07'),
(4, 'Green', 'green', '#08d4a9', '{\"0\":\"60\",\"1\":\"240\"}', 2, 15, '[60,240]', 'hide', '2021-08-23 17:02:35', '2021-08-23 17:02:35'),
(5, 'Black', 'black', 'black', '{\"0\":\"150\",\"1\":\"330\"}', 2, 3, '[150,330]', 'hide', '2021-08-23 17:03:02', '2021-08-23 17:03:02'),
(6, 'Yellow', 'yellow', '#feb002', '{\"0\":\"30\",\"1\":\"90\",\"2\":\"150\",\"3\":\"240\",\"4\":\"300\"}', 2, 2, '[30,210]', 'hide', '2021-08-23 17:03:17', '2021-08-23 17:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `dailyBonus`
--

CREATE TABLE `dailyBonus` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `days` int DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `depositRequests`
--

CREATE TABLE `depositRequests` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `screenshot` text COLLATE utf8mb4_general_ci,
  `comment` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','hold','rejected','completed','failed') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `comment` text COLLATE utf8mb4_general_ci,
  `result_time` bigint DEFAULT NULL,
  `result` bigint DEFAULT NULL,
  `status` enum('started','stopped','closed','result') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refund_status` enum('pending','success') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin_profit` bigint DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamePlays`
--

INSERT INTO `gamePlays` (`id`, `game_id`, `players`, `time`, `time_left`, `comment`, `result_time`, `result`, `status`, `refund_status`, `admin_profit`, `startTime`, `endTime`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 60, -31, NULL, 20, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:17:21', '2021-11-13 18:22:27', '2021-11-13 12:47:21', '2021-11-13 12:47:21'),
(2, 1, NULL, 60, 29, NULL, NULL, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:18:21', '2021-11-13 18:20:27', '2021-11-13 12:48:21', '2021-11-13 12:48:21'),
(3, 1, NULL, 60, -101, NULL, 20, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:21:27', '2021-11-13 18:26:00', '2021-11-13 12:51:27', '2021-11-13 12:51:27'),
(4, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:22:28', '2021-11-13 18:23:29', '2021-11-13 12:52:28', '2021-11-13 12:52:28'),
(5, 1, NULL, 60, -69, NULL, 20, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:25:00', '2021-11-13 18:29:17', '2021-11-13 12:55:00', '2021-11-13 12:55:00'),
(6, 1, NULL, 60, -1, NULL, 13, 1, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:26:01', '2021-11-13 18:27:17', '2021-11-13 12:56:01', '2021-11-13 12:56:01'),
(7, 1, NULL, 60, -77, NULL, 20, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:28:17', '2021-11-13 18:33:45', '2021-11-13 12:58:17', '2021-11-13 12:58:17'),
(8, 1, NULL, 60, 0, NULL, 4, 3, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:29:17', '2021-11-13 18:30:45', '2021-11-13 12:59:17', '2021-11-13 12:59:17'),
(9, 1, NULL, 60, -2, 'result2randomundefined', -1, 2, 'closed', NULL, 10, NULL, NULL, '2021-11-13 18:31:45', '2021-11-13 18:32:40', '2021-11-13 13:01:45', '2021-11-13 13:01:45'),
(10, 1, NULL, 60, 0, 'result3randomundefined', 0, 3, 'closed', 'pending', 200, NULL, NULL, '2021-11-13 18:32:45', '2021-11-13 18:33:47', '2021-11-13 13:02:45', '2021-11-13 13:02:45'),
(11, 1, NULL, 60, 31, NULL, NULL, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 18:33:45', '2021-11-13 18:34:00', '2021-11-13 13:03:45', '2021-11-13 13:03:45'),
(12, 1, NULL, 60, -2, 'result3randomundefined', -1, 3, 'closed', NULL, 110, NULL, NULL, '2021-11-13 18:35:00', '2021-11-13 18:35:54', '2021-11-13 13:05:00', '2021-11-13 13:05:00'),
(13, 1, NULL, 60, -2, 'result1randomundefined', -1, 1, 'closed', NULL, -10, NULL, NULL, '2021-11-13 18:36:00', '2021-11-13 18:36:54', '2021-11-13 13:06:00', '2021-11-13 13:06:00'),
(14, 1, NULL, 60, -2, 'result1randomundefined', 0, 1, 'closed', NULL, -20, NULL, NULL, '2021-11-13 18:37:00', '2021-11-13 18:38:02', '2021-11-13 13:07:00', '2021-11-13 13:07:00'),
(15, 1, NULL, 60, -16, 'result2randomundefined', -4, 2, 'closed', NULL, -79, NULL, NULL, '2021-11-13 18:38:00', '2021-11-13 18:39:10', '2021-11-13 13:08:00', '2021-11-13 13:08:00'),
(16, 1, NULL, 60, -2, 'result2randomundefined', -1, 2, 'closed', NULL, 20, NULL, NULL, '2021-11-13 18:39:01', '2021-11-13 18:39:56', '2021-11-13 13:09:01', '2021-11-13 13:09:01'),
(17, 1, NULL, 60, -2, 'result2randomundefined', -1, 2, 'closed', NULL, 20, NULL, NULL, '2021-11-13 18:40:00', '2021-11-13 18:40:54', '2021-11-13 13:10:00', '2021-11-13 13:10:00'),
(18, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:41:00', '2021-11-13 18:42:03', '2021-11-13 13:11:00', '2021-11-13 13:11:00'),
(19, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:42:00', '2021-11-13 18:43:03', '2021-11-13 13:12:00', '2021-11-13 13:12:00'),
(20, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:43:00', '2021-11-13 18:43:56', '2021-11-13 13:13:00', '2021-11-13 13:13:00'),
(21, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:44:00', '2021-11-13 18:45:02', '2021-11-13 13:14:00', '2021-11-13 13:14:00'),
(22, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:45:00', '2021-11-13 18:46:03', '2021-11-13 13:15:00', '2021-11-13 13:15:00'),
(23, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:46:00', '2021-11-13 18:47:02', '2021-11-13 13:16:00', '2021-11-13 13:16:00'),
(24, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:47:00', '2021-11-13 18:48:02', '2021-11-13 13:17:00', '2021-11-13 13:17:00'),
(25, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:48:00', '2021-11-13 18:49:02', '2021-11-13 13:18:00', '2021-11-13 13:18:00'),
(26, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:49:00', '2021-11-13 18:50:02', '2021-11-13 13:19:00', '2021-11-13 13:19:00'),
(27, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:50:00', '2021-11-13 18:51:01', '2021-11-13 13:20:00', '2021-11-13 13:20:00'),
(28, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:51:00', '2021-11-13 18:52:02', '2021-11-13 13:21:00', '2021-11-13 13:21:00'),
(29, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:52:00', '2021-11-13 18:53:02', '2021-11-13 13:22:00', '2021-11-13 13:22:00'),
(30, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:53:00', '2021-11-13 18:54:02', '2021-11-13 13:23:00', '2021-11-13 13:23:00'),
(31, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:54:00', '2021-11-13 18:55:02', '2021-11-13 13:24:00', '2021-11-13 13:24:00'),
(32, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:55:00', '2021-11-13 18:56:02', '2021-11-13 13:25:00', '2021-11-13 13:25:00'),
(33, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:56:00', '2021-11-13 18:57:02', '2021-11-13 13:26:00', '2021-11-13 13:26:00'),
(34, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:57:00', '2021-11-13 18:58:02', '2021-11-13 13:27:00', '2021-11-13 13:27:00'),
(35, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:58:00', '2021-11-13 18:59:02', '2021-11-13 13:28:00', '2021-11-13 13:28:00'),
(36, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 18:59:00', '2021-11-13 19:00:02', '2021-11-13 13:29:00', '2021-11-13 13:29:00'),
(37, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:00:00', '2021-11-13 19:01:02', '2021-11-13 13:30:00', '2021-11-13 13:30:00'),
(38, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:01:00', '2021-11-13 19:02:02', '2021-11-13 13:31:00', '2021-11-13 13:31:00'),
(39, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:02:00', '2021-11-13 19:03:02', '2021-11-13 13:32:00', '2021-11-13 13:32:00'),
(40, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:03:00', '2021-11-13 19:04:01', '2021-11-13 13:33:00', '2021-11-13 13:33:00'),
(41, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:04:00', '2021-11-13 19:05:01', '2021-11-13 13:34:00', '2021-11-13 13:34:00'),
(42, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:05:00', '2021-11-13 19:06:01', '2021-11-13 13:35:00', '2021-11-13 13:35:00'),
(43, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:06:00', '2021-11-13 19:07:02', '2021-11-13 13:36:00', '2021-11-13 13:36:00'),
(44, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:07:00', '2021-11-13 19:08:02', '2021-11-13 13:37:00', '2021-11-13 13:37:00'),
(45, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:08:00', '2021-11-13 19:09:01', '2021-11-13 13:38:00', '2021-11-13 13:38:00'),
(46, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:09:00', '2021-11-13 19:10:01', '2021-11-13 13:39:00', '2021-11-13 13:39:00'),
(47, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:10:00', '2021-11-13 19:11:01', '2021-11-13 13:40:00', '2021-11-13 13:40:00'),
(48, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:11:00', '2021-11-13 19:12:01', '2021-11-13 13:41:00', '2021-11-13 13:41:00'),
(49, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:12:00', '2021-11-13 19:13:01', '2021-11-13 13:42:00', '2021-11-13 13:42:00'),
(50, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:13:00', '2021-11-13 19:14:01', '2021-11-13 13:43:00', '2021-11-13 13:43:00'),
(51, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:14:00', '2021-11-13 19:15:02', '2021-11-13 13:44:00', '2021-11-13 13:44:00'),
(52, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:15:00', '2021-11-13 19:16:02', '2021-11-13 13:45:00', '2021-11-13 13:45:00'),
(53, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:16:00', '2021-11-13 19:17:01', '2021-11-13 13:46:00', '2021-11-13 13:46:00'),
(54, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:17:00', '2021-11-13 19:18:01', '2021-11-13 13:47:00', '2021-11-13 13:47:00'),
(55, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:18:00', '2021-11-13 19:19:01', '2021-11-13 13:48:00', '2021-11-13 13:48:00'),
(56, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:19:00', '2021-11-13 19:20:01', '2021-11-13 13:49:00', '2021-11-13 13:49:00'),
(57, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:20:00', '2021-11-13 19:21:01', '2021-11-13 13:50:00', '2021-11-13 13:50:00'),
(58, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:21:00', '2021-11-13 19:22:01', '2021-11-13 13:51:00', '2021-11-13 13:51:00'),
(59, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:22:00', '2021-11-13 19:23:01', '2021-11-13 13:52:00', '2021-11-13 13:52:00'),
(60, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:23:00', '2021-11-13 19:24:01', '2021-11-13 13:53:00', '2021-11-13 13:53:00'),
(61, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:24:00', '2021-11-13 19:25:01', '2021-11-13 13:54:00', '2021-11-13 13:54:00'),
(62, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:25:00', '2021-11-13 19:26:01', '2021-11-13 13:55:00', '2021-11-13 13:55:00'),
(63, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:26:00', '2021-11-13 19:27:01', '2021-11-13 13:56:00', '2021-11-13 13:56:00'),
(64, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:27:00', '2021-11-13 19:28:01', '2021-11-13 13:57:00', '2021-11-13 13:57:00'),
(65, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:28:00', '2021-11-13 19:29:01', '2021-11-13 13:58:00', '2021-11-13 13:58:00'),
(66, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:29:00', '2021-11-13 19:30:01', '2021-11-13 13:59:00', '2021-11-13 13:59:00'),
(67, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:30:00', '2021-11-13 19:31:01', '2021-11-13 14:00:00', '2021-11-13 14:00:00'),
(68, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:31:00', '2021-11-13 19:32:02', '2021-11-13 14:01:00', '2021-11-13 14:01:00'),
(69, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:32:00', '2021-11-13 19:33:01', '2021-11-13 14:02:00', '2021-11-13 14:02:00'),
(70, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:33:00', '2021-11-13 19:34:01', '2021-11-13 14:03:00', '2021-11-13 14:03:00'),
(71, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:34:00', '2021-11-13 19:35:01', '2021-11-13 14:04:00', '2021-11-13 14:04:00'),
(72, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:35:00', '2021-11-13 19:36:01', '2021-11-13 14:05:00', '2021-11-13 14:05:00'),
(73, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:36:00', '2021-11-13 19:37:01', '2021-11-13 14:06:00', '2021-11-13 14:06:00'),
(74, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:37:00', '2021-11-13 19:38:01', '2021-11-13 14:07:00', '2021-11-13 14:07:00'),
(75, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:38:00', '2021-11-13 19:39:01', '2021-11-13 14:08:00', '2021-11-13 14:08:00'),
(76, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:39:00', '2021-11-13 19:40:02', '2021-11-13 14:09:00', '2021-11-13 14:09:00'),
(77, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:40:00', '2021-11-13 19:41:02', '2021-11-13 14:10:00', '2021-11-13 14:10:00'),
(78, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:41:00', '2021-11-13 19:42:01', '2021-11-13 14:11:00', '2021-11-13 14:11:00'),
(79, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:42:00', '2021-11-13 19:43:01', '2021-11-13 14:12:00', '2021-11-13 14:12:00'),
(80, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:43:00', '2021-11-13 19:44:01', '2021-11-13 14:13:00', '2021-11-13 14:13:00'),
(81, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:44:00', '2021-11-13 19:45:01', '2021-11-13 14:14:00', '2021-11-13 14:14:00'),
(82, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:45:00', '2021-11-13 19:46:01', '2021-11-13 14:15:00', '2021-11-13 14:15:00'),
(83, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:46:00', '2021-11-13 19:47:01', '2021-11-13 14:16:00', '2021-11-13 14:16:00'),
(84, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:47:00', '2021-11-13 19:48:01', '2021-11-13 14:17:00', '2021-11-13 14:17:00'),
(85, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:48:00', '2021-11-13 19:49:01', '2021-11-13 14:18:00', '2021-11-13 14:18:00'),
(86, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:49:00', '2021-11-13 19:50:01', '2021-11-13 14:19:00', '2021-11-13 14:19:00'),
(87, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:50:00', '2021-11-13 19:51:02', '2021-11-13 14:20:00', '2021-11-13 14:20:00'),
(88, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:51:00', '2021-11-13 19:52:01', '2021-11-13 14:21:00', '2021-11-13 14:21:00'),
(89, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:52:01', '2021-11-13 19:53:02', '2021-11-13 14:22:01', '2021-11-13 14:22:01'),
(90, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:53:00', '2021-11-13 19:54:01', '2021-11-13 14:23:00', '2021-11-13 14:23:00'),
(91, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:54:00', '2021-11-13 19:55:01', '2021-11-13 14:24:00', '2021-11-13 14:24:00'),
(92, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:55:00', '2021-11-13 19:56:01', '2021-11-13 14:25:00', '2021-11-13 14:25:00'),
(93, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:56:00', '2021-11-13 19:57:01', '2021-11-13 14:26:00', '2021-11-13 14:26:00'),
(94, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:57:00', '2021-11-13 19:58:01', '2021-11-13 14:27:00', '2021-11-13 14:27:00'),
(95, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:58:00', '2021-11-13 19:59:01', '2021-11-13 14:28:00', '2021-11-13 14:28:00'),
(96, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 19:59:00', '2021-11-13 20:00:01', '2021-11-13 14:29:00', '2021-11-13 14:29:00'),
(97, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:00:00', '2021-11-13 20:01:01', '2021-11-13 14:30:00', '2021-11-13 14:30:00'),
(98, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:01:00', '2021-11-13 20:02:01', '2021-11-13 14:31:00', '2021-11-13 14:31:00'),
(99, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:02:00', '2021-11-13 20:03:01', '2021-11-13 14:32:00', '2021-11-13 14:32:00'),
(100, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:03:00', '2021-11-13 20:04:01', '2021-11-13 14:33:00', '2021-11-13 14:33:00'),
(101, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:04:00', '2021-11-13 20:05:01', '2021-11-13 14:34:00', '2021-11-13 14:34:00'),
(102, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:05:00', '2021-11-13 20:06:01', '2021-11-13 14:35:00', '2021-11-13 14:35:00'),
(103, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:06:00', '2021-11-13 20:07:01', '2021-11-13 14:36:00', '2021-11-13 14:36:00'),
(104, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:07:00', '2021-11-13 20:08:01', '2021-11-13 14:37:00', '2021-11-13 14:37:00'),
(105, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:08:00', '2021-11-13 20:09:01', '2021-11-13 14:38:00', '2021-11-13 14:38:00'),
(106, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:09:00', '2021-11-13 20:10:01', '2021-11-13 14:39:00', '2021-11-13 14:39:00'),
(107, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:10:00', '2021-11-13 20:11:01', '2021-11-13 14:40:00', '2021-11-13 14:40:00'),
(108, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:11:00', '2021-11-13 20:12:01', '2021-11-13 14:41:00', '2021-11-13 14:41:00'),
(109, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:12:00', '2021-11-13 20:13:01', '2021-11-13 14:42:00', '2021-11-13 14:42:00'),
(110, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:13:00', '2021-11-13 20:14:01', '2021-11-13 14:43:00', '2021-11-13 14:43:00'),
(111, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:14:00', '2021-11-13 20:15:01', '2021-11-13 14:44:00', '2021-11-13 14:44:00'),
(112, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:15:00', '2021-11-13 20:16:01', '2021-11-13 14:45:00', '2021-11-13 14:45:00'),
(113, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:16:00', '2021-11-13 20:17:01', '2021-11-13 14:46:00', '2021-11-13 14:46:00'),
(114, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:17:00', '2021-11-13 20:18:01', '2021-11-13 14:47:00', '2021-11-13 14:47:00'),
(115, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:18:00', '2021-11-13 20:19:01', '2021-11-13 14:48:00', '2021-11-13 14:48:00'),
(116, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:19:00', '2021-11-13 20:20:01', '2021-11-13 14:49:00', '2021-11-13 14:49:00'),
(117, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:20:00', '2021-11-13 20:21:01', '2021-11-13 14:50:00', '2021-11-13 14:50:00'),
(118, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:21:00', '2021-11-13 20:22:01', '2021-11-13 14:51:00', '2021-11-13 14:51:00'),
(119, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:22:00', '2021-11-13 20:23:01', '2021-11-13 14:52:00', '2021-11-13 14:52:00'),
(120, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:23:00', '2021-11-13 20:24:01', '2021-11-13 14:53:00', '2021-11-13 14:53:00'),
(121, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:24:00', '2021-11-13 20:25:01', '2021-11-13 14:54:00', '2021-11-13 14:54:00'),
(122, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:25:00', '2021-11-13 20:26:01', '2021-11-13 14:55:00', '2021-11-13 14:55:00'),
(123, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:26:00', '2021-11-13 20:27:01', '2021-11-13 14:56:00', '2021-11-13 14:56:00'),
(124, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:27:00', '2021-11-13 20:28:01', '2021-11-13 14:57:00', '2021-11-13 14:57:00'),
(125, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:28:00', '2021-11-13 20:29:01', '2021-11-13 14:58:00', '2021-11-13 14:58:00'),
(126, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:29:00', '2021-11-13 20:30:01', '2021-11-13 14:59:00', '2021-11-13 14:59:00'),
(127, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:30:00', '2021-11-13 20:31:01', '2021-11-13 15:00:00', '2021-11-13 15:00:00'),
(128, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:31:00', '2021-11-13 20:32:01', '2021-11-13 15:01:00', '2021-11-13 15:01:00'),
(129, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:32:00', '2021-11-13 20:33:01', '2021-11-13 15:02:00', '2021-11-13 15:02:00'),
(130, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:33:00', '2021-11-13 20:34:01', '2021-11-13 15:03:00', '2021-11-13 15:03:00'),
(131, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:34:00', '2021-11-13 20:35:01', '2021-11-13 15:04:00', '2021-11-13 15:04:00'),
(132, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:35:00', '2021-11-13 20:36:01', '2021-11-13 15:05:00', '2021-11-13 15:05:00'),
(133, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:36:00', '2021-11-13 20:37:01', '2021-11-13 15:06:00', '2021-11-13 15:06:00'),
(134, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:37:00', '2021-11-13 20:38:02', '2021-11-13 15:07:00', '2021-11-13 15:07:00'),
(135, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:38:00', '2021-11-13 20:39:01', '2021-11-13 15:08:00', '2021-11-13 15:08:00'),
(136, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:39:00', '2021-11-13 20:40:01', '2021-11-13 15:09:00', '2021-11-13 15:09:00'),
(137, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:40:00', '2021-11-13 20:41:01', '2021-11-13 15:10:00', '2021-11-13 15:10:00'),
(138, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:41:00', '2021-11-13 20:42:02', '2021-11-13 15:11:00', '2021-11-13 15:11:00'),
(139, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:42:00', '2021-11-13 20:43:01', '2021-11-13 15:12:00', '2021-11-13 15:12:00'),
(140, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:43:00', '2021-11-13 20:44:01', '2021-11-13 15:13:00', '2021-11-13 15:13:00'),
(141, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:44:00', '2021-11-13 20:45:01', '2021-11-13 15:14:00', '2021-11-13 15:14:00'),
(142, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:45:00', '2021-11-13 20:46:01', '2021-11-13 15:15:00', '2021-11-13 15:15:00'),
(143, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:46:00', '2021-11-13 20:47:01', '2021-11-13 15:16:00', '2021-11-13 15:16:00'),
(144, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:47:00', '2021-11-13 20:48:01', '2021-11-13 15:17:00', '2021-11-13 15:17:00'),
(145, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:48:00', '2021-11-13 20:49:01', '2021-11-13 15:18:00', '2021-11-13 15:18:00'),
(146, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:49:00', '2021-11-13 20:50:01', '2021-11-13 15:19:00', '2021-11-13 15:19:00'),
(147, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:50:00', '2021-11-13 20:51:01', '2021-11-13 15:20:00', '2021-11-13 15:20:00'),
(148, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:51:00', '2021-11-13 20:52:01', '2021-11-13 15:21:00', '2021-11-13 15:21:00'),
(149, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:52:00', '2021-11-13 20:53:01', '2021-11-13 15:22:00', '2021-11-13 15:22:00'),
(150, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:53:00', '2021-11-13 20:54:01', '2021-11-13 15:23:00', '2021-11-13 15:23:00'),
(151, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:54:00', '2021-11-13 20:55:01', '2021-11-13 15:24:00', '2021-11-13 15:24:00'),
(152, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:55:00', '2021-11-13 20:56:01', '2021-11-13 15:25:00', '2021-11-13 15:25:00'),
(153, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:56:00', '2021-11-13 20:57:01', '2021-11-13 15:26:00', '2021-11-13 15:26:00'),
(154, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:57:00', '2021-11-13 20:58:01', '2021-11-13 15:27:00', '2021-11-13 15:27:00'),
(155, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:58:00', '2021-11-13 20:59:01', '2021-11-13 15:28:00', '2021-11-13 15:28:00'),
(156, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 20:59:00', '2021-11-13 21:00:01', '2021-11-13 15:29:00', '2021-11-13 15:29:00'),
(157, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:00:00', '2021-11-13 21:01:01', '2021-11-13 15:30:00', '2021-11-13 15:30:00'),
(158, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:01:00', '2021-11-13 21:02:01', '2021-11-13 15:31:00', '2021-11-13 15:31:00'),
(159, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:02:00', '2021-11-13 21:03:01', '2021-11-13 15:32:00', '2021-11-13 15:32:00'),
(160, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:03:00', '2021-11-13 21:04:01', '2021-11-13 15:33:00', '2021-11-13 15:33:00'),
(161, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:04:00', '2021-11-13 21:05:01', '2021-11-13 15:34:00', '2021-11-13 15:34:00'),
(162, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:05:00', '2021-11-13 21:06:01', '2021-11-13 15:35:00', '2021-11-13 15:35:00'),
(163, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:06:00', '2021-11-13 21:07:01', '2021-11-13 15:36:00', '2021-11-13 15:36:00'),
(164, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:07:00', '2021-11-13 21:08:01', '2021-11-13 15:37:00', '2021-11-13 15:37:00'),
(165, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:08:00', '2021-11-13 21:09:01', '2021-11-13 15:38:00', '2021-11-13 15:38:00'),
(166, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:09:00', '2021-11-13 21:10:01', '2021-11-13 15:39:00', '2021-11-13 15:39:00'),
(167, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:10:00', '2021-11-13 21:11:01', '2021-11-13 15:40:00', '2021-11-13 15:40:00'),
(168, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:11:00', '2021-11-13 21:12:01', '2021-11-13 15:41:00', '2021-11-13 15:41:00'),
(169, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:12:00', '2021-11-13 21:13:01', '2021-11-13 15:42:00', '2021-11-13 15:42:00'),
(170, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:13:00', '2021-11-13 21:14:01', '2021-11-13 15:43:00', '2021-11-13 15:43:00'),
(171, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:14:00', '2021-11-13 21:15:01', '2021-11-13 15:44:00', '2021-11-13 15:44:00'),
(172, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:15:00', '2021-11-13 21:16:01', '2021-11-13 15:45:00', '2021-11-13 15:45:00'),
(173, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:16:00', '2021-11-13 21:17:01', '2021-11-13 15:46:00', '2021-11-13 15:46:00'),
(174, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-13 21:17:00', '2021-11-13 21:18:01', '2021-11-13 15:47:00', '2021-11-13 15:47:00'),
(175, 1, NULL, 60, 3, NULL, NULL, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-13 21:18:00', '2021-11-15 11:52:48', '2021-11-13 15:48:00', '2021-11-13 15:48:00'),
(176, 1, NULL, 60, -1, 'result2random1', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 11:53:49', '2021-11-15 11:54:49', '2021-11-15 06:23:49', '2021-11-15 06:23:49'),
(177, 1, NULL, 60, -5, 'result2randomundefined', -1, 2, 'closed', NULL, 1100, NULL, NULL, '2021-11-15 11:54:49', '2021-11-15 11:55:46', '2021-11-15 06:24:49', '2021-11-15 06:24:49'),
(178, 1, NULL, 60, -1, 'result2random1', -3, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 11:55:49', '2021-11-15 11:57:23', '2021-11-15 06:25:49', '2021-11-15 06:25:49'),
(179, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 11:56:50', '2021-11-15 11:58:22', '2021-11-15 06:26:50', '2021-11-15 06:26:50'),
(180, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 11:57:49', '2021-11-15 11:58:43', '2021-11-15 06:27:49', '2021-11-15 06:27:49'),
(181, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 11:58:49', '2021-11-15 11:59:50', '2021-11-15 06:28:49', '2021-11-15 06:28:49'),
(182, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 11:59:49', '2021-11-15 12:00:50', '2021-11-15 06:29:49', '2021-11-15 06:29:49'),
(183, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:00:49', '2021-11-15 12:01:50', '2021-11-15 06:30:49', '2021-11-15 06:30:49'),
(184, 1, NULL, 60, -1, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:01:49', '2021-11-15 12:02:51', '2021-11-15 06:31:49', '2021-11-15 06:31:49'),
(185, 1, NULL, 60, -1, 'result1random0', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:02:49', '2021-11-15 12:03:50', '2021-11-15 06:32:49', '2021-11-15 06:32:49'),
(186, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:03:49', '2021-11-15 12:04:50', '2021-11-15 06:33:49', '2021-11-15 06:33:49'),
(187, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:04:49', '2021-11-15 12:05:50', '2021-11-15 06:34:49', '2021-11-15 06:34:49'),
(188, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:05:49', '2021-11-15 12:06:50', '2021-11-15 06:35:49', '2021-11-15 06:35:49'),
(189, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:06:49', '2021-11-15 12:07:50', '2021-11-15 06:36:49', '2021-11-15 06:36:49'),
(190, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:07:49', '2021-11-15 12:08:50', '2021-11-15 06:37:49', '2021-11-15 06:37:49'),
(191, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:08:49', '2021-11-15 12:09:50', '2021-11-15 06:38:49', '2021-11-15 06:38:49'),
(192, 1, NULL, 60, -1, 'result3random2', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:09:49', '2021-11-15 12:10:52', '2021-11-15 06:39:49', '2021-11-15 06:39:49'),
(193, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:10:49', '2021-11-15 12:11:50', '2021-11-15 06:40:49', '2021-11-15 06:40:49'),
(194, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:11:49', '2021-11-15 12:12:50', '2021-11-15 06:41:49', '2021-11-15 06:41:49'),
(195, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:12:49', '2021-11-15 12:13:50', '2021-11-15 06:42:49', '2021-11-15 06:42:49'),
(196, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:13:49', '2021-11-15 12:14:50', '2021-11-15 06:43:49', '2021-11-15 06:43:49'),
(197, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:14:49', '2021-11-15 12:15:50', '2021-11-15 06:44:49', '2021-11-15 06:44:49'),
(198, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:15:49', '2021-11-15 12:16:50', '2021-11-15 06:45:49', '2021-11-15 06:45:49'),
(199, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:16:49', '2021-11-15 12:17:50', '2021-11-15 06:46:49', '2021-11-15 06:46:49'),
(200, 1, NULL, 60, -1, 'result1random0', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:17:49', '2021-11-15 12:18:43', '2021-11-15 06:47:49', '2021-11-15 06:47:49'),
(201, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:18:49', '2021-11-15 12:19:50', '2021-11-15 06:48:49', '2021-11-15 06:48:49'),
(202, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:19:49', '2021-11-15 12:20:51', '2021-11-15 06:49:49', '2021-11-15 06:49:49'),
(203, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:20:49', '2021-11-15 12:21:44', '2021-11-15 06:50:49', '2021-11-15 06:50:49'),
(204, 1, NULL, 60, -1, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:21:49', '2021-11-15 12:22:51', '2021-11-15 06:51:49', '2021-11-15 06:51:49'),
(205, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:22:49', '2021-11-15 12:23:50', '2021-11-15 06:52:49', '2021-11-15 06:52:49'),
(206, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:23:49', '2021-11-15 12:24:53', '2021-11-15 06:53:49', '2021-11-15 06:53:49'),
(207, 1, NULL, 60, -1, 'result1random0', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:24:49', '2021-11-15 12:25:51', '2021-11-15 06:54:49', '2021-11-15 06:54:49'),
(208, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:25:49', '2021-11-15 12:26:42', '2021-11-15 06:55:49', '2021-11-15 06:55:49'),
(209, 1, NULL, 60, -1, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:26:49', '2021-11-15 12:27:51', '2021-11-15 06:56:49', '2021-11-15 06:56:49'),
(210, 1, NULL, 60, 0, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:27:49', '2021-11-15 12:28:52', '2021-11-15 06:57:49', '2021-11-15 06:57:49'),
(211, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 12:28:49', '2021-11-15 12:29:45', '2021-11-15 06:58:49', '2021-11-15 06:58:49'),
(212, 1, NULL, 60, 15, NULL, NULL, NULL, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-15 12:29:49', '2021-11-15 12:53:48', '2021-11-15 06:59:49', '2021-11-15 06:59:49'),
(213, 1, NULL, 60, -364, NULL, 20, 2, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-15 12:54:49', '2021-11-15 13:04:00', '2021-11-15 07:24:49', '2021-11-15 07:24:49'),
(214, 1, NULL, 60, -338, NULL, 20, 1, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-15 12:55:49', '2021-11-15 13:04:00', '2021-11-15 07:25:49', '2021-11-15 07:25:49'),
(215, 1, NULL, 60, -279, NULL, 20, 1, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-15 12:56:51', '2021-11-15 13:02:59', '2021-11-15 07:26:51', '2021-11-15 07:26:51'),
(216, 1, NULL, 60, -1, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 13:04:01', '2021-11-15 13:04:57', '2021-11-15 07:34:01', '2021-11-15 07:34:01'),
(217, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 13:12:59', '2021-11-15 13:14:01', '2021-11-15 07:42:59', '2021-11-15 07:42:59'),
(218, 1, NULL, 60, -1, 'result3random2', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 13:13:59', '2021-11-15 13:15:02', '2021-11-15 07:43:59', '2021-11-15 07:43:59'),
(219, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 13:14:59', '2021-11-15 13:16:02', '2021-11-15 07:44:59', '2021-11-15 07:44:59'),
(220, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 13:15:59', '2021-11-15 13:17:01', '2021-11-15 07:45:59', '2021-11-15 07:45:59'),
(221, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 13:16:59', '2021-11-15 13:17:53', '2021-11-15 07:46:59', '2021-11-15 07:46:59'),
(222, 1, NULL, 60, 0, NULL, 11, 2, 'stopped', 'pending', NULL, NULL, NULL, '2021-11-15 13:17:59', '2021-11-15 14:02:30', '2021-11-15 07:47:59', '2021-11-15 07:47:59'),
(223, 1, NULL, 60, -2, 'result1randomundefined', -1, 1, 'closed', NULL, 10, NULL, NULL, '2021-11-15 14:03:30', '2021-11-15 14:04:23', '2021-11-15 08:33:30', '2021-11-15 08:33:30'),
(224, 1, NULL, 60, -1, 'result1randomundefined', 0, 1, 'closed', NULL, 20, NULL, NULL, '2021-11-15 14:04:30', '2021-11-15 14:05:32', '2021-11-15 08:34:30', '2021-11-15 08:34:30'),
(225, 1, NULL, 60, -1, 'result3random2', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:05:30', '2021-11-15 14:06:24', '2021-11-15 08:35:30', '2021-11-15 08:35:30'),
(226, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:06:30', '2021-11-15 14:07:31', '2021-11-15 08:36:30', '2021-11-15 08:36:30'),
(227, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:07:30', '2021-11-15 14:08:23', '2021-11-15 08:37:30', '2021-11-15 08:37:30'),
(228, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:08:30', '2021-11-15 14:09:31', '2021-11-15 08:38:30', '2021-11-15 08:38:30'),
(229, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:09:30', '2021-11-15 14:10:23', '2021-11-15 08:39:30', '2021-11-15 08:39:30'),
(230, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:10:30', '2021-11-15 14:11:31', '2021-11-15 08:40:30', '2021-11-15 08:40:30'),
(231, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:11:30', '2021-11-15 14:12:31', '2021-11-15 08:41:30', '2021-11-15 08:41:30'),
(232, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:12:30', '2021-11-15 14:13:31', '2021-11-15 08:42:30', '2021-11-15 08:42:30'),
(233, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:13:30', '2021-11-15 14:14:31', '2021-11-15 08:43:30', '2021-11-15 08:43:30'),
(234, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:14:30', '2021-11-15 14:15:31', '2021-11-15 08:44:30', '2021-11-15 08:44:30'),
(235, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:15:30', '2021-11-15 14:16:31', '2021-11-15 08:45:30', '2021-11-15 08:45:30'),
(236, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:16:30', '2021-11-15 14:17:31', '2021-11-15 08:46:30', '2021-11-15 08:46:30'),
(237, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:17:30', '2021-11-15 14:18:31', '2021-11-15 08:47:30', '2021-11-15 08:47:30'),
(238, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:18:30', '2021-11-15 14:19:31', '2021-11-15 08:48:30', '2021-11-15 08:48:30'),
(239, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:19:30', '2021-11-15 14:20:31', '2021-11-15 08:49:30', '2021-11-15 08:49:30'),
(240, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:20:30', '2021-11-15 14:21:31', '2021-11-15 08:50:30', '2021-11-15 08:50:30'),
(241, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:21:30', '2021-11-15 14:22:31', '2021-11-15 08:51:30', '2021-11-15 08:51:30'),
(242, 1, NULL, 60, -1, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:22:30', '2021-11-15 14:23:32', '2021-11-15 08:52:30', '2021-11-15 08:52:30'),
(243, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:23:30', '2021-11-15 14:24:32', '2021-11-15 08:53:30', '2021-11-15 08:53:30'),
(244, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:24:30', '2021-11-15 14:25:31', '2021-11-15 08:54:30', '2021-11-15 08:54:30'),
(245, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:25:30', '2021-11-15 14:26:31', '2021-11-15 08:55:30', '2021-11-15 08:55:30'),
(246, 1, NULL, 60, -1, 'result1random0', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:26:30', '2021-11-15 14:27:34', '2021-11-15 08:56:30', '2021-11-15 08:56:30'),
(247, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:27:30', '2021-11-15 14:28:24', '2021-11-15 08:57:30', '2021-11-15 08:57:30'),
(248, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:28:30', '2021-11-15 14:29:32', '2021-11-15 08:58:30', '2021-11-15 08:58:30'),
(249, 1, NULL, 60, -1, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:29:30', '2021-11-15 14:30:27', '2021-11-15 08:59:30', '2021-11-15 08:59:30'),
(250, 1, NULL, 60, -1, 'result2random1', -2, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:30:30', '2021-11-15 14:31:44', '2021-11-15 09:00:30', '2021-11-15 09:00:30'),
(251, 1, NULL, 60, -4, 'result1random0', -3, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:31:30', '2021-11-15 14:33:28', '2021-11-15 09:01:30', '2021-11-15 09:01:30'),
(252, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:32:33', '2021-11-15 14:34:08', '2021-11-15 09:02:33', '2021-11-15 09:02:33'),
(253, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:33:30', '2021-11-15 14:34:32', '2021-11-15 09:03:31', '2021-11-15 09:03:31'),
(254, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:34:30', '2021-11-15 14:35:32', '2021-11-15 09:04:30', '2021-11-15 09:04:30'),
(255, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:35:30', '2021-11-15 14:36:31', '2021-11-15 09:05:30', '2021-11-15 09:05:30'),
(256, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:36:30', '2021-11-15 14:37:31', '2021-11-15 09:06:30', '2021-11-15 09:06:30'),
(257, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:37:30', '2021-11-15 14:38:31', '2021-11-15 09:07:30', '2021-11-15 09:07:30'),
(258, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:38:30', '2021-11-15 14:39:32', '2021-11-15 09:08:30', '2021-11-15 09:08:30'),
(259, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:39:30', '2021-11-15 14:40:31', '2021-11-15 09:09:30', '2021-11-15 09:09:30'),
(260, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:40:30', '2021-11-15 14:41:31', '2021-11-15 09:10:30', '2021-11-15 09:10:30'),
(261, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:41:30', '2021-11-15 14:42:31', '2021-11-15 09:11:30', '2021-11-15 09:11:30'),
(262, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:42:30', '2021-11-15 14:43:31', '2021-11-15 09:12:30', '2021-11-15 09:12:30'),
(263, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:43:30', '2021-11-15 14:44:31', '2021-11-15 09:13:30', '2021-11-15 09:13:30'),
(264, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:44:30', '2021-11-15 14:45:32', '2021-11-15 09:14:30', '2021-11-15 09:14:30'),
(265, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:45:30', '2021-11-15 14:46:31', '2021-11-15 09:15:30', '2021-11-15 09:15:30'),
(266, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:46:30', '2021-11-15 14:47:31', '2021-11-15 09:16:30', '2021-11-15 09:16:30'),
(267, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:47:30', '2021-11-15 14:48:31', '2021-11-15 09:17:30', '2021-11-15 09:17:30'),
(268, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:48:30', '2021-11-15 14:49:31', '2021-11-15 09:18:30', '2021-11-15 09:18:30'),
(269, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:49:30', '2021-11-15 14:50:32', '2021-11-15 09:19:30', '2021-11-15 09:19:30'),
(270, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:50:30', '2021-11-15 14:51:31', '2021-11-15 09:20:30', '2021-11-15 09:20:30'),
(271, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:51:30', '2021-11-15 14:52:31', '2021-11-15 09:21:30', '2021-11-15 09:21:30'),
(272, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:52:30', '2021-11-15 14:53:31', '2021-11-15 09:22:30', '2021-11-15 09:22:30'),
(273, 1, NULL, 60, -1, 'result3random2', -2, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:53:30', '2021-11-15 14:54:29', '2021-11-15 09:23:30', '2021-11-15 09:23:30'),
(274, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:54:30', '2021-11-15 14:55:32', '2021-11-15 09:24:30', '2021-11-15 09:24:30'),
(275, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:55:30', '2021-11-15 14:56:31', '2021-11-15 09:25:30', '2021-11-15 09:25:30'),
(276, 1, NULL, 60, 0, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:56:30', '2021-11-15 14:57:33', '2021-11-15 09:26:30', '2021-11-15 09:26:30'),
(277, 1, NULL, 60, -1, 'result2random1', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:57:30', '2021-11-15 14:58:32', '2021-11-15 09:27:30', '2021-11-15 09:27:30'),
(278, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:58:30', '2021-11-15 14:59:34', '2021-11-15 09:28:30', '2021-11-15 09:28:30'),
(279, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 14:59:30', '2021-11-15 15:00:31', '2021-11-15 09:29:30', '2021-11-15 09:29:30'),
(280, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:00:30', '2021-11-15 15:01:31', '2021-11-15 09:30:30', '2021-11-15 09:30:30'),
(281, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:01:30', '2021-11-15 15:02:31', '2021-11-15 09:31:30', '2021-11-15 09:31:30'),
(282, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:02:30', '2021-11-15 15:03:32', '2021-11-15 09:32:30', '2021-11-15 09:32:30'),
(283, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:03:30', '2021-11-15 15:04:32', '2021-11-15 09:33:30', '2021-11-15 09:33:30'),
(284, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:04:30', '2021-11-15 15:05:31', '2021-11-15 09:34:30', '2021-11-15 09:34:30'),
(285, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:05:30', '2021-11-15 15:06:31', '2021-11-15 09:35:30', '2021-11-15 09:35:30'),
(286, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:06:30', '2021-11-15 15:07:31', '2021-11-15 09:36:30', '2021-11-15 09:36:30'),
(287, 1, NULL, 60, -1, 'result2random1', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:07:30', '2021-11-15 15:08:33', '2021-11-15 09:37:30', '2021-11-15 09:37:30'),
(288, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:08:30', '2021-11-15 15:09:32', '2021-11-15 09:38:30', '2021-11-15 09:38:30'),
(289, 1, NULL, 60, -1, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:09:30', '2021-11-15 15:10:32', '2021-11-15 09:39:30', '2021-11-15 09:39:30'),
(290, 1, NULL, 60, 0, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:10:30', '2021-11-15 15:11:33', '2021-11-15 09:40:30', '2021-11-15 09:40:30'),
(291, 1, NULL, 60, 0, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:11:30', '2021-11-15 15:12:33', '2021-11-15 09:41:30', '2021-11-15 09:41:30'),
(292, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:12:30', '2021-11-15 15:13:31', '2021-11-15 09:42:30', '2021-11-15 09:42:30'),
(293, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:13:30', '2021-11-15 15:14:31', '2021-11-15 09:43:30', '2021-11-15 09:43:30'),
(294, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:14:30', '2021-11-15 15:15:26', '2021-11-15 09:44:30', '2021-11-15 09:44:30'),
(295, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:15:30', '2021-11-15 15:16:31', '2021-11-15 09:45:30', '2021-11-15 09:45:30');
INSERT INTO `gamePlays` (`id`, `game_id`, `players`, `time`, `time_left`, `comment`, `result_time`, `result`, `status`, `refund_status`, `admin_profit`, `startTime`, `endTime`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(296, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:16:30', '2021-11-15 15:17:32', '2021-11-15 09:46:30', '2021-11-15 09:46:30'),
(297, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:17:30', '2021-11-15 15:18:33', '2021-11-15 09:47:30', '2021-11-15 09:47:30'),
(298, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:18:30', '2021-11-15 15:19:31', '2021-11-15 09:48:30', '2021-11-15 09:48:30'),
(299, 1, NULL, 60, 0, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:19:30', '2021-11-15 15:20:33', '2021-11-15 09:49:30', '2021-11-15 09:49:30'),
(300, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:20:30', '2021-11-15 15:21:23', '2021-11-15 09:50:30', '2021-11-15 09:50:30'),
(301, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:21:30', '2021-11-15 15:22:26', '2021-11-15 09:51:30', '2021-11-15 09:51:30'),
(302, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:22:30', '2021-11-15 15:23:34', '2021-11-15 09:52:30', '2021-11-15 09:52:30'),
(303, 1, NULL, 60, -1, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:23:30', '2021-11-15 15:24:31', '2021-11-15 09:53:30', '2021-11-15 09:53:30'),
(304, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:24:30', '2021-11-15 15:25:31', '2021-11-15 09:54:30', '2021-11-15 09:54:30'),
(305, 1, NULL, 60, -1, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:25:30', '2021-11-15 15:26:23', '2021-11-15 09:55:30', '2021-11-15 09:55:30'),
(306, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:26:30', '2021-11-15 15:27:31', '2021-11-15 09:56:30', '2021-11-15 09:56:30'),
(307, 1, NULL, 60, 0, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:27:30', '2021-11-15 15:28:32', '2021-11-15 09:57:30', '2021-11-15 09:57:30'),
(308, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:28:30', '2021-11-15 15:29:32', '2021-11-15 09:58:30', '2021-11-15 09:58:30'),
(309, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:29:30', '2021-11-15 15:30:31', '2021-11-15 09:59:30', '2021-11-15 09:59:30'),
(310, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:30:30', '2021-11-15 15:31:31', '2021-11-15 10:00:30', '2021-11-15 10:00:30'),
(311, 1, NULL, 60, -1, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:31:30', '2021-11-15 15:32:32', '2021-11-15 10:01:30', '2021-11-15 10:01:30'),
(312, 1, NULL, 60, 0, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:32:30', '2021-11-15 15:33:34', '2021-11-15 10:02:30', '2021-11-15 10:02:30'),
(313, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:33:30', '2021-11-15 15:34:33', '2021-11-15 10:03:30', '2021-11-15 10:03:30'),
(314, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:34:30', '2021-11-15 15:35:31', '2021-11-15 10:04:30', '2021-11-15 10:04:30'),
(315, 1, NULL, 60, -1, 'result2random1', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:35:30', '2021-11-15 15:36:32', '2021-11-15 10:05:30', '2021-11-15 10:05:30'),
(316, 1, NULL, 60, -1, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:36:30', '2021-11-15 15:37:30', '2021-11-15 10:06:30', '2021-11-15 10:06:30'),
(317, 1, NULL, 60, -1, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:37:30', '2021-11-15 15:38:35', '2021-11-15 10:07:30', '2021-11-15 10:07:30'),
(318, 1, NULL, 60, 0, 'result3random2', -1, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:38:30', '2021-11-15 15:39:34', '2021-11-15 10:08:30', '2021-11-15 10:08:30'),
(319, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:39:30', '2021-11-15 15:40:32', '2021-11-15 10:09:30', '2021-11-15 10:09:30'),
(320, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:40:30', '2021-11-15 15:41:31', '2021-11-15 10:10:30', '2021-11-15 10:10:30'),
(321, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:41:30', '2021-11-15 15:42:31', '2021-11-15 10:11:30', '2021-11-15 10:11:30'),
(322, 1, NULL, 60, 0, 'result1random0', 0, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:42:30', '2021-11-15 15:43:31', '2021-11-15 10:12:30', '2021-11-15 10:12:30'),
(323, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:43:30', '2021-11-15 15:44:31', '2021-11-15 10:13:30', '2021-11-15 10:13:30'),
(324, 1, NULL, 60, 0, 'result2random1', 0, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:44:30', '2021-11-15 15:45:31', '2021-11-15 10:14:30', '2021-11-15 10:14:30'),
(325, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:45:30', '2021-11-15 15:46:24', '2021-11-15 10:15:30', '2021-11-15 10:15:30'),
(326, 1, NULL, 60, -1, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:46:30', '2021-11-15 15:47:25', '2021-11-15 10:16:30', '2021-11-15 10:16:30'),
(327, 1, NULL, 60, 0, 'result2random1', -1, 2, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:47:30', '2021-11-15 15:48:32', '2021-11-15 10:17:30', '2021-11-15 10:17:30'),
(328, 1, NULL, 60, 0, 'result3random2', 0, 3, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:48:30', '2021-11-15 15:49:31', '2021-11-15 10:18:30', '2021-11-15 10:18:30'),
(329, 1, NULL, 60, -2, 'result1random0', -1, 1, 'closed', NULL, 0, NULL, NULL, '2021-11-15 15:49:30', '2021-11-15 15:50:29', '2021-11-15 10:19:30', '2021-11-15 10:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `gamePositions`
--

CREATE TABLE `gamePositions` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `game_id` bigint DEFAULT NULL,
  `game_play_id` bigint DEFAULT NULL,
  `option` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ntimes` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','cleared') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `date` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamePositions`
--

INSERT INTO `gamePositions` (`id`, `user_id`, `game_id`, `game_play_id`, `option`, `ntimes`, `amount`, `comment`, `status`, `date`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 1, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:17:32', '2021-11-13 18:17:32'),
(2, 1, 1, 1, '1', 3, 10, NULL, 'pending', NULL, '2021-11-13 18:17:33', '2021-11-13 18:17:33'),
(3, 1, 1, 1, '3', 10, 1, NULL, 'pending', NULL, '2021-11-13 18:17:37', '2021-11-13 18:17:37'),
(4, 1, 1, 3, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:21:40', '2021-11-13 18:21:40'),
(5, 1, 1, 3, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:21:42', '2021-11-13 18:21:42'),
(6, 1, 1, 3, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:21:42', '2021-11-13 18:21:42'),
(7, 1, 1, 5, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:25:12', '2021-11-13 18:25:12'),
(8, 1, 1, 5, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:25:16', '2021-11-13 18:25:16'),
(9, 1, 1, 5, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:25:16', '2021-11-13 18:25:16'),
(10, 1, 1, 7, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:28:38', '2021-11-13 18:28:38'),
(11, 1, 1, 7, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:28:40', '2021-11-13 18:28:40'),
(12, 1, 1, 7, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:28:40', '2021-11-13 18:28:40'),
(13, 1, 1, 9, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:31:57', '2021-11-13 18:31:57'),
(14, 1, 1, 9, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:31:59', '2021-11-13 18:32:28'),
(15, 1, 1, 9, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:31:59', '2021-11-13 18:31:59'),
(16, 1, 1, 10, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:33:25', '2021-11-13 18:33:25'),
(17, 1, 1, 10, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:33:25', '2021-11-13 18:33:25'),
(18, 1, 1, 12, '3', 10, 10, NULL, 'cleared', NULL, '2021-11-13 18:35:14', '2021-11-13 18:35:43'),
(19, 1, 1, 12, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:35:15', '2021-11-13 18:35:15'),
(20, 1, 1, 12, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:35:17', '2021-11-13 18:35:17'),
(21, 1, 1, 13, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:36:07', '2021-11-13 18:36:07'),
(22, 1, 1, 13, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:36:11', '2021-11-13 18:36:11'),
(23, 1, 1, 13, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:36:12', '2021-11-13 18:36:12'),
(24, 1, 1, 13, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:36:13', '2021-11-13 18:36:13'),
(25, 1, 1, 13, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:36:13', '2021-11-13 18:36:13'),
(26, 1, 1, 13, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:36:14', '2021-11-13 18:36:14'),
(27, 1, 1, 13, '1', 3, 100, NULL, 'cleared', NULL, '2021-11-13 18:36:19', '2021-11-13 18:36:43'),
(28, 1, 1, 13, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:36:23', '2021-11-13 18:36:23'),
(29, 1, 1, 13, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:36:28', '2021-11-13 18:36:28'),
(30, 1, 1, 13, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:36:29', '2021-11-13 18:36:29'),
(31, 1, 1, 13, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:36:30', '2021-11-13 18:36:30'),
(32, 1, 1, 14, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:37:08', '2021-11-13 18:37:08'),
(33, 1, 1, 14, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:37:09', '2021-11-13 18:37:09'),
(34, 1, 1, 14, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:37:09', '2021-11-13 18:37:09'),
(35, 1, 1, 14, '1', 3, 100, NULL, 'cleared', NULL, '2021-11-13 18:37:11', '2021-11-13 18:37:43'),
(36, 1, 1, 14, '2', 2, 100, NULL, 'pending', NULL, '2021-11-13 18:37:12', '2021-11-13 18:37:12'),
(37, 1, 1, 14, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:37:13', '2021-11-13 18:37:13'),
(38, 1, 1, 14, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:37:14', '2021-11-13 18:37:14'),
(39, 1, 1, 14, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:37:14', '2021-11-13 18:37:14'),
(40, 1, 1, 14, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:37:15', '2021-11-13 18:37:15'),
(41, 1, 1, 14, '2', 2, 10, NULL, 'pending', NULL, '2021-11-13 18:37:15', '2021-11-13 18:37:15'),
(42, 1, 1, 15, '2', 2, 10, NULL, 'cleared', NULL, '2021-11-13 18:38:06', '2021-11-13 18:38:45'),
(43, 1, 1, 15, '2', 2, 10, NULL, 'cleared', NULL, '2021-11-13 18:38:06', '2021-11-13 18:38:47'),
(44, 1, 1, 15, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:38:07', '2021-11-13 18:38:07'),
(45, 1, 1, 15, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:38:07', '2021-11-13 18:38:07'),
(46, 1, 1, 15, '1', 3, 10, NULL, 'pending', NULL, '2021-11-13 18:38:08', '2021-11-13 18:38:08'),
(47, 1, 1, 15, '1', 3, 10, NULL, 'pending', NULL, '2021-11-13 18:38:08', '2021-11-13 18:38:08'),
(48, 1, 1, 15, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:38:11', '2021-11-13 18:38:48'),
(49, 1, 1, 15, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:38:11', '2021-11-13 18:38:49'),
(50, 1, 1, 15, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:38:11', '2021-11-13 18:38:52'),
(51, 1, 1, 15, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:38:12', '2021-11-13 18:38:12'),
(52, 1, 1, 15, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:38:12', '2021-11-13 18:38:55'),
(53, 1, 1, 15, '3', 10, 100, NULL, 'pending', NULL, '2021-11-13 18:38:14', '2021-11-13 18:38:14'),
(54, 1, 1, 15, '3', 10, 100, NULL, 'pending', NULL, '2021-11-13 18:38:14', '2021-11-13 18:38:14'),
(55, 1, 1, 15, '1', 3, 500, NULL, 'pending', NULL, '2021-11-13 18:38:15', '2021-11-13 18:38:15'),
(56, 1, 1, 15, '2', 2, 500, NULL, 'cleared', NULL, '2021-11-13 18:38:16', '2021-11-13 18:39:00'),
(57, 1, 1, 15, '3', 10, 1, NULL, 'pending', NULL, '2021-11-13 18:38:18', '2021-11-13 18:38:18'),
(58, 1, 1, 16, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:39:12', '2021-11-13 18:39:12'),
(59, 1, 1, 16, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:39:17', '2021-11-13 18:39:44'),
(60, 1, 1, 16, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:39:20', '2021-11-13 18:39:20'),
(61, 1, 1, 16, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:39:28', '2021-11-13 18:39:28'),
(62, 1, 1, 17, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:40:07', '2021-11-13 18:40:07'),
(63, 1, 1, 17, '3', 10, 10, NULL, 'pending', NULL, '2021-11-13 18:40:07', '2021-11-13 18:40:07'),
(64, 1, 1, 17, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-13 18:40:09', '2021-11-13 18:40:44'),
(65, 1, 1, 17, '1', 3, 100, NULL, 'pending', NULL, '2021-11-13 18:40:10', '2021-11-13 18:40:10'),
(66, 1, 1, 177, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-15 11:54:54', '2021-11-15 11:55:31'),
(67, 1, 1, 177, '2', 2, 100, NULL, 'cleared', NULL, '2021-11-15 11:54:55', '2021-11-15 11:55:33'),
(68, 1, 1, 177, '1', 3, 100, NULL, 'pending', NULL, '2021-11-15 11:54:56', '2021-11-15 11:54:56'),
(69, 1, 1, 177, '3', 10, 100, NULL, 'pending', NULL, '2021-11-15 11:54:56', '2021-11-15 11:54:56'),
(70, 1, 1, 177, '1', 3, 100, NULL, 'pending', NULL, '2021-11-15 11:54:56', '2021-11-15 11:54:56'),
(71, 1, 1, 177, '2', 2, 1000, NULL, 'cleared', NULL, '2021-11-15 11:54:59', '2021-11-15 11:55:35'),
(72, 1, 1, 177, '1', 3, 1000, NULL, 'pending', NULL, '2021-11-15 11:54:59', '2021-11-15 11:54:59'),
(73, 1, 1, 177, '3', 10, 1000, NULL, 'pending', NULL, '2021-11-15 11:55:01', '2021-11-15 11:55:01'),
(74, 1, 1, 214, '2', 2, 10, NULL, 'pending', NULL, '2021-11-15 12:56:28', '2021-11-15 12:56:28'),
(75, 1, 1, 214, '3', 10, 10, NULL, 'pending', NULL, '2021-11-15 12:56:29', '2021-11-15 12:56:29'),
(76, 1, 1, 214, '1', 2, 10, NULL, 'cleared', NULL, '2021-11-15 12:56:30', '2021-11-15 12:56:34'),
(77, 1, 1, 215, '2', 2, 10, NULL, 'pending', NULL, '2021-11-15 12:57:12', '2021-11-15 12:57:12'),
(78, 1, 1, 215, '3', 10, 10, NULL, 'pending', NULL, '2021-11-15 12:57:20', '2021-11-15 12:57:20'),
(79, 1, 1, 215, '1', 2, 10, NULL, 'cleared', NULL, '2021-11-15 12:57:22', '2021-11-15 12:57:37'),
(80, 1, 1, 223, '2', 2, 10, NULL, 'pending', NULL, '2021-11-15 14:03:45', '2021-11-15 14:03:45'),
(81, 1, 1, 223, '1', 2, 10, NULL, 'cleared', NULL, '2021-11-15 14:03:46', '2021-11-15 14:04:12'),
(82, 1, 1, 223, '3', 10, 10, NULL, 'pending', NULL, '2021-11-15 14:03:50', '2021-11-15 14:03:50'),
(83, 1, 1, 224, '2', 2, 10, NULL, 'pending', NULL, '2021-11-15 14:04:48', '2021-11-15 14:04:48'),
(84, 1, 1, 224, '3', 10, 10, NULL, 'pending', NULL, '2021-11-15 14:04:54', '2021-11-15 14:04:54'),
(85, 1, 1, 224, '1', 2, 10, NULL, 'cleared', NULL, '2021-11-15 14:04:57', '2021-11-15 14:05:12'),
(86, 1, 1, 224, '3', 10, 10, NULL, 'pending', NULL, '2021-11-15 14:05:07', '2021-11-15 14:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `status` enum('show','hide') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_09_30_064437_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` enum('read','unread') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `comment`, `status`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(1, 1, 'hellooo rajuuu', NULL, 'read', NULL, '2021-11-16 10:49:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_title`, `meta_image`, `meta_description`, `keywords`, `created_at`, `updated_at`) VALUES
(1, 'Privacy', 'privacy', '<p>Dear Customer,</p>\r\n<p>We are pleased that you are interested in data protection. We would like to give you an easily understandable overview of our data protection process.</p>\r\n<p>Our goal is to provide you with an amazing customer experience that also means that you can always trust us, that we are always transparent and honest to you. Your trust in our product is the reason why we can provide you with an amazing customer experience. We would like to thank you for this cooperation.</p>\r\n<h1><strong>Who we are</strong></h1>\r\n<p>We are Orderchey and we love data protection.&nbsp;</p>\r\n<p>While visiting our website, registering or placing orders, you agree to this privacy policy.</p>\r\n<p>As data controller, we determine how we process your personal data, for what purposes and by what means. While we are required by law to provide you with all of the following information, we do so primarily out of the belief that a partnership should always be honest.</p>\r\n<p>As data controller we are responsible that all our processing activities are in accordance with legal requirements but also you may reasonably expect these processing of your personal data (link to \"legitimate interests\").</p>\r\n<p>If you have any questions about data protection at Orderchey, you can also contact our data protection officer at any time by sending an email to support@orderchey.com.</p>\r\n\r\n<p>We will continue to be your point of contact if you have any questions about data protection.</p>\r\n<h1><strong>Privacy is your right and you have the choice</strong></h1>\r\n<p>As a customer you have the choice which information you would like to share with us. Of course we need some information for the fulfillment of our contract. However, this does not always require all the data which you can make available to us.</p>\r\n<p>You can take the following steps to disclose less information about yourself:</p>\r\n<p><strong>Cookies: </strong>You can install additional add-ons in your browser that block unnecessary cookies. By doing so, you will not see any interest-based advertisements.</p>\r\n<p><strong>Advertising:</strong> If you do not want to receive newsletters from us, you can unsubscribe at any time. In this case, we will not be able to send you any cool offers.</p>\r\n<p><strong>No data sharing: </strong>If you don\'t want to share any information with us at all, that\'s a shame. In this case we can\'t convince you how great our products are.</p>\r\n<h1><strong>You can also make use of the following rights at any time:</strong></h1>\r\n<p><strong>Right to access</strong></p>\r\n<p>You have the right to be informed which data we store about you and how we process this data.</p>\r\n<p><strong>Right to rectification</strong></p>\r\n<p>If you notice that stored data is incorrect, you can always ask us to correct it.</p>\r\n<p><strong>Right to erasure</strong></p>\r\n<p>You can ask us at any time to delete the data we have stored about you.</p>\r\n<p><strong>Right to object to the processing of your data</strong></p>\r\n<p>You can revoke your consent at any time or object to the further processing of your data. This also includes objecting to our processing, which we process without your consent but based on our legitimate interest. This applies, for example, to direct marketing. You can object to receiving further newsletters at any time.</p>\r\n<p>If you do not agree with one of our processing purposes based on our legitimate interest or wish to object to it, you may object to the processing at any time on grounds relating to his or her particular situation. Please write an email to support@orderchey.com. In this case we will review the processing activity again and either stop processing your data for this purpose or explain to you our reasons worth protecting and why we will continue with the processing.</p>\r\n<p><strong>Right of complaint</strong></p>\r\n<p>If you believe that we have done something wrong with your personal data or your rights, you can complain to the appropriate supervisory authority at any time.</p>\r\n<p>To exercise your rights, you can contact support@orderchey.com at any time.</p>\r\n<h1><strong>What data we process</strong></h1>\r\n<p>In the following description of our processing activities, we refer in each case to categories of personal data. A category includes several personal data, which are usually processed together for the purposes.</p>\r\n<p>Personal data is information that can identify you or even make you identifiable.</p>\r\n<p>We generally process the following categories of personal data for the following reasons:</p>\r\n<p><strong>Contact Information:</strong></p>\r\n<p>Name, address, telephone number, email address, your ID from any social media (if applicable).</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>If you contact us, we collect this data because we need to know who we are talking to and what we have been talking about so that we can help you with your reason for contacting us. This also applies if you leave comments on social media on our fan pages. We do not combine this data with your profile data on our platform, but we can still identify you by your social media ID.</p>\r\n<p><strong>Location data:</strong></p>\r\n<p>Address, Postcode, City, Country, Longitude, Latitude</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>We need these data to be able to deliver your orders. We create the longitude and latitude automatically in order to be able to process your delivery address in our other linked systems, such as our Rider app, and to display your address to our riders or riders of restaurants.</p>\r\n<p><strong>Profile data (master data):</strong></p>\r\n<p>Name, email address, password, telephone number, delivery addresses, interests, demographic data (age, delivery address)</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>This data is your master data, which we absolutely need for our services. Without an email address / telephone number and a password, you cannot create a profile. Together with your name, this is your master data. We need your age to ensure that you are not a minor.</p>\r\n<p><strong>Device information and access data:</strong></p>\r\n<p>Device ID, device identification, operating system and corresponding version, time of access, configuration settings, information on Internet connection (IP address)</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>With each access this information is stored by us for technical reasons. We also use parts of this information to detect suspicious behaviour at an early stage and to avert damage.</p>\r\n<p><strong>Order information:</strong></p>\r\n<p>Order history, selected restaurants, invoices, order ID, comments on orders, information on payment method, delivery address, successful orders and cancelled orders</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>Each time you place an order, this information will be added to your profile. You can view all this information in your profile at any time. The information should give you an overview of your own interests and previous orders. We will also use the same information to improve our services. In addition, we will anonymize this information when you request a deletion or when your profile becomes inactive in order to continue to use this information in an anonymized form to optimize our services.</p>\r\n<p><strong>Communication data</strong></p>\r\n<p>Name, email address, telephone number, device ID</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>If you would like to receive a newsletter, an SMS or an in-app push notification from us, we need certain information to send you the messages. Instead of addressing you with \"Hey You\", we find it more customer friendly to address you with your name. This category of personal information is also used by us to contact you, for example, if a product cannot be delivered and we want to offer you an alternative instead.</p>\r\n<p><strong>Payment information:</strong></p>\r\n<p>Payment method, pseudonymized credit card information</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>We need this information to track your payments and assign them to the orders you have placed.</p>\r\n<p><strong>Delivery information:</strong></p>\r\n<p>Name, delivery address, phone number, order ID</p>\r\n<p><strong>Reason:</strong></p>\r\n<p>In accordance with the principle of data minimization, we only provide our riders and restaurants with the information that they need from you to prepare and deliver your order.</p>\r\n<h1><strong>For which purposes we process data</strong></h1>\r\n<p>We process your personal data only in accordance with the strict legal requirements. We pay particular attention to the fact that all principles for the processing of personal data are taken into account. The Orderchey Company pays great attention to transparency. Therefore, we only process your data if this is lawful and you can reasonably expect it to be processed. If, in the course of our evaluation, we come to the conclusion that the processing cannot reasonably be expected, we will only carry out the processing with your express consent.</p>\r\n<h2><strong>Account creation, SSO registration, administration of your profile</strong></h2>\r\n<p>In order to be able to offer you our services, the processing of your personal data is essential. Much of this data you transmit to us and other parts of the data we collect automatically when using our platforms. Nevertheless, we endeavour to keep the amount of data as small as possible. You can help us by only sharing necessary data with us that we need to fulfill our contractual obligations.</p>\r\n<h3><strong>Account creation</strong></h3>\r\n<p>When creating a customer account you will be asked to enter your master data. This is absolutely necessary, as we cannot create a customer profile without this data. Your email address and telephone number are particularly important, as we can use this information to identify you in our system the next time you want to log in again. Furthermore, we would like to ask you to choose your password carefully. Do not use the same password on multiple websites. Your password should also be at least 8 characters long, at least one lowercase letter, one uppercase letter, one special character (!?#,%&amp; etc.) and one digit. Please don’t share neither your password nor your email address with anyone else.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Profile data (master data)</p>\r\n<p>Device information and access data</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Performance of contract</p>\r\n<h3><strong>Login</strong></h3>\r\n<p>If you already have an existing customer account, you will need to enter your email address and password to log in. If we detect irregularities during registration, such as entering the wrong password several times, we will take appropriate measures to prevent damage to you and us.&nbsp;</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Profile data (master data)</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Fulfilment of contract for registration;</p>\r\n<p>Legitimate Interest for the security measures</p>\r\n\r\n<p>Fulfilment of contract</p>\r\n<h3><strong>Buffering</strong></h3>\r\n<p>After you have logged in to your profile and made your selection, the products will be saved in your profile. If you accidentally close your browser or app, you can continue to the last point of your order. The last information is stored in a cookie.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Profile data (master data)</p>\r\n<p>Device information and access data</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Legitimate interest</p>\r\n<p>The legitimate interest is to provide you with a better ordering experience where you can conveniently continue your order with browsers or apps that are accidentally closed.</p>\r\n<h2><strong>Delivery</strong></h2>\r\n<p>Once you have successfully placed your order, a number of processes are running in the background to ensure that your order is delivered quickly.</p>\r\n<p>The following processing activities describe how and why your data is processed for the respective purposes.</p>\r\n<h3><strong>Transfer to Riders and Restaurants</strong></h3>\r\n<p>We use different riders for delivery. These can be permanent employees, freelancers or third parties who provide us with riders on the basis of a data processing agreement when we deliver our orders. In all these cases we send your personal data to the riders so that they can deliver your order quickly.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Delivery information to Market Place Restaurants (own delivery of restaurant)</p>\r\n<p>Name, address, phone number to own riders</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Performance of contract</p>\r\n<h3><strong>Calls from riders or restaurants</strong></h3>\r\n<p>If a product of your choice is not available for delivery or our riders cannot reach you at the delivery address you provided, they have received instructions from us to call you so that the problem can be solved easily.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Delivery information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Contract performance on call by the rider</p>\r\n<p>Legitimate interest when called by the restaurant. The restaurants have no claim whatsoever to your personal data and under no circumstances may they use it for their own purposes. If you should nevertheless be contacted by a restaurant without your prior consent, we ask you to report this to us by e-mail to support@orderchey.com.</p>\r\n<h2><strong>Saved payment methods</strong></h2>\r\n<p>In order to make the ordering process even more convenient for you, we offer to save your preferred payment method. This means that you don\'t have to enter your payment details again the next time you place an order. The storage of this data requires your prior consent. You can save your payment data by clicking on the consent field. You can revoke your consent for the future at any time by deactivating the consent field again or by informing us of this by e-mail to support@orderchey.com.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Payment data</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h2><strong>Advertising and marketing</strong></h2>\r\n<h3><strong>Direct marketing</strong></h3>\r\n<h4><strong>Newsletter</strong></h4>\r\n<p>If you have provided us with your email address when purchasing goods or services or creating an account on our platform, we reserve the right to send you regular offers of similar goods or services to those already purchased from our range by email.</p>\r\n<p>Not only do the contents of our newsletters vary, but so do the technologies and criteria we use to design our newsletters and segment customer groups. For example, a group of customers may receive a special newsletter promoting special deals from restaurants where customers have ordered. Other newsletters may refer to specific products that relate to a particular flavour, such as sushi, Indian delicacies or pizza.</p>\r\n<p>We use different information from your order history and delivery addresses.</p>\r\n<p>This is a profiling process in which we <strong>automatically process</strong> your data. The specific customer segmentation can have a <strong>legal effect on you or can have a significant effect</strong> on you in other ways if you receive certain newsletters and are not included in other campaigns.</p>\r\n<p>If automated decision making leads to a negative result for you and you do not agree with this, you can contact us at support@orderchey.com. In this case, we will individually assess the circumstances of your case.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p>Location data</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Data processing in this respect takes place solely on the basis of our legitimate interest in personalised direct marketing. If you have initially objected to the use of your email address for this purpose, we will not send you an email for marketing purposes. You are entitled to object to the use of your email address for the aforementioned advertising purposes at any time with effect for the future by notifying the person responsible named at the beginning. Upon receipt of your objection, the use of your email address for advertising purposes will be discontinued immediately.</p>\r\n<h4><strong>NPS</strong></h4>\r\n<p>We are constantly striving to improve our services. Your constructive feedback is very important to us. Therefore we will occasionally send you customer surveys and ask you to give us your opinion. If you do not wish to receive customer surveys, you can unsubscribe at any time. For any customer survey request you can click \"unsubscribe\" below and we will not contact you again.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Communication data</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Legitimate interest.</p>\r\n<p>Our legitimate interest is the purpose described above.</p>\r\n<h4><strong>App</strong></h4>\r\n<p>We have a strong interest in informing you about new restaurants or deals when using our app. We are always working to give you an amazing customer experience. To achieve this, we negotiate very good deals for you with our restaurant partners. To inform you about these deals, we send you in our Apps in-app-notification or push-notification. It is imperative that you have activated this in your end devices.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Location data</p>\r\n<p>Profile data (master data)</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>If processing takes place with your consent, the legal basis is consent. Otherwise, the processing is based on our legitimate interest. Our legitimate interest lies in the aforementioned purpose.</p>\r\n<h4><strong>SMS</strong></h4>\r\n<p>Besides other means we continue to use SMS to inform you about new deals in your area. You will only receive an SMS from us if you have given your consent. You can revoke your consent at any time for the future. Please send us an e-mail to support@orderchey.com. The registration as well as the cancellation is free of charge for you.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h4><strong>Online marketing</strong></h4>\r\n<p>Our service is based to a large extent on convincing potential customers that we offer an amazing customer experience and that every visit to our platform is worthwhile. In order to reach as many potential customers as possible, we are very active in the field of online marketing. It is just as important to win the trust of potential customers and to strengthen the trust of our existing customers. Therefore, we would like to present you our processes as transparent as possible.</p>\r\n<h4><strong>Targeting</strong></h4>\r\n<p>In principle, targeting means the switching and fading in of advertising banners on websites that are tailored to specific target groups. The aim is to display the most attractive banners as individually as possible for the user and potential customer. Firstly, we define a target group and secondly, we commission our service providers to show our advertising to the defined target group. We do not process any personal data, as these are initially made anonymous. To better define the target group, we segment customer types and place different ads on different portals.</p>\r\n<h4><strong>Retargeting</strong></h4>\r\n<p>As soon as you have visited our website and, for example, have already placed an order in your shopping cart, we store this information in cookies. If you continue to surf other websites, our advertising partners will remind you on our behalf that you have not yet completed your order. We don\'t want you to miss out on our amazing customer experience.</p>\r\n<p>You can disable retargeting by installing appropriate add-ons for your browser. Furthermore, you can and should also regularly delete the cookies stored in the browser you are using.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Legitimate interest.</p>\r\n<p>Our legitimate interest is the purpose described above.</p>\r\n<h5><strong>Cookies</strong></h5>\r\n<p>In order to make the visit of our website/app attractive and to enable the use of certain functions, we use so-called cookies on various pages. These are small text files that are stored on your device. Some of the cookies we use are deleted after the end of the browser session, i.e. after closing your browser (so-called session cookies). Other cookies remain on your device and allow us or our affiliate to recognize your browser on your next visit (persistent cookies). You can set your browser so that you are informed about the setting of cookies and individually decide on their acceptance or exclude the acceptance of cookies for specific cases or in general. Failure to accept cookies may limit the functionality of our website/app.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>If processing takes place with your consent, the legal basis is consent. Otherwise, the processing is based on our legitimate interest. Our legitimate interest lies in the aforementioned purpose.</p>\r\n<p>You can find our cookie policy with all the cookies we use here.</p>\r\n<h4><strong>Bonus programs</strong></h4>\r\n<p>We want to reward our customers\' loyalty with attractive deals and points. For this reason, we offer our customers the opportunity to participate in such bonus programs. Participation in a bonus program requires consent. You can revoke your consent at any time for the future. Please send us an email to support@orderchey.com for this purpose.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h3><strong>Sweepstakes</strong></h3>\r\n<p>The participation in the lottery requires your consent. If you have already given your consent and would like to revoke it for the future, you can do so at any time by sending an email to support@orderchey.com. In this case, we will exclude you from participating in our sweepstakes and you will not receive any further invitations to sweepstakes.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h3><strong>User Experience Surveys:</strong></h3>\r\n<p>We always develop new products and try to adapt our services to the wishes of our customers. In order to measure the effectiveness of these changes, we regularly offer interviews with our User Experience team. In these interviews we record your usage behaviour and ask you for possible optimisation possibilities.</p>\r\n<p>Participation in the interviews requires your consent. If you have already given your consent and would like to revoke it for the future, you can do so at any time by sending an email to support@orderchey.com. In this case we will exclude you from participating in our interviews and you will not receive any further invitations for them.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h2><strong>Customer Relationship Management</strong></h2>\r\n<h3><strong>Your requests</strong></h3>\r\n<p>Your satisfaction is our biggest goal. Therefore we are very keen to be available for all your questions and to answer them. In order to be able to answer these questions and understand the overall problem, we store the conversation content in our Customer Relationship Management System when you contact us.</p>\r\n<p>The content of the information we store depends on the information you provide to us as part of our communications.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact information</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Performance of contract</p>\r\n<h3><strong>Call Center</strong></h3>\r\n<p>If you contact us by phone, we store the conversation with your consent for quality assurance purposes. In individual cases, we also use the recordings for</p>\r\n<p>Quality improvement in customer service, i.e. for training purposes (coaching) with our employees. The content of the information we store depends on the information you provide to us as part of our communications.</p>\r\n<p>The stored telephone calls are deleted after 90 days at the latest or if the purpose of the storage, i.e. the quality check, is fulfilled earlier.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact information</p>\r\n<p>Order information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h2><strong>Fraud prevention and security of our platform</strong></h2>\r\n<p>In order to protect our customers and our platform from possible attacks, we continuously monitor the activities on our website for all visitors. To this end, we use various technical measures to ensure that suspicious behavior patterns are detected at an early stage and prevented in good time. To achieve this goal, several monitoring mechanisms run in parallel and prevent potential attackers from accessing our website at all.</p>\r\n<p>The<strong> decision-making process is automated and can have a legal effect on the person concerned or affect them in a similar way.</strong> If automated decision making leads to a negative result for you and you do not agree with this, you can contact us at support@orderchey.com. In this case, we will individually assess the circumstances of your case.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Device information and access data</p>\r\n<p>Contact information</p>\r\n<p>Payment information</p>\r\n<p>Order information</p>\r\n<p>Voucher information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Consent</p>\r\n<h2><strong>Merger &amp; acquisitions, change of ownership</strong></h2>\r\n<p>We would also like to inform you that in the event of a merger with or acquisition by another company, we will disclose information to that company. Of course, we will require the company to comply with the legal data protection regulations.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Contact Information</p>\r\n<p>Delivery information</p>\r\n<p>Location data</p>\r\n<p>Profile data (master data)</p>\r\n<p>Device information and access data</p>\r\n<p>Order information</p>\r\n<p>Communication data</p>\r\n<p>Payment information</p>\r\n<p>Voucher information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Legitimate interest</p>\r\n<p>Our legitimate interest is the purpose described above.</p>\r\n<h2><strong>Vouchers</strong></h2>\r\n<p>We often offer vouchers for our platforms. The reasons can vary. The purpose of these vouchers is to reward our loyal customers and to encourage them to continue to lead our loyal customers.</p>\r\n<p>In order to be able to check the number, the value and the frequency of use of the vouchers, but also to avoid misuse of these vouchers, we collect various personal data.</p>\r\n<p><strong>Categories of personal data:</strong></p>\r\n<p>Profile data (master data)</p>\r\n<p>Voucher information</p>\r\n<p><strong>Legal basis:</strong></p>\r\n<p>Legitimate interest</p>\r\n<p>Our legitimate interest is the purpose described above.</p>\r\n<h1><strong>Who we work with and where we process your data</strong></h1>\r\n<p>We never give your data to unauthorized third parties. However, as part of our work we obtain the services of selected service providers and give them limited and strictly monitored access to some of our data. However, before we forwarding personal data to these partner companies for processing on our behalf, each individual company undergoes an audit. All data recipients must meet the legal data protection requirements and prove their data protection level with appropriate proofs.</p>\r\n<h2><strong>Service providers</strong></h2>\r\n<p>We use different data processors in our daily processing. These process your personal data in accordance with the applicable local requirements only according to our instructions and have no claims whatsoever on these data. We also monitor our processors and include only those who meet our high standards.</p>\r\n<p>Because we use different data processors and change them from time to time, it is not appropriate to identify specific recipients of personal information. However, if you are interested, we will be happy to disclose the name of the processor(s) in use at that time upon request.</p>\r\n<h2><strong>Third parties</strong></h2>\r\n<p>In addition to data processors, we also work with third parties, to whom we also transmit your personal data, but who are not bound by our instructions. These are, for example, our consultants, lawyers or tax consultants who receive your data from us on the basis of a contract and process your personal data for legal reasons or to protect our own interests.</p>\r\n<p>We do not sell or rent your personal data to third parties under any circumstances. This will never take place without your explicit consent.</p>\r\n<h2><strong>Prosecuting authorities and legal proceedings</strong></h2>\r\n<p>Unfortunately, it can happen that a few of our customers and service providers do not behave fairly and want to harm us. In these cases, we are not only obliged to hand over personal data due to legal obligations, it is also in our interest to prevent damage and to enforce our claims and to reject unjustified claims.</p>\r\n<h1><strong>How long we store your data</strong></h1>\r\n<p>We generally delete your data after the purpose has been fulfilled. The exact deletion rules are defined in our regional deletion concepts. Different deletion rules apply depending on the purpose of the processing. Within our deletion concepts we have defined various data classes and assigned rule deletion periods to them. The data collected is marked with a deletion rule. When the retention period is met, the stored data will be deleted accordingly.</p>\r\n<p>We will delete your personal data either if you wish and let us know or if your account is inactive for three years, we will also delete your account. Before this happens, you will receive a separate notification from us to the email address registered in your user account.</p>\r\n<p>In addition to the deletion rules defined by us, there are other legal retention periods which we must also observe. For example, tax data must be kept for a period of between six and ten years or even longer in some cases. These special retention periods vary according to local legal requirements.</p>\r\n<p>Therefore, despite your request for deletion of your data, we may still have to store some of the stored data due to legal regulations. In this case, however, we will restrict data from further processing.</p>\r\n<p>Furthermore, we will continue to store your data if we have a right to do so in accordance with applicable local laws. This applies in particular if we need your personal data for the establishment, exercise or defence of legal claims.</p>\r\n<h1><strong>Right of modification</strong></h1>\r\n<p>We reserve the right to change this data protection declaration in compliance with the statutory provisions. We will inform you of any significant changes, such as changes of purpose or new purposes of processing.</p>\r\n<p>Last update: July 2020</p>', NULL, NULL, NULL, NULL, NULL, '2021-06-30 06:36:33');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('20210823182022-create-deposit-request.js'),
('20210825092218-create-setting.js'),
('20210906024513-create-daily-bonus.js'),
('20210914193542-create-user-daily-bonus.js'),
('20210920105003-create-admin-earning.js'),
('20211101115242-create-task-bonus.js');

-- --------------------------------------------------------

--
-- Table structure for table `Settings`
--

CREATE TABLE `Settings` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_general_ci,
  `slug` text COLLATE utf8mb4_general_ci,
  `option` bigint DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `status` enum('show','hide') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `name` text COLLATE utf8mb4_general_ci,
  `slug` text COLLATE utf8mb4_general_ci,
  `option` bigint DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `status` enum('show','hide') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(8, 'Maximum Withdrawls per DAy', 'max_withdrawls_per_day', 5, '5', 'show', '2021-08-31 00:00:00', '2021-08-31 00:00:00'),
(9, 'Free Withdrawls per DAy', 'free_withdrawls_per_day', 1, '1', 'show', '2021-08-31 00:00:00', '2021-08-31 00:00:00'),
(10, 'Withdrawl Fee', 'withdrawl_fee', 2, '2%', 'show', '2021-08-31 00:00:00', '2021-08-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `city_id` bigint DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `upi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_care_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `help_line_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gst` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin_profit` double DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `gameServerStatus` enum('start','stop') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `android_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ios_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `min_android_version` varchar(355) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_app_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `store_app_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `franchise_app_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` enum('live','stop') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_text` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `city_id`, `logo`, `site_logo`, `payment_barcode`, `upi`, `favicon`, `site_name`, `admin_logo`, `address`, `email`, `phone`, `customer_care_no`, `help_line_no`, `gst`, `company`, `currency`, `admin_profit`, `created_at`, `updated_at`, `site_url`, `gameServerStatus`, `android_url`, `ios_url`, `min_android_version`, `customer_app_url`, `store_app_url`, `franchise_app_url`, `status`, `status_text`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'sitesetting/a94855adb80fd11799bd8ee1735d1fa0.jpeg', 'app/site_setting//Uun6MKpo0rmSV9Xm4AdnuAZAERxWaxUhyKlNzzFB.png', 'app/site_setting//fTJ72LyGFTBktaWXlSTIzzKzsnwMpj2UKskdRkcv.jpg', '8977440439@ybl', NULL, 'Bigg Spin Game', NULL, '19-4-802,Anantapur.\r\nSSDOFOSD', 'teja@gmail.com', '9876543210', '9876543210', '9876543210', NULL, 'Bigg Spin Game', NULL, 27853, NULL, '2021-10-01 04:10:48', 'https://bigspingame.com/', 'start', 'https://play.google.com/store/apps/details?id=com.bigspingame.app', NULL, '1.1', 'https://play.google.com/store/apps/details?id=app.orderchey.customer', 'https://play.google.com/store/apps/details?id=app.orderchey.store', NULL, 'live', 'under maintanance', NULL, '2021-11-15 13:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `taskBonus`
--

CREATE TABLE `taskBonus` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `total_plays` int DEFAULT NULL,
  `status` enum('pending','claim','claimed','expired') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `bonus` int DEFAULT NULL,
  `claimed_date` date DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taskBonus`
--

INSERT INTO `taskBonus` (`id`, `user_id`, `total_plays`, `status`, `bonus`, `claimed_date`, `comment`, `createdAt`, `updatedAt`) VALUES
(13, 1, 30, 'pending', 3, '2021-11-11', NULL, '2021-11-11 15:47:11', '2021-11-11 15:47:12'),
(14, 1, 100, 'pending', 6, '2021-11-11', NULL, '2021-11-11 15:47:12', '2021-11-11 15:47:12'),
(15, 1, 300, 'pending', 16, '2021-11-11', NULL, '2021-11-11 15:47:12', '2021-11-11 15:47:12'),
(16, 1, 300, 'pending', 16, '2021-11-11', NULL, '2021-11-11 15:47:12', '2021-11-11 15:47:12'),
(17, 1, 1000, 'pending', 30, '2021-11-11', NULL, '2021-11-11 15:47:12', '2021-11-11 15:47:12'),
(18, 1, 1000, 'pending', 30, '2021-11-11', NULL, '2021-11-11 15:47:12', '2021-11-11 15:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` enum('credit','debit') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userDailyBonus`
--

CREATE TABLE `userDailyBonus` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `day` bigint DEFAULT NULL,
  `week` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `status` enum('pending','claimed','expired') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userDailyBonus`
--

INSERT INTO `userDailyBonus` (`id`, `user_id`, `day`, `week`, `date`, `amount`, `status`, `comment`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 46, NULL, 2, 'expired', NULL, '2021-11-08 12:28:32', '2021-11-08 12:28:32'),
(2, 1, 2, 46, NULL, 2, 'claimed', NULL, '2021-11-08 12:28:32', '2021-11-08 12:28:42'),
(3, 1, 3, 46, NULL, 2, 'expired', NULL, '2021-11-08 12:28:33', '2021-11-10 14:29:11'),
(4, 1, 4, 46, NULL, 2, 'expired', NULL, '2021-11-08 12:28:33', '2021-11-11 15:47:04'),
(5, 1, 5, 46, NULL, 2, 'pending', NULL, '2021-11-08 12:28:33', '2021-11-11 15:47:05'),
(6, 1, 6, 46, NULL, 2, 'pending', NULL, '2021-11-08 12:28:33', '2021-11-11 15:47:05'),
(7, 1, 7, 46, NULL, 2, 'pending', NULL, '2021-11-08 12:28:33', '2021-11-11 15:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wallet` double DEFAULT '0',
  `earnings` double DEFAULT '0',
  `gulkan_points` double DEFAULT '0',
  `profilePic` text COLLATE utf8mb4_general_ci,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `otp` int DEFAULT NULL,
  `token` longtext COLLATE utf8mb4_general_ci,
  `firebaseToken` longtext COLLATE utf8mb4_general_ci,
  `mobile_verified` enum('yes','no') COLLATE utf8mb4_general_ci DEFAULT 'no',
  `bankAccountNumber` text COLLATE utf8mb4_general_ci,
  `bankAccountName` text COLLATE utf8mb4_general_ci,
  `bankIFSC` text COLLATE utf8mb4_general_ci,
  `bankName` text COLLATE utf8mb4_general_ci,
  `bankAddress` text COLLATE utf8mb4_general_ci,
  `UPI` text COLLATE utf8mb4_general_ci,
  `your_id` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `referral_id` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `played_games` int DEFAULT NULL,
  `won_games` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `wallet`, `earnings`, `gulkan_points`, `profilePic`, `password`, `otp`, `token`, `firebaseToken`, `mobile_verified`, `bankAccountNumber`, `bankAccountName`, `bankIFSC`, `bankName`, `bankAddress`, `UPI`, `your_id`, `referral_id`, `played_games`, `won_games`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(1, 'Ace', NULL, '8919023970', 0, 170711, 3907.8400000000356, NULL, '$2b$10$kL2Nz3iJQmAqf8SHuUxQkehZN4rBwLn4uiv6mgHeHZkiZhyVbX56W', 894944, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAka0wyTnozaUpRbUFxZjhTSHVVeFFrZWhaTjRyQndMbjR1aXY2bWdIZUhaa2laaHlWYlg1NlciLCJ1c2VySWQiOjEsImlhdCI6MTYzNzAzODA0NiwiZXhwIjoxNjM4MzM0MDQ2fQ.9OpxBSHHIT1ntxr86ZIbIsPo_QMVnk9OAecA-BXCYek', 'cT0HyxgwQhuywGSMnCOU_Z:APA91bHzV2fWrU7kOBFp65YpHQ2bejYSDe4b_J56GdHAJCQGMcUIkQyyFNonMT81LqSYaXGZxpch2FbZUMmBNIUvcg4vgwjv91HGKNrd3jUOh3UoJ9IYKHMOP8rJnTQtTQRM4eg5w24t', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, '8919023970', NULL, 291, NULL, '2021-10-01 16:16:19', '2021-11-16 10:49:48', '2021-10-01 10:46:19', '2021-10-01 06:10:48'),
(2, 'teja', NULL, '8712103633', 22, 0, 0, NULL, '$2b$10$mmA51.zNRcr5cF65RkGoyedDY6aRnthNE9uT0J/jO5ysO/e3yZRX2', 291662, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, '8712103633', '1', NULL, NULL, '2021-10-01 16:22:19', '2021-10-01 16:22:47', '2021-10-01 10:52:19', '2021-10-01 10:52:19'),
(4, 'Aryan', NULL, '7075650803', 2, 0, 0, NULL, '$2b$10$JrhigXlmzEVwVDe3QSEfb.V77p0fVaZhpIPhvvwDMPTqncmfA9NF.', 113876, NULL, NULL, 'yes', NULL, NULL, NULL, NULL, NULL, NULL, '7075650803', '', NULL, NULL, '2021-10-01 16:29:53', '2021-10-01 16:30:26', '2021-10-01 10:59:53', '2021-10-01 10:59:53'),
(5, 'NMR', NULL, '9000501510', 1, 19, 0.4400000000000001, NULL, '$2b$10$6Pe9iQx1T/pElT/UBRO/kunsJJQUMAFT38./4tXcpVnu6HKQWIJNi', 733680, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGUiOiIkMmIkMTAkNlBlOWlReDFUL3BFbFQvVUJSTy9rdW5zSkpRVU1BRlQzOC4vNHRYY3BWbnU2SEtRV0lKTmkiLCJ1c2VySWQiOjUsImlhdCI6MTYzNjAyNDYyNywiZXhwIjoxNjM3MzIwNjI3fQ.yKDtkRMF9Ty12iJGHg97ssmKc42y4g9F7EI77tREN4w', 'fhL75rsmRqyhdEOSMHt5G9:APA91bFLXFsr2V9evL0qBgrESm6prSKyHkRN5yiTSqlT_C24rJb_FO4x9FlhOxo0FzmkWHQVgbf5ZgUZMHSwqLYsB8DNRJPAoGknZ1wJJStujYImkMEVbe6hqktO-7wVUugkCs-4VxqX', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, '9000501510', NULL, 9, NULL, '2021-11-04 16:46:02', '2021-11-04 17:00:23', '2021-11-04 11:16:02', '2021-11-04 11:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `walletHistories`
--

CREATE TABLE `walletHistories` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A User',
  `game_id` bigint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `credit_debit` enum('credit','debit') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` enum('game','bonus','deposit','refund') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wallet_type` enum('wallet','earnings','gulkan_points') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `walletHistories`
--

INSERT INTO `walletHistories` (`id`, `user_id`, `user_name`, `game_id`, `amount`, `balance`, `credit_debit`, `type`, `wallet_type`, `comment`, `createdAt`, `updatedAt`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, -10, 165573, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:17:31', '2021-11-13 18:17:31', '2021-11-13 12:47:31', '2021-11-13 12:47:31'),
(2, 1, NULL, 1, -10, 165563, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:17:33', '2021-11-13 18:17:33', '2021-11-13 12:47:33', '2021-11-13 12:47:33'),
(3, 1, NULL, 1, -1, 165562, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:17:37', '2021-11-13 18:17:37', '2021-11-13 12:47:37', '2021-11-13 12:47:37'),
(4, 1, NULL, 1, -10, 165552, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:21:40', '2021-11-13 18:21:40', '2021-11-13 12:51:40', '2021-11-13 12:51:40'),
(5, 1, NULL, 1, -100, 165452, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:21:41', '2021-11-13 18:21:41', '2021-11-13 12:51:41', '2021-11-13 12:51:41'),
(6, 1, NULL, 1, -100, 165352, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:21:42', '2021-11-13 18:21:42', '2021-11-13 12:51:42', '2021-11-13 12:51:42'),
(7, 1, NULL, 1, -10, 165342, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:25:12', '2021-11-13 18:25:12', '2021-11-13 12:55:12', '2021-11-13 12:55:12'),
(8, 1, NULL, 1, -100, 165242, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:25:16', '2021-11-13 18:25:16', '2021-11-13 12:55:16', '2021-11-13 12:55:16'),
(9, 1, NULL, 1, -100, 165142, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:25:16', '2021-11-13 18:25:16', '2021-11-13 12:55:16', '2021-11-13 12:55:16'),
(10, 1, NULL, 1, -10, 165132, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:28:38', '2021-11-13 18:28:38', '2021-11-13 12:58:38', '2021-11-13 12:58:38'),
(11, 1, NULL, 1, -100, 165032, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:28:39', '2021-11-13 18:28:39', '2021-11-13 12:58:39', '2021-11-13 12:58:39'),
(12, 1, NULL, 1, -100, 165032, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:28:39', '2021-11-13 18:28:39', '2021-11-13 12:58:39', '2021-11-13 12:58:39'),
(13, 1, NULL, 1, -10, 165022, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:31:57', '2021-11-13 18:31:57', '2021-11-13 13:01:57', '2021-11-13 13:01:57'),
(14, 1, NULL, 1, -100, 164922, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:31:58', '2021-11-13 18:31:58', '2021-11-13 13:01:58', '2021-11-13 13:01:58'),
(15, 1, NULL, 1, -100, 164922, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:31:58', '2021-11-13 18:31:58', '2021-11-13 13:01:58', '2021-11-13 13:01:58'),
(16, 1, NULL, 9, 200, 165122, 'credit', 'game', 'earnings', '', '2021-11-13 18:32:27', '2021-11-13 18:32:27', '2021-11-13 13:02:27', '2021-11-13 13:02:27'),
(17, 1, NULL, 9, 2, 165124, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:32:27', '2021-11-13 18:32:27', '2021-11-13 13:02:27', '2021-11-13 13:02:27'),
(18, 1, NULL, 9, 200, 165322, 'credit', 'game', 'earnings', '', '2021-11-13 18:32:27', '2021-11-13 18:32:27', '2021-11-13 13:02:27', '2021-11-13 13:02:27'),
(19, 1, NULL, 9, 2, 165324, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:32:28', '2021-11-13 18:32:28', '2021-11-13 13:02:28', '2021-11-13 13:02:28'),
(20, 1, NULL, 1, -100, 165222, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:33:24', '2021-11-13 18:33:24', '2021-11-13 13:03:24', '2021-11-13 13:03:24'),
(21, 1, NULL, 1, -100, 165122, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:33:25', '2021-11-13 18:33:25', '2021-11-13 13:03:25', '2021-11-13 13:03:25'),
(22, 1, NULL, 1, -10, 165112, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:35:14', '2021-11-13 18:35:14', '2021-11-13 13:05:14', '2021-11-13 13:05:14'),
(23, 1, NULL, 1, -100, 165012, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:35:15', '2021-11-13 18:35:15', '2021-11-13 13:05:15', '2021-11-13 13:05:15'),
(24, 1, NULL, 1, -100, 164912, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:35:17', '2021-11-13 18:35:17', '2021-11-13 13:05:17', '2021-11-13 13:05:17'),
(25, 1, NULL, 12, 100, 165012, 'credit', 'game', 'earnings', '', '2021-11-13 18:35:42', '2021-11-13 18:35:42', '2021-11-13 13:05:42', '2021-11-13 13:05:42'),
(26, 1, NULL, 12, 1, 165013, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:35:42', '2021-11-13 18:35:42', '2021-11-13 13:05:42', '2021-11-13 13:05:42'),
(27, 1, NULL, 12, 100, 165112, 'credit', 'game', 'earnings', '', '2021-11-13 18:35:42', '2021-11-13 18:35:42', '2021-11-13 13:05:42', '2021-11-13 13:05:42'),
(28, 1, NULL, 12, 1, 165113, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:35:43', '2021-11-13 18:35:43', '2021-11-13 13:05:43', '2021-11-13 13:05:43'),
(29, 1, NULL, 1, -100, 165012, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:06', '2021-11-13 18:36:06', '2021-11-13 13:06:06', '2021-11-13 13:06:06'),
(30, 1, NULL, 1, -10, 165002, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:11', '2021-11-13 18:36:11', '2021-11-13 13:06:11', '2021-11-13 13:06:11'),
(31, 1, NULL, 1, -10, 164992, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:12', '2021-11-13 18:36:12', '2021-11-13 13:06:12', '2021-11-13 13:06:12'),
(32, 1, NULL, 1, -10, 164982, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:12', '2021-11-13 18:36:12', '2021-11-13 13:06:12', '2021-11-13 13:06:12'),
(33, 1, NULL, 1, -10, 164972, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:13', '2021-11-13 18:36:13', '2021-11-13 13:06:13', '2021-11-13 13:06:13'),
(34, 1, NULL, 1, -10, 164962, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:14', '2021-11-13 18:36:14', '2021-11-13 13:06:14', '2021-11-13 13:06:14'),
(35, 1, NULL, 1, -100, 164862, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:19', '2021-11-13 18:36:19', '2021-11-13 13:06:19', '2021-11-13 13:06:19'),
(36, 1, NULL, 1, -10, 164852, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:23', '2021-11-13 18:36:23', '2021-11-13 13:06:23', '2021-11-13 13:06:23'),
(37, 1, NULL, 1, -10, 164842, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:28', '2021-11-13 18:36:28', '2021-11-13 13:06:28', '2021-11-13 13:06:28'),
(38, 1, NULL, 1, -10, 164832, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:29', '2021-11-13 18:36:29', '2021-11-13 13:06:29', '2021-11-13 13:06:29'),
(39, 1, NULL, 1, -10, 164822, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:36:30', '2021-11-13 18:36:30', '2021-11-13 13:06:30', '2021-11-13 13:06:30'),
(40, 1, NULL, 13, 300, 165122, 'credit', 'game', 'earnings', '', '2021-11-13 18:36:42', '2021-11-13 18:36:42', '2021-11-13 13:06:42', '2021-11-13 13:06:42'),
(41, 1, NULL, 13, 3, 165125, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:36:42', '2021-11-13 18:36:42', '2021-11-13 13:06:42', '2021-11-13 13:06:42'),
(42, 1, NULL, 13, 300, 165422, 'credit', 'game', 'earnings', '', '2021-11-13 18:36:43', '2021-11-13 18:36:43', '2021-11-13 13:06:43', '2021-11-13 13:06:43'),
(43, 1, NULL, 13, 3, 165425, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:36:43', '2021-11-13 18:36:43', '2021-11-13 13:06:43', '2021-11-13 13:06:43'),
(44, 1, NULL, 1, -10, 165412, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:08', '2021-11-13 18:37:08', '2021-11-13 13:07:08', '2021-11-13 13:07:08'),
(45, 1, NULL, 1, -10, 165402, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:08', '2021-11-13 18:37:08', '2021-11-13 13:07:08', '2021-11-13 13:07:08'),
(46, 1, NULL, 1, -10, 165402, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:08', '2021-11-13 18:37:08', '2021-11-13 13:07:08', '2021-11-13 13:07:08'),
(47, 1, NULL, 1, -100, 165302, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:11', '2021-11-13 18:37:11', '2021-11-13 13:07:11', '2021-11-13 13:07:11'),
(48, 1, NULL, 1, -100, 165202, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:12', '2021-11-13 18:37:12', '2021-11-13 13:07:12', '2021-11-13 13:07:12'),
(49, 1, NULL, 1, -10, 165192, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:13', '2021-11-13 18:37:13', '2021-11-13 13:07:13', '2021-11-13 13:07:13'),
(50, 1, NULL, 1, -10, 165182, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:13', '2021-11-13 18:37:13', '2021-11-13 13:07:13', '2021-11-13 13:07:13'),
(51, 1, NULL, 1, -10, 165172, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:14', '2021-11-13 18:37:14', '2021-11-13 13:07:14', '2021-11-13 13:07:14'),
(52, 1, NULL, 1, -10, 165172, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:14', '2021-11-13 18:37:14', '2021-11-13 13:07:14', '2021-11-13 13:07:14'),
(53, 1, NULL, 1, -10, 165162, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:37:15', '2021-11-13 18:37:15', '2021-11-13 13:07:15', '2021-11-13 13:07:15'),
(54, 1, NULL, 14, 300, 165462, 'credit', 'game', 'earnings', '', '2021-11-13 18:37:42', '2021-11-13 18:37:42', '2021-11-13 13:07:42', '2021-11-13 13:07:42'),
(55, 1, NULL, 14, 3, 165465, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:37:43', '2021-11-13 18:37:43', '2021-11-13 13:07:43', '2021-11-13 13:07:43'),
(56, 1, NULL, 14, 300, 165762, 'credit', 'game', 'earnings', '', '2021-11-13 18:37:43', '2021-11-13 18:37:43', '2021-11-13 13:07:43', '2021-11-13 13:07:43'),
(57, 1, NULL, 14, 3, 165765, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:37:43', '2021-11-13 18:37:43', '2021-11-13 13:07:43', '2021-11-13 13:07:43'),
(58, 1, NULL, 1, -10, 165752, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:06', '2021-11-13 18:38:06', '2021-11-13 13:08:06', '2021-11-13 13:08:06'),
(59, 1, NULL, 1, -10, 165752, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:06', '2021-11-13 18:38:06', '2021-11-13 13:08:06', '2021-11-13 13:08:06'),
(60, 1, NULL, 1, -10, 165742, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:06', '2021-11-13 18:38:06', '2021-11-13 13:08:06', '2021-11-13 13:08:06'),
(61, 1, NULL, 1, -10, 165742, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:06', '2021-11-13 18:38:06', '2021-11-13 13:08:06', '2021-11-13 13:08:06'),
(62, 1, NULL, 1, -10, 165732, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:08', '2021-11-13 18:38:08', '2021-11-13 13:08:08', '2021-11-13 13:08:08'),
(63, 1, NULL, 1, -10, 165732, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:08', '2021-11-13 18:38:08', '2021-11-13 13:08:08', '2021-11-13 13:08:08'),
(64, 1, NULL, 1, -100, 165632, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:10', '2021-11-13 18:38:10', '2021-11-13 13:08:10', '2021-11-13 13:08:10'),
(65, 1, NULL, 1, -100, 165632, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:10', '2021-11-13 18:38:10', '2021-11-13 13:08:10', '2021-11-13 13:08:10'),
(66, 1, NULL, 1, -100, 165632, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:10', '2021-11-13 18:38:10', '2021-11-13 13:08:10', '2021-11-13 13:08:10'),
(67, 1, NULL, 1, -100, 165532, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:11', '2021-11-13 18:38:11', '2021-11-13 13:08:11', '2021-11-13 13:08:11'),
(68, 1, NULL, 1, -100, 165532, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:11', '2021-11-13 18:38:11', '2021-11-13 13:08:11', '2021-11-13 13:08:11'),
(69, 1, NULL, 1, -100, 165432, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:13', '2021-11-13 18:38:13', '2021-11-13 13:08:13', '2021-11-13 13:08:13'),
(70, 1, NULL, 1, -100, 165432, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:14', '2021-11-13 18:38:14', '2021-11-13 13:08:14', '2021-11-13 13:08:14'),
(71, 1, NULL, 1, -500, 164932, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:14', '2021-11-13 18:38:14', '2021-11-13 13:08:14', '2021-11-13 13:08:14'),
(72, 1, NULL, 1, -500, 164432, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:16', '2021-11-13 18:38:16', '2021-11-13 13:08:16', '2021-11-13 13:08:16'),
(73, 1, NULL, 1, -1, 164431, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:38:18', '2021-11-13 18:38:18', '2021-11-13 13:08:18', '2021-11-13 13:08:18'),
(74, 1, NULL, 15, 20, 164451, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:42', '2021-11-13 18:38:42', '2021-11-13 13:08:42', '2021-11-13 13:08:42'),
(75, 1, NULL, 15, 0.2, 164451.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:43', '2021-11-13 18:38:43', '2021-11-13 13:08:43', '2021-11-13 13:08:43'),
(76, 1, NULL, 15, 20, 164471, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:43', '2021-11-13 18:38:43', '2021-11-13 13:08:43', '2021-11-13 13:08:43'),
(77, 1, NULL, 15, 0.2, 164471.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:44', '2021-11-13 18:38:44', '2021-11-13 13:08:44', '2021-11-13 13:08:44'),
(78, 1, NULL, 15, 20, 164491, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:45', '2021-11-13 18:38:45', '2021-11-13 13:08:45', '2021-11-13 13:08:45'),
(79, 1, NULL, 15, 20, 164491, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:45', '2021-11-13 18:38:45', '2021-11-13 13:08:45', '2021-11-13 13:08:45'),
(80, 1, NULL, 15, 0.2, 164491.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:45', '2021-11-13 18:38:45', '2021-11-13 13:08:45', '2021-11-13 13:08:45'),
(81, 1, NULL, 15, 0.2, 164491.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:45', '2021-11-13 18:38:45', '2021-11-13 13:08:45', '2021-11-13 13:08:45'),
(82, 1, NULL, 15, 20, 164511, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:46', '2021-11-13 18:38:46', '2021-11-13 13:08:46', '2021-11-13 13:08:46'),
(83, 1, NULL, 15, 20, 164511, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:46', '2021-11-13 18:38:46', '2021-11-13 13:08:46', '2021-11-13 13:08:46'),
(84, 1, NULL, 15, 0.2, 164511.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:46', '2021-11-13 18:38:46', '2021-11-13 13:08:46', '2021-11-13 13:08:46'),
(85, 1, NULL, 15, 0.2, 164511.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:46', '2021-11-13 18:38:46', '2021-11-13 13:08:46', '2021-11-13 13:08:46'),
(86, 1, NULL, 15, 200, 164711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:46', '2021-11-13 18:38:46', '2021-11-13 13:08:46', '2021-11-13 13:08:46'),
(87, 1, NULL, 15, 2, 164713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:47', '2021-11-13 18:38:47', '2021-11-13 13:08:47', '2021-11-13 13:08:47'),
(88, 1, NULL, 15, 200, 164911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:47', '2021-11-13 18:38:47', '2021-11-13 13:08:47', '2021-11-13 13:08:47'),
(89, 1, NULL, 15, 2, 164913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:47', '2021-11-13 18:38:47', '2021-11-13 13:08:47', '2021-11-13 13:08:47'),
(90, 1, NULL, 15, 200, 164911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:47', '2021-11-13 18:38:47', '2021-11-13 13:08:47', '2021-11-13 13:08:47'),
(91, 1, NULL, 15, 2, 164913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(92, 1, NULL, 15, 200, 165311, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(93, 1, NULL, 15, 200, 165311, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(94, 1, NULL, 15, 200, 165311, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(95, 1, NULL, 15, 200, 165311, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(96, 1, NULL, 15, 2, 165313, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(97, 1, NULL, 15, 2, 165313, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:48', '2021-11-13 18:38:48', '2021-11-13 13:08:48', '2021-11-13 13:08:48'),
(98, 1, NULL, 15, 2, 165313, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:49', '2021-11-13 18:38:49', '2021-11-13 13:08:49', '2021-11-13 13:08:49'),
(99, 1, NULL, 15, 2, 165313, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:49', '2021-11-13 18:38:49', '2021-11-13 13:08:49', '2021-11-13 13:08:49'),
(100, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:50', '2021-11-13 13:08:50'),
(101, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:50', '2021-11-13 13:08:50'),
(102, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(103, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(104, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(105, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(106, 1, NULL, 15, 200, 165711, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:50', '2021-11-13 18:38:50', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(107, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(108, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(109, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(110, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(111, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:51', '2021-11-13 13:08:51'),
(112, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:52', '2021-11-13 13:08:52'),
(113, 1, NULL, 15, 2, 165713, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:51', '2021-11-13 18:38:51', '2021-11-13 13:08:52', '2021-11-13 13:08:52'),
(114, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(115, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(116, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(117, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(118, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(119, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(120, 1, NULL, 15, 200, 165911, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(121, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:53', '2021-11-13 13:08:53'),
(122, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:54', '2021-11-13 13:08:54'),
(123, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:54', '2021-11-13 13:08:54'),
(124, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:53', '2021-11-13 18:38:53', '2021-11-13 13:08:54', '2021-11-13 13:08:54'),
(125, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:54', '2021-11-13 18:38:54', '2021-11-13 13:08:54', '2021-11-13 13:08:54'),
(126, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:54', '2021-11-13 18:38:54', '2021-11-13 13:08:54', '2021-11-13 13:08:54'),
(127, 1, NULL, 15, 2, 165913, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:54', '2021-11-13 18:38:54', '2021-11-13 13:08:54', '2021-11-13 13:08:54'),
(128, 1, NULL, 15, 200, 166111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:54', '2021-11-13 18:38:54', '2021-11-13 13:08:55', '2021-11-13 13:08:55'),
(129, 1, NULL, 15, 2, 166113, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:55', '2021-11-13 18:38:55', '2021-11-13 13:08:55', '2021-11-13 13:08:55'),
(130, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:56', '2021-11-13 13:08:56'),
(131, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:56', '2021-11-13 13:08:56'),
(132, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:56', '2021-11-13 13:08:56'),
(133, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:56', '2021-11-13 13:08:56'),
(134, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:56', '2021-11-13 13:08:56'),
(135, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(136, 1, NULL, 15, 1000, 167111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(137, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:56', '2021-11-13 18:38:56', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(138, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(139, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(140, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(141, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:57', '2021-11-13 13:08:57'),
(142, 1, NULL, 15, 1000, 167311, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:58', '2021-11-13 13:08:58'),
(143, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:58', '2021-11-13 13:08:58'),
(144, 1, NULL, 15, 10, 167121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:57', '2021-11-13 18:38:57', '2021-11-13 13:08:58', '2021-11-13 13:08:58'),
(145, 1, NULL, 15, 10, 167321, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:58', '2021-11-13 18:38:58', '2021-11-13 13:08:58', '2021-11-13 13:08:58'),
(146, 1, NULL, 15, 1000, 168111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:58', '2021-11-13 18:38:58', '2021-11-13 13:08:59', '2021-11-13 13:08:59'),
(147, 1, NULL, 15, 1000, 168111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:58', '2021-11-13 18:38:58', '2021-11-13 13:08:59', '2021-11-13 13:08:59'),
(148, 1, NULL, 15, 1000, 168111, 'credit', 'game', 'earnings', '', '2021-11-13 18:38:58', '2021-11-13 18:38:58', '2021-11-13 13:08:59', '2021-11-13 13:08:59'),
(149, 1, NULL, 15, 10, 168121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:59', '2021-11-13 18:38:59', '2021-11-13 13:08:59', '2021-11-13 13:08:59'),
(150, 1, NULL, 15, 10, 168121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:59', '2021-11-13 18:38:59', '2021-11-13 13:08:59', '2021-11-13 13:08:59'),
(151, 1, NULL, 15, 10, 168121, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:38:59', '2021-11-13 18:38:59', '2021-11-13 13:08:59', '2021-11-13 13:08:59'),
(152, 1, NULL, 1, -10, 169101, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:39:12', '2021-11-13 18:39:12', '2021-11-13 13:09:12', '2021-11-13 13:09:12'),
(153, 1, NULL, 1, -100, 169001, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:39:17', '2021-11-13 18:39:17', '2021-11-13 13:09:17', '2021-11-13 13:09:17'),
(154, 1, NULL, 1, -100, 168901, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:39:20', '2021-11-13 18:39:20', '2021-11-13 13:09:20', '2021-11-13 13:09:20'),
(155, 1, NULL, 1, -10, 168891, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:39:28', '2021-11-13 18:39:28', '2021-11-13 13:09:28', '2021-11-13 13:09:28'),
(156, 1, NULL, 16, 200, 169091, 'credit', 'game', 'earnings', '', '2021-11-13 18:39:43', '2021-11-13 18:39:43', '2021-11-13 13:09:43', '2021-11-13 13:09:43'),
(157, 1, NULL, 16, 2, 169093, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:39:43', '2021-11-13 18:39:43', '2021-11-13 13:09:43', '2021-11-13 13:09:43'),
(158, 1, NULL, 16, 200, 169291, 'credit', 'game', 'earnings', '', '2021-11-13 18:39:44', '2021-11-13 18:39:44', '2021-11-13 13:09:44', '2021-11-13 13:09:44'),
(159, 1, NULL, 16, 2, 169293, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:39:44', '2021-11-13 18:39:44', '2021-11-13 13:09:44', '2021-11-13 13:09:44'),
(160, 1, NULL, 1, -10, 169281, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:40:06', '2021-11-13 18:40:06', '2021-11-13 13:10:06', '2021-11-13 13:10:06'),
(161, 1, NULL, 1, -10, 169281, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:40:06', '2021-11-13 18:40:06', '2021-11-13 13:10:06', '2021-11-13 13:10:06'),
(162, 1, NULL, 1, -100, 169181, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:40:08', '2021-11-13 18:40:08', '2021-11-13 13:10:08', '2021-11-13 13:10:08'),
(163, 1, NULL, 1, -100, 169081, 'debit', 'game', 'earnings', NULL, '2021-11-13 18:40:10', '2021-11-13 18:40:10', '2021-11-13 13:10:10', '2021-11-13 13:10:10'),
(164, 1, NULL, 17, 200, 169281, 'credit', 'game', 'earnings', '', '2021-11-13 18:40:42', '2021-11-13 18:40:42', '2021-11-13 13:10:42', '2021-11-13 13:10:42'),
(165, 1, NULL, 17, 2, 169283, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:40:42', '2021-11-13 18:40:42', '2021-11-13 13:10:42', '2021-11-13 13:10:42'),
(166, 1, NULL, 17, 200, 169481, 'credit', 'game', 'earnings', '', '2021-11-13 18:40:43', '2021-11-13 18:40:43', '2021-11-13 13:10:43', '2021-11-13 13:10:43'),
(167, 1, NULL, 17, 2, 169483, 'credit', 'bonus', 'gulkan_points', '', '2021-11-13 18:40:43', '2021-11-13 18:40:43', '2021-11-13 13:10:43', '2021-11-13 13:10:43'),
(168, 1, NULL, 1, -100, 169381, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:54', '2021-11-15 11:54:54', '2021-11-15 06:24:54', '2021-11-15 06:24:54'),
(169, 1, NULL, 1, -100, 169281, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:55', '2021-11-15 11:54:55', '2021-11-15 06:24:55', '2021-11-15 06:24:55'),
(170, 1, NULL, 1, -100, 169181, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:55', '2021-11-15 11:54:55', '2021-11-15 06:24:55', '2021-11-15 06:24:55'),
(171, 1, NULL, 1, -100, 169081, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:56', '2021-11-15 11:54:56', '2021-11-15 06:24:56', '2021-11-15 06:24:56'),
(172, 1, NULL, 1, -100, 169081, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:56', '2021-11-15 11:54:56', '2021-11-15 06:24:56', '2021-11-15 06:24:56'),
(173, 1, NULL, 1, -1000, 168081, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:58', '2021-11-15 11:54:58', '2021-11-15 06:24:58', '2021-11-15 06:24:58'),
(174, 1, NULL, 1, -1000, 167081, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:54:59', '2021-11-15 11:54:59', '2021-11-15 06:24:59', '2021-11-15 06:24:59'),
(175, 1, NULL, 1, -1000, 166081, 'debit', 'game', 'earnings', NULL, '2021-11-15 11:55:00', '2021-11-15 11:55:00', '2021-11-15 06:25:00', '2021-11-15 06:25:00'),
(176, 1, 'Ace', 177, 200, 166281, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:30', '2021-11-15 11:55:30', '2021-11-15 06:25:30', '2021-11-15 06:25:30'),
(177, 1, 'Ace', 177, 2, 166283, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:31', '2021-11-15 11:55:31', '2021-11-15 06:25:31', '2021-11-15 06:25:31'),
(178, 1, 'Ace', 177, 200, 166481, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:32', '2021-11-15 11:55:32', '2021-11-15 06:25:32', '2021-11-15 06:25:32'),
(179, 1, 'Ace', 177, 2, 166483, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:32', '2021-11-15 11:55:32', '2021-11-15 06:25:32', '2021-11-15 06:25:32'),
(180, 1, 'Ace', 177, 200, 166681, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:32', '2021-11-15 11:55:32', '2021-11-15 06:25:32', '2021-11-15 06:25:32'),
(181, 1, 'Ace', 177, 200, 166681, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:32', '2021-11-15 11:55:32', '2021-11-15 06:25:32', '2021-11-15 06:25:32'),
(182, 1, 'Ace', 177, 2, 166683, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:32', '2021-11-15 11:55:32', '2021-11-15 06:25:32', '2021-11-15 06:25:32'),
(183, 1, 'Ace', 177, 2, 166683, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:32', '2021-11-15 11:55:32', '2021-11-15 06:25:32', '2021-11-15 06:25:32'),
(184, 1, 'Ace', 177, 2000, 168681, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:33', '2021-11-15 11:55:33', '2021-11-15 06:25:33', '2021-11-15 06:25:33'),
(185, 1, 'Ace', 177, 2000, 168681, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:33', '2021-11-15 11:55:33', '2021-11-15 06:25:33', '2021-11-15 06:25:33'),
(186, 1, 'Ace', 177, 20, 168701, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:33', '2021-11-15 11:55:33', '2021-11-15 06:25:33', '2021-11-15 06:25:33'),
(187, 1, 'Ace', 177, 20, 168701, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:34', '2021-11-15 11:55:34', '2021-11-15 06:25:34', '2021-11-15 06:25:34'),
(188, 1, 'Ace', 177, 2000, 170681, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:34', '2021-11-15 11:55:34', '2021-11-15 06:25:34', '2021-11-15 06:25:34'),
(189, 1, 'Ace', 177, 2000, 170681, 'credit', 'game', 'earnings', '', '2021-11-15 11:55:34', '2021-11-15 11:55:34', '2021-11-15 06:25:34', '2021-11-15 06:25:34'),
(190, 1, 'Ace', 177, 20, 170701, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:34', '2021-11-15 11:55:34', '2021-11-15 06:25:34', '2021-11-15 06:25:34'),
(191, 1, 'Ace', 177, 20, 170701, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 11:55:34', '2021-11-15 11:55:34', '2021-11-15 06:25:34', '2021-11-15 06:25:34'),
(192, 1, 'A User', 1, -10, 170671, 'debit', 'game', 'earnings', NULL, '2021-11-15 12:56:28', '2021-11-15 12:56:28', '2021-11-15 07:26:28', '2021-11-15 07:26:28'),
(193, 1, 'A User', 1, -10, 170661, 'debit', 'game', 'earnings', NULL, '2021-11-15 12:56:28', '2021-11-15 12:56:28', '2021-11-15 07:26:28', '2021-11-15 07:26:28'),
(194, 1, 'A User', 1, -10, 170651, 'debit', 'game', 'earnings', NULL, '2021-11-15 12:56:29', '2021-11-15 12:56:29', '2021-11-15 07:26:29', '2021-11-15 07:26:29'),
(195, 1, 'Ace', 214, 20, 170671, 'credit', 'game', 'earnings', '', '2021-11-15 12:56:32', '2021-11-15 12:56:32', '2021-11-15 07:26:32', '2021-11-15 07:26:32'),
(196, 1, 'Ace', 214, 20, 170671, 'credit', 'game', 'earnings', '', '2021-11-15 12:56:32', '2021-11-15 12:56:32', '2021-11-15 07:26:33', '2021-11-15 07:26:33'),
(197, 1, 'Ace', 214, 0.2, 170671.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 12:56:33', '2021-11-15 12:56:33', '2021-11-15 07:26:33', '2021-11-15 07:26:33'),
(198, 1, 'Ace', 214, 0.2, 170671.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 12:56:33', '2021-11-15 12:56:33', '2021-11-15 07:26:33', '2021-11-15 07:26:33'),
(199, 1, 'A User', 1, -10, 170681, 'debit', 'game', 'earnings', NULL, '2021-11-15 12:57:11', '2021-11-15 12:57:11', '2021-11-15 07:27:11', '2021-11-15 07:27:11'),
(200, 1, 'A User', 1, -10, 170671, 'debit', 'game', 'earnings', NULL, '2021-11-15 12:57:19', '2021-11-15 12:57:19', '2021-11-15 07:27:19', '2021-11-15 07:27:19'),
(201, 1, 'A User', 1, -10, 170661, 'debit', 'game', 'earnings', NULL, '2021-11-15 12:57:20', '2021-11-15 12:57:20', '2021-11-15 07:27:21', '2021-11-15 07:27:21'),
(202, 1, 'Ace', 215, 20, 170681, 'credit', 'game', 'earnings', '', '2021-11-15 12:57:36', '2021-11-15 12:57:36', '2021-11-15 07:27:36', '2021-11-15 07:27:36'),
(203, 1, 'Ace', 215, 0.2, 170681.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 12:57:37', '2021-11-15 12:57:37', '2021-11-15 07:27:37', '2021-11-15 07:27:37'),
(204, 1, 'A User', 1, -10, 170691, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:03:45', '2021-11-15 14:03:45', '2021-11-15 08:33:45', '2021-11-15 08:33:45'),
(205, 1, 'A User', 1, -10, 170681, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:03:46', '2021-11-15 14:03:46', '2021-11-15 08:33:46', '2021-11-15 08:33:46'),
(206, 1, 'A User', 1, -10, 170671, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:03:49', '2021-11-15 14:03:49', '2021-11-15 08:33:49', '2021-11-15 08:33:49'),
(207, 1, 'Ace', 223, 20, 170691, 'credit', 'game', 'earnings', '', '2021-11-15 14:04:11', '2021-11-15 14:04:11', '2021-11-15 08:34:11', '2021-11-15 08:34:11'),
(208, 1, 'Ace', 223, 0.2, 170691.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 14:04:12', '2021-11-15 14:04:12', '2021-11-15 08:34:12', '2021-11-15 08:34:12'),
(209, 1, 'A User', 1, -10, 170701, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:04:47', '2021-11-15 14:04:47', '2021-11-15 08:34:47', '2021-11-15 08:34:47'),
(210, 1, 'A User', 1, -10, 170691, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:04:54', '2021-11-15 14:04:54', '2021-11-15 08:34:54', '2021-11-15 08:34:54'),
(211, 1, 'A User', 1, -10, 170681, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:04:57', '2021-11-15 14:04:57', '2021-11-15 08:34:57', '2021-11-15 08:34:57'),
(212, 1, 'A User', 1, -10, 170671, 'debit', 'game', 'earnings', NULL, '2021-11-15 14:05:07', '2021-11-15 14:05:07', '2021-11-15 08:35:07', '2021-11-15 08:35:07'),
(213, 1, 'Ace', 224, 20, 170691, 'credit', 'game', 'earnings', '', '2021-11-15 14:05:11', '2021-11-15 14:05:11', '2021-11-15 08:35:11', '2021-11-15 08:35:11'),
(214, 1, 'Ace', 224, 0.2, 170691.2, 'credit', 'bonus', 'gulkan_points', '', '2021-11-15 14:05:11', '2021-11-15 14:05:11', '2021-11-15 08:35:11', '2021-11-15 08:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawRequests`
--

CREATE TABLE `withdrawRequests` (
  `id` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `bankDetails` text COLLATE utf8mb4_general_ci,
  `date` date DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `status` enum('pending','hold','rejected','completed','failed') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminEarnings`
--
ALTER TABLE `adminEarnings`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `depositRequests`
--
ALTER TABLE `depositRequests`
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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- Indexes for table `taskBonus`
--
ALTER TABLE `taskBonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userDailyBonus`
--
ALTER TABLE `userDailyBonus`
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
-- AUTO_INCREMENT for table `adminEarnings`
--
ALTER TABLE `adminEarnings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- AUTO_INCREMENT for table `depositRequests`
--
ALTER TABLE `depositRequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gamePlays`
--
ALTER TABLE `gamePlays`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `gamePositions`
--
ALTER TABLE `gamePositions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Settings`
--
ALTER TABLE `Settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `taskBonus`
--
ALTER TABLE `taskBonus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userDailyBonus`
--
ALTER TABLE `userDailyBonus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `walletHistories`
--
ALTER TABLE `walletHistories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `withdrawRequests`
--
ALTER TABLE `withdrawRequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
