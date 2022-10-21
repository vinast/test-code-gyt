-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 20 Okt 2022 pada 13.48
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

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
-- Struktur dari tabel `banks`
--

CREATE TABLE `banks` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `banks`
--

INSERT INTO `banks` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
('86c989b6-ba93-404d-896f-12117441e3e9', 'Bank Plecit ', '2022-10-18 11:43:17', '2022-10-19 04:06:24'),
('95f501e3-49e1-4d5c-b558-a80c3bba2111', 'Bank DOSO', '2022-10-18 11:43:48', '2022-10-18 11:43:48'),
('e3406c74-ada8-4234-b3c4-48b6d5cb9b58', 'Bank BNI SYARIAH', '2022-10-18 11:43:33', '2022-10-18 11:43:33'),
('e99192b7-901c-48de-a8c3-6e919f286a66', 'Bank BMT AMANAH', '2022-10-19 02:29:48', '2022-10-19 02:29:48'),
('f5b8c4af-912d-4d8d-bb4c-e14046729c2f', 'Bank BSI', '2022-10-18 11:43:39', '2022-10-18 11:43:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
('0a012260-e526-4bdc-b986-7feee3b35df0', 'Web', '2022-10-18 11:07:03', '2022-10-18 11:07:03'),
('25247b3d-c2d1-45e4-a5d6-117877b3565f', 'Design', '2022-10-18 11:07:19', '2022-10-18 11:07:19'),
('519af576-4a41-4b32-990c-da17e9455510', 'Robotic', '2022-10-18 11:06:55', '2022-10-18 11:06:55'),
('cc1cd0d8-8bff-4dd3-ae15-9dcd4c30f05b', 'Bisnis', '2022-10-18 11:07:32', '2022-10-18 11:07:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contents`
--

CREATE TABLE `contents` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `deskripsi_content` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `kelaId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `contents`
--

INSERT INTO `contents` (`id`, `name`, `deskripsi_content`, `content`, `createdAt`, `updatedAt`, `kelaId`) VALUES
('23fed0e1-5a34-4704-be21-85851f54df46', 'materi 2 web vue', 'materi 2 web vue', 'content materi 2', '2022-10-18 11:13:54', '2022-10-18 11:13:54', '0aa243a3-07c0-4ce0-80fb-86db99cea140'),
('3ec60715-f4dc-410c-b85b-e44998679621', 'materi 3 web vue', 'materi 3 web vue', 'content materi 3', '2022-10-18 11:14:03', '2022-10-18 11:14:03', '0aa243a3-07c0-4ce0-80fb-86db99cea140'),
('8ff7ff81-ee6b-4dfa-9311-93b44bb836dc', 'materi 1 design ui/ux', 'materi 1 design ui/ux', 'content materi 1', '2022-10-18 11:15:13', '2022-10-18 11:15:13', '4239b883-0d1d-4614-9ed6-da80475d3249'),
('98243e18-ce65-45f8-9611-96262aa140b9', 'materi 1 web vue', 'materi 1 web vue', 'content materi 1', '2022-10-18 11:13:45', '2022-10-18 11:13:45', '0aa243a3-07c0-4ce0-80fb-86db99cea140'),
('c0acbd27-e7eb-4805-9c61-f888c3fd27d1', 'materi 2 design ui/ux', 'materi 2 design ui/ux', 'content materi 2', '2022-10-18 11:15:28', '2022-10-18 11:15:28', '4239b883-0d1d-4614-9ed6-da80475d3249');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `deskripsi_kelas` varchar(255) NOT NULL,
  `thumbnail_kelas` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `name`, `deskripsi_kelas`, `thumbnail_kelas`, `thumbnail_url`, `harga`, `createdAt`, `updatedAt`, `categoryId`) VALUES
('0aa243a3-07c0-4ce0-80fb-86db99cea140', 'kelas web vue', 'kelas web vue', '6fe1ceae5395cb8cc479e2bf6bd4d670.jpg', 'http://localhost:5000/images/6fe1ceae5395cb8cc479e2bf6bd4d670.jpg', 2000, '2022-10-18 11:09:42', '2022-10-18 11:09:42', '0a012260-e526-4bdc-b986-7feee3b35df0'),
('4239b883-0d1d-4614-9ed6-da80475d3249', 'kelas design uiux', 'kelas design uiux', 'c643af355981be8a6de4a0da0a634ca8.jpg', 'http://localhost:5000/images/c643af355981be8a6de4a0da0a634ca8.jpg', 2000, '2022-10-18 11:10:51', '2022-10-18 11:10:51', '25247b3d-c2d1-45e4-a5d6-117877b3565f');

-- --------------------------------------------------------

--
-- Struktur dari tabel `langganan`
--

CREATE TABLE `langganan` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kelaId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `transaksiDetailId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `langganan`
--

INSERT INTO `langganan` (`id`, `createdAt`, `updatedAt`, `userId`, `kelaId`, `transaksiDetailId`) VALUES
('84f3d761-d497-48bb-ab83-9c2c7e7cf47d', '2022-10-20 00:57:13', '2022-10-20 00:57:13', 'e3fb4be5-c417-49b2-9db4-5cd6b3203fa8', '4239b883-0d1d-4614-9ed6-da80475d3249', '265416a3-681c-42e1-9f88-cc3be410fedb'),
('dbaf55dd-f7d8-470b-a9b0-af2494faf75b', '2022-10-20 01:06:13', '2022-10-20 01:06:13', '223f71b6-04c4-4ef2-9c7c-2556ac00e258', '4239b883-0d1d-4614-9ed6-da80475d3249', 'd7562513-cbb2-4c8b-a105-f4400f2d0a86');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('-BEYcasyl_jrLumGWP2jgdpVmK0-f_xZ', '2022-10-21 04:42:26', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:42:26.533Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:42:26', '2022-10-20 04:42:26'),
('0egWx6APw65VbbSrndVITitFcaC9biay', '2022-10-21 04:38:39', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:38:39.747Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:38:39', '2022-10-20 04:38:39'),
('0ovaQv7CdC_3PcIIlOGTcDFs4UGNh6-_', '2022-10-21 11:40:00', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T11:40:00.068Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 11:40:00', '2022-10-20 11:40:00'),
('2BIbmYLRDLPzNeI0LOwH0NzgBUO5bH9w', '2022-10-21 04:00:43', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:00:43.326Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:00:43', '2022-10-20 04:00:43'),
('2HfzvigksUSurGRgHnYJf0tA4qs9h3r_', '2022-10-21 09:31:34', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:31:34.826Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:31:34', '2022-10-20 09:31:34'),
('2Yr5VdF4RgL5LG5ljbOi3R7F44HUAhoi', '2022-10-21 03:56:29', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:56:29.508Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:56:29', '2022-10-20 03:56:29'),
('3ldjXqFXRaCXVREfurMgpfCingQL1PeT', '2022-10-21 03:42:23', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:42:23.084Z\",\"secure\":true,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"none\"},\"userId\":\"7a61f155-f13f-4405-b0c3-26325f84f127\"}', '2022-10-20 03:42:23', '2022-10-20 03:42:23'),
('46A-We8VYFWGz-4qiq-UKVrTJh8oAgWy', '2022-10-21 04:37:00', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:37:00.833Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:37:00', '2022-10-20 04:37:00'),
('4LimZ1ERQe3y2iUqXLoPiE1KkF_0Yrh_', '2022-10-21 03:44:56', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:44:56.908Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:44:56', '2022-10-20 03:44:56'),
('4OlmLELlJ20vcLgAUWq_khMZGTDfCdW6', '2022-10-21 04:32:31', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:32:31.453Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:32:31', '2022-10-20 04:32:31'),
('4XWnMcZ-ywhO2-GtwcRyizAsILMFFkF5', '2022-10-21 04:47:28', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:47:28.165Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:47:28', '2022-10-20 04:47:28'),
('5PGSE322M-Jz8CEZcwB4I7YI5gwuUmB-', '2022-10-21 03:42:24', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:42:24.659Z\",\"secure\":true,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"none\"}}', '2022-10-20 03:42:24', '2022-10-20 03:42:24'),
('5R_unvmaTsSlpQ2BMABiRXi8Xim0V81O', '2022-10-21 09:37:53', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:37:53.243Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:37:53', '2022-10-20 09:37:53'),
('5T6EHV9uR1piHtd-k7jKXc_DUTtmcK1e', '2022-10-21 04:11:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:11:46.671Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:11:46', '2022-10-20 04:11:46'),
('6a7ZJmgzy6e27bhPjmLqV0iJSqOXeNJ9', '2022-10-21 09:37:53', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:37:53.265Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:37:53', '2022-10-20 09:37:53'),
('6Bj8A2MFR3cqHKLrz1TJia_wFN7_-09F', '2022-10-21 04:51:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:51:18.294Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:51:18', '2022-10-20 04:51:18'),
('7HTzfFOhMlorvsKd4dl_JWcUc-3DAeBA', '2022-10-21 04:45:36', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:45:36.704Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:45:36', '2022-10-20 04:45:36'),
('7nh4aa2TB8owMap5wgjsUA8b9rbSRMU-', '2022-10-21 03:57:34', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:34.911Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:57:34', '2022-10-20 03:57:34'),
('8oleubHjx6X-evzld3s9x7YBmD7jhnOZ', '2022-10-21 09:36:13', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:36:13.021Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:36:13', '2022-10-20 09:36:13'),
('8TtepI-z1sSsOLHLi6DdFv0b5Z7x2arE', '2022-10-21 04:11:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:11:46.667Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:11:46', '2022-10-20 04:11:46'),
('9EalCeaR1qjwPVAK444o82NO1g6ioBQl', '2022-10-21 04:48:25', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:48:25.129Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:48:25', '2022-10-20 04:48:25'),
('a4Po-IL7vbTcNLgIm8blf6KMi_FCjTAa', '2022-10-21 04:44:42', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:44:42.553Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:44:42', '2022-10-20 04:44:42'),
('AFXZY_tLjOPigl9JRncwg7ZmFZ5KWV8f', '2022-10-21 04:46:16', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:16.311Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:16', '2022-10-20 04:46:16'),
('aKi2ZXIIv_oJhV_SZod-uPIH6e_sJZVj', '2022-10-21 04:46:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:18.191Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:18', '2022-10-20 04:46:18'),
('amEqXvgkwMPC8G8ruypkDAUaTIvBI5NG', '2022-10-21 04:47:28', '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2022-10-21T04:47:28.176Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:47:28', '2022-10-20 04:47:28'),
('BBS_GKL5DqgsWtikBh5G_-sREGmTNzaU', '2022-10-21 04:31:49', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:31:49.206Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:31:49', '2022-10-20 04:31:49'),
('bIrbqpSVVnP51LgLnBsMShrMUho7UcR7', '2022-10-21 04:12:56', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:12:56.069Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:12:56', '2022-10-20 04:12:56'),
('BQM70SDchSCjuCno1e-tURWqI93g_rHe', '2022-10-21 09:36:13', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:36:13.077Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:36:13', '2022-10-20 09:36:13'),
('BuBbQqapdC_ZEYPAWgtQ_Bi46ANfMxhA', '2022-10-21 03:57:09', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:09.412Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:57:09', '2022-10-20 03:57:09'),
('bvJZ3ru-fKHN8G69HTHCZh-ZGDmBU7oJ', '2022-10-21 04:37:40', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:37:40.827Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:37:40', '2022-10-20 04:37:40'),
('bZhCBZIBvyRxdzw2rg_niY9RAQsWK44B', '2022-10-21 10:43:33', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T10:43:33.844Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 10:43:33', '2022-10-20 10:43:33'),
('b_6FUEevEnBj3NKJxJKLvtMDRk400Ldq', '2022-10-21 04:38:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:38:18.338Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:38:18', '2022-10-20 04:38:18'),
('Cexs3F1q4vTi_81mQu8XdUOoD9vvzg7I', '2022-10-21 04:45:17', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:45:17.273Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:45:17', '2022-10-20 04:45:17'),
('CZOKHkK6FPBB6oPvcBk0JOw8k206vbT6', '2022-10-21 04:32:31', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:32:31.436Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:32:31', '2022-10-20 04:32:31'),
('C_-slpJlBO6FwsdhGZKDN9czqKU3pmQ9', '2022-10-21 03:44:57', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:44:57.144Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:44:57', '2022-10-20 03:44:57'),
('c_nlH0Yh_poHpH-2nISm3LQNYgLgFsWS', '2022-10-21 04:12:56', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:12:56.409Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:12:56', '2022-10-20 04:12:56'),
('DBdo0uyBnoICCSoXHVj5zP8xZdIGAKXI', '2022-10-21 04:36:13', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:36:13.778Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:36:13', '2022-10-20 04:36:13'),
('dNyQHvMfmy_H-bJz-ylx0lTn4JqAO28u', '2022-10-21 09:31:34', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:31:34.907Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:31:34', '2022-10-20 09:31:34'),
('Dwx88pqHcHny7MR0lV3ix3FDmZvmPNBH', '2022-10-21 03:56:28', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:56:28.957Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:56:28', '2022-10-20 03:56:28'),
('eA1tNJgidg8gaZ7BonRC-CWXMpwlSk3Z', '2022-10-21 03:42:22', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:42:22.734Z\",\"secure\":true,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"none\"}}', '2022-10-20 03:42:22', '2022-10-20 03:42:22'),
('EoihmH3m6N3VjQ-DXL6IsgF2zm5QJbvn', '2022-10-21 04:50:42', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:50:42.451Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:50:42', '2022-10-20 04:50:42'),
('EOsOYrHvteLxQdJvPhu1kcTEY7qQyIGb', '2022-10-21 09:35:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:35:46.043Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:35:46', '2022-10-20 09:35:46'),
('ePhaopxv9A3heUKgv_dvp5LfGkym7RpQ', '2022-10-21 04:33:36', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:33:36.304Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:33:36', '2022-10-20 04:33:36'),
('fAorJVrZLStKyDkPVdru_Y9baOEBeQWY', '2022-10-21 04:33:36', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:33:36.356Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:33:36', '2022-10-20 04:33:36'),
('fMM6biq3F4fjHw8JH2cqGRR0Fey_pK3Z', '2022-10-21 09:37:53', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:37:53.284Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:37:53', '2022-10-20 09:37:53'),
('fQHJ2eKkbRwwhkXqzoVYEtCjTez0l4PA', '2022-10-21 03:57:54', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:54.723Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:57:54', '2022-10-20 03:57:54'),
('gmkmnVvA3DH1sfCLQifD-JzblHW16rt0', '2022-10-21 09:13:03', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:13:03.394Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:13:03', '2022-10-20 09:13:03'),
('GUMLn5Tiv1A2ASAYWD5ZLxc-ThK4f7PJ', '2022-10-21 04:41:31', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:41:31.936Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:41:31', '2022-10-20 04:41:31'),
('gW-eELCokJeQEuXJuUQtdkv7JA1pOOoa', '2022-10-21 04:36:40', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:36:40.789Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:36:40', '2022-10-20 04:36:40'),
('he6MtpZJYfKaXMxjSCP8PcA7o0NYk0KM', '2022-10-21 03:56:29', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:56:29.489Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:56:29', '2022-10-20 03:56:29'),
('He7SUzICVH4l6ek_EQ-0FN8FOc07kH80', '2022-10-21 09:49:16', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:49:16.194Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:49:16', '2022-10-20 09:49:16'),
('hkFtdbJzuWBbUlBWBXqiSzA1Fkz_Rdj8', '2022-10-21 09:41:36', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:41:36.203Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:41:36', '2022-10-20 09:41:36'),
('HVHTbjcJ4Txj500HKDfxCuPsEPKFAkVk', '2022-10-21 09:35:29', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:35:29.095Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:35:29', '2022-10-20 09:35:29'),
('HWn5_zwQ_40223Car6nSmTEDwdbTok1d', '2022-10-21 03:57:54', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:54.591Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:57:54', '2022-10-20 03:57:54'),
('hxec3dNm4KfiEmVy6ySbqn4tN1XglFc2', '2022-10-21 04:46:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:18.679Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:19', '2022-10-20 04:46:19'),
('iCdwtfEYr3sfQJUIbAjREcGvwEYuQgCs', '2022-10-21 04:00:41', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:00:41.299Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:00:41', '2022-10-20 04:00:41'),
('IFVGPzX78U0t8DvKN2ewEL_gSeY-8QHm', '2022-10-21 04:34:41', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:34:41.197Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:34:41', '2022-10-20 04:34:41'),
('IirdhRA_ZpxrPDLZ2sIps2YG7A9cHwC_', '2022-10-21 04:41:38', '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2022-10-21T04:41:38.681Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:41:38', '2022-10-20 04:41:38'),
('IlLPLooV_wKvkxJzE4mQA7GeI-9wHdt1', '2022-10-21 10:43:33', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T10:43:33.792Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 10:43:33', '2022-10-20 10:43:33'),
('IxYy5gHgQ6uA01VppjBgwixAEKq1j8M9', '2022-10-21 04:37:00', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:37:00.811Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:37:00', '2022-10-20 04:37:00'),
('J6hIbiFowEbVo3u46g9zs2yTDWUWyz4o', '2022-10-21 04:35:35', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:35:35.192Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:35:35', '2022-10-20 04:35:35'),
('j6Ox6EFLrO9neEDNHeniRJ-cf2xWO7kl', '2022-10-21 04:37:40', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:37:40.850Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:37:40', '2022-10-20 04:37:40'),
('JgjITaH_1wfpsf7Or8Ngz8EWCihVaAMF', '2022-10-21 09:37:06', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:37:06.455Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:37:06', '2022-10-20 09:37:06'),
('Jly72LqCwAwkoYQKjuivVFVD_VLMLtts', '2022-10-21 09:13:01', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:13:01.973Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:13:01', '2022-10-20 09:13:01'),
('jM1sqzCjFF0FihMbjrvUgXz-v8Hvcjgk', '2022-10-21 03:43:41', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:43:41.610Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:43:41', '2022-10-20 03:43:41'),
('JOZCSTSZfWGsFNCxfFt2Lyepc6qjjYlb', '2022-10-21 03:43:24', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:43:24.294Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:43:24', '2022-10-20 03:43:24'),
('JRr6UJKuthxaB-D67MH6dBocKnTq_cT4', '2022-10-21 04:34:41', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:34:41.182Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:34:41', '2022-10-20 04:34:41'),
('k-9tl8xEcokdyNyP7akMnPke7aJnLpx_', '2022-10-21 04:12:56', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:12:56.035Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:12:56', '2022-10-20 04:12:56'),
('K-xHS7CjAZh8qMfK-EggKC2eCaSUFXqx', '2022-10-21 04:38:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:38:18.312Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:38:18', '2022-10-20 04:38:18'),
('LM2poAkCGXp0thBL2sGdtblFLG5dXL6p', '2022-10-21 09:37:06', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:37:06.462Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:37:06', '2022-10-20 09:37:06'),
('LQHZoiy47vTucMTVPRXAYo-uno3jNKTq', '2022-10-21 04:00:34', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:00:34.919Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:00:34', '2022-10-20 04:00:34'),
('lr1RHjAe6RPO6jZGBetrjcZj_7hRCTXt', '2022-10-21 04:50:47', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:50:47.882Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:50:47', '2022-10-20 04:50:47'),
('MQBL5siAs2kHG1d41wNoorWO3JA04RjG', '2022-10-21 09:35:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:35:46.020Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:35:46', '2022-10-20 09:35:46'),
('N6Q6wCCwDJOBXnC1QYGxHq6h__V2u6cp', '2022-10-21 03:57:10', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:10.135Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:57:10', '2022-10-20 03:57:10'),
('NmjR_PCScyndaWHbiEwkPgQL6mIdQC5w', '2022-10-21 04:46:22', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:22.878Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:22', '2022-10-20 04:46:22'),
('NqaByNoiqnKhondenO9A-WaQYJGHHY_s', '2022-10-21 04:35:35', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:35:35.223Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:35:35', '2022-10-20 04:35:35'),
('OaOnr5V8ZnQRxq5aqCrpu28rabqzSpdI', '2022-10-21 03:45:21', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:45:21.546Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":\"5e70aca9-503f-4dcb-baea-69cfb54ac195\"}', '2022-10-20 03:45:21', '2022-10-20 03:45:21'),
('ohJ-3Guchbj3y-9EKQcQvpYBvYlW73tu', '2022-10-21 09:49:16', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:49:16.204Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:49:16', '2022-10-20 09:49:16'),
('ojQ4WCstEKHsq8qiNObqLPfLNuh4208S', '2022-10-21 04:38:39', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:38:39.873Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:38:39', '2022-10-20 04:38:39'),
('oKJvwNBx1Nmb2sfw9LTW3iB_upow1u2Y', '2022-10-21 03:44:57', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:44:57.148Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:44:57', '2022-10-20 03:44:57'),
('OPakyFRMB202_l-vCQvRcNTzQ-oYJox2', '2022-10-21 10:43:33', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T10:43:33.851Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 10:43:33', '2022-10-20 10:43:33'),
('oyogGv2BH7Dm_lTRfaS5ypzyypI0BoB1', '2022-10-21 09:35:29', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:35:29.359Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:35:29', '2022-10-20 09:35:29'),
('paocyR9slbJC6IPF-8Ez8gHNGhm2yq-O', '2022-10-21 04:51:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:51:18.303Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:51:18', '2022-10-20 04:51:18'),
('PemaMSbxhW3lMn_wjTkHKk_ZwpznGveP', '2022-10-21 03:49:30', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:49:30.398Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:49:30', '2022-10-20 03:49:30'),
('PmdQDc-D4OY0exBBvN7oxOuvwXB3Y716', '2022-10-21 04:42:26', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:42:26.563Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:42:26', '2022-10-20 04:42:26'),
('r5hsIkIWhXNkLwOjAIksl-FYfxQkAXYb', '2022-10-21 04:50:47', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:50:47.763Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:50:47', '2022-10-20 04:50:47'),
('REgmTZY6cqdf5IvuMXZOyueEtRGcJu79', '2022-10-21 04:36:40', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:36:40.774Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:36:40', '2022-10-20 04:36:40'),
('rJz9g7Vjl_HWsZUxN4UsFjaFRGfEhhQD', '2022-10-21 04:11:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:11:46.289Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:11:46', '2022-10-20 04:11:46'),
('ru3-t2YCxSfh7ElLmL5oGXuhSyHK-ZVi', '2022-10-21 04:11:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:11:46.314Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:11:46', '2022-10-20 04:11:46'),
('RXGHOrgMsBbPSqx9RJxV2qHdLWBy4PPs', '2022-10-21 04:12:44', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:12:44.787Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:12:44', '2022-10-20 04:12:44'),
('RXjA0jmmqqcWvqXOh15qT44AHY1LmJYn', '2022-10-21 04:14:06', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:14:06.459Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:14:06', '2022-10-20 04:14:06'),
('S6c0On9ih4Mo9fuMeC1AdwOA7oOoz1UJ', '2022-10-21 04:48:25', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:48:25.103Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:48:25', '2022-10-20 04:48:25'),
('se8EjnhXL0WR_brjKNMsuUZmX1Uadi29', '2022-10-21 09:49:16', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:49:16.157Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:49:16', '2022-10-20 09:49:16'),
('SJg_ytURA4d2vmm0s8KF2Mf5c7Rv9rce', '2022-10-21 09:35:29', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:35:29.036Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:35:29', '2022-10-20 09:35:29'),
('T_EPNiyINc1S7IYhGzEaZpN0QHxgb3xV', '2022-10-21 03:45:21', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:45:21.780Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:45:21', '2022-10-20 03:45:21'),
('uMvJDPd1i7Zbt-uVUqIDsiE1tTQhzgHn', '2022-10-21 09:31:35', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:31:35.212Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:31:35', '2022-10-20 09:31:35'),
('upBudYkvqWWZxkwGG-jDymTxAM1wWyb9', '2022-10-21 09:35:46', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:35:46.282Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:35:46', '2022-10-20 09:35:46'),
('Ur-ARdlWA-6XZcEInrs4LeNQfhsDGxTp', '2022-10-21 04:46:01', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:01.558Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:01', '2022-10-20 04:46:01'),
('UxbbwoRJkozax9u7GwTntEv0TE2SFFwU', '2022-10-21 04:44:42', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:44:42.570Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:44:42', '2022-10-20 04:44:42'),
('uxJC59G1eZYdCCI-bJGnHb9iyagpHXY9', '2022-10-21 09:41:36', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:41:36.281Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:41:36', '2022-10-20 09:41:36'),
('v3scT8W6L4k4x9rmTkIFvSWlHNhoVVQh', '2022-10-21 04:46:16', '{\"cookie\":{\"originalMaxAge\":86399999,\"expires\":\"2022-10-21T04:46:16.336Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:16', '2022-10-20 04:46:16'),
('VTiWmOEMeaseVvR8G1qIMI-j-mnYMDw1', '2022-10-21 09:49:16', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:49:16.510Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:49:16', '2022-10-20 09:49:16'),
('VuyQStJfjw3jrzCOBcoe8Ln8Q7DR2STW', '2022-10-21 04:00:44', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:00:44.953Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:00:44', '2022-10-20 04:00:44'),
('wa2LixzAri4LenEuO-3g-f3GTrYv3Ui7', '2022-10-21 09:37:53', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:37:53.574Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:37:53', '2022-10-20 09:37:53'),
('X5OS8R70ieCr91NY0eSSHkNwtYyBlZiu', '2022-10-21 04:36:13', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:36:13.751Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:36:13', '2022-10-20 04:36:13'),
('XbVmodlHaVv34M07GaJwv_HmLNcVfvlD', '2022-10-21 04:12:56', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:12:56.412Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:12:56', '2022-10-20 04:12:56'),
('XtDxgfRwa__gFHJ6eG_a_EZbe8qcJDyE', '2022-10-21 04:46:01', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:01.622Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:01', '2022-10-20 04:46:01'),
('XTWQpUh5NIQGaP70zQGhlM29lugsTH6g', '2022-10-21 03:45:21', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:45:21.416Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:45:21', '2022-10-20 03:45:21'),
('yx6m17G_x7OcIApm_c2X3Cg9DNocn6aQ', '2022-10-21 04:41:38', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:41:38.637Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:41:38', '2022-10-20 04:41:38'),
('z2gU-2vjVr4TtOc_DL20_6KxOAd0iSfz', '2022-10-21 03:57:54', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:54.707Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 03:57:54', '2022-10-20 03:57:54'),
('z3EuRRxEkLmyWue9vQyKVesb_8dW0eRw', '2022-10-21 04:46:18', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T04:46:18.684Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 04:46:19', '2022-10-20 04:46:19'),
('zgJnt_ayMvUAHH2th8xyPRTG7hnL1yrE', '2022-10-21 09:13:01', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:13:01.990Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:13:02', '2022-10-20 09:13:02'),
('zNGD2RNEzfg4i0rRzvh4QHeputHr_JAJ', '2022-10-21 03:57:09', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:57:09.819Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":\"5e70aca9-503f-4dcb-baea-69cfb54ac195\"}', '2022-10-20 03:57:09', '2022-10-20 03:57:09'),
('zvjpROxVR4THPA2VP9rNAY7r4404_mOi', '2022-10-21 03:43:42', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T03:43:41.899Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"},\"userId\":\"7a61f155-f13f-4405-b0c3-26325f84f127\"}', '2022-10-20 03:43:41', '2022-10-20 03:43:42'),
('z_Z0-ut97JTyqYdOO6DycFOVG1PXnXhQ', '2022-10-21 09:41:36', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-21T09:41:36.110Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-20 09:41:36', '2022-10-20 09:41:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `bukti_transaksi` text DEFAULT NULL,
  `bukti_transaksi_url` text DEFAULT NULL,
  `status_transaksi` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `kelaId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bankId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `name`, `tanggal`, `bukti_transaksi`, `bukti_transaksi_url`, `status_transaksi`, `createdAt`, `updatedAt`, `userId`, `kelaId`, `bankId`) VALUES
('265416a3-681c-42e1-9f88-cc3be410fedb', 'Lisdyantod', '2022-10-19 04:21:23', NULL, NULL, 'BELUM SELESAI', '2022-10-19 04:21:23', '2022-10-20 00:57:13', 'e3fb4be5-c417-49b2-9db4-5cd6b3203fa8', '4239b883-0d1d-4614-9ed6-da80475d3249', 'e3406c74-ada8-4234-b3c4-48b6d5cb9b58'),
('42da215b-b164-41d1-9c1a-d5af367cc8b1', 'Brili Jwalo', '2022-10-18 12:32:32', 'a126d06da90347d820284421c822c582.jpg', 'http://localhost:5000/bukti_transfer/a126d06da90347d820284421c822c582.jpg', 'BELUM SELESAI', '2022-10-18 12:32:32', '2022-10-19 10:41:00', '5e70aca9-503f-4dcb-baea-69cfb54ac195', '0aa243a3-07c0-4ce0-80fb-86db99cea140', '86c989b6-ba93-404d-896f-12117441e3e9'),
('d7562513-cbb2-4c8b-a105-f4400f2d0a86', 'Satria Yoga', '2022-10-19 04:20:41', NULL, NULL, 'BELUM SELESAI', '2022-10-19 04:20:41', '2022-10-20 01:06:13', '223f71b6-04c4-4ef2-9c7c-2556ac00e258', '4239b883-0d1d-4614-9ed6-da80475d3249', 'e3406c74-ada8-4234-b3c4-48b6d5cb9b58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('223f71b6-04c4-4ef2-9c7c-2556ac00e258', 'yogawoka', 'y@y.com', '$argon2id$v=19$m=4096,t=3,p=1$S34TeonlXEC7Uo2sBz+o4g$w8ez3FtEDo7K4kIDlRGLZHz5qe+MEEgN4Zm2lrn1SYU', 'user', '2022-10-18 11:04:24', '2022-10-18 11:04:24'),
('5e70aca9-503f-4dcb-baea-69cfb54ac195', 'brilio', 'b@b.com', '$argon2id$v=19$m=4096,t=3,p=1$c+hNqvIxDx/ANzLFU2CMbg$sR0EZNZJ39HAFDyOHLDhT9ARblhCFSLxGNpWbfAetpc', 'user', '2022-10-18 11:03:50', '2022-10-18 11:03:50'),
('7a61f155-f13f-4405-b0c3-26325f84f127', 'khalio', 'k@k.com', '$argon2id$v=19$m=4096,t=3,p=1$4cygv52F8qnulxRw+NSPTA$u11WczQvumoJMSDmWz4qqOeVtRlIT6IfCcXDYB0yc/8', 'admin', '2022-10-18 11:05:52', '2022-10-18 11:05:52'),
('e3fb4be5-c417-49b2-9db4-5cd6b3203fa8', 'antokondo', 'a@a.com', '$argon2id$v=19$m=4096,t=3,p=1$nIh4xhw2m6V5eq0zcTHlrw$0hSs14fqJA8+SyySwS2PDbbwc57fS5ZDPRX8QztvrzQ', 'user', '2022-10-18 11:05:16', '2022-10-18 11:05:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelaId` (`kelaId`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indeks untuk tabel `langganan`
--
ALTER TABLE `langganan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `kelaId` (`kelaId`),
  ADD KEY `transaksiDetailId` (`transaksiDetailId`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indeks untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `kelaId` (`kelaId`),
  ADD KEY `bankId` (`bankId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`kelaId`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `langganan`
--
ALTER TABLE `langganan`
  ADD CONSTRAINT `langganan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `langganan_ibfk_2` FOREIGN KEY (`kelaId`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `langganan_ibfk_3` FOREIGN KEY (`transaksiDetailId`) REFERENCES `transaksi_details` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD CONSTRAINT `transaksi_details_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_details_ibfk_2` FOREIGN KEY (`kelaId`) REFERENCES `kelas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_details_ibfk_3` FOREIGN KEY (`bankId`) REFERENCES `banks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
