/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - framework_api
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`framework_api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `framework_api`;

/*Table structure for table `fasilitas` */

DROP TABLE IF EXISTS `fasilitas`;

CREATE TABLE `fasilitas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_fasilitas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fasilitas` */

insert  into `fasilitas`(`id`,`nama_fasilitas`,`deskripsi`,`created_at`,`updated_at`) values 
(1,'Ruang Ganti','Pria dan Wanita','2025-03-09 04:40:39','2025-03-09 04:43:46'),
(2,'toilet','pria dan wanita','2025-03-09 04:43:56','2025-03-09 04:43:56');

/*Table structure for table `fasilitas_lapangan` */

DROP TABLE IF EXISTS `fasilitas_lapangan`;

CREATE TABLE `fasilitas_lapangan` (
  `fasilitas_id` bigint unsigned NOT NULL,
  `lapangan_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`fasilitas_id`,`lapangan_id`),
  KEY `lapangan_id` (`lapangan_id`),
  CONSTRAINT `fasilitas_lapangan_ibfk_1` FOREIGN KEY (`fasilitas_id`) REFERENCES `fasilitas` (`id`),
  CONSTRAINT `fasilitas_lapangan_ibfk_2` FOREIGN KEY (`lapangan_id`) REFERENCES `lapangan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `fasilitas_lapangan` */

insert  into `fasilitas_lapangan`(`fasilitas_id`,`lapangan_id`) values 
(1,2),
(2,2);

/*Table structure for table `kategori_laps` */

DROP TABLE IF EXISTS `kategori_laps`;

CREATE TABLE `kategori_laps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kategori_laps` */

insert  into `kategori_laps`(`id`,`nama_kategori`,`deskripsi`,`created_at`,`updated_at`) values 
(2,'badminton','lapangan badminton','2025-03-09 04:29:11','2025-03-09 04:29:11'),
(3,'Futsal','Lapangan','2025-03-09 04:29:20','2025-03-09 04:29:50');

/*Table structure for table `lapangan` */

DROP TABLE IF EXISTS `lapangan`;

CREATE TABLE `lapangan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas` int NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `harga` decimal(10,2) NOT NULL,
  `kategori_id` bigint unsigned NOT NULL,
  `status` enum('tersedia','tidak tersedia') COLLATE utf8mb4_unicode_ci DEFAULT 'tersedia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `lapangan_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_laps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `lapangan` */

insert  into `lapangan`(`id`,`nama`,`kapasitas`,`deskripsi`,`harga`,`kategori_id`,`status`,`created_at`,`updated_at`) values 
(2,'Lapangan Futsal A',10,'Lapangan futsal indoor dengan rumput sintetis',100000.00,3,'tersedia','2025-03-09 15:50:26','2025-03-09 15:57:24');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2025_03_06_140421_user',1),
(2,'2025_03_06_141835_create_personal_access_tokens_table',2),
(3,'2025_03_09_040954_kategori_lap',3),
(4,'2025_03_09_043526_fasilitas',4),
(5,'2025_03_09_111603_lapangan',5),
(6,'2025_03_09_153737_status_lapangan',6);

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `status_lapangan` */

DROP TABLE IF EXISTS `status_lapangan`;

CREATE TABLE `status_lapangan` (
  `id_status` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_lapangan` bigint unsigned NOT NULL,
  `deskripsi_status` enum('tersedia','disewa','perbaikan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_status`),
  KEY `status_lapangan_id_lapangan_foreign` (`id_lapangan`),
  CONSTRAINT `status_lapangan_id_lapangan_foreign` FOREIGN KEY (`id_lapangan`) REFERENCES `lapangan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `status_lapangan` */

insert  into `status_lapangan`(`id_status`,`id_lapangan`,`deskripsi_status`,`created_at`,`updated_at`) values 
(1,2,'perbaikan','2025-03-09 15:50:59','2025-03-09 15:56:33');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_nim_unique` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`nama`,`nim`,`created_at`,`updated_at`) values 
(3,'frankie','244107027008','2025-03-06 14:31:41','2025-03-06 14:31:41'),
(4,'Steinlie','123','2025-03-09 04:00:35','2025-03-09 04:00:35');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
