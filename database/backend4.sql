-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 19 Ağu 2026, 10:40:13
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend4`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `colors`
--

INSERT INTO `colors` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Red', 'red', '2026-08-19 04:23:00', '2026-08-19 04:23:00'),
(3, 'Green', 'green', '2026-08-19 04:27:21', '2026-08-19 04:27:21'),
(4, 'Blue', 'blue', '2026-08-19 04:27:28', '2026-08-19 04:27:28'),
(5, 'Purple', 'purple', '2026-08-19 04:27:42', '2026-08-19 04:27:42'),
(6, 'Black', 'black', '2026-08-19 04:27:54', '2026-08-19 04:27:54'),
(7, 'Orange', 'orange', '2026-08-19 04:28:02', '2026-08-19 04:28:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `color_product`
--

CREATE TABLE `color_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `color_product`
--

INSERT INTO `color_product` (`id`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(1, 3, 2, NULL, NULL),
(2, 3, 4, NULL, NULL),
(3, 3, 5, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 4, 3, NULL, NULL),
(6, 4, 4, NULL, NULL),
(7, 5, 2, NULL, NULL),
(8, 5, 3, NULL, NULL),
(9, 5, 4, NULL, NULL),
(10, 5, 7, NULL, NULL),
(11, 6, 5, NULL, NULL),
(12, 6, 6, NULL, NULL),
(13, 7, 3, NULL, NULL),
(14, 7, 5, NULL, NULL),
(15, 7, 7, NULL, NULL),
(16, 8, 3, NULL, NULL),
(17, 8, 5, NULL, NULL),
(18, 8, 7, NULL, NULL),
(19, 9, 3, NULL, NULL),
(20, 9, 5, NULL, NULL),
(21, 10, 3, NULL, NULL),
(22, 10, 4, NULL, NULL),
(23, 10, 5, NULL, NULL),
(24, 11, 2, NULL, NULL),
(25, 11, 3, NULL, NULL),
(26, 11, 5, NULL, NULL),
(27, 12, 2, NULL, NULL),
(28, 12, 4, NULL, NULL),
(29, 12, 5, NULL, NULL),
(30, 13, 2, NULL, NULL),
(31, 13, 6, NULL, NULL),
(32, 13, 7, NULL, NULL),
(33, 14, 4, NULL, NULL),
(34, 14, 5, NULL, NULL),
(35, 15, 2, NULL, NULL),
(36, 15, 4, NULL, NULL),
(37, 15, 5, NULL, NULL),
(38, 16, 2, NULL, NULL),
(39, 16, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_18_124256_create_roles_table', 1),
(5, '2026_08_18_124304_create_role_users_table', 1),
(6, '2026_08_18_140639_create_colors_table', 2),
(7, '2026_08_18_140647_create_sizes_table', 2),
(8, '2026_08_18_140654_create_products_table', 2),
(9, '2026_08_18_140933_create_color_product_table', 2),
(10, '2026_08_18_140946_create_product_size_table', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `quantity`, `price`, `description`, `thumbnail`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Men 1', 'men-1', 12, 12.33, 'Consectetur vendor elit leo consectetur nisi vendor nisi. Ipsum eiusmod consectetur tellus elementum consectetur. Elementum sed aenean eiusmod. Consectetur nisi eiusmod nisi aenean vivamus semper ipsum eiusmod. Elementum ipsum elementum. Semper elementum. Tellus sit ipsum nisi. Ipsum elit lorem sed tellus vendor. Eiusmod vivamus dolor. Vendor vivamus porttitor sit eiusmod. Vendor dolor elementum leo. Aenean consectetur elementum nisi ipsum tellus. Nisi eiusmod semper. Sed. Ipsum. Elit aenean eiusmod nisi porttitor. Sed sit. Sed vendor tellus consectetur aenean sit. Lorem leo dolor consectetur nisi lorem. Vendor elit lorem tellus porttitor elementum. Eiusmod elit vendor lorem eiusmod. Vendor sed porttitor elit. Vendor.', 'storage/images/product/Xq4Xcw6njhacIEufrrt1HGXC0afLcBsEOTTwCAoL.jpg', 1, '2026-08-19 05:37:57', '2026-08-19 05:37:57'),
(5, 'Men 2', 'men-2', 12, 12.45, 'Vivamus sed porttitor vivamus elementum. Sit elit vendor sit sed. Porttitor leo elementum sit vivamus sit. Tellus elit. Nisi aenean eiusmod semper lorem sit. Sed lorem tellus porttitor. Elit leo. Ipsum nisi aenean consectetur leo sed. Sit aenean porttitor aenean vendor vivamus. Nisi eiusmod vendor nisi sit eiusmod. Semper lorem. Ipsum leo porttitor tellus. Elementum porttitor. Sit vivamus tellus elit lorem eiusmod aenean. Vivamus aenean vivamus eiusmod sit nisi sed nisi lorem. Semper sed aenean sed consectetur leo. Vivamus dolor leo. Semper vivamus nisi leo sed lorem aenean. Dolor ipsum lorem sit dolor consectetur leo sit. Vivamus consectetur nisi lorem.', 'storage/images/product/3uUfh7wWhOb3C8KFU7dV2H4mEJd2mLd87wAi01rD.jpg', 1, '2026-08-19 05:38:22', '2026-08-19 05:38:22'),
(6, 'Men 3', 'men-3', 12, 23.40, 'Sit porttitor nisi elit leo porttitor. Consectetur vivamus sed. Dolor. Lorem eiusmod leo elit porttitor ipsum. Eiusmod consectetur eiusmod vivamus consectetur. Sed aenean vendor nisi. Dolor eiusmod nisi elementum eiusmod. Consectetur lorem leo sit ipsum. Leo. Ipsum dolor vendor tellus ipsum consectetur. Sed dolor sit porttitor semper sit. Leo semper. Consectetur elit porttitor tellus. Leo vendor. Elementum sit nisi ipsum. Aenean lorem nisi. Lorem ipsum porttitor. Dolor tellus dolor elementum. Tellus porttitor vivamus sed consectetur leo porttitor. Elementum dolor sed. Porttitor. Dolor vendor elit. Vivamus dolor sit elit. Consectetur dolor. Porttitor consectetur vivamus sit porttitor vivamus. Consectetur eiusmod elit sed.', 'storage/images/product/uE8zVCz65ehh5hZzbQktzuRd6S8w79NOSHEnq0tR.jpg', 1, '2026-08-19 05:38:48', '2026-08-19 05:38:48'),
(7, 'Men 4', 'men-4', 2, 23.50, 'Eiusmod dolor leo eiusmod porttitor eiusmod. Sit. Aenean tellus nisi elit vendor. Elementum semper ipsum porttitor elit lorem. Dolor aenean. Lorem. Porttitor vivamus leo. Eiusmod aenean lorem ipsum tellus dolor aenean lorem. Nisi vendor lorem vendor. Porttitor vendor ipsum elementum vendor vivamus. Aenean vendor elementum porttitor elementum lorem. Aenean nisi consectetur semper elementum sed. Sit tellus ipsum nisi consectetur sed nisi eiusmod lorem. Leo vivamus lorem. Consectetur sit leo semper. Dolor vivamus. Sit ipsum eiusmod elementum ipsum. Leo. Nisi dolor elementum tellus vendor elit. Sit eiusmod vendor leo lorem vendor sed. Semper porttitor vivamus consectetur. Ipsum lorem sit lorem sed.', 'storage/images/product/yhh1aN29muVox4dm3QQIv1sJwGd7Y46GHtsaJFd9.jpg', 1, '2026-08-19 05:39:21', '2026-08-19 05:39:21'),
(8, 'Men 5', 'men-5', 33, 32.10, 'Tellus dolor vendor sit semper nisi tellus vivamus ipsum. Porttitor vivamus sed porttitor tellus vivamus dolor semper consectetur. Elementum tellus ipsum. Nisi dolor nisi. Elementum elit porttitor sed semper dolor. Vendor consectetur dolor ipsum elementum sed. Consectetur vivamus elit porttitor. Semper nisi porttitor ipsum sit. Tellus semper elit. Vivamus. Aenean ipsum aenean semper consectetur. Lorem. Nisi lorem semper consectetur semper. Dolor lorem tellus. Vivamus eiusmod leo consectetur tellus dolor eiusmod. Consectetur sed. Eiusmod vivamus elementum nisi aenean eiusmod vivamus lorem. Semper nisi semper sit lorem. Leo vendor sit nisi sit. Semper elit lorem elementum aenean vivamus. Aenean sit. Porttitor dolor.', 'storage/images/product/uz8KizryTE7u8QOHKsbTu9tPzOuD82qHiaZiFNuc.jpg', 1, '2026-08-19 05:39:47', '2026-08-19 05:39:47'),
(9, 'Old Men 1', 'old-men-1', 32, 32.10, 'Elit semper sit sed elementum ipsum vivamus aenean. Tellus vivamus eiusmod sed. Vendor elementum eiusmod. Sed elementum tellus. Consectetur sit. Eiusmod semper elementum vivamus. Vendor lorem leo sit aenean leo eiusmod nisi. Vendor lorem elit. Porttitor. Dolor sit consectetur nisi. Tellus vivamus nisi porttitor dolor. Ipsum nisi tellus vivamus lorem. Tellus elementum consectetur vendor sit dolor. Aenean consectetur eiusmod consectetur ipsum vendor porttitor. Nisi vivamus dolor sit porttitor sit vivamus. Eiusmod dolor. Lorem porttitor sed. Semper nisi tellus. Elit aenean leo dolor eiusmod elementum. Dolor elit porttitor vendor semper leo vivamus. Dolor consectetur nisi eiusmod lorem aenean sed. Dolor leo.', 'storage/images/product/Wkmj1UOKr6rZ0Igp50d0GxBPC4lQmbM9Iwy6nStw.jpg', 1, '2026-08-19 05:40:26', '2026-08-19 05:40:26'),
(10, 'Old Men 2', 'old-men-2', 21, 21.20, 'Porttitor elit tellus lorem tellus sit ipsum. Nisi sed sit lorem sit vivamus sit. Elementum vendor elementum ipsum. Sit vivamus. Nisi. Sit vendor eiusmod dolor. Semper elit porttitor nisi elit. Porttitor leo. Lorem semper vendor. Leo ipsum elit ipsum consectetur. Semper tellus porttitor eiusmod sed. Semper tellus vendor sit. Tellus sit aenean vendor dolor sed nisi. Eiusmod consectetur elementum sed porttitor eiusmod tellus. Porttitor eiusmod sit. Lorem leo lorem elementum lorem consectetur. Ipsum lorem vivamus dolor aenean vivamus leo consectetur. Porttitor elit aenean porttitor semper nisi vivamus vendor. Elit vendor. Ipsum. Lorem vendor vivamus eiusmod. Vivamus ipsum elementum aenean. Tellus.', 'storage/images/product/dkuLKQ1aJGCUvyf6VDoemH9YqZrAmVrO7LNxW9rl.jpg', 1, '2026-08-19 05:41:01', '2026-08-19 05:41:01'),
(11, 'Old Men 3', 'old-men-3', 42, 28.50, 'Consectetur porttitor semper dolor tellus vendor aenean. Vendor eiusmod aenean nisi vivamus. Elit ipsum semper. Ipsum porttitor aenean dolor consectetur nisi. Tellus porttitor semper sed. Semper vivamus eiusmod semper sit. Vivamus porttitor vivamus elit elementum sit. Dolor ipsum sed vendor eiusmod leo eiusmod vivamus vendor. Leo tellus dolor. Eiusmod porttitor. Sit leo sed elementum. Semper vivamus. Consectetur porttitor aenean tellus sit lorem tellus dolor. Tellus sit. Semper elementum ipsum nisi. Elementum dolor sit aenean sed dolor nisi. Vendor leo nisi. Lorem sed lorem eiusmod. Sit. Dolor eiusmod lorem tellus nisi. Leo nisi elementum tellus elementum aenean semper elit nisi. Vendor.', 'storage/images/product/FAMffZuzpPuvwkV50irBLkM5SLwZbJHwiOflTrdK.jpg', 1, '2026-08-19 05:41:41', '2026-08-19 05:41:41'),
(12, 'Old Men 4', 'old-men-4', 54, 26.20, 'Elementum consectetur porttitor sed ipsum dolor. Consectetur porttitor vendor semper elit eiusmod. Elementum eiusmod sit tellus. Aenean dolor. Elit porttitor. Vivamus tellus consectetur aenean vivamus. Ipsum leo ipsum vendor porttitor. Ipsum sit leo semper dolor elementum. Sit eiusmod lorem nisi. Elit vivamus. Ipsum semper sed. Tellus vendor vivamus tellus aenean tellus elit aenean semper. Leo. Dolor aenean lorem elementum porttitor eiusmod nisi lorem. Aenean semper. Lorem aenean lorem leo consectetur vendor elementum. Sed consectetur aenean vendor consectetur elit vivamus eiusmod. Nisi sit tellus vendor. Tellus leo vivamus nisi. Semper eiusmod. Porttitor dolor consectetur aenean dolor tellus. Consectetur vivamus sed. Leo.', 'storage/images/product/VIKvNC2Tf8LD8AHGrwHuIkkPb7hSPbdKqor8LpQs.jpg', 1, '2026-08-19 05:42:41', '2026-08-19 05:42:41'),
(13, 'Old Man Tshirt 5', 'old-man-tshirt-5', 6, 42.10, 'Eiusmod consectetur sit nisi vendor lorem ipsum. Semper sit elementum porttitor elementum ipsum sit. Vendor lorem vivamus eiusmod vivamus sit semper. Dolor porttitor eiusmod vendor. Dolor elit consectetur dolor porttitor consectetur sit. Vendor dolor elit vivamus elementum tellus consectetur dolor. Consectetur sit tellus ipsum semper. Sit semper porttitor sit. Aenean sit semper leo ipsum nisi ipsum. Vivamus sit eiusmod elementum semper dolor tellus. Semper tellus sed vendor nisi sed dolor. Aenean ipsum. Tellus nisi ipsum aenean semper porttitor aenean nisi. Sit nisi vivamus porttitor vivamus consectetur elementum tellus. Leo eiusmod nisi vendor sit eiusmod vivamus elementum. Leo consectetur vendor vivamus.', 'storage/images/product/jb2e8B8p2Z0LWBABfES2Tbaf3YrffJjqt7o5WpS3.jpg', 1, '2026-08-19 05:43:24', '2026-08-19 05:43:24'),
(14, 'Women 1', 'women-1', 54, 27.10, 'Leo ipsum porttitor sed eiusmod sed. Elementum elit eiusmod consectetur semper consectetur. Vendor nisi. Vendor aenean consectetur vendor. Dolor leo eiusmod tellus vendor sit. Sed consectetur nisi sed. Nisi elit nisi elit. Vivamus sit porttitor. Semper consectetur tellus dolor vendor. Semper lorem. Nisi lorem aenean semper nisi tellus. Vivamus tellus. Elementum eiusmod consectetur porttitor. Tellus eiusmod nisi dolor tellus nisi. Leo dolor semper. Aenean vivamus. Lorem consectetur elit semper eiusmod. Tellus sed. Vendor dolor nisi. Sit vendor. Vivamus nisi dolor semper lorem eiusmod ipsum. Tellus sed leo elit tellus porttitor. Ipsum vivamus semper elementum porttitor vivamus. Sit nisi vivamus nisi.', 'storage/images/product/qnMjKTeTLpYWUZr4pTJvCG6JfPywKAKMBStQ1vxe.jpg', 1, '2026-08-19 05:44:01', '2026-08-19 05:44:01'),
(15, 'Women 2', 'women-2', 76, 29.20, 'Tellus elit dolor nisi vendor consectetur. Elementum consectetur ipsum. Lorem tellus semper. Dolor ipsum sit eiusmod. Dolor lorem. Eiusmod sed elementum porttitor vivamus leo. Ipsum. Semper vendor eiusmod aenean elit. Eiusmod elit sit consectetur ipsum. Lorem. Vivamus aenean leo lorem dolor vivamus. Consectetur nisi aenean. Nisi sed lorem porttitor tellus. Nisi vivamus aenean porttitor aenean. Elementum vendor dolor aenean semper dolor aenean eiusmod. Porttitor lorem vendor leo nisi sed nisi tellus vivamus. Tellus eiusmod ipsum semper vivamus sed. Porttitor semper. Leo. Porttitor lorem elementum sed. Vivamus sit consectetur. Vivamus consectetur vendor. Nisi semper ipsum sed sit. Nisi leo sit lorem.', 'storage/images/product/7qYBDUVJaSELHOThtHoWggyIsQTIpRWjwi48CrSC.jpg', 0, '2026-08-19 05:44:36', '2026-08-19 05:44:36'),
(16, 'Women 3', 'women-3', 33, 33.60, 'Porttitor lorem consectetur sed vendor sit vivamus. Elit vendor aenean vendor porttitor consectetur sit. Consectetur nisi dolor eiusmod. Vivamus dolor. Leo elementum aenean leo ipsum vendor consectetur. Dolor leo nisi. Dolor consectetur. Aenean porttitor sit. Aenean porttitor vivamus consectetur tellus eiusmod vendor. Consectetur nisi eiusmod. Elementum aenean vivamus sit. Ipsum eiusmod elementum semper consectetur sit elit. Sed aenean vivamus dolor. Elit sit eiusmod consectetur tellus. Leo eiusmod porttitor sit eiusmod elementum eiusmod. Elementum nisi sed aenean tellus vivamus. Eiusmod tellus semper tellus eiusmod semper. Aenean. Vendor elementum vivamus sed aenean. Elit vendor aenean dolor semper. Tellus consectetur sed. Eiusmod sed.', 'storage/images/product/G10gMRLp1O0dXglycfiPbiJaaeyRwDEWJ0W62CQg.jpg', 1, '2026-08-19 05:45:02', '2026-08-19 07:35:06');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_size`
--

CREATE TABLE `product_size` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product_size`
--

INSERT INTO `product_size` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(3, 4, 1, NULL, NULL),
(4, 4, 2, NULL, NULL),
(5, 4, 3, NULL, NULL),
(6, 5, 1, NULL, NULL),
(7, 5, 2, NULL, NULL),
(8, 5, 4, NULL, NULL),
(9, 6, 3, NULL, NULL),
(10, 6, 4, NULL, NULL),
(11, 7, 2, NULL, NULL),
(12, 7, 4, NULL, NULL),
(13, 8, 1, NULL, NULL),
(14, 8, 2, NULL, NULL),
(15, 9, 2, NULL, NULL),
(16, 9, 3, NULL, NULL),
(17, 10, 1, NULL, NULL),
(18, 10, 2, NULL, NULL),
(19, 10, 3, NULL, NULL),
(20, 11, 1, NULL, NULL),
(21, 11, 3, NULL, NULL),
(22, 11, 4, NULL, NULL),
(23, 12, 4, NULL, NULL),
(24, 12, 5, NULL, NULL),
(25, 13, 1, NULL, NULL),
(26, 13, 4, NULL, NULL),
(27, 13, 7, NULL, NULL),
(28, 14, 1, NULL, NULL),
(29, 14, 2, NULL, NULL),
(30, 14, 3, NULL, NULL),
(31, 15, 3, NULL, NULL),
(32, 15, 4, NULL, NULL),
(36, 16, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gi9kSrWrvs3a7GfUN1U51cgqrkquhS7B4GRK13ad', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ2UThhZjZzd3BKRVlLVXNIUWpiT0p0T2tKSFN1cUlPbnNJd29oVGwzIiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluXC9wcm9kdWN0Iiwicm91dGUiOiJhZG1pbi5wcm9kdWN0LmluZGV4In0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoxfQ==', 1787135706);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'XXS', 'xxs', '2026-08-19 04:31:52', '2026-08-19 04:31:52'),
(2, 'XS', 'xs', '2026-08-19 04:31:57', '2026-08-19 04:31:57'),
(3, 'S', 's', '2026-08-19 04:32:02', '2026-08-19 04:32:02'),
(4, 'M', 'm', '2026-08-19 04:32:08', '2026-08-19 04:32:08'),
(5, 'L', 'l', '2026-08-19 04:32:15', '2026-08-19 04:32:15'),
(6, 'XL', 'xl', '2026-08-19 04:32:21', '2026-08-19 04:32:21'),
(7, 'XXL', 'xxl', '2026-08-19 04:32:27', '2026-08-19 04:32:27');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `profile_completed` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `address`, `city`, `zip_code`, `profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sezer Ünalmış', 'admin@email.com', NULL, '$2y$12$gphajZU4E2/WFXWR1u2bd.lHGrTRhsmfZ9ihJeTKdi5NkL25WM9pi', '', '', '', 0, NULL, NULL, '2026-08-18 10:35:05');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Tablo için indeksler `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `color_product`
--
ALTER TABLE `color_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_size_product_id_foreign` (`product_id`),
  ADD KEY `product_size_size_id_foreign` (`color_id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_size_product_id_foreign` (`product_id`),
  ADD KEY `product_size_size_id_foreign` (`size_id`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `product_size_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
