-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 03, 2021 at 09:05 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

DROP TABLE IF EXISTS `histories`;
CREATE TABLE IF NOT EXISTS `histories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paying_person` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `histories_order_id_foreign` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `order_id`, `package_name`, `paying_person`, `package_type`, `created_at`, `updated_at`) VALUES
(2, 4, 'package 1', '02-00 PAX', 'Standard', '2021-01-03 14:53:08', '2021-01-03 14:53:08'),
(3, 4, 'package 2', '05-06 PAX', 'Deluxe', '2021-01-03 14:53:08', '2021-01-03 14:53:08'),
(4, 4, 'package 3', '09-10 PAX', 'Luxury', '2021-01-03 14:53:08', '2021-01-03 14:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_01_03_171046_create_product_stocks_table', 1),
(4, '2021_01_03_172333_create_orders_table', 1),
(5, '2021_01_03_172349_create_histories_table', 1),
(7, '2021_01_03_200555_create_packages_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `total`, `created_at`, `updated_at`) VALUES
(4, 'admin', 'Los Angeles, California', 54360, '2021-01-03 14:53:08', '2021-01-03 14:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` enum('Package 1','Package 2','Package 3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `person` enum('02-00 PAX','03-04 PAX','05-06 PAX','07-08 PAX','09-10 PAX') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Standard','Deluxe','Luxury') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `person`, `type`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Package 1', '02-00 PAX', 'Standard', 12840, NULL, NULL),
(2, 'Package 1', '02-00 PAX', 'Deluxe', 14640, NULL, NULL),
(3, 'Package 1', '02-00 PAX', 'Luxury', 17160, NULL, NULL),
(4, 'Package 1', '03-04 PAX', 'Standard', 9840, NULL, NULL),
(5, 'Package 1', '03-04 PAX', 'Deluxe', 11880, NULL, NULL),
(6, 'Package 1', '03-04 PAX', 'Luxury', 15120, NULL, NULL),
(7, 'Package 1', '05-06 PAX', 'Standard', 6840, NULL, NULL),
(8, 'Package 1', '05-06 PAX', 'Deluxe', 8640, NULL, NULL),
(9, 'Package 1', '05-06 PAX', 'Luxury', 11760, NULL, NULL),
(10, 'Package 1', '07-08 PAX', 'Standard', 5880, NULL, NULL),
(11, 'Package 1', '07-08 PAX', 'Deluxe', 7560, NULL, NULL),
(12, 'Package 1', '07-08 PAX', 'Luxury', 10440, NULL, NULL),
(13, 'Package 1', '09-10 PAX', 'Standard', 4680, NULL, NULL),
(14, 'Package 1', '09-10 PAX', 'Deluxe', 6600, NULL, NULL),
(15, 'Package 1', '09-10 PAX', 'Luxury', 9360, NULL, NULL),
(16, 'Package 2', '02-00 PAX', 'Standard', 16920, NULL, NULL),
(17, 'Package 2', '02-00 PAX', 'Deluxe', 20040, NULL, NULL),
(18, 'Package 2', '02-00 PAX', 'Luxury', 26400, NULL, NULL),
(19, 'Package 2', '03-04 PAX', 'Standard', 13440, NULL, NULL),
(20, 'Package 2', '03-04 PAX', 'Deluxe', 17520, NULL, NULL),
(21, 'Package 2', '03-04 PAX', 'Luxury', 23880, NULL, NULL),
(22, 'Package 2', '05-06 PAX', 'Standard', 9720, NULL, NULL),
(23, 'Package 2', '05-06 PAX', 'Deluxe', 13680, NULL, NULL),
(24, 'Package 2', '05-06 PAX', 'Luxury', 19320, NULL, NULL),
(25, 'Package 2', '07-08 PAX', 'Standard', 8520, NULL, NULL),
(26, 'Package 2', '07-08 PAX', 'Deluxe', 11880, NULL, NULL),
(27, 'Package 2', '07-08 PAX', 'Luxury', 17280, NULL, NULL),
(28, 'Package 2', '09-10 PAX', 'Standard', 7320, NULL, NULL),
(29, 'Package 2', '09-10 PAX', 'Deluxe', 10680, NULL, NULL),
(30, 'Package 2', '09-10 PAX', 'Luxury', 15960, NULL, NULL),
(31, 'Package 3', '02-00 PAX', 'Standard', 20640, NULL, NULL),
(32, 'Package 3', '02-00 PAX', 'Deluxe', 25800, NULL, NULL),
(33, 'Package 3', '02-00 PAX', 'Luxury', 39960, NULL, NULL),
(34, 'Package 3', '03-04 PAX', 'Standard', 16920, NULL, NULL),
(35, 'Package 3', '03-04 PAX', 'Deluxe', 23160, NULL, NULL),
(36, 'Package 3', '03-04 PAX', 'Luxury', 38640, NULL, NULL),
(37, 'Package 3', '05-06 PAX', 'Standard', 12600, NULL, NULL),
(38, 'Package 3', '05-06 PAX', 'Deluxe', 18120, NULL, NULL),
(39, 'Package 3', '05-06 PAX', 'Luxury', 33000, NULL, NULL),
(40, 'Package 3', '07-08 PAX', 'Standard', 10920, NULL, NULL),
(41, 'Package 3', '07-08 PAX', 'Deluxe', 16200, NULL, NULL),
(42, 'Package 3', '07-08 PAX', 'Luxury', 30360, NULL, NULL),
(43, 'Package 3', '09-10 PAX', 'Standard', 9720, NULL, NULL),
(44, 'Package 3', '09-10 PAX', 'Deluxe', 14760, NULL, NULL),
(45, 'Package 3', '09-10 PAX', 'Luxury', 27840, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
CREATE TABLE IF NOT EXISTS `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `name`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Order1', 23, 23232, '2021-01-03 12:54:09', '2021-01-03 12:54:09'),
(2, 'Order2', 34, 343434, '2021-01-03 12:54:09', '2021-01-03 12:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
