-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 05, 2025 at 09:38 PM
-- Server version: 8.0.42-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatsender`
--

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE `apps` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `device_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'category',
  `status` int NOT NULL DEFAULT '1',
  `is_featured` int NOT NULL DEFAULT '1',
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `type`, `status`, `is_featured`, `lang`, `created_at`, `updated_at`) VALUES
(6, 'Chatbot', 'chatbot', 'blog_category', 1, 1, 'en', '2023-03-06 18:35:06', '2023-03-06 18:35:06'),
(7, 'Target marketing', 'target-marketing', 'blog_category', 1, 1, 'en', '2023-03-06 18:35:30', '2023-03-06 18:35:30'),
(8, 'Button message', 'button-message', 'blog_category', 1, 1, 'en', '2023-03-06 18:36:44', '2023-03-06 18:36:44'),
(9, 'Template message', 'template-message', 'blog_category', 1, 1, 'en', '2023-03-06 18:36:50', '2023-03-06 18:36:50'),
(10, 'Location message', 'location-message', 'blog_category', 1, 1, 'en', '2023-03-06 18:37:56', '2023-03-06 18:37:56'),
(11, 'support', 'support', 'tags', 1, 1, 'en', '2023-03-06 18:38:24', '2023-03-06 18:38:24'),
(12, 'marketing', 'marketing', 'tags', 1, 1, 'en', '2023-03-06 18:38:46', '2023-03-06 18:38:46'),
(13, 'whatsapp', 'whatsapp', 'tags', 1, 1, 'en', '2023-03-06 18:39:05', '2023-03-06 18:39:05'),
(14, 'chatbot', 'chatbot', 'tags', 1, 1, 'en', '2023-03-06 18:39:16', '2023-03-06 18:39:16');

-- --------------------------------------------------------

--
-- Table structure for table `categorymetas`
--

CREATE TABLE `categorymetas` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `name`, `phone`, `created_at`, `updated_at`) VALUES
(784, 7, 'Livreur Mta3 Stouch', '21629282093@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(785, 7, '5alty Mounira', '21654667912@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(786, 7, 'Hbiba', '21698455551@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(787, 7, 'Robe De mariage', '21694615218@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(788, 7, 'Nahed', '21620884402@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(789, 7, 'Imen Arifi', '21696557275@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(790, 7, 'Tapis Électrique', '21690424145@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(791, 7, 'Delta Solaire', '21695001596@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(792, 7, 'Madame 3aliya', '21623982588@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(793, 7, 'Asouma', '21694213207@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(794, 7, 'Tata Ahlem', '21626392840@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(795, 7, 'Khawla Khannouchi', '21655642032@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(796, 7, 'Mis3ad', '21690426334@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(797, 7, 'Islem', '21620238967@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(798, 7, 'Chaima Cliente', '21629007329@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(799, 7, 'Omi Sabou7a', '21652083783@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(800, 7, 'Madame Chiraz', '21627692524@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(801, 7, 'Salma Jarti', '21650699988@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(802, 7, 'Tata Najwa', '21621055779@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(803, 7, 'Limem Pneu', '21624405835@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(804, 7, 'Dc Massage', '21653536054@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(805, 7, 'Mahdi 8ourabi', '21653878775@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(806, 7, 'Hiba', '21694611960@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(807, 7, 'Khaoula', '21698999667@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(808, 7, 'Amal Mabrouki', '21656512189@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(809, 7, 'Ghada Sbitar', '21651702508@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(810, 7, 'Besma Hannechi', '21658094091@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(811, 7, 'Hadil', '21627403831@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(812, 7, 'Rabia', '21652101123@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(813, 7, 'Amjed', '21624717955@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(814, 7, 'Ameni', '21627128203@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(815, 7, 'Chaker', '21654093920@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(816, 7, 'Nour Saad', '96181600409@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(817, 7, 'Amoula Med', '21629975001@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(818, 7, 'Nejia Achref', '21650602559@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(819, 7, 'Nejia', '21695663091@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(820, 7, 'Hanen Ali', '21651465120@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(821, 7, 'Faten Coif', '21698710166@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(822, 7, '5ali Youssef', '21622308341@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(823, 7, 'Cliente', '21623074337@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(824, 7, 'Omi Mbarka', '21626382008@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(825, 7, '5alty Hanen 2', '21646911333@s.whatsapp.net', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(826, 7, 'Frigo Sousse', '21655210253@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(827, 7, 'Hanin Bijou', '21653258164@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(828, 7, 'Om Zeineb', '21624044434@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(829, 7, 'Maissa Toufoula', '21625658139@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(830, 7, 'Samsar', '21656328414@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(831, 7, 'Gros Chlayek', '21622467686@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(832, 7, 'Ali Livreur', '21627895218@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(833, 7, '5alty Na3ima', '21628244497@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(834, 7, 'Latifa Hama', '21694453141@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(835, 7, 'Transporteur Moto', '21697638787@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(836, 7, 'Somaya WhatsApp', '21620662699@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(837, 7, 'Sihem Pub', '21697214187@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(838, 7, '22750693', '21622750693@s.whatsapp.net', '2025-06-23 20:33:10', '2025-06-23 20:33:10'),
(842, 9, 'Radhouane Ibn Tidert', '21698643364@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(843, 9, 'Zouhair Code', '21690501093@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(844, 9, 'Adel Gabes', '21698274335@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(845, 9, 'Whatss', '21629358867@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(846, 9, 'Oumaima', '21628508028@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(847, 9, 'Seifeddin  Etudiant', '21625284825@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(848, 9, 'Habibi', '21627128203@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(849, 9, 'Riadh RTCA', '21655648681@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(850, 9, 'Mahdi Usdt', '21654241940@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(851, 9, 'Mosaed', '21690426334@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(852, 9, 'Tarek Trad', '21629739034@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(853, 9, 'Imad  Frip Luxe ', '21656424316@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(854, 9, 'S Travel', '21658128545@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(855, 9, 'Yahia Daoued Montage', '21656253948@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(856, 9, 'Mehdi Hassen', '21625685298@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(857, 9, 'Fedi Ben Nsir', '21622244273@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(858, 9, 'Hannachi', '447404324351@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(859, 9, 'Abd Ennour', '21697956932@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(860, 9, 'Gosto Pizza', '21652735882@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(861, 9, 'Chokri Meryah', '21696133404@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(862, 9, 'Yahia Boudhina', '21653845623@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(863, 9, 'Ahmed Slimeni', '21627334204@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(864, 9, 'Adem Ben Mokded', '21629036384@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(865, 9, 'Aymen Chahed', '21655627548@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(866, 9, 'Rabia Hannachi', '21654005297@s.whatsapp.net', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(867, 9, 'Nour Bent Okhty', '21652806159@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(868, 9, 'Imad Khayati', '21628044000@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(869, 9, 'Nader Multicom', '21628838502@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(870, 9, 'Ghdira غديرة', '21622914212@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(871, 9, 'Fares Ben Salem', '21624522738@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(872, 9, 'Technicen Climatisation', '21626059431@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(873, 9, 'Aouidat Achref', '21697066866@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(874, 9, 'Yassine Ibrahim', '21658521083@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(875, 9, 'Kamel Zoghbi', '21627844887@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(876, 9, 'Issam Domotique', '21628800793@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(877, 9, 'Saber Lajili', '21698721665@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(878, 9, 'Ahmed Ben Nsir Nsibi', '21698115853@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(879, 9, 'Patric', '33780934367@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(880, 9, 'Lilya O Sport', '21652349239@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(881, 9, 'Chatgpt', '18002428478@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(882, 9, 'Anouar Younsi', '21625161530@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(883, 9, 'Yosra Krimi', '21650133056@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(884, 9, 'Amen Photographe', '21692567187@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(885, 9, 'aloui med abdelfatteh', '21695993933@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(886, 9, 'Peinture', '21695311526@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(887, 9, 'Bader', '21627303075@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(888, 9, 'Hosni Louage Sousse', '21620408163@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(889, 9, 'Smart Innovation', '21651954443@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(890, 9, 'Sam', '21651029610@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(891, 9, 'Bijouterie Bouzid Frere', '21698108902@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(892, 9, 'Salah Karay', '21697465610@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(893, 9, 'Wajdi Conduite', '21698429487@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(894, 9, 'Cheiko', '21620040030@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(895, 9, 'Ameni Fisque', '21695288875@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(896, 9, 'Salah', '21652321212@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(897, 9, 'Adam France ', '33782220132@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(898, 9, 'Financier', '21624439000@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(899, 9, 'Aymen Dbibi', '21654130000@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(900, 9, 'Hatem Fullstack Js', '21621789535@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(901, 9, 'Houssem Chaari', '21695993927@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(902, 9, 'Achref Chrif', '21620411673@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(903, 9, 'Legal Smart', '21654477911@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(904, 9, 'Kais Wel Aami', '218927580119@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(905, 9, 'Ibrahim Aidi', '21626444431@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(906, 9, 'Mounir Jebes', '21699812854@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(907, 9, 'Gerant Vivo', '21624415000@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(908, 9, 'Foued Bouhlel Sephax', '21698546473@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(909, 9, 'Zakaria Khilifi', '21620386965@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(910, 9, 'Rabia Okhty', '21652101123@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(911, 9, 'Anis Factoring Site Web', '21658453846@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(912, 9, 'Ramzi Ben Chaaben', '21655517758@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(913, 9, 'Wajih Marzouki', '21620449600@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(914, 9, 'Ste Lenda', '21644203777@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(915, 9, 'Bachir Telecom Krono Indus', '21698196839@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(916, 9, 'Emna', '21628785281@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(917, 9, 'Moto', '21623729450@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(918, 9, 'Khaled Youssef', '21656753084@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(919, 9, 'Mouna Hichri', '21624460690@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(920, 9, 'Whatsapp Blayah', '21623087324@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(921, 9, 'Saief  Precimed', '21655189287@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(922, 9, 'Youssef', '21698222253@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(923, 9, 'Solde Usdt 4.45', '21621712772@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(924, 9, 'Chaise El Zouhour', '21626430210@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(925, 9, 'Zribi Hamdi', '21658401255@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(926, 9, 'Livreur', '21697007433@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(927, 9, 'Hanen Hatem', '33634647324@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(928, 9, 'Ahmed Tayyari', '21698658344@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(929, 9, 'Mohamed Table', '21628874249@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(930, 9, 'Amine Chaari', '21698743877@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(931, 9, 'Yousef Diagnostic', '21658248214@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(932, 9, 'Hamza Etudiant Maxskills', '21655021142@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(933, 9, 'Wassim Stagaire', '21621500744@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(934, 9, 'Imad Bakir Car', '21625241342@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(935, 9, 'Afef  Ben Brahim', '21625833093@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(936, 9, 'Wassim Mourouj', '21625067837@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(937, 9, 'Hajer Dridi', '21624119500@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(938, 9, 'Bilel Bhk', '21658138996@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(939, 9, 'Sadok Debich', '21651556621@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(940, 9, 'Walid Turki', '21650691561@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(941, 9, 'Ayoub Néjem', '21622256251@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(942, 9, 'Monji Ben Yaaiish Ai', '21697624612@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(943, 9, 'Mohamed Abou Charekh', '21651027264@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(944, 9, 'Hamdi Ahmed', '33614543651@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(945, 9, 'Firas  Trabelsi', '21658616388@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(946, 9, 'Salah Mnakbi', '21620880102@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(947, 9, 'SAFA AMARA', '21620060593@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(948, 9, 'Technicien Clichard', '21655767716@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(949, 9, 'ELMABROUK DEVELOPMENT', '21654998153@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(950, 9, 'Lunara', '21621404025@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(951, 9, 'Firas  Trabelsi', '21629601310@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(952, 9, '2 Wheels', '21622187183@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(953, 9, 'Mohamed Salah Jben', '21623592343@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(954, 9, 'Emna Solhaji', '21620317566@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(955, 9, 'Farouk', '21626121877@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(956, 9, 'Hazem Ghazel', '21698798494@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(957, 9, 'Finioui', '21624942503@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(958, 9, '+216 26 392 840 Om Mosead', '21626392840@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(959, 9, 'Chaima Kanzari', '21698521172@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(960, 9, 'Mon Zayeni', '21625070307@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(961, 9, 'Mahdi Kanzari Moonlight', '21698521171@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(962, 9, 'Mouhidin Moto Ariana', '21655442293@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(963, 9, 'Inès Jlassi Premium Travel', '21626668728@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(964, 9, 'Arwa Chrikty', '21622242018@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(965, 9, 'Sameh Mansouri', '21629810235@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(966, 9, 'Houcine B', '21620727972@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(967, 9, 'Gsii Bizerte', '21620784160@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(968, 9, 'Mahmoud Trad', '21658213504@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(969, 9, 'Zied El Ayeb', '21629552239@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(970, 9, 'Aeg', '21620730749@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(971, 9, 'Dhekra Ben Ibrahim', '21627267504@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(972, 9, 'Mohamed Nsiby', '21622239799@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(973, 9, 'Saad Berrada', '21651239144@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(974, 9, 'Ahmed Ben Hmida Photovoltaique ', '21654150938@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(975, 9, 'Mohamed Ali Fadhel Etudiant Maxskills', '21690469994@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(976, 9, 'Houcem Najar', '21620705200@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(977, 9, 'Hamdi Zribi', '21620271084@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(978, 9, 'Mega Pc', '21629606000@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(979, 9, 'Achref', '21626968119@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(980, 9, 'Dali', '21629099232@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(981, 9, 'Wejden Stps', '21692024594@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(982, 9, 'Youssef Gharbi', '21625789309@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(983, 9, 'Anis Salh', '21622320665@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(984, 9, 'Slim Zribi', '21698576540@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(985, 9, 'Zouhour Elkron', '21695993943@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(986, 9, 'Kamel Hajjaji', '21624691891@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(987, 9, 'Chokri', '21695276237@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(988, 9, 'Ronine', '21698743155@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(989, 9, 'Sponsoring', '21621269949@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(990, 9, 'Mohamed Ouni', '21622934200@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(991, 9, 'Malek Dey Daly', '21624353747@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(992, 9, 'Mahmoud Dimesi Etudiant Maxskills', '21622953413@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(993, 9, 'Alassane', '21629758814@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(994, 9, 'Hassen Casa Look Design', '21627931279@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(995, 9, 'Helmi', '21625755290@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(996, 9, 'Ghassen Dougui Telecom', '21692414363@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(997, 9, 'Walid', '21628842486@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(998, 9, 'Riadh Seed', '21627437934@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(999, 9, 'Hakim Clicsoft', '21652000883@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1000, 9, 'Achref Safety', '21621011333@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1001, 9, 'Raoua Hmeda', '21628830960@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1002, 9, 'Olfa Karrat', '21695993925@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1003, 9, 'Docteur Abbas', '21653536054@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1004, 9, 'Farid Hamdi', '21625084895@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1005, 9, 'Kacem Sassi Elkron', '21695993918@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1006, 9, 'Bako Motors', '21652300054@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1007, 9, 'Oussema Guennichi', '21655359259@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1008, 9, 'Saief Dridi Louage', '21692269566@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1009, 9, 'Alassane', '21624322650@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1010, 9, 'Ahmed  Ghdira', '21629706204@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1011, 9, 'NUTREND.TUNISIE', '21627777416@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1012, 9, 'Besma Hannachi', '21658094091@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1013, 9, 'Mohamed Thabet ClicSoft ClicHard', '21658081526@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1014, 9, 'Mourad Fartouna', '21656328414@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1015, 9, 'Wajdi Pmi', '21621674107@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1016, 9, 'Chedia', '21629474990@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1017, 9, 'Ghassen Doggui ', '21655280602@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1018, 9, 'Ahmed Tayyari', '21698359300@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1019, 9, 'Amira Elkron Sousse', '21699193526@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1020, 9, 'Naser', '21629507869@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1021, 9, 'Muhammed Fatah Hannachi', '21629499214@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1022, 9, 'Yousef Gharbi', '21629686140@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1023, 9, 'Walid Turki', '21696691561@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1024, 9, 'El Meznel Laouina', '21653871552@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1025, 9, 'Yosri Dar El Amal', '21655953110@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1026, 9, 'Saad Berrada 2', '21655561269@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1027, 9, 'Alaa Bakir Rent Car', '21625000682@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1028, 9, 'Azouz', '21652240246@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1029, 9, 'Saief Eddin Bayaa', '21650752356@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1030, 9, 'Wiem Arvia', '21699857964@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1031, 9, 'Ikhlas  Shili Trading Company', '21623090661@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1032, 9, 'Khaled Slimi', '21652200059@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1033, 9, 'Rahma Graphico', '21653164725@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1034, 9, 'Tarek Htb Delivery', '21698946845@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1035, 9, 'Yassin Ooredoo', '21622129087@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1036, 9, 'Issam', '21698510214@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1037, 9, 'Naouel Autogox20', '21651212399@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1038, 9, 'Precimed Saief', '21695813439@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1039, 9, 'Hichem Aouini', '21654445719@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1040, 9, 'Amjed Ben Nsir', '21620684509@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1041, 9, 'Intissam Whats', '21629504161@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1042, 9, 'Thoura Hammemi', '21624521637@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1043, 9, 'Salah Mnakbi', '21698268796@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1044, 9, 'Fehmi  Beezaouia', '21653277668@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1045, 9, 'Yassin  Elouaer', '21650470495@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1046, 9, 'Technicien Ooredoo', '21625335444@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1047, 9, 'Seif Aeg', '21629242128@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1048, 9, 'Mondhor Meuble Korsi', '21650183818@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1049, 9, 'Sami Hchicha', '21698743875@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1050, 9, 'Hakim Elevateur', '21698308796@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1051, 9, 'Imed Forniseur Nikon', '21620231131@s.whatsapp.net', '2025-07-02 20:41:02', '2025-07-02 20:41:02'),
(1052, 9, 'Moez Romdhan', '21695288913@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1053, 9, 'Nabil', '21629535324@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1054, 9, 'Espace Moto Nabeul', '21692040008@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1055, 9, 'Vitalight', '21625776932@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1056, 9, 'Fathi Allaoui', '21625053830@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1057, 9, 'Noel  Suisse', '41796029511@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1058, 9, 'Oussema Attijari Bank', '21627218786@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1059, 9, 'Mouadh Souad', '33766146381@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1060, 9, 'Ahmed  K-Power', '21621682052@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1061, 9, 'Mohamed Securite Info', '21656311616@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1062, 9, 'Oussema Douggi', '21625172379@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1063, 9, 'Raouef Kada', '21698818811@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1064, 9, 'Yosri Maison Retraite', '21658014131@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1065, 9, 'Mohamed Ali Moto', '21694933635@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1066, 9, 'Mohamed Commercial Ecomoto', '21624245061@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1067, 9, 'Montassar Design', '21655457088@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1068, 9, 'Faouzi Mejri', '21653267439@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1069, 9, 'Rafiaa Hamaty', '21620225261@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1070, 9, 'Tigo', '21650378741@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1071, 9, 'Fares La Planet', '21620867661@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1072, 9, 'Kais Hammemi', '21651959460@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1073, 9, 'Safa Amara', '21654008852@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1074, 9, 'Aya', '21693811300@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1075, 9, 'Afef Ben Ibrahim', '21629657869@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1076, 9, 'Muhammed Rideau', '21629064826@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1077, 9, 'Wael', '21628418603@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1078, 9, 'Mohamed  Fehmi', '21622789303@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1079, 9, '‪+21625773604‬', '21625773604@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1080, 9, 'Boulouna', '21697087459@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1081, 9, 'Sami Ka3boura', '21626330898@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1082, 9, 'Mohamed Paradis ', '33749054021@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1083, 9, 'GRITLI Youssef', '21653992168@s.whatsapp.net', '2025-07-02 20:41:03', '2025-07-02 20:41:03'),
(1084, 10, 'Mohamed', '29499214', '2025-07-02 20:49:24', '2025-07-05 16:29:03'),
(1085, 10, 'Moataz', '54998153', '2025-07-02 20:49:33', '2025-07-05 16:28:45');

-- --------------------------------------------------------

--
-- Table structure for table `deviceorders`
--

CREATE TABLE `deviceorders` (
  `id` bigint UNSIGNED NOT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `phone` int NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr` text COLLATE utf8mb4_unicode_ci,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `hook_url` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `uuid`, `user_id`, `name`, `phone`, `user_name`, `qr`, `meta`, `hook_url`, `status`, `created_at`, `updated_at`) VALUES
(3, 'f7825037-5c3b-4415-8462-492c4e63281b', 4, 'iphone 14', '21629499214', 'Hannachi Muhamed Al-Fatah', NULL, NULL, 'https://www.maxskills.tn', 1, NULL, NULL),
(15, '82316c78-e762-482f-950e-05c4c5444ad5', 8, 'My phone', NULL, NULL, 'data:image/png;base64,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', NULL, NULL, 0, NULL, NULL),
(19, 'd71cf05d-cc1a-4861-b21e-bac7d455848c', 9, 'phone', '21629499214', 'Hannachi Muhamed Al-Fatah', NULL, NULL, 'http://206.72.199.206/webhook', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` double NOT NULL DEFAULT '0',
  `multiply` double NOT NULL DEFAULT '1',
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` double NOT NULL DEFAULT '1',
  `max_amount` double NOT NULL DEFAULT '1000',
  `is_auto` int NOT NULL DEFAULT '0',
  `image_accept` int DEFAULT NULL,
  `test_mode` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `phone_required` int NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `name`, `currency`, `logo`, `charge`, `multiply`, `namespace`, `min_amount`, `max_amount`, `is_auto`, `image_accept`, `test_mode`, `status`, `phone_required`, `data`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'usd', '/uploads/payment-gateway/paypal.png', 2, 1, 'App\\Gateway\\Paypal', 1, 1000, 1, 0, 1, 0, 0, '{\"client_id\":\"\",\"client_secret\":\"\"}', NULL, '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(2, 'stripe', 'usd', '/uploads/payment-gateway/stripe.png', 2, 1, 'App\\Gateway\\Stripe', 1, 1000, 1, 0, 1, 0, 0, '{\"publishable_key\":\"\",\"secret_key\":\"\"}', NULL, '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(5, 'razorpay', 'inr', '/uploads/payment-gateway/rajorpay.png', 2, 1, 'App\\Gateway\\Razorpay', 1, 10000, 1, 0, 1, 0, 0, '{\"key_id\":\"\",\"key_secret\":\"\"}', NULL, '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(8, 'flutterwave', NULL, '/uploads/payment-gateway/flutterwave.png', 2, 1, 'App\\Gateway\\Flutterwave', 1, 1000, 1, 0, 1, 0, 1, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\",\"payment_options\":\"card\"}', NULL, '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(12, 'Konnect', 'tnd', 'http://206.72.199.206/uploads/whatsendertun/25/06/685aade2290582406251750773218.jpg', 3, 1, 'App\\Gateway\\CustomGateway', 1, 1000, 0, NULL, 0, 1, 0, NULL, NULL, '2025-06-24 13:53:38', '2025-06-24 13:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `groupcontacts`
--

CREATE TABLE `groupcontacts` (
  `group_id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groupcontacts`
--

INSERT INTO `groupcontacts` (`group_id`, `contact_id`) VALUES
(7, 784),
(7, 785),
(7, 786),
(7, 787),
(7, 788),
(7, 789),
(7, 790),
(7, 791),
(7, 792),
(7, 793),
(7, 794),
(7, 795),
(7, 796),
(7, 797),
(7, 798),
(7, 799),
(7, 800),
(7, 801),
(7, 802),
(7, 803),
(7, 804),
(7, 805),
(7, 806),
(7, 807),
(7, 808),
(7, 809),
(7, 810),
(7, 811),
(7, 812),
(7, 813),
(7, 814),
(7, 815),
(7, 816),
(7, 817),
(7, 818),
(7, 819),
(7, 820),
(7, 821),
(7, 822),
(7, 823),
(7, 824),
(7, 825),
(7, 826),
(7, 827),
(7, 828),
(7, 829),
(7, 830),
(7, 831),
(7, 832),
(7, 833),
(7, 834),
(7, 835),
(7, 836),
(7, 837),
(7, 838),
(9, 842),
(9, 843),
(9, 844),
(9, 845),
(9, 846),
(9, 847),
(9, 848),
(9, 849),
(9, 850),
(9, 851),
(9, 852),
(9, 853),
(9, 854),
(9, 855),
(9, 856),
(9, 857),
(9, 858),
(9, 859),
(9, 860),
(9, 861),
(9, 862),
(9, 863),
(9, 864),
(9, 865),
(9, 866),
(9, 867),
(9, 868),
(9, 869),
(9, 870),
(9, 871),
(9, 872),
(9, 873),
(9, 874),
(9, 875),
(9, 876),
(9, 877),
(9, 878),
(9, 879),
(9, 880),
(9, 881),
(9, 882),
(9, 883),
(9, 884),
(9, 885),
(9, 886),
(9, 887),
(9, 888),
(9, 889),
(9, 890),
(9, 891),
(9, 892),
(9, 893),
(9, 894),
(9, 895),
(9, 896),
(9, 897),
(9, 898),
(9, 899),
(9, 900),
(9, 901),
(9, 902),
(9, 903),
(9, 904),
(9, 905),
(9, 906),
(9, 907),
(9, 908),
(9, 909),
(9, 910),
(9, 911),
(9, 912),
(9, 913),
(9, 914),
(9, 915),
(9, 916),
(9, 917),
(9, 918),
(9, 919),
(9, 920),
(9, 921),
(9, 922),
(9, 923),
(9, 924),
(9, 925),
(9, 926),
(9, 927),
(9, 928),
(9, 929),
(9, 930),
(9, 931),
(9, 932),
(9, 933),
(9, 934),
(9, 935),
(9, 936),
(9, 937),
(9, 938),
(9, 939),
(9, 940),
(9, 941),
(9, 942),
(9, 943),
(9, 944),
(9, 945),
(9, 946),
(9, 947),
(9, 948),
(9, 949),
(9, 950),
(9, 951),
(9, 952),
(9, 953),
(9, 954),
(9, 955),
(9, 956),
(9, 957),
(9, 958),
(9, 959),
(9, 960),
(9, 961),
(9, 962),
(9, 963),
(9, 964),
(9, 965),
(9, 966),
(9, 967),
(9, 968),
(9, 969),
(9, 970),
(9, 971),
(9, 972),
(9, 973),
(9, 974),
(9, 975),
(9, 976),
(9, 977),
(9, 978),
(9, 979),
(9, 980),
(9, 981),
(9, 982),
(9, 983),
(9, 984),
(9, 985),
(9, 986),
(9, 987),
(9, 988),
(9, 989),
(9, 990),
(9, 991),
(9, 992),
(9, 993),
(9, 994),
(9, 995),
(9, 996),
(9, 997),
(9, 998),
(9, 999),
(9, 1000),
(9, 1001),
(9, 1002),
(9, 1003),
(9, 1004),
(9, 1005),
(9, 1006),
(9, 1007),
(9, 1008),
(9, 1009),
(9, 1010),
(9, 1011),
(9, 1012),
(9, 1013),
(9, 1014),
(9, 1015),
(9, 1016),
(9, 1017),
(9, 1018),
(9, 1019),
(9, 1020),
(9, 1021),
(9, 1022),
(9, 1023),
(9, 1024),
(9, 1025),
(9, 1026),
(9, 1027),
(9, 1028),
(9, 1029),
(9, 1030),
(9, 1031),
(9, 1032),
(9, 1033),
(9, 1034),
(9, 1035),
(9, 1036),
(9, 1037),
(9, 1038),
(9, 1039),
(9, 1040),
(9, 1041),
(9, 1042),
(9, 1043),
(9, 1044),
(9, 1045),
(9, 1046),
(9, 1047),
(9, 1048),
(9, 1049),
(9, 1050),
(9, 1051),
(9, 1071),
(9, 1072),
(9, 1073),
(9, 1074),
(9, 1075),
(9, 1076),
(9, 1077),
(9, 1078),
(9, 1079),
(9, 1080),
(9, 1081),
(9, 1082),
(12, 1084),
(12, 1085),
(13, 1067),
(13, 1056),
(13, 1057),
(13, 1052),
(13, 1053),
(13, 1054),
(13, 1055),
(13, 1058),
(13, 1059),
(13, 1060),
(13, 1061),
(13, 1062),
(13, 1063),
(13, 1064),
(13, 1065),
(13, 1066),
(13, 1068),
(13, 1069),
(13, 1070),
(13, 1083);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 'first', '2025-06-21 04:45:57', '2025-06-21 04:45:57'),
(2, 4, '555', '2025-06-21 14:09:04', '2025-06-21 14:09:04'),
(3, 4, '22222', '2025-06-21 14:13:42', '2025-06-21 14:13:42'),
(5, 2, 'Imported Contacts', '2025-06-22 14:59:35', '2025-06-22 14:59:35'),
(6, 5, 'Imported Contacts', '2025-06-22 15:09:42', '2025-06-22 15:09:42'),
(7, 7, 'Imported Contacts', '2025-06-23 20:33:09', '2025-06-23 20:33:09'),
(8, 7, 'Groupe 1', '2025-06-23 21:16:43', '2025-06-23 21:16:43'),
(9, 9, 'Imported Contacts', '2025-07-02 20:41:01', '2025-07-02 20:41:01'),
(10, 10, 'groupe 1', '2025-07-02 20:49:04', '2025-07-02 20:49:04'),
(11, 10, 'groupe 2', '2025-07-02 20:49:07', '2025-07-02 20:49:07'),
(12, 10, 'groupe 3', '2025-07-02 20:49:12', '2025-07-02 20:49:12'),
(13, 9, 'Mohamed', '2025-07-03 18:09:38', '2025-07-03 18:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `position`, `data`, `lang`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Header', 'main-menu', '[{\"text\":\"Accueil\",\"icon\":\"\",\"href\":\"/\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"Tarifs\",\"icon\":\"empty\",\"href\":\"/pricing\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"À propos\",\"icon\":\"empty\",\"href\":\"/about\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"Fonctionnalités\",\"icon\":\"empty\",\"href\":\"/features\",\"target\":\"_self\",\"title\":\"\"},{\"text\":\"Contact\",\"icon\":\"empty\",\"href\":\"/contact\",\"target\":\"_self\",\"title\":\"\"}]', 'en', '1', '2025-06-21 04:30:01', '2025-06-21 04:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_04_174202_create_deviceorders_table', 1),
(6, '2022_11_04_174204_create_devices_table', 1),
(7, '2022_11_04_174205_create_apps_table', 1),
(8, '2022_11_07_154504_create_templates_table', 1),
(9, '2022_11_24_200110_create_smstransactions_table', 1),
(10, '2022_11_26_175433_create_smstesttransactions_table', 1),
(11, '2022_12_09_155744_create_schedulemessages_table', 1),
(12, '2022_12_09_164619_create_contacts_table', 1),
(13, '2022_12_09_165556_create_schedulecontacts_table', 1),
(14, '2023_02_04_181414_create_replies_table', 1),
(15, '2023_02_11_160234_create_supports_table', 1),
(16, '2023_02_11_160247_create_supportlogs_table', 1),
(17, '2023_02_12_163752_create_plans_table', 1),
(18, '2023_02_12_163758_create_gateways_table', 1),
(19, '2023_02_12_163759_create_orders_table', 1),
(20, '2023_02_12_170152_create_notifications_table', 1),
(21, '2023_02_13_130039_create_permission_tables', 1),
(22, '2023_02_14_181559_create_options_table', 1),
(23, '2023_02_19_082229_create_posts_table', 1),
(24, '2023_02_19_082240_create_categories_table', 1),
(25, '2023_02_19_082254_create_postcategories_table', 1),
(26, '2023_02_19_084742_create_categorymetas_table', 1),
(27, '2023_02_19_084751_create_postmetas_table', 1),
(28, '2023_02_19_085200_create_menus_table', 1),
(29, '2023_03_02_184250_create_jobs_table', 1),
(30, '2023_03_08_151642_create_groups_table', 1),
(31, '2023_03_08_151657_create_groupcontacts_table', 1),
(32, '2023_10_06_145950_create_webhooks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` int NOT NULL DEFAULT '0',
  `is_admin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `key`, `value`, `lang`) VALUES
(1, 'primary_data', '{\"logo\":\"\\/uploads\\/23\\/04\\/16809883098PkELjA7CZYT8XyFgvaU.png\",\"favicon\":\"uploads\\/favicon.png\",\"contact_email\":\"contact@email.com\",\"contact_phone\":\"8801234567890\",\"address\":\"Bowery St, New York\",\"socials\":{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"youtube\":\"https:\\/\\/youtube.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\",\"linkedin\":\"https:\\/\\/linkedin.com\\/\"},\"footer_logo\":\"\\/uploads\\/23\\/04\\/16809882645YTjTdvCTduL5D1hCfX7.png\"}', 'en'),
(2, 'tax', '0', 'en'),
(3, 'base_currency', '{\"name\":\"TND\",\"icon\":\" TND\",\"position\":\"right\"}', 'en'),
(4, 'invoice_data', '{\"company_name\":\"Whatserve\",\"address\":\"San francisco\",\"city\":\"California\",\"country\":\"USA\",\"post_code\":\"12345\"}', 'en'),
(5, 'languages', '{\"en\":\"English\"}', 'en'),
(6, 'seo_home', '{\"site_name\":\"Home\",\"matatag\":\"\",\"matadescription\":\"\",\"twitter_site_title\":\"home\",\"preview\":\"\"}', 'en'),
(7, 'seo_blog', '{\"site_name\":\"Blogs\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(8, 'seo_about', '{\"site_name\":\"About Us\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(9, 'seo_pricing', '{\"site_name\":\"Pricing\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(10, 'seo_contact', '{\"site_name\":\"Contact Us\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(11, 'seo_faq', '{\"site_name\":\"Faq\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(12, 'seo_team', '{\"site_name\":\"Our Team\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(13, 'seo_features', '{\"site_name\":\"Features\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(14, 'seo_how_its_works', '{\"site_name\":\"How its work\",\"matatag\":\"\",\"matadescription\":\"\",\"preview\":\"\"}', 'en'),
(15, 'header_footer', '{\"header\":{\"announcement_type\":\"NOW HIRING:\",\"announcement_title\":\"Are You A Driven And Motivated 1st Line IT Support Engineer?\",\"announcement_link\":\"\\/contact\"},\"footer\":{\"title\":\"Ready To Launch \\ud83d\\ude80\",\"description\":\"Automate your conversations and boost your marketing strategy\",\"right_image_link\":\"\\/pricing\",\"left_image_link\":\"\\/pricing\"},\"footer_button_image\":\"\\/uploads\\/23\\/03\\/1678211121jY056A0fKjEFLQN7lJeZ.png\",\"footer_left_button_image\":\"\\/uploads\\/23\\/03\\/1678211121yYLog9HsVoV5QCJAvX4g.png\"}', 'en'),
(16, 'home-page', '{\"heading\":{\"title\":\"Boost your marketing with <strong>WASender<\\/strong>\",\"left_button_link\":\"\\/pricing\",\"right_button_link\":\"\\/pricing\"},\"brand\":{\"title\":\"Over 32K+ software businesses growing with WASender\",\"status\":\"active\"},\"cta\":{\"title\":\"More than 13,000 teams use our platform\"},\"features\":{\"title\":\"Explore Our Amazing Features \\ud83d\\udd25\",\"status\":\"active\"},\"platform\":{\"title\":\"Start Building Chatbot using WASender\",\"description\":\"We provide a bird`s eye perspective of your entire bot, which aids in the development of a highly engaging bot. You can create, test, and build chatbots graphically using a single no-code online interface.\",\"button_title\":\"Get Started\",\"button_link\":\"\\/pricing\"},\"account_area\":{\"heading\":\"Create your free account\",\"subheading\":\"It takes only 3 minutes to get started\",\"description\":\"Plug your messaging channels, install your widget and\\r\\nyou\\u2019re ready to go\",\"form_link\":\"\\/register\\/2\",\"status\":\"active\",\"button_link1\":\"\\/pricing\",\"button_link2\":\"\\/pricing\"},\"about\":{\"title\":\"Whatsapp Automation\",\"description\":\"A WhatsApp bot can work around the clock and can handle multiple requests simultaneously, which means that it is always available to assist customers, even outside of regular business hours.\",\"action_area_title\":\"Lets create a Whatsapp chatbot \\ud83d\\ude80\"},\"top_faq\":{\"title\":\"WASender For Creatives business \\ud83d\\ude07\",\"description\":\"WASender is the best quaint james bond victoria sponge happy days cras arse over blatant\"},\"integration\":{\"title\":\"Top Integration \\ud83e\\udd1d\\ud83c\\udffb\"},\"testimonial\":{\"title\":\"User Feedback \\ud83c\\udf96\\ufe0f\"},\"calltoaction\":{\"title\":\"Discover a better way to <br> manage spendings\",\"button_title\":\"Get Started Now\",\"button_link\":\"\\/pricing\"},\"right_button_image\":\"\\/uploads\\/23\\/03\\/16782229849w7zEZUReAELpYZzBhfy.png\",\"left_button_image\":\"\\/uploads\\/23\\/03\\/16782229844xnXg3VVbopZTUmCVkoP.png\",\"hero_left_image\":\"\\/uploads\\/23\\/04\\/1680991267dcZhpgfhm46WulMpbFmU.png\",\"hero_image\":\"\\/uploads\\/23\\/03\\/1678140600lS8T5SkGWjUDMw00x8aR.png\",\"testimonial_cover\":\"\\/uploads\\/23\\/04\\/1680990550b4VGZjg5I0mHrS0ZEzEO.png\",\"integration_cover\":\"\\/uploads\\/23\\/04\\/1680691072MdDwD8iZV7nFu32OLg7Z.png\",\"integration_left\":\"\\/uploads\\/23\\/04\\/1680687785yK5jB6wU8F0njvElGAqE.png\",\"integration_right\":\"\\/uploads\\/23\\/04\\/1680687785b4Qk1bP8HMnMCuedEqOo.png\",\"hero_right_image\":\"\\/uploads\\/23\\/04\\/1680991267IpQIAwGSbY5ZIFRwO6Pp.png\",\"cta_logo\":\"\\/uploads\\/23\\/03\\/1678039536jzV8Ut6FTWgytwnEZxo0.png\",\"cta_thumbnail\":\"\\/uploads\\/23\\/03\\/1678139635o3AHoY7EGdexS7UuUajq.png\",\"platform_thumbnail\":\"\\/uploads\\/23\\/03\\/1678139743EuXomMHlbRJIEUobx62D.png\",\"account_area_thumbnail\":\"\\/uploads\\/23\\/03\\/1678140032Wxqq2w6cndL4uWiEHf8B.png\",\"account_area_top_thumbnail\":\"\\/uploads\\/23\\/03\\/1678039536eRShFlGn3Uw9tN1X14E0.png\",\"account_area_bottom_thumbnail\":\"\\/uploads\\/23\\/03\\/16780395365JXHyeVBXUVAldB1V5Se.png\",\"account_footer_left_image\":\"\\/uploads\\/23\\/03\\/16780395365VbXNjp8vpREwrrQ8R44.png\",\"account_footer_right_image\":\"\\/uploads\\/23\\/03\\/1678039536cX0XI21coIdJ3M1Im54A.png\",\"faq_cover\":\"\\/uploads\\/23\\/04\\/1680990550DfwMWKaP9MfCYR6fPued.png\",\"about_cover\":\"\\/uploads\\/23\\/04\\/1680989187xEbFX8vGfdBmWfMkb3Xo.gif\"}', 'en'),
(17, 'why-choose', '{\"title\":\"Why choose WhaTSender \\ud83c\\udf96\\ufe0f\",\"subtitle\":\"Get start\",\"left_button_link\":\"\\/pricing\",\"right_button_link\":\"\\/pricing\",\"left_block_title\":\"Active Customers\",\"left_block_value\":\"1200\",\"center_block_title\":\"Total Customers\",\"center_block_value\":\"1500\",\"right_block_title\":\"Positive Reviews\",\"right_block_value\":\"600\",\"left_button_image\":\"\\/uploads\\/23\\/03\\/1678120554l1bhGUjz28tmiBtCqTK6.png\",\"right_button_image\":\"\\/uploads\\/23\\/03\\/1678120554IAVDm9xBLZXYtGAamM0I.png\",\"left_block_image\":\"\\/uploads\\/23\\/03\\/1678120554hneDbhf9WG6aXvdV0h6q.png\",\"center_block_image\":\"\\/uploads\\/23\\/03\\/1678120554PcP79pqqlziQ71Yf1T70.png\",\"right_block_image\":\"\\/uploads\\/23\\/03\\/1678120554dGH99dtfF4slpDVVHjT1.png\"}', 'en'),
(18, 'contact-page', '{\"address\":\"Ariana\",\"country\":\"Tunis\",\"map_link\":null,\"contact1\":\"+21654998153\",\"contact2\":null,\"email1\":\"contact@emdev.click\",\"email2\":null}', 'en'),
(19, 'about', '{\"about_image_1\":\"\\/uploads\\/23\\/03\\/1678140418eqwc9ocl8MfpeP0fEznT.png\",\"about_image_2\":\"\\/uploads\\/23\\/03\\/16781404191Btcr8D8FJTBo3SiTcQA.png\",\"breadcrumb_title\":\"About WhatServe\",\"section_title\":\"Over 12 years of experience in the IT Industry & Tech service\",\"experience\":\"12\",\"experience_title\":\"Years of Experience\",\"description\":\"Lorem ipsum dolor sit amet enim. Etiam ullamcorper. Suspendisse a pellentesque dui, non felis. Maecenas malesuada elit lectus felis, malesuada ultricies. Curabitur et ligula. Ut molestie a, ultricies porta <br> Lorem ipsum dolor sit amet enim. Etiam ullamcorper. Suspendisse a pellentesque dui, non felis. Maecenas malesuada elit lectus felis,\",\"button_title\":\"Check our work\",\"button_link\":\"\\/features\",\"facilities\":\"Fast support, Stable api response, Reasonable price, User-friendly UX, Regular features update\",\"introducing_video\":\"https:\\/\\/www.youtube.com\\/watch?v=Fu3MIwF-LJw\"}', 'en'),
(20, 'counter', '{\"experience\":\"12\",\"active_customers\":\"900\",\"positive_reviews\":\"200\",\"satisfied_customers\":\"800\"}', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `gateway_id` bigint UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `will_expire` date DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_no`, `payment_id`, `plan_id`, `user_id`, `gateway_id`, `amount`, `tax`, `status`, `will_expire`, `meta`, `created_at`, `updated_at`) VALUES
(3, '0000003', '1234321', 2, 8, 12, 300, 0, 1, '2025-07-31', NULL, '2025-07-01 17:22:57', '2025-07-01 17:22:57'),
(4, '0000004', 'ERJQ1MBBoNvimAu111', 2, 9, 12, 129, 0, 1, '2025-08-01', '\"{\\\"screenshot\\\":\\\"http:\\\\\\/\\\\\\/206.72.199.206\\\\\\/uploads\\\\\\/payments\\\\\\/25\\\\\\/07\\\\\\/686539457cbfa.png\\\",\\\"comment\\\":\\\"client\\\"}\"', '2025-07-02 13:51:01', '2025-07-02 13:52:30'),
(5, '0000005', 'I2YQLQ4wd6DZfVF137', 2, 10, 12, 129, 0, 1, '2025-08-01', '\"{\\\"screenshot\\\":\\\"http:\\\\\\/\\\\\\/206.72.199.206\\\\\\/uploads\\\\\\/payments\\\\\\/25\\\\\\/07\\\\\\/68653b2539883.png\\\",\\\"comment\\\":\\\"client\\\"}\"', '2025-07-02 13:59:01', '2025-07-02 13:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'about', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(2, 'blogs', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(3, 'blogs-category', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(4, 'blog-tags', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(5, 'faq', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(6, 'features', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(7, 'team', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(8, 'language', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(9, 'menu', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(10, 'custom-page', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(11, 'partners', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(12, 'seo', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(13, 'testimonials', 'web', 'Appearance', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(14, 'page-settings', 'web', 'Site Settings', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(15, 'admin', 'web', 'Site Settings', '2025-06-21 04:30:00', '2025-06-21 04:30:00'),
(16, 'developer-settings', 'web', 'Site Settings', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(17, 'roles', 'web', 'Site Settings', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(18, 'apps', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(19, 'contacts', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(20, 'customer', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(21, 'device', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(22, 'notification', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(23, 'schedule', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(24, 'templates', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(25, 'message-transactions', 'web', 'User Logs', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(26, 'cron-job', 'web', 'SAAS Functionalities', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(27, 'gateways', 'web', 'SAAS Functionalities', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(28, 'order', 'web', 'SAAS Functionalities', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(29, 'subscriptions', 'web', 'SAAS Functionalities', '2025-06-21 04:30:01', '2025-06-21 04:30:01'),
(30, 'support', 'web', 'SAAS Functionalities', '2025-06-21 04:30:01', '2025-06-21 04:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labelcolor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iconname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `is_featured` int NOT NULL DEFAULT '0',
  `is_recommended` int NOT NULL DEFAULT '0',
  `is_trial` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `days` int NOT NULL DEFAULT '0',
  `trial_days` int DEFAULT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `title`, `labelcolor`, `iconname`, `price`, `is_featured`, `is_recommended`, `is_trial`, `status`, `days`, `trial_days`, `data`, `created_at`, `updated_at`) VALUES
(1, 'Starter', 'price-color-1', 'fas fa-star', 49, 1, 0, 0, 1, 30, 0, '{\"messages_limit\":\"10000\",\"contact_limit\":\"500\",\"device_limit\":\"1\",\"template_limit\":\"20\",\"apps_limit\":\"1\",\"chatbot\":\"false\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"false\",\"access_group_list\":\"true\"}', '2023-03-05 18:29:25', '2025-07-02 21:02:20'),
(2, 'Enterprise', 'price-color-2', 'far fa-check-circle', 129, 1, 1, 0, 1, 30, 0, '{\"messages_limit\":\"-1\",\"contact_limit\":\"3000\",\"device_limit\":\"3\",\"template_limit\":\"100\",\"apps_limit\":\"3\",\"chatbot\":\"false\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"false\",\"access_group_list\":\"true\"}', '2023-03-05 18:30:39', '2025-07-02 14:35:01'),
(3, 'Basic', 'price-color-3', 'fab fa-angellist', 79, 1, 0, 0, 1, 30, 0, '{\"messages_limit\":\"30000\",\"contact_limit\":\"1500\",\"device_limit\":\"2\",\"template_limit\":\"50\",\"apps_limit\":\"2\",\"chatbot\":\"false\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"false\",\"access_group_list\":\"true\"}', '2023-03-05 18:32:49', '2025-07-02 21:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `postcategories`
--

CREATE TABLE `postcategories` (
  `post_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postcategories`
--

INSERT INTO `postcategories` (`post_id`, `category_id`) VALUES
(8, 7),
(8, 13),
(9, 7),
(9, 8),
(9, 12),
(9, 13),
(10, 6),
(10, 13),
(10, 14);

-- --------------------------------------------------------

--
-- Table structure for table `postmetas`
--

CREATE TABLE `postmetas` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postmetas`
--

INSERT INTO `postmetas` (`id`, `post_id`, `key`, `value`) VALUES
(1, 1, 'excerpt', 'A chatbot is always available to serve your customer 24/7. A chatbot can save you a lot of time and money by automating repetitive tasks like qualifying leads or answering questions of your customers. By offering instatily response to your customer, your business will build trust and boost conversions and sales.'),
(2, 2, 'excerpt', 'No, you only need a email to sign up.'),
(3, 3, 'excerpt', 'Yes, If you are unhappy with our service, we offer 30 days money-back guarantee on any plan.'),
(4, 4, 'excerpt', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"linkedin\":\"https:\\/\\/linkedin.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}'),
(5, 4, 'description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(6, 4, 'preview', '/uploads/23/03/1678125197LZ4zAxvVjarz0PrmZCqK.png'),
(7, 5, 'excerpt', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"linkedin\":\"https:\\/\\/linkedin.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}'),
(8, 5, 'description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(9, 5, 'preview', '/uploads/23/03/1678125246G7FoUHHxe2C88n1cVXCq.png'),
(10, 6, 'excerpt', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"linkedin\":\"https:\\/\\/linkedin.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}'),
(11, 6, 'description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(12, 6, 'preview', '/uploads/23/03/16781252849ApdWcy0jUhLRb9QtCL4.png'),
(13, 7, 'excerpt', '{\"facebook\":\"https:\\/\\/www.facebook.com\\/\",\"twitter\":\"https:\\/\\/twitter.com\\/\",\"linkedin\":\"https:\\/\\/linkedin.com\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/\"}'),
(14, 7, 'description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
(15, 7, 'preview', '/uploads/23/03/1678125323UINo4L0ZND1ErxlWCAFu.png'),
(16, 8, 'preview', '/uploads/23/03/1678128734p2mgTWEhEKwm5MsxhunY.png'),
(17, 8, 'short_description', 'In a world that’s increasingly getting commoditized, thanks to technology, it’s an open secret that customer focus is the real differentiator. This Gospel truth is germane to every business function, but in marketing it’s indispensable. Reason being the constantly changing needs, wants and desires of customers. New age marketing therefore, is all about unique individual experiences through tools that bring brands closer to their customer.'),
(18, 8, 'main_description', 'Today there’s literally an ocean when it comes to the number of available tools for marketers but none comes close to the effectiveness of QBM. Quality Based Messaging or QBM is a feature under WhatsApp business API which helps businesses engage customers through contextual messaging. These messages need to meet the quality criteria defined by WhatsApp and hence the name- Quality Based Messaging.'),
(19, 8, 'seo', '{\"title\":\"Boost your business growth with WhatsApp Quality Based Messaging\",\"description\":\"In a world that\\u2019s increasingly getting commoditized, thanks to technology, it\\u2019s an open secret that customer focus is the real differentiator. This Gospel truth is germane to every business function, but in marketing it\\u2019s indispensable. Reason being the constantly changing needs, wants and desires of customers. New age marketing therefore, is all about unique individual experiences through tools that bring brands closer to their customer.\",\"tags\":\"wa, whatsapp, devstation, qserve, whatsserve, whatserder\"}'),
(20, 9, 'preview', '/uploads/23/03/1678129064eIpoGudjOtETN0JhQRzG.png'),
(21, 9, 'short_description', 'In the competitive business landscape, if there’s one thing that has led to the massive growth of internet businesses, it is digital advertising. The $600 billion industry holds an outsized control on customers—- who buys what and thus to the fortunes of these businesses. An interesting aspect of digital advertising is its dynamic and ever-evolving nature, from search ads to video and voice search with the latest being Click to Chat ads. Click to Chat ads, although at a nascent stage currently,'),
(22, 9, 'main_description', 'In Feynman speak, Click to Chat ads are ads that are conversational in nature. With precise targeting, marketers are finding it to be much more effective in addressing the shortcomings of typical digital ads.\n\n         Before delving deeper into Click to Chat ads, it’s important to understand imperfections in the digital ad industry which have made way for this new form of advertising. The world moved from traditional mass media advertising to digital ads as the audience had moved online and targeting audience segments on digital was easy. \n\n         But while digital solved the problem of targeting, it lacked two-way conversations where users could be engaged and their doubts settled.\n\n         The customer does not have a choice today, if they want to connect with the advertised brand for clarity on product /service or instantly perform a transaction. Website landing pages are better suited for savvy internet users who are adept at browsing through multiple pages.They are not for technology newbies. Moreover, a landing page is not the ideal destination in case of products such as jewelry, furniture, real estate and financial services where guided selling works best. \n\n         Take for example- jewelry. A beautiful model wearing a stylish looking pendant set may entice a user to click on the ad and enter a landing page. But leaves this user unanswered for common questions such as- exchange policy, the kind of gemstones used in the pendant etc.'),
(23, 9, 'seo', '{\"title\":\"Click to Chat ads on WhatsApp- A vital tool for your marketing arsenal\",\"description\":\"In the competitive business landscape, if there\\u2019s one thing that has led to the massive growth of internet businesses, it is digital advertising. The $600 billion industry holds an outsized control on customers\\u2014- who buys what and thus to the fortunes of these businesses. An interesting aspect of digital advertising is its dynamic and ever-evolving nature, from search ads to video and voice search with the latest being Click to Chat ads. Click to Chat ads, although at a nascent stage currently,\",\"tags\":\"wa, whatsapp, devstation, wasender, whatsserve\",\"image\":\"\\/uploads\\/23\\/03\\/1678129064ZCzwbv9lHINvkGVXBH2R.png\"}'),
(24, 10, 'preview', '/uploads/23/03/16781292529emrzSmYnHCskq8JUxIb.png'),
(25, 10, 'short_description', 'ChatGPT (Conversational Generative Pre-trained Transformer) is a newly released open-source conversational AI platform. It has been praised for its ability to generate natural language responses to user inputs, and many have hailed it as the next step in creating more human-like conversations. However, despite its promise, certain limitations still prevent it from being a viable replacement for other conversational AI platforms. Let’s explore these limitations and how they can be addressed.'),
(26, 10, 'main_description', 'How is ChatGPT different from Conversational AI?\n        As an AI language model, ChatGPT can provide conversational capabilities that can be helpful for certain use cases, such as answering general questions or providing basic support. However, it is not designed to replace enterprise conversational AI platforms for several reasons:\n\n        Fine-tuning and customization: Enterprise conversational AI platforms can be customized to meet specific business needs and integrate with their existing systems of records, providing a more tailored solution. ChatGPT, on the other hand, is a general-purpose AI language model and may not be able to meet the specific needs of every business.\n        Security and compliance: Enterprise conversational AI platforms often have security and compliance features built-in, ensuring that sensitive data is protected and regulatory requirements are met. ChatGPT is not specifically designed for enterprise-level security and compliance requirements.\n        Integrations: Enterprise conversational AI platforms can integrate with other systems and applications, allowing for a more seamless experience for users. ChatGPT does not have the same level of integration capabilities.\n        Support and maintenance: Enterprise conversational AI platforms often provide support and maintenance services to ensure that the system is running smoothly and to address any issues that arise. ChatGPT does not provide this level of support and maintenance.\n        Scalability: Enterprise conversational AI platforms can be scaled to handle large volumes of user interactions, while ChatGPT may not be able to handle the same level of scalability.\n        In summary, while ChatGPT can provide conversational capabilities for certain use cases, it is not designed to replace enterprise conversational AI platforms, which offer greater customization, security, integration, support, maintenance, and scalability capabilities to meet the needs of large businesses.'),
(27, 10, 'seo', '{\"title\":\"Why ChatGPT Cannot Replace Conversational AI Platforms?\",\"description\":\"ChatGPT (Conversational Generative Pre-trained Transformer) is a newly released open-source conversational AI platform. It has been praised for its ability to generate natural language responses to user inputs, and many have hailed it as the next step in creating more human-like conversations. However, despite its promise, certain limitations still prevent it from being a viable replacement for other conversational AI platforms. Let\\u2019s explore these limitations and how they can be addressed.\",\"tags\":\"wa, whatsapp, devstation, qserve, whatsserve\",\"image\":\"\\/uploads\\/23\\/03\\/16781292529yMlP8qfUEaRjJic39bs.png\"}'),
(30, 12, 'excerpt', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.'),
(31, 12, 'preview', '/uploads/23/03/1678130604XsBOBA2JdT4D3dUMsVPO.jpg'),
(32, 13, 'excerpt', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum'),
(33, 13, 'preview', '/uploads/23/03/1678130652BHfP85klZ25vaXpBU6AT.jpg'),
(34, 14, 'excerpt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
(35, 14, 'preview', '/uploads/23/03/1678130699E0RrnxKNI6tkb6Qc1eV1.jpg'),
(36, 15, 'excerpt', 'Boost digital finance adoption with instant balance inquiries, portfolio recommendations, hassle-free claims settlement, cross-sell and more'),
(37, 16, 'excerpt', 'Revolutionize your restaurant operations with WhatsApp-based ordering, meal and add-on recommendations, payments and real-time delivery updates'),
(38, 17, 'excerpt', 'Create multistage campaigns in just a few clicks and plan your campaigns ahead of time with pre-built templates'),
(39, 17, 'main_description', 'Create multistage campaigns in just a few clicks and plan your campaigns ahead of time with pre-built templates Adapt customer journeys based on real-time events. such as purchases, browses, or any event unique to your customers Seamlessly integrate with marketing tools and CRMs like Clevertap and Moengage to send tailored campaigns'),
(40, 17, 'preview', '/uploads/23/03/1678143851hf9IuC24SAhOJ1dLId94.png'),
(41, 17, 'banner', '/uploads/23/03/1678143446kru2cExnnwONsqF55Nc6.png'),
(42, 18, 'excerpt', 'WhatsApp lets you add buttons to message templates. There are two types of buttons: Quick replies and Call to action buttons. These buttons open up many opportunities for businesses worldwide to engage with their customers on WhatsApp, one of the most popular messaging applications.'),
(43, 18, 'main_description', 'WhatsApp lets you add buttons to message templates. There are two types of buttons: Quick replies and Call to action buttons. These buttons open up many opportunities for businesses worldwide to engage with their customers on WhatsApp, one of the most popular messaging applications. Quick replies let businesses define buttons that users can tap to respond. When a Quick reply is tapped, a message containing the button text is sent in the conversation. Call to action buttons trigger a phone call or open a website when tapped. Please note that at this time, WhatsApp does not support deeplinks. To use buttons, you need to submit them as part of a message template to WhatsApp. Once approved, templates containing buttons can be sent by sending the message text in your API request.'),
(44, 18, 'preview', '/uploads/23/03/1678144536donXXxCjluUjy3vZEjEO.png'),
(45, 18, 'banner', '/uploads/23/03/1678177857DqLCX7BJooFwWYFnY3mH.png'),
(50, 20, 'excerpt', 'WhatsApp users can schedule posts on the app to plan and send text, photos or videos. The posts can be scheduled for WhatsApp business or to send wishes on birthdays and festivals.'),
(51, 20, 'main_description', 'With 2 billion+ active users, WhatsApp is the most widely used communication app. WhatsApp allows you to share text messages, multi-media, location & now money. With all these useful features, you may want to schedule a WhatsApp message for wishing someone their birthday or remind your friends about some events. Or if you’re a business, you may want to schedule payment reminders on the last day of subscriptions or cart reminders to your customers’ WhatsApp. Or, your business needs to automate WhatsApp Business greeting messages to all new customers/subscribers.'),
(52, 20, 'preview', '/uploads/23/03/1678176166I16bhCDLteYzyEXmiydB.png'),
(53, 20, 'banner', '/uploads/23/03/16781761667IC0JxTR0A4nDQ3pPkPn.webp'),
(54, 21, 'excerpt', 'WA Bulk messaging is the dissemination of large numbers of messages for delivery to WASender software. It is used by media companies, banks and other enterprises and consumer brands for a variety of purposes including entertainment, enterprise and mobile marketing.'),
(55, 21, 'main_description', 'A bulk message is a message that is sent from a single WhatsApp Business user to multiple phone numbers at the same time. All receivers of the message will see it coming in as a private message. WhatsApp bulk messaging first was a consumer-only feature, but it’s now also available for businesses. For businesses, this means they can now also use WhatsApp for outbound marketing activities.'),
(56, 21, 'preview', '/uploads/23/03/167817697016QUKcDn2rlERcMDuR2p.png'),
(57, 21, 'banner', '/uploads/23/03/1678177795QbOsO2mocgkgO8NRF071.png'),
(58, 22, 'excerpt', 'Representational state transfer is a software architectural style that describes the architecture of the Web.'),
(59, 22, 'main_description', 'An API is a set of definitions and protocols for building and integrating application software. It’s sometimes referred to as a contract between an information provider and an information user—establishing the content required from the consumer (the call) and the content required by the producer (the response). For example, the API design for a weather service could specify that the user supply a zip code and that the producer reply with a 2-part answer, the first being the high temperature, and the second being the low.'),
(60, 22, 'preview', '/uploads/23/03/1678177358eT0wu71Go2ANWmiEVTrP.png'),
(61, 22, 'banner', '/uploads/23/03/16781773587loKRma922J59f5EOXHQ.png'),
(62, 23, 'excerpt', 'WASender is the best quaint james bond victoria sponge happy days cras.'),
(63, 24, 'excerpt', 'No you can simply register with your email'),
(64, 25, 'excerpt', 'WASender has supported free Demo trial. You don\'t need to add credit card information.'),
(65, 26, 'description', 'What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nWhy do we use it?\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(66, 26, 'seo', '{\"title\":\"terms and conditions\",\"description\":\"orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, w\",\"tags\":\"wa, whatsapp, devstation, qserve, whatsserve\"}');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blog',
  `status` int NOT NULL DEFAULT '1',
  `featured` int NOT NULL DEFAULT '1',
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `type`, `status`, `featured`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'Why does your business need a chatbot?', 'why-does-your-business-need-a-chatbot', 'faq', 1, 1, 'en', '2023-03-06 10:17:03', '2023-03-06 10:17:03'),
(2, 'Do I need a credit card to sign up?', 'do-i-need-a-credit-card-to-sign-up', 'faq', 1, 1, 'en', '2023-03-06 10:17:50', '2023-03-06 10:17:50'),
(3, 'Do you offer a 30 day money-back guarantee?', 'do-you-offer-a-30-day-money-back-guarantee', 'faq', 1, 1, 'en', '2023-03-06 10:18:16', '2023-03-06 10:18:16'),
(4, 'Darlene Robertson', 'Product Manager', 'team', 1, 1, 'en', '2023-03-06 17:53:17', '2023-03-06 17:53:17'),
(5, 'Bessie Cooper', 'Vp People', 'team', 1, 1, 'en', '2023-03-06 17:54:06', '2023-03-06 17:54:06'),
(6, 'Eleanor Pena', 'Head of Design', 'team', 1, 1, 'en', '2023-03-06 17:54:44', '2023-03-06 17:54:44'),
(7, 'Rhonda Ortiz', 'Founder & CO', 'team', 1, 1, 'en', '2023-03-06 17:55:23', '2023-03-06 17:55:23'),
(8, 'Boost your business growth with WhatsApp Quality Based Messaging', 'boost-your-business-growth-with-whatsapp-quality-based-messaging', 'blog', 1, 1, 'en', '2023-03-06 18:50:45', '2023-03-06 18:50:45'),
(9, 'Click to Chat ads on WhatsApp- A vital tool for your marketing arsenal', 'click-to-chat-ads-on-whatsapp-a-vital-tool-for-your-marketing-arsenal', 'blog', 1, 1, 'en', '2023-03-06 18:57:44', '2023-03-06 18:57:44'),
(10, 'Why ChatGPT Cannot Replace Conversational AI Platforms?', 'why-chatgpt-cannot-replace-conversational-ai-platforms', 'blog', 1, 1, 'en', '2023-03-06 19:00:52', '2023-03-06 19:00:52'),
(12, 'Keith Powers', 'Developer', 'testimonial', 1, 1, '5', '2023-03-06 19:23:24', '2023-03-06 19:23:24'),
(13, 'Mary', 'Digital Marketer', 'testimonial', 1, 1, '5', '2023-03-06 19:24:12', '2023-03-06 19:25:36'),
(14, 'Clinton Ramosup', 'Freelancer', 'testimonial', 1, 1, '5', '2023-03-06 19:24:59', '2023-03-06 19:25:22'),
(15, 'Financial Services', 'financial-services', 'faq', 1, 1, 'en', '2023-03-06 19:30:09', '2023-03-06 19:30:09'),
(16, 'How it will take impact for Food & Restaurants business.', 'how-it-will-take-impact-for-food-restaurants-business', 'faq', 1, 1, 'en', '2023-03-06 19:31:09', '2023-03-06 19:31:09'),
(17, 'Template messaging', 'template-messaging', 'feature', 1, 1, 'en', '2023-03-06 22:24:43', '2023-03-06 22:24:43'),
(18, 'Actions buttons', 'actions-buttons', 'feature', 1, 1, 'en', '2023-03-06 23:15:36', '2023-03-06 23:16:21'),
(20, 'Schedule message', 'schedule-message', 'feature', 1, 0, 'en', '2023-03-07 08:02:46', '2023-03-07 08:03:07'),
(21, 'Bulk message', 'bulk-message', 'feature', 1, 0, 'en', '2023-03-07 08:13:22', '2023-03-07 08:13:22'),
(22, 'RESET API for App', 'reset-api-for-app', 'feature', 1, 0, 'en', '2023-03-07 08:22:38', '2023-03-07 08:22:38'),
(23, 'Automatically sync in real time', 'top', 'faq', 1, 1, 'en', '2023-04-09 19:39:14', '2023-04-09 19:39:14'),
(24, 'Do I need a credit card to sign up?', 'top', 'faq', 1, 1, 'en', '2023-04-09 19:39:50', '2023-04-09 19:39:50'),
(25, 'Free Demo Trial', 'top', 'faq', 1, 1, 'en', '2023-04-09 19:40:59', '2025-07-01 23:13:03'),
(26, 'Terms and conditions', 'terms-and-conditions', 'page', 1, 1, 'en', '2023-04-09 19:40:59', '2023-04-09 19:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `device_id` bigint UNSIGNED NOT NULL,
  `template_id` bigint UNSIGNED DEFAULT NULL,
  `keyword` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` text COLLATE utf8mb4_unicode_ci,
  `match_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'equal',
  `reply_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-06-21 04:30:00', '2025-06-21 04:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedulecontacts`
--

CREATE TABLE `schedulecontacts` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED DEFAULT NULL,
  `schedulemessage_id` bigint UNSIGNED DEFAULT NULL,
  `status_code` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedulemessages`
--

CREATE TABLE `schedulemessages` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `device_id` bigint UNSIGNED DEFAULT NULL,
  `template_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `schedule_at` datetime DEFAULT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedulemessages`
--

INSERT INTO `schedulemessages` (`id`, `user_id`, `device_id`, `template_id`, `title`, `body`, `schedule_at`, `zone`, `date`, `time`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, '123', 'note : {name} hello vps', '2025-06-21 04:48:00', 'Africa/Tunis', NULL, NULL, 'delivered', '2025-06-21 04:47:13', '2025-06-21 04:48:03'),
(2, 2, NULL, 3, '123', NULL, '2025-06-23 21:09:00', 'Africa/Tunis', NULL, NULL, 'delivered', '2025-06-23 21:07:50', '2025-06-23 21:09:10'),
(3, 10, NULL, NULL, 'azertyuio', '1234556', '2025-07-05 13:57:00', 'Africa/Tunis', NULL, NULL, 'delivered', '2025-07-05 13:55:44', '2025-07-05 13:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `smstesttransactions`
--

CREATE TABLE `smstesttransactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `app_id` bigint UNSIGNED DEFAULT NULL,
  `device_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `charge` double DEFAULT NULL,
  `messaging_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_code` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smstransactions`
--

CREATE TABLE `smstransactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `device_id` bigint UNSIGNED DEFAULT NULL,
  `app_id` bigint UNSIGNED DEFAULT NULL,
  `template_id` bigint UNSIGNED DEFAULT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'from_api',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supportlogs`
--

CREATE TABLE `supportlogs` (
  `id` bigint UNSIGNED NOT NULL,
  `is_admin` int NOT NULL DEFAULT '0',
  `seen` int NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supports`
--

CREATE TABLE `supports` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_no` int NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `uuid`, `user_id`, `title`, `body`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ac3103bb-9415-4597-b8dc-125bc7af62ce', 4, 'Facebook', '{\"text\":\"camera\"}', 'plain-text', 1, '2025-06-21 14:00:43', '2025-06-21 14:00:43'),
(2, 'd5064641-42d2-4afc-8aea-dcb54ed1b2c5', 2, 'salut', '{\"text\":\"salut {name}\"}', 'plain-text', 1, '2025-06-22 15:00:46', '2025-06-22 15:00:46'),
(3, 'a8fae7d9-3fd0-4a7b-a17f-0707e66f6ea5', 2, 'pdf 8.4mo', '{\"caption\":\"pdf 8.4mo\",\"image\":{\"url\":\"http:\\/\\/206.72.199.206\\/uploads\\/message\\/2\\/25\\/06\\/1750712393.jpg\"}}', 'text-with-media', 1, '2025-06-23 20:59:53', '2025-06-23 20:59:53'),
(4, 'a40aad46-062b-46f5-894c-ad1e747247bb', 9, 'Commande', '{\"caption\":\"KVA\",\"image\":{\"url\":\"http:\\/\\/206.72.199.206\\/uploads\\/message\\/9\\/25\\/07\\/1751489113.png\"}}', 'text-with-media', 1, '2025-07-02 20:45:13', '2025-07-02 20:45:13'),
(7, 'a45d2fa2-ab8b-41b5-ae4a-f8815ae6386e', 10, 'azdaz', '{\"text\":\"azdaz\"}', 'plain-text', 1, '2025-07-05 16:06:31', '2025-07-05 16:06:31'),
(8, '361b10c5-55f6-45b9-a463-72bd75a82a0c', 10, 'test', '{\"text\":\"slm {phone_number}  nom ==  {name}\"}', 'plain-text', 1, '2025-07-05 16:23:55', '2025-07-05 16:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authkey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `plan` text COLLATE utf8mb4_unicode_ci,
  `plan_id` int DEFAULT NULL,
  `will_expire` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `authkey`, `wallet`, `role`, `email`, `phone`, `address`, `email_verified_at`, `password`, `status`, `meta`, `plan`, `plan_id`, `will_expire`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'uploads/avatar.png', NULL, NULL, 'admin', 'admin@admin.com', NULL, NULL, NULL, '$2y$10$RjdTcsDyz4Yhdnc1ECrkpOuwUzwKJVbyfZeQ7FHZhOTD8qnns1gdu', 1, NULL, NULL, NULL, NULL, NULL, '2025-06-21 04:30:00', '2025-07-01 23:01:27'),
(2, 'Moataz Mabrouk', NULL, 'VD6IWydCrAI8vFJ379QdzudsUfiljsdMJw7wKDb80WtwJ3nb95', NULL, 'user', 'mabrmoatez@gmail.com', NULL, NULL, NULL, '$2y$10$9TbKgdTpSPBWdVaAoLq2WeU3DFlkYL09QOqY79oHN710exNpRyycC', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-01', NULL, '2025-06-21 04:33:22', '2025-06-21 04:33:22'),
(3, 'test', NULL, 'xBhZV7F4xCtQGYgXaemjaz1tXUhlWEvIm52WXXuxSIaC9bOTur', NULL, 'user', 'user@user.com', NULL, NULL, NULL, '$2y$10$sHqVj5FZcdfyfaPUPaRly./TIGyMojv..aSBLDdJNPuTVJy3dKC42', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-01', NULL, '2025-06-21 12:51:24', '2025-06-21 12:51:24'),
(4, 'hannachi', NULL, 'Dcq6GoWBVeB7JoqaBGDa3U73kOr1uq84QZbYEP3PngRT6HMqAp', NULL, 'user', 'hannachimuhammedfatah@gmail.com', NULL, NULL, NULL, '$2y$10$20.6mgZChgnHKthAvwo7BOKOzHQABRbQgXQU5brEO104OsG0e2Njm', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-01', NULL, '2025-06-21 13:57:44', '2025-06-21 13:57:44'),
(5, 'moataz', NULL, 'ualwq5vQwRbxYA0iDWNHBZ6zkxoveWiMEXPVJKB4cxLFFcLtgM', NULL, 'user', 'develmabrouk@gmail.com', NULL, NULL, NULL, '$2y$10$GzqY6H1oe8WuFtGPe0dMcOF4RHdQ3PPMOq.wVcyJOob9Iz61zyYyu', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-02', NULL, '2025-06-22 15:08:06', '2025-06-22 15:08:06'),
(6, 'emdev', NULL, 'tbLnn06cVG7uANUOIVsuVFrdQmWSSt5CkDfo5wS0RcmyXuVtib', NULL, 'user', 'contact@emdev.click', NULL, NULL, NULL, '$2y$10$omwjlQyXUlyYFfFqy2eyAuLS4DE3Ba3k.e3F8hukwE8pcg4muVTZ2', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-02', NULL, '2025-06-22 15:31:03', '2025-06-22 15:31:03'),
(7, 'Hannachi', NULL, 'gEuLJCzLyUYX1CtfxFpfQZJwmJxrm5VkbLuQOduKU2FFNQx2y4', NULL, 'user', 'rebrand.tn@gmail.com', NULL, NULL, NULL, '$2y$10$a4Ml24WZPhmHPVaqWXkKgu1Qeh6DmiV.cPTrwYIndIGdAN2SC/Pvi', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-23', NULL, '2025-06-23 20:26:33', '2025-06-23 20:30:55'),
(8, 'Ghassen', NULL, 'BUMVVviqVDmKxHgJlisXQXrYVafEJgUZ8lIrAtFO8Do8lqZNjI', NULL, 'user', 'ghassen9713@gmail.com', NULL, NULL, NULL, '$2y$10$vprqidc1C/6hN/7Kdn3yBun1xE82Zm85rGpe1L3c/cYm24OP53iPa', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-07-31', NULL, '2025-07-01 14:00:54', '2025-07-01 17:23:15'),
(9, 'client', NULL, 'cNXGeWQR4MqQVSMndP3lGSbxFiB9A3zwuWCrYWEevrMljkm1JD', NULL, 'user', 'client@gmail.com', NULL, NULL, NULL, '$2y$10$qMhnGJzoPZMGasuCuCB0D.dZGcMfnW5jWdmi7TmQTEp0RlGAe1qMS', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-08-01', NULL, '2025-07-02 13:50:39', '2025-07-02 13:52:30'),
(10, 'client 2', NULL, 'EH2CYCNgYdASqPwrRphdQJROPqtQtWYaP7FMs6Cb0zQjiiGfGx', NULL, 'user', 'client2@gmail.com', NULL, NULL, NULL, '$2y$10$zO0IL853RaZ2FCMMd0GfOeCLsZeV8ITw9m9Rxtc6guuHwG5DMUv5K', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"-1\",\"device_limit\":\"-1\",\"template_limit\":\"-1\",\"apps_limit\":\"-1\",\"chatbot\":\"true\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"true\",\"access_group_list\":\"true\"}', 2, '2025-08-01', NULL, '2025-07-02 13:58:42', '2025-07-02 13:59:39'),
(11, 'Hannachi', NULL, 'Yh5GgruMHDFuRD5LLy2MH9bEvVsiG3Pz93DyJ1M0DsfvEbIGab', NULL, 'user', 'hannachimuhammed@gmail.com', NULL, NULL, NULL, '$2y$10$/6u9cSoInCtecILchhq6G.Y0.BBsr1q4c/cxJRe8SRN69bqmDNwCy', 1, NULL, '{\"messages_limit\":\"-1\",\"contact_limit\":\"3000\",\"device_limit\":\"3\",\"template_limit\":\"100\",\"apps_limit\":\"3\",\"chatbot\":\"false\",\"bulk_message\":\"true\",\"schedule_message\":\"true\",\"access_chat_list\":\"false\",\"access_group_list\":\"true\"}', 2, NULL, NULL, '2025-07-02 21:05:01', '2025-07-02 21:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` bigint UNSIGNED NOT NULL,
  `device_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `hook` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '2',
  `status_code` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apps_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `apps_key_unique` (`key`),
  ADD KEY `apps_user_id_foreign` (`user_id`),
  ADD KEY `apps_device_id_foreign` (`device_id`),
  ADD KEY `apps_uuid_index` (`uuid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorymetas`
--
ALTER TABLE `categorymetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorymetas_category_id_foreign` (`category_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_user_id_foreign` (`user_id`);

--
-- Indexes for table `deviceorders`
--
ALTER TABLE `deviceorders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deviceorders_user_id_foreign` (`user_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `devices_uuid_unique` (`uuid`),
  ADD KEY `devices_user_id_foreign` (`user_id`),
  ADD KEY `devices_uuid_index` (`uuid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupcontacts`
--
ALTER TABLE `groupcontacts`
  ADD KEY `groupcontacts_group_id_foreign` (`group_id`),
  ADD KEY `groupcontacts_contact_id_foreign` (`contact_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_plan_id_foreign` (`plan_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_gateway_id_foreign` (`gateway_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postcategories`
--
ALTER TABLE `postcategories`
  ADD KEY `postcategories_post_id_foreign` (`post_id`),
  ADD KEY `postcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `postmetas`
--
ALTER TABLE `postmetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postmetas_post_id_foreign` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_user_id_foreign` (`user_id`),
  ADD KEY `replies_device_id_foreign` (`device_id`),
  ADD KEY `replies_template_id_foreign` (`template_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedulecontacts`
--
ALTER TABLE `schedulecontacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedulecontacts_contact_id_foreign` (`contact_id`),
  ADD KEY `schedulecontacts_schedulemessage_id_foreign` (`schedulemessage_id`);

--
-- Indexes for table `schedulemessages`
--
ALTER TABLE `schedulemessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedulemessages_user_id_foreign` (`user_id`),
  ADD KEY `schedulemessages_device_id_foreign` (`device_id`),
  ADD KEY `schedulemessages_template_id_foreign` (`template_id`);

--
-- Indexes for table `smstesttransactions`
--
ALTER TABLE `smstesttransactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smstesttransactions_user_id_foreign` (`user_id`),
  ADD KEY `smstesttransactions_app_id_foreign` (`app_id`),
  ADD KEY `smstesttransactions_device_id_foreign` (`device_id`);

--
-- Indexes for table `smstransactions`
--
ALTER TABLE `smstransactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `smstransactions_user_id_foreign` (`user_id`),
  ADD KEY `smstransactions_device_id_foreign` (`device_id`),
  ADD KEY `smstransactions_app_id_foreign` (`app_id`),
  ADD KEY `smstransactions_template_id_foreign` (`template_id`);

--
-- Indexes for table `supportlogs`
--
ALTER TABLE `supportlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supportlogs_support_id_foreign` (`support_id`),
  ADD KEY `supportlogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `supports`
--
ALTER TABLE `supports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supports_user_id_foreign` (`user_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templates_uuid_unique` (`uuid`),
  ADD KEY `templates_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webhooks_device_id_foreign` (`device_id`),
  ADD KEY `webhooks_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categorymetas`
--
ALTER TABLE `categorymetas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1087;

--
-- AUTO_INCREMENT for table `deviceorders`
--
ALTER TABLE `deviceorders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `postmetas`
--
ALTER TABLE `postmetas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedulecontacts`
--
ALTER TABLE `schedulecontacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedulemessages`
--
ALTER TABLE `schedulemessages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `smstesttransactions`
--
ALTER TABLE `smstesttransactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smstransactions`
--
ALTER TABLE `smstransactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supportlogs`
--
ALTER TABLE `supportlogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supports`
--
ALTER TABLE `supports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apps`
--
ALTER TABLE `apps`
  ADD CONSTRAINT `apps_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `apps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorymetas`
--
ALTER TABLE `categorymetas`
  ADD CONSTRAINT `categorymetas_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deviceorders`
--
ALTER TABLE `deviceorders`
  ADD CONSTRAINT `deviceorders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groupcontacts`
--
ALTER TABLE `groupcontacts`
  ADD CONSTRAINT `groupcontacts_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groupcontacts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_gateway_id_foreign` FOREIGN KEY (`gateway_id`) REFERENCES `gateways` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `postcategories`
--
ALTER TABLE `postcategories`
  ADD CONSTRAINT `postcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `postcategories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `postmetas`
--
ALTER TABLE `postmetas`
  ADD CONSTRAINT `postmetas_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `replies_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedulecontacts`
--
ALTER TABLE `schedulecontacts`
  ADD CONSTRAINT `schedulecontacts_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedulecontacts_schedulemessage_id_foreign` FOREIGN KEY (`schedulemessage_id`) REFERENCES `schedulemessages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedulemessages`
--
ALTER TABLE `schedulemessages`
  ADD CONSTRAINT `schedulemessages_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `schedulemessages_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `schedulemessages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smstesttransactions`
--
ALTER TABLE `smstesttransactions`
  ADD CONSTRAINT `smstesttransactions_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `smstesttransactions_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `smstesttransactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `smstransactions`
--
ALTER TABLE `smstransactions`
  ADD CONSTRAINT `smstransactions_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `smstransactions_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `smstransactions_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `smstransactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supportlogs`
--
ALTER TABLE `supportlogs`
  ADD CONSTRAINT `supportlogs_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supportlogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `supports`
--
ALTER TABLE `supports`
  ADD CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `templates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD CONSTRAINT `webhooks_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `webhooks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
