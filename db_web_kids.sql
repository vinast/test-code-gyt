-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 24 Okt 2022 pada 04.10
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
('355314aa-1bf3-41b0-a578-faa27f9b88ed', '2022-10-22 04:22:06', '2022-10-22 04:22:06', '5e70aca9-503f-4dcb-baea-69cfb54ac195', '0aa243a3-07c0-4ce0-80fb-86db99cea140', '28017bf9-d3f3-4410-8d96-bdad4ff1d40e'),
('48c53135-527e-47c7-83fd-1cb89e864e0f', '2022-10-22 04:20:11', '2022-10-22 04:20:11', '5e70aca9-503f-4dcb-baea-69cfb54ac195', '4239b883-0d1d-4614-9ed6-da80475d3249', 'a3eb5c28-d52b-4330-80ca-1ab2b2726c49'),
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
('di-9WGlY82UMPsNXbeTiB_AW7-Ji4fQA', '2022-10-25 01:10:51', '{\"cookie\":{\"originalMaxAge\":86400000,\"expires\":\"2022-10-25T01:10:51.715Z\",\"secure\":false,\"httpOnly\":true,\"path\":\"/\",\"sameSite\":\"lax\"}}', '2022-10-24 01:10:51', '2022-10-24 01:10:51');

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
('28017bf9-d3f3-4410-8d96-bdad4ff1d40e', 'Brili Jaloe Besaka', '2022-10-22 02:03:53', 'a126d06da90347d820284421c822c582.jpg', 'http://localhost:5000/bukti_transfer/a126d06da90347d820284421c822c582.jpg', 'SELESAI', '2022-10-22 02:03:53', '2022-10-22 04:22:06', '5e70aca9-503f-4dcb-baea-69cfb54ac195', '0aa243a3-07c0-4ce0-80fb-86db99cea140', '86c989b6-ba93-404d-896f-12117441e3e9'),
('a3eb5c28-d52b-4330-80ca-1ab2b2726c49', 'Brili Jaloe Besaka', '2022-10-22 02:19:44', '1c5922c40283ce7b3d19360d5830f4ff.jpg', 'http://localhost:5000/bukti_transfer/1c5922c40283ce7b3d19360d5830f4ff.jpg', 'SELESAI', '2022-10-22 02:19:44', '2022-10-22 04:20:11', '5e70aca9-503f-4dcb-baea-69cfb54ac195', '4239b883-0d1d-4614-9ed6-da80475d3249', '95f501e3-49e1-4d5c-b558-a80c3bba2111'),
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
('3d65ca9b-bb87-4738-84f3-3c9576ce845b', 'ryantopi', 'ry@ry.com', '$argon2id$v=19$m=4096,t=3,p=1$Djx3XitxQ1uXRB+Mu26K1g$RDJUYfP2VZlNIGCAiJ7hzkglJi3ck834zwwcs/JMcCY', 'user', '2022-10-20 14:31:06', '2022-10-20 14:31:06'),
('5e70aca9-503f-4dcb-baea-69cfb54ac195', 'brilio', 'b@b.com', '$argon2id$v=19$m=4096,t=3,p=1$c+hNqvIxDx/ANzLFU2CMbg$sR0EZNZJ39HAFDyOHLDhT9ARblhCFSLxGNpWbfAetpc', 'user', '2022-10-18 11:03:50', '2022-10-18 11:03:50'),
('7a61f155-f13f-4405-b0c3-26325f84f127', 'khalio', 'k@k.com', '$argon2id$v=19$m=4096,t=3,p=1$4cygv52F8qnulxRw+NSPTA$u11WczQvumoJMSDmWz4qqOeVtRlIT6IfCcXDYB0yc/8', 'admin', '2022-10-18 11:05:52', '2022-10-18 11:05:52'),
('e0f1967b-985b-4c6f-82c7-4423fbf0f5c3', 'Sambudi890', 's@s.com', '$argon2id$v=19$m=65536,t=3,p=4$NnhNnbyqo6thxE9KeHL9Lg$ekM3MIdsRzyrCa5eAeqTEoMjJ/duB1m4KoGgBZlSX5Q', 'user', '2022-10-22 05:05:55', '2022-10-22 05:05:55'),
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
