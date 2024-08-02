-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2024 at 09:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_web_kids`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `rekening_name` varchar(255) NOT NULL,
  `rekening_no` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `rekening_name`, `rekening_no`, `createdAt`, `updatedAt`) VALUES
('0be470b9-2a90-447c-a2a5-e40a4d28b649', 'BTN', 'Code Gyt', '5738291046753812', '2024-06-30 17:29:16', '2024-06-30 17:29:16'),
('70c6d429-2a01-4ce3-a3c2-2a70bd98a675', 'BCA', 'Code Gyt', '4821937650', '2022-12-27 07:35:09', '2024-06-30 17:23:17'),
('71c34118-8a1e-46bc-a9eb-03b27b244f68', 'CIMB Niaga', 'Code Gyt', '8294731056824', '2024-06-30 17:30:08', '2024-06-30 17:30:08'),
('b4c3f33f-c0c5-4100-8e35-e83dace7e68d', 'Mandiri', 'Code Gyt', '1928374650912', '2024-06-30 17:26:46', '2024-06-30 17:30:17'),
('b96ec737-2bd0-4696-98fa-e330728e6692', 'BSI', 'Code Gyt', '3849271056823', '2024-06-30 17:28:23', '2024-06-30 17:28:23'),
('eb97ab35-5dd4-4e67-810b-2dd71b9ee5db', 'BRI', 'Code Gyt', '957316428703159', '2024-06-30 17:22:39', '2024-06-30 17:22:39'),
('fee72d16-e86c-4108-878d-850ab42f51e6', 'BNI', 'Code Gyt', '5839201476', '2023-02-16 15:03:31', '2024-06-30 17:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
('240f61d5-5ccf-41bd-9f71-e62a35cc1a6c', 'Android / Mobile', '2024-06-30 17:31:06', '2024-06-30 17:31:06'),
('3abbf2af-38a2-49b0-a2d9-bf083689b292', 'Back-end Special', '2024-07-09 13:00:27', '2024-07-09 13:00:27'),
('712046b4-399e-4b97-bcc4-41c2277f93e5', 'artificial intelligence', '2024-06-30 17:32:20', '2024-06-30 17:32:20'),
('89798586-f9bd-4bf4-b981-06251725cdfb', 'Object Oriented Programming (OOP)', '2024-06-30 17:30:58', '2024-06-30 17:30:58'),
('a138e352-bde0-4fea-ba36-54f95546351d', 'Fundamental', '2024-06-30 17:30:41', '2024-06-30 17:30:41'),
('c3f7c680-e3c1-46a5-b11d-8f9d912e37a6', 'Website', '2022-12-26 13:11:42', '2024-06-30 17:30:30'),
('d2bd9a1b-f090-4964-81ac-d3d3929d3694', 'Logika ', '2023-02-04 01:56:34', '2024-06-30 17:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `deskripsi_content` longtext NOT NULL,
  `content` varchar(255) NOT NULL,
  `isLocked` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `kelaId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `deskripsi_content`, `content`, `isLocked`, `createdAt`, `updatedAt`, `kelaId`) VALUES
('06a191e6-7f6f-488f-8bf0-dc956edd9e50', 'Cara Kerja Java', '<p>Cara Kerja Java</p><p><br></p>', 'OrgFwUl2tzQ', 1, '2024-07-20 19:32:28', '2024-07-20 19:32:28', '98a7e22c-960d-444d-8044-39df567851af'),
('103d5577-b17d-4f8a-8f92-973b096327ce', 'Pendahuluan HTML', '<p>deskripsi materi pendahuluan html</p>', 'NBZ9Ro6UKV8', 0, '2023-02-04 02:36:30', '2023-02-04 02:36:30', '0e71aec6-a60b-4256-9769-a423f5902bb1'),
('16125106-416c-49df-a7cc-efead5dbcbb7', 'Activity', '<p>Activity</p><p><br></p>', 'lqJVL_DeXu0', 1, '2024-07-20 19:33:59', '2024-07-20 19:33:59', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('19be54f2-8b59-4e75-a235-32a1a4d080fa', 'Roadmap Web', '<p>ini materi roadmap web</p>', 'c_fRtpQf4Oc', 0, '2023-02-04 02:34:49', '2023-02-04 02:34:49', '0e71aec6-a60b-4256-9769-a423f5902bb1'),
('1aa1fb8b-f9c5-4b5e-9ac1-ce6011083a48', 'Mengenal Bahasa Pemrograman C++', '<p>Mengenal Bahasa Pemrograman C++</p>', 'r4fZPG5N6tk', 0, '2024-07-20 19:28:24', '2024-07-20 19:28:24', '0929da04-4831-4b90-99ec-634e40a4738f'),
('1df5aa83-1a94-41a0-9cc6-f86b03f572c2', 'Pengenalan Print dan Alur Eksekusi', '<p>Pengenalan Print dan Alur Eksekusi</p><p><br></p>', 'sNgYNAQI8mw', 1, '2024-07-20 19:33:05', '2024-07-20 19:33:05', '98a7e22c-960d-444d-8044-39df567851af'),
('1f61e8fc-c39a-4469-badb-beef0a00fd54', 'Perulangan PHP', '<p>Perulangan PHP</p>', 'gej2bWVVh7I', 1, '2024-07-20 19:27:13', '2024-07-20 19:27:13', '4ecae2e2-b714-4240-bb94-4886e03aa248'),
('2467b4bf-506e-4a7c-862a-9e88cd485778', 'Operator Logika', '<p>Operator Logika</p><p><br></p>', 'lD55-CjmCZE', 1, '2024-07-20 19:29:28', '2024-07-20 19:29:28', '0929da04-4831-4b90-99ec-634e40a4738f'),
('25c6efaa-ec78-4477-8e61-b039167e8a48', 'Memahami String[ ] args', '<p>Memahami String[ ] args</p>', 'xF5xujaKLPE', 1, '2024-07-20 19:33:22', '2024-07-20 19:33:22', '98a7e22c-960d-444d-8044-39df567851af'),
('2b54abd2-12ab-48fa-981f-de1cf1fd7785', 'Pembelajaran LOGIKA & ALGORITMA pertemuan 1', '<p>Pembelajaran LOGIKA &amp; ALGORITMA pertemuan 1</p><p><br></p>', 'xE-r1_5rYC0', 0, '2024-07-20 19:29:53', '2024-07-20 19:29:53', '24b6bce6-be20-4c05-8e64-952095113940'),
('2e193b00-966e-492b-8f3c-367ab0835e89', 'web dinamis', '<p>web dinamis</p>', 'r6XRZkCheKg', 1, '2024-06-25 08:14:22', '2024-06-25 08:14:22', '0e71aec6-a60b-4256-9769-a423f5902bb1'),
('2e351073-3df1-44a2-8aa9-8d47fb924cb5', 'TextView', '<p>TextView</p><p><br></p>', 'JrrQOWaLIks', 1, '2024-07-20 19:34:36', '2024-07-20 19:34:36', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('30bcce07-4277-4715-9af2-7065f2f08294', 'Memahami Struktur Program', '<p>Memahami Struktur Program</p><p><br></p>', 's7x4oB_7wrk', 1, '2024-07-20 19:32:41', '2024-07-20 19:32:41', '98a7e22c-960d-444d-8044-39df567851af'),
('31ac8700-8878-440f-9fcb-cae8d2924c6f', 'Pembelajaran LOGIKA & ALGORITMA Pertemuan 5', '<p>Pembelajaran LOGIKA &amp; ALGORITMA Pertemuan 5</p><p><br></p>', '1oOZJvMo8U8', 1, '2024-07-20 19:31:52', '2024-07-20 19:31:52', '24b6bce6-be20-4c05-8e64-952095113940'),
('33ec30bf-63c9-4d48-9651-2baee95dafd3', 'Belajar Struktur Bahasa Pemrograman C++', '<p>Belajar Struktur Bahasa Pemrograman C++</p><p><br></p>', 'VMT7Felu1MI', 0, '2024-07-20 19:28:37', '2024-07-20 19:28:37', '0929da04-4831-4b90-99ec-634e40a4738f'),
('346014da-9178-4274-9d0e-41aee3116d00', 'Tipe Data Number', '<p>Tipe Data Number</p><p><br></p>', 'z0qNnwardGg', 1, '2024-07-20 19:25:33', '2024-07-20 19:25:33', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('3b427400-970b-4a90-973a-d62a73397d62', 'Operator Aritmatika', '<p>Operator Aritmatika</p><p><br></p>', '8DL_Bax4mro', 1, '2024-07-20 19:29:14', '2024-07-20 19:29:14', '0929da04-4831-4b90-99ec-634e40a4738f'),
('3ceb4d2f-2fc4-4ab8-8b41-15412f51f440', 'saseqwe', '<p>adwad</p>', 'r6XRZkCheKg', 0, '2024-06-25 08:24:04', '2024-06-25 08:24:04', NULL),
('3f36d40a-cb51-47ee-960c-d7288441968a', 'Apa itu PHP?', '<p>Apa itu PHP?</p><p><br></p>', 'QJMTprXtPa0', 0, '2024-07-20 19:26:31', '2024-07-20 19:26:31', '4ecae2e2-b714-4240-bb94-4886e03aa248'),
('46782381-6bb4-4719-a161-7755cc6e0fff', 'Variabel, Assignment dan Deklarasi', '<p>Variabel, Assignment dan Deklarasi</p><p><br></p>', 'ddK6hExKhmM ', 1, '2024-07-20 19:33:30', '2024-07-20 19:33:30', '98a7e22c-960d-444d-8044-39df567851af'),
('52c888f5-be5d-4d85-a8e9-fa15df509841', 'Apa itu Java?', '<p>Apa itu Java?</p><p><br></p>', 'uHyfQV0kbgo', 0, '2024-07-20 19:32:15', '2024-07-20 19:32:15', '98a7e22c-960d-444d-8044-39df567851af'),
('588eccbf-1e46-439a-82d7-a880f21a840e', 'Eksplore Variable Input dan Output', '<p>Eksplore Variable Input dan Output</p><p><br></p>', '0sFh-rALd2Q', 1, '2024-07-20 19:29:00', '2024-07-20 19:29:00', '0929da04-4831-4b90-99ec-634e40a4738f'),
('66b4d66a-68b5-4525-af16-47aedf62b929', 'Variable dalam PHP', '<p>Variable dalam PHP</p><p><br></p>', 'tpEfl46GSe0', 0, '2024-07-20 19:26:45', '2024-07-20 19:26:45', '4ecae2e2-b714-4240-bb94-4886e03aa248'),
('6cffc715-efa6-4f23-b688-5fc5bd2ed7d3', 'Tipe Data pada Pemrograman C++', '<p>Tipe Data pada Pemrograman C++</p><p><br></p>', 'zbSzPA9xTLo', 1, '2024-07-20 19:28:48', '2024-07-20 19:28:48', '0929da04-4831-4b90-99ec-634e40a4738f'),
('708ba179-7938-4344-afa1-794172dbd405', 'For Loop (Perulangan)', '<p>For Loop (Perulangan) Dalam Python</p><p><br></p>', 'Z4qfMhx4XzQ', 1, '2024-07-11 16:57:11', '2024-07-11 16:57:11', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('716e716c-1f1d-4c56-b66f-dff9461f9714', 'EditText', '<p>EditText</p>', 'mczlHrl1ElE', 1, '2024-07-20 19:34:54', '2024-07-20 19:34:54', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('756ff9ed-2ec1-4165-8920-ad6686a81570', 'Menjalankan JavaScript', '<p>Js</p>', 'BN6fyGVf5A4', 0, '2024-07-20 19:24:26', '2024-07-20 19:24:26', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('7858f6ac-ee36-4a8e-9717-b86987a39537', 'Pembelajaran LOGIKA & ALGORITMA Pertemuan 4', '<p>Pembelajaran LOGIKA &amp; ALGORITMA Pertemuan 4</p><p><br></p>', 'cB52iNBtkV4', 1, '2024-07-20 19:31:41', '2024-07-20 19:31:41', '24b6bce6-be20-4c05-8e64-952095113940'),
('7a3cfff3-181b-4ff7-8137-421118f758c9', 'Operasi Aritmatika', '<p>Operasi Aritmatika</p>', 'RoDGGTWbKK4', 1, '2024-07-11 16:55:42', '2024-07-11 16:55:42', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('7ad7c456-b866-46eb-9862-5ac10f85af0d', 'Pengenalan C++', '<p>ffesfesfesfsfesfesfsef</p>', 'lsVQKKqm4iQ', 1, '2024-06-29 20:11:27', '2024-06-29 20:11:27', NULL),
('7c32ef98-b6b0-464a-9756-1a2c62ebb13e', 'ImageView', '<p>ImageView</p><p><br></p>', 'gVvRODI7iDU', 1, '2024-07-20 19:35:07', '2024-07-20 19:36:04', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('7df8faf1-0c01-4ac3-9628-016a8a0ac7e6', 'Button', '<p>Button</p>', 'XB-oKEgHOwE', 1, '2024-07-20 19:34:25', '2024-07-20 19:34:25', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('8512dfad-9382-48db-8dce-c3e7ab34d740', 'Variabel (let , var, const)', '<p>Variabel (let , var, const)</p><p><br></p>', 'op30bc1Mm60', 0, '2024-07-20 19:25:02', '2024-07-20 19:25:02', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('868b460f-c0aa-455f-8934-5157205b4c27', 'Pembelajaran LOGIKA & ALGORITMA Pertemuan 3', '<p>Pembelajaran LOGIKA &amp; ALGORITMA Pertemuan 3</p><p><br></p>', 'ZHPjrv_pbJY', 1, '2024-07-20 19:31:29', '2024-07-20 19:31:29', '24b6bce6-be20-4c05-8e64-952095113940'),
('89ffe943-776e-4121-b88d-8bdcc1526903', 'Boolean', '<p>Boolean</p>', 'R9YSWHhR1T8', 1, '2024-07-20 19:25:46', '2024-07-20 19:25:46', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('8fc6b40d-f032-43e0-a9fd-5a1af515d1cf', 'Apa Itu Python?', '<p>Pengenalan Python</p>', 'iA8lLwmtKQM', 0, '2024-07-11 16:53:46', '2024-07-11 16:53:46', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('a47d468e-30d4-4d26-a37d-f7be5eaaf2a5', 'Operasi Aritmatika', '<p>Operasi Aritmatika</p>', 'WcZJfBa9NzY', 1, '2024-07-20 19:26:10', '2024-07-20 19:26:10', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('aaf204df-44d9-4e00-a488-e4936b3b0364', 'Pembuatan Form', '<p>ini materi pembuatan form</p>', 'LQf_Jj7jbCI', 1, '2023-02-04 02:37:24', '2023-02-04 02:37:24', '0e71aec6-a60b-4256-9769-a423f5902bb1'),
('b3c8f2f6-d111-478e-b672-73224ef4af89', 'Function (Fungsi) dalam PHP', '<p>Function (Fungsi) dalam PHP</p>', 'RMk4KOgafc4', 1, '2024-07-20 19:27:53', '2024-07-20 19:27:53', '4ecae2e2-b714-4240-bb94-4886e03aa248'),
('b62b84d6-bc95-4656-bb8a-e1a9abb26204', 'Operasi Logika atau Boolean', '<p>Operasi Logika atau Boolean Dalam Python</p><p><br></p>', 'Sl7zqPpC2VI', 1, '2024-07-11 16:56:04', '2024-07-11 16:56:04', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('bd32844c-aad1-4454-bb64-5d4a2008a3e6', 'Pembelajaran LOGIKA & ALGORITMA Pertemuan 2', '<p>Pembelajaran LOGIKA &amp; ALGORITMA Pertemuan 2</p><p><br></p>', 'htyRqosE6Qg', 1, '2024-07-20 19:30:11', '2024-07-20 19:30:11', '24b6bce6-be20-4c05-8e64-952095113940'),
('bd74fd2f-df3a-43ea-9db9-975239563460', 'Logika Percabangan PHP', '<p>Logika Percabangan PHP</p><p><br></p>', 'rAyVIuIryH0', 1, '2024-07-20 19:27:01', '2024-07-20 19:27:01', '4ecae2e2-b714-4240-bb94-4886e03aa248'),
('bf9e373e-b173-470a-9a86-3611a533ffd2', 'Tipe Data', '<p>Tipe Data Dalam Python</p>', 'b3X0CH98Y9g', 1, '2024-07-11 16:55:14', '2024-07-11 16:57:24', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('c6f019be-5fda-41bd-a8b1-49f8ce700eee', 'Pengenalan Kotlin', '<p>Pengenalan Kotlin</p><p><br></p>', 'h_0FtYwrlE0', 0, '2024-07-20 19:33:47', '2024-07-20 19:33:47', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('ca407137-1ecc-44c0-80bd-21c9a5e8c5ed', 'IF dan ELSE Statement', '<p><strong>IF dan ELSE Statement Dalam Python</strong></p>', 'rF8rh40z_X0', 1, '2024-07-11 16:56:51', '2024-07-11 16:56:51', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('d1e8a890-6599-4063-85a2-a14f33f8eed9', 'Array PHP', '<p>Array PHP</p><p><br></p>', '9bD5Iqn2gtk', 1, '2024-07-20 19:27:27', '2024-07-20 19:27:27', '4ecae2e2-b714-4240-bb94-4886e03aa248'),
('d2febfda-f155-466a-a8ba-2efc9ec2ecc8', 'Mengenal Variabel', '<p>Variabel Dalam Python.</p><p><br></p><p><br></p><h1><strong>Jika Ingin Lanjut Silahkan Berlangganan Dulu.</strong></h1>', 'gxmTFXfrMzk', 0, '2024-07-11 16:54:31', '2024-07-11 16:57:35', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e'),
('d7d0300b-f9a7-436a-a18d-54f5cb34a647', 'Apa itu Javascript?', '<p>Lorem h</p>', 'sNLadea-tLU', 0, '2024-07-20 19:24:07', '2024-07-20 19:24:50', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('e7cfd67b-8d68-4aa7-b792-e46aabd8b475', 'Css Tailwind', '<p>ee2qeq2e2q</p>', 'shl3ENyT4bI', 0, '2024-07-09 11:41:08', '2024-07-09 11:41:08', '0e71aec6-a60b-4256-9769-a423f5902bb1'),
('ec9370d7-fbcb-4fc3-be91-9d4ed3fda9d5', 'Layout', '<p>Layout</p><p><br></p>', 'C1BB2ibQRD0', 1, '2024-07-20 19:34:12', '2024-07-20 19:34:12', 'd68c6163-1a54-43f9-8daf-8b9493cbce18'),
('f819e76f-db64-47af-b1ec-2565260178d8', 'Tipe Data', '<p>Tipe Data</p>', 'v5qtnn9eJ2M', 1, '2024-07-20 19:25:19', '2024-07-20 19:25:19', '6c890930-1a2a-428a-ac4a-7c9834ade08a'),
('fdc948c2-f0b7-4fc9-b95f-0a03b2e4cc13', 'Organisasi Program dengan Package', '<p>Organisasi Program dengan Package</p><p><br></p>', 'VqCQmEdF7E8', 1, '2024-07-20 19:32:53', '2024-07-20 19:32:53', '98a7e22c-960d-444d-8044-39df567851af');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `deskripsi_kelas` longtext NOT NULL,
  `thumbnail_kelas` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `name`, `deskripsi_kelas`, `thumbnail_kelas`, `thumbnail_url`, `harga`, `createdAt`, `updatedAt`, `categoryId`) VALUES
('0929da04-4831-4b90-99ec-634e40a4738f', 'Belajar C++ Dasar', 'MEMPELAJARI DASAR C++', 'ecf15134212ce77b079be4fe1d5d0d20.jpg', 'http://localhost:5000/images/ecf15134212ce77b079be4fe1d5d0d20.jpg', 199998, '2024-07-09 13:01:58', '2024-07-09 13:01:58', 'a138e352-bde0-4fea-ba36-54f95546351d'),
('0e71aec6-a60b-4256-9769-a423f5902bb1', 'Belajar Web Dasar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae quam sapien. Donec vestibulum nisl ligula, vel commodo libero egestas in. Praesent feugiat libero pharetra, venenatis orci non, auctor quam. Donec faucibus diam vitae neque malesuada vulputate. Cras iaculis est nec nunc molestie interdum. Ut volutpat mauris nec felis vulputate, id imperdiet urna tincidunt. Morbi dignissim dolor id sem sollicitudin, a feugiat massa sodales. Phasellus ultrices vel tortor in facilisis. Cras id dui vitae ex cursus condimentum sed quis eros. Cras id convallis elit. Donec porta neque egestas, volutpat nulla non, luctus lacus.\r\n\r\nSed vitae diam posuere, eleifend ligula at, faucibus risus. Morbi convallis interdum ante, id suscipit tellus venenatis at. Morbi et fermentum diam, in commodo lectus. Mauris ut tortor faucibus, pharetra nunc ut, dictum enim. Phasellus dignissim, enim sit amet lobortis efficitur, purus augue ullamcorper tortor, a dapibus dui lectus id lorem. Nullam nec mauris auctor, tristique libero eu, aliquam lorem. Donec gravida nibh odio, in euismod mauris venenatis scelerisque. Nullam sollicitudin sollicitudin nunc, porta tincidunt lectus pharetra non. Fusce sed neque imperdiet, tempus est at, pellentesque eros. Donec cursus tincidunt ligula, vitae luctus magna vehicula vel. Aenean ornare, erat ac porta mattis, nunc eros convallis mauris, in convallis elit ex sit amet orci. Nullam lacinia ligula quis pulvinar tristique. Curabitur aliquam justo ultrices, dictum nibh ut, gravida quam.\r\n\r\nNunc pellentesque venenatis est, nec placerat eros hendrerit at. Maecenas dignissim id nibh vel accumsan. Morbi interdum, lectus posuere lacinia facilisis, mauris elit ullamcorper nunc, id maximus nisl lectus in nibh. Suspendisse nibh urna, consequat quis sem sed, commodo fermentum urna. Sed sed ultricies quam, in egestas quam. Vestibulum ornare ligula ut neque volutpat lobortis. In malesuada ante egestas leo mattis, ut tincidunt ex efficitur. Aliquam eleifend nec eros ut tempor. Proin sit amet mi ex. Fusce dictum suscipit nisl malesuada rhoncus. Nullam imperdiet lorem posuere mi molestie fringilla. Etiam blandit, urna in pulvinar sodales, magna lorem commodo odio, ut dignissim tellus elit accumsan sem. Ut nec purus pulvinar, rhoncus mauris a, varius quam. Maecenas nec facilisis enim. Quisque at laoreet lorem.', '881bd202f8a47836aa4750d254c98d1a.jpg', 'http://localhost:5000/images/881bd202f8a47836aa4750d254c98d1a.jpg', 33999, '2023-02-04 02:04:53', '2024-07-09 14:39:25', 'c3f7c680-e3c1-46a5-b11d-8f9d912e37a6'),
('24b6bce6-be20-4c05-8e64-952095113940', 'Belajar Logika Dasar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis eros vel euismod vestibulum. Vestibulum accumsan enim nec justo vestibulum, sed dictum quam dapibus. Etiam imperdiet vulputate turpis non fringilla. Phasellus rhoncus diam metus, quis tempus tortor blandit a. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec turpis ipsum, condimentum non pulvinar quis, hendrerit vitae arcu. Nulla feugiat in magna eget imperdiet. Quisque non odio leo. Phasellus ornare eu ligula in tempor. Curabitur ullamcorper id mauris sed pharetra. Donec tempus convallis convallis.\r\n\r\nMorbi id enim mi. Duis imperdiet efficitur ipsum, id tempus risus viverra eget. Duis eu tristique lorem, et fringilla nibh. Fusce vitae condimentum turpis. Etiam massa eros, porttitor eu diam sed, finibus laoreet enim. Cras placerat purus quam, sed vulputate ante mollis accumsan. Ut congue libero ac scelerisque ullamcorper. Vivamus fringilla viverra mi a pretium. Mauris venenatis quam non lobortis eleifend. Cras id risus sed mi vulputate pulvinar ut et metus. Sed feugiat venenatis aliquam. Donec sagittis justo vitae tristique interdum.\r\n\r\nNullam lectus metus, viverra ut rhoncus at, lobortis sed nulla. Vestibulum sit amet finibus nunc. Pellentesque euismod ante a eros egestas, vitae luctus arcu dictum. Morbi mattis nisl eu turpis sodales, eu posuere justo sodales. Cras a felis vel lacus tincidunt auctor. Praesent sagittis consequat consequat. Nam nulla mi, posuere et mattis ac, laoreet a ex. Duis varius, risus a venenatis imperdiet, tellus ligula tempus sapien, a accumsan ex risus quis velit.\r\n\r\nFusce a turpis nec nulla faucibus ornare faucibus ut nisl. Sed quis neque tellus. Integer at tristique lorem. Etiam pellentesque, velit at accumsan elementum, arcu enim vestibulum leo, vel lacinia arcu orci facilisis odio. Nam rutrum, metus vel dapibus posuere, ante arcu efficitur augue, vel ornare nibh ipsum vel ipsum. Ut malesuada dolor eget enim laoreet, vitae blandit sem luctus. Suspendisse molestie pretium aliquam. Phasellus mollis arcu eu elit luctus vulputate. Donec blandit tortor et viverra vestibulum. Etiam ornare sed libero a cursus. Nam finibus nisl venenatis eros fringilla condimentum. Mauris imperdiet eros imperdiet felis laoreet, quis suscipit dui blandit. Vestibulum elementum sed dui eu eleifend.', 'e79f0f09b2f057c29eda066d649896a1.png', 'http://localhost:5000/images/e79f0f09b2f057c29eda066d649896a1.png', 23000, '2022-12-27 07:35:50', '2024-07-09 14:37:14', 'd2bd9a1b-f090-4964-81ac-d3d3929d3694'),
('3b2ce72d-7cd7-43a7-b2a7-22016c425126', 'Belajar Flutter Dasar', 'Lorem', 'cb535a52a6125583ae61af7a71ef2ea3.jpg', 'http://localhost:5000/images/cb535a52a6125583ae61af7a71ef2ea3.jpg', 100000, '2024-07-10 17:45:07', '2024-07-10 17:45:07', '240f61d5-5ccf-41bd-9f71-e62a35cc1a6c'),
('4ecae2e2-b714-4240-bb94-4886e03aa248', 'Belajar PHP Dasar', 'Lorem Ipsum', '7683f09db41daf8ba8f8284d6e9e521f.jpg', 'http://localhost:5000/images/7683f09db41daf8ba8f8284d6e9e521f.jpg', 99000, '2024-07-09 14:38:20', '2024-07-09 14:38:20', '3abbf2af-38a2-49b0-a2d9-bf083689b292'),
('63c450ea-a5bd-479a-a872-1a161e019a81', 'Belajar Framework Laravel', 'Lorem', 'c3128cd17b31c2ea8745ff05ac40342a.png', 'http://localhost:5000/images/c3128cd17b31c2ea8745ff05ac40342a.png', 150000, '2024-07-10 17:43:28', '2024-07-10 17:43:28', 'c3f7c680-e3c1-46a5-b11d-8f9d912e37a6'),
('6c890930-1a2a-428a-ac4a-7c9834ade08a', 'Belajar JavaScript ', 'Lorem', '21e481a50a605f0f3889694849ad77e8.jpg', 'http://localhost:5000/images/21e481a50a605f0f3889694849ad77e8.jpg', 80000, '2024-07-09 16:39:17', '2024-07-09 16:39:49', 'c3f7c680-e3c1-46a5-b11d-8f9d912e37a6'),
('8c81c10e-b405-4b22-b95c-4c3a68cbd34e', 'Belajar Python Dasar', 'Lorem', '7bc14f73e26d1a48f911873d9087203d.jpg', 'http://localhost:5000/images/7bc14f73e26d1a48f911873d9087203d.jpg', 100000, '2024-07-09 14:40:16', '2024-07-09 14:40:16', '712046b4-399e-4b97-bcc4-41c2277f93e5'),
('98a7e22c-960d-444d-8044-39df567851af', 'Belajar Java Dasar', 'Lorem', 'b6fd760581280d9f05ad771e923bcaa7.png', 'http://localhost:5000/images/b6fd760581280d9f05ad771e923bcaa7.png', 99999, '2024-07-10 17:44:36', '2024-07-10 17:44:36', '89798586-f9bd-4bf4-b981-06251725cdfb'),
('d68c6163-1a54-43f9-8daf-8b9493cbce18', 'Belajar Aplikasi Android', 'Lorem Kotlin', 'da514d9b1251c3d2c78361f99e115754.png', 'http://localhost:5000/images/da514d9b1251c3d2c78361f99e115754.png', 80000, '2024-07-10 17:44:02', '2024-07-10 17:44:02', '240f61d5-5ccf-41bd-9f71-e62a35cc1a6c');

-- --------------------------------------------------------

--
-- Table structure for table `langganan`
--

CREATE TABLE `langganan` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kelaId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `transaksiDetailId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `langganan`
--

INSERT INTO `langganan` (`id`, `createdAt`, `updatedAt`, `userId`, `kelaId`, `transaksiDetailId`) VALUES
('0e473833-f3b5-43b0-af54-218796bdfb86', '2024-07-09 13:12:14', '2024-07-09 13:12:14', '242bf85b-67dc-44d0-bc81-23b414bd1c05', '0929da04-4831-4b90-99ec-634e40a4738f', NULL),
('596bb048-a49c-4520-9726-c2190fe5217b', '2024-07-19 19:02:54', '2024-07-19 19:02:54', '242bf85b-67dc-44d0-bc81-23b414bd1c05', '0929da04-4831-4b90-99ec-634e40a4738f', NULL),
('6e0485f5-8ac0-4e49-9561-3a79923ea23d', '2024-07-11 16:58:56', '2024-07-11 16:58:56', '242bf85b-67dc-44d0-bc81-23b414bd1c05', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e', '1fade9ea-0047-4500-9838-e68763f22c8d'),
('d25799cc-4a4a-4c7f-be8b-c8d83645dc30', '2024-07-19 19:08:24', '2024-07-19 19:08:24', '35eea8ab-4773-4378-8eb6-94d704597905', '0e71aec6-a60b-4256-9769-a423f5902bb1', 'c6cde6db-106d-4190-b5a3-1fba02da039d');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('UkpZVWqdO6vLxc6OHsWgZZy1zPFpaUbL', '2024-07-21 19:37:43', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2024-07-21T19:35:25.872Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":\"242bf85b-67dc-44d0-bc81-23b414bd1c05\"}', '2024-07-20 19:21:55', '2024-07-20 19:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bukti_transaksi` text DEFAULT NULL,
  `bukti_transaksi_url` text DEFAULT NULL,
  `status_transaksi` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kelaId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bankId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `name`, `bukti_transaksi`, `bukti_transaksi_url`, `status_transaksi`, `createdAt`, `updatedAt`, `userId`, `kelaId`, `bankId`) VALUES
('1fade9ea-0047-4500-9838-e68763f22c8d', 'Didik Vinastu', '769ee9211fdecaefab5f251c1a38c83f.jpg', 'http://localhost:5000/bukti_transfer/769ee9211fdecaefab5f251c1a38c83f.jpg', 'SELESAI', '2024-07-11 16:58:21', '2024-07-11 16:58:56', '242bf85b-67dc-44d0-bc81-23b414bd1c05', '8c81c10e-b405-4b22-b95c-4c3a68cbd34e', '70c6d429-2a01-4ce3-a3c2-2a70bd98a675'),
('c6cde6db-106d-4190-b5a3-1fba02da039d', 'Didik Vinastu', '769ee9211fdecaefab5f251c1a38c83f.jpg', 'http://localhost:5000/bukti_transfer/769ee9211fdecaefab5f251c1a38c83f.jpg', 'SELESAI', '2024-07-19 19:05:18', '2024-07-19 19:08:24', '35eea8ab-4773-4378-8eb6-94d704597905', '0e71aec6-a60b-4256-9769-a423f5902bb1', '70c6d429-2a01-4ce3-a3c2-2a70bd98a675');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `no_telp`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('242bf85b-67dc-44d0-bc81-23b414bd1c05', 'Didik Vinastu', '85320200399', 'vin@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$8eAf+hu/x86eqfL1kMkJjQ$c+oWMoxfiGhsrJV9PN1VXzLm+HGTsKxnkU6ex1pS55s', 'user', '2024-06-20 12:27:32', '2024-06-20 12:27:32'),
('35eea8ab-4773-4378-8eb6-94d704597905', 'Didik Vinastu', '85320200399', 'vinast@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$82BoFEfRBxL3WYA4k8oSBw$41HHl3HgLaP7LjSZKWgC8bkdIeRgsI1VeYq/spxOcKU', 'admin', '2022-12-26 13:08:53', '2024-07-09 11:39:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelaId` (`kelaId`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `langganan`
--
ALTER TABLE `langganan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `kelaId` (`kelaId`),
  ADD KEY `transaksiDetailId` (`transaksiDetailId`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `kelaId` (`kelaId`),
  ADD KEY `bankId` (`bankId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`kelaId`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `langganan`
--
ALTER TABLE `langganan`
  ADD CONSTRAINT `langganan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `langganan_ibfk_2` FOREIGN KEY (`kelaId`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `langganan_ibfk_3` FOREIGN KEY (`transaksiDetailId`) REFERENCES `transaksi_details` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD CONSTRAINT `transaksi_details_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_details_ibfk_2` FOREIGN KEY (`kelaId`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_details_ibfk_3` FOREIGN KEY (`bankId`) REFERENCES `banks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
