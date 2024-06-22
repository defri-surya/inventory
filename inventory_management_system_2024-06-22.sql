# ************************************************************
# Sequel Ace SQL dump
# Version 20067
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.3.0)
# Database: inventory_management_system
# Generation Time: 2024-06-22 13:19:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table agens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agens`;

CREATE TABLE `agens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `agen_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `agens_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `agens_phone_unique` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `agens` WRITE;
/*!40000 ALTER TABLE `agens` DISABLE KEYS */;

INSERT INTO `agens` (`id`, `agen_name`, `email`, `phone`, `address`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`)
VALUES
	(1,'rctbbO0vaC','admin@app.com','7391367759','0KhGXB4Kyi','1779387221860437.jpg','OX4kt2n9Qk','1874538084','BRI','2023-10-10 16:38:12','2023-10-10 16:38:12'),
	(2,'winter','admin@web.com','8732183731278','alamat',NULL,'OX4kt2n9Qk','1111774915','BNI','2023-12-07 14:34:21','2023-12-07 14:34:21');

/*!40000 ALTER TABLE `agens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `categories_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `categories_slug_unique` (`slug`) USING BTREE,
  KEY `categories_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `categories_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `satuan`, `slug`, `created_at`, `updated_at`, `status_id`)
VALUES
	(1,'categori 1','Gram','categori-1','2023-09-12 02:20:48','2023-09-12 02:20:48',1),
	(2,'Kategori 2','Kilogram','kategori-2','2024-06-16 14:55:54','2024-06-16 14:59:11',1);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` int DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `customers_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `customers_phone_unique` (`phone`) USING BTREE,
  KEY `customers_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `customers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `name`, `nik`, `npwp`, `email`, `phone`, `address`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`, `status_id`)
VALUES
	(1,'customer',129301293,'921039110','cek@mail.com','20923093','dasd',NULL,'dasidji','932093','BNI','2023-09-12 07:54:45','2023-10-24 11:44:05',1),
	(2,'Agen',NULL,NULL,'agen@mail.com','08528392812','Agen','1779386931698407.png','Agen','213989','BRI','2023-10-10 16:33:35','2023-10-10 16:33:35',1),
	(3,'ROqp9aiYMc',7647676,'675675657','5aaNv4KSGQ@mail.com','3037673148','xgluAX0AQ5',NULL,'xdbEPAqcNG','1538705787',NULL,'2023-12-17 08:36:46','2023-12-17 08:36:46',1),
	(4,'ROqp9aiYMc',7647676,'675675657','5aaNv4KSGQgbh@mail.com','3037673148897','xgluAX0AQ5',NULL,'xdbEPAqcNG','1538705787',NULL,'2023-12-17 08:37:40','2023-12-17 08:37:40',1),
	(5,'cz5i8ZvEid',7647676,'675675657','5aaNv4KSGdasdQ@mail.com','9646737534324324','APfpA0B8Cs',NULL,'8A32NW0kEr','4869456376',NULL,'2023-12-17 08:39:30','2023-12-17 08:39:30',1),
	(6,'ZZEzmotPeb',96332,'2787128217','nUsv7ZKi6l@mail.com','6883213257','yMwB0WiUBQ',NULL,'mZDhIm6diE','0367573384','BNI','2024-01-16 01:54:16','2024-01-16 01:54:16',1),
	(10,'jufi2rNv7k',926434,'124878','qcybb@dhsf.com','8915565370','qIjYyKo4my',NULL,'wCbhcgpMMW','4915619374',NULL,'2024-02-03 18:26:13','2024-02-03 18:26:13',1),
	(11,'vVwgk12v2T',423436,'501805','h6p54@bqq4.com','4373550965','CaLBZZ2pYJ',NULL,'ShCBbUsKYs','8878456441',NULL,'2024-02-03 18:26:50','2024-02-03 18:26:50',1),
	(12,'rsnUZBqBeI',297993,'114576','6eunm@2dth.com','7246006072','zhix3JeH3Z',NULL,'6zAFV5V6el','6073923168',NULL,'2024-02-03 18:27:28','2024-02-03 18:27:28',1),
	(13,'Test Customer',878787897,'65656565765','tc@gmail.com','8778778','jjjhhhjkhuhuh',NULL,'Test Customer','876868686','BNI','2024-06-22 12:46:28','2024-06-22 12:46:28',1);

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table delivery_order_purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delivery_order_purchases`;

CREATE TABLE `delivery_order_purchases` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `supplier_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_delivery_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_invoice_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_faktur_pajak_supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `invoice_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `delivery_order_purchases` WRITE;
/*!40000 ALTER TABLE `delivery_order_purchases` DISABLE KEYS */;

INSERT INTO `delivery_order_purchases` (`id`, `purchase_id`, `supplier_id`, `no_delivery_supplier`, `no_invoice_supplier`, `no_faktur_pajak_supplier`, `invoice_description`, `delivery_date`, `created_at`, `updated_at`)
VALUES
	(5,'18','2','742125','601982','750147','kSE8wVc4nn','2024-04-14','2024-04-14 06:01:02','2024-04-14 06:01:02');

/*!40000 ALTER TABLE `delivery_order_purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table delivery_orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delivery_orders`;

CREATE TABLE `delivery_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` bigint unsigned NOT NULL,
  `id_order` bigint unsigned NOT NULL,
  `invoice_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delivery_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_via` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `delivery_orders` WRITE;
/*!40000 ALTER TABLE `delivery_orders` DISABLE KEYS */;

INSERT INTO `delivery_orders` (`id`, `id_customer`, `id_order`, `invoice_description`, `delivery_number`, `ship_via`, `delivery_date`, `created_at`, `updated_at`)
VALUES
	(13,1,23,'Penjualan tgl 18052024','DLV-28355','-','2024-05-18','2024-05-18 14:29:49','2024-05-18 14:29:49'),
	(14,1,23,'Penjualan tgl 18052024','DLV-03042','-','2024-05-18','2024-05-18 14:29:50','2024-05-18 14:29:50'),
	(50,2,25,'testTE','DLV-61419','test','2024-06-18','2024-06-18 05:00:24','2024-06-18 05:00:24'),
	(51,12,29,'test','DLV-64147','-','2024-06-18','2024-06-18 09:47:44','2024-06-18 09:47:44'),
	(52,1,30,'Pengiriman Barang','DLV-87086','-','2024-06-20','2024-06-19 12:36:14','2024-06-19 12:36:14'),
	(54,1,37,'Pengiriman Barang','DLV-42849','-','2024-06-20','2024-06-20 15:01:41','2024-06-20 15:01:41'),
	(55,1,38,'Kirim','DLV-62132','-','2024-06-22','2024-06-22 12:20:35','2024-06-22 12:20:35'),
	(56,1,39,'kirim','DLV-95238','-','2024-06-22','2024-06-22 12:28:44','2024-06-22 12:28:44'),
	(57,1,40,'kirim','DLV-49591','-','2024-06-22','2024-06-22 12:41:30','2024-06-22 12:41:30');

/*!40000 ALTER TABLE `delivery_orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table detail_master_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detail_master_values`;

CREATE TABLE `detail_master_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `master_value_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `detail_master_values_master_value_id_foreign` (`master_value_id`) USING BTREE,
  CONSTRAINT `detail_master_values_master_value_id_foreign` FOREIGN KEY (`master_value_id`) REFERENCES `master_values` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `detail_master_values` WRITE;
/*!40000 ALTER TABLE `detail_master_values` DISABLE KEYS */;

INSERT INTO `detail_master_values` (`id`, `master_value_id`, `name`, `description`, `created_at`, `updated_at`)
VALUES
	(106,1,'Gulaku','Gulaku adalah merk gula ini itu','2023-10-04 07:41:44','2024-01-03 23:52:26'),
	(107,2,'Barang Jadi','Barang Jadi','2023-10-04 07:41:58','2023-10-04 07:41:58'),
	(108,3,'Minuman','Minuman','2023-10-04 07:42:11','2023-10-04 07:42:11'),
	(109,4,'Minuman','Minuman','2023-10-04 07:42:21','2023-10-04 07:42:21'),
	(110,5,'Minuman Mineral','Minuman Mineral','2023-10-04 07:42:36','2023-10-04 07:42:36'),
	(111,6,'Indonesia','Indonesia','2023-10-04 07:42:46','2023-10-04 07:42:46'),
	(112,6,'China','China','2023-10-04 07:42:46','2023-10-04 07:42:46');

/*!40000 ALTER TABLE `detail_master_values` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table identity_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `identity_files`;

CREATE TABLE `identity_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identity_files_customer_id_foreign` (`customer_id`) USING BTREE,
  CONSTRAINT `identity_files_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `identity_files` WRITE;
/*!40000 ALTER TABLE `identity_files` DISABLE KEYS */;

INSERT INTO `identity_files` (`id`, `customer_id`, `title`, `image_identity`, `created_at`, `updated_at`)
VALUES
	(3,5,'2f74Sz17EG','1785520707747912.png','2023-12-17 09:27:20','2023-12-17 09:27:20');

/*!40000 ALTER TABLE `identity_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item_products`;

CREATE TABLE `item_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `production_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `item_products_unit_id_foreign` (`unit_id`) USING BTREE,
  KEY `item_products_production_id_foreign` (`production_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  CONSTRAINT `item_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_products_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table list_gudangs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `list_gudangs`;

CREATE TABLE `list_gudangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `suppliers_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `suppliers_phone_unique` (`phone`) USING BTREE,
  KEY `suppliers_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `list_gudangs_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `list_gudangs` WRITE;
/*!40000 ALTER TABLE `list_gudangs` DISABLE KEYS */;

INSERT INTO `list_gudangs` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `npwp`, `shopname`, `type`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`, `status_id`, `company_name`, `company_phone`)
VALUES
	(1,4,'Test Gudang Edit','test@gmail.com','765787877','Test Adrees','567890898788',NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-16 13:49:37','2024-06-17 10:12:41',1,NULL,NULL),
	(2,9,'Gudang Gula Jaya','ggj@gmail.com','76767676','hgjjnnjnkj','657668686',NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-19 08:49:23','2024-06-19 08:49:23',1,NULL,NULL);

/*!40000 ALTER TABLE `list_gudangs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table list_tokos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `list_tokos`;

CREATE TABLE `list_tokos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `suppliers_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `suppliers_phone_unique` (`phone`) USING BTREE,
  KEY `suppliers_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `list_tokos_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `list_tokos` WRITE;
/*!40000 ALTER TABLE `list_tokos` DISABLE KEYS */;

INSERT INTO `list_tokos` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `npwp`, `shopname`, `type`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`, `status_id`, `company_name`, `company_phone`)
VALUES
	(1,3,'Test Toko','test@gmail.com','878787878','Address Toko','977999989798789','Test Toko',NULL,NULL,'Test toko','879797787','BNI','2024-06-16 14:34:56','2024-06-17 10:21:06',1,NULL,NULL),
	(2,11,'Gula Jaya','gj@gmail.com','575776868','jbbnbjmnmnbmnb',NULL,'gula_jaya',NULL,NULL,'gulajaya','65767686','BNI','2024-06-19 09:04:04','2024-06-19 09:04:04',1,NULL,NULL);

/*!40000 ALTER TABLE `list_tokos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table master_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `master_status`;

CREATE TABLE `master_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `master_status` WRITE;
/*!40000 ALTER TABLE `master_status` DISABLE KEYS */;

INSERT INTO `master_status` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'aktif',NULL,NULL),
	(2,'tidak aktif',NULL,NULL);

/*!40000 ALTER TABLE `master_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table master_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `master_values`;

CREATE TABLE `master_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `master_values` WRITE;
/*!40000 ALTER TABLE `master_values` DISABLE KEYS */;

INSERT INTO `master_values` (`id`, `name`, `description`, `created_at`, `updated_at`, `status_id`)
VALUES
	(1,'Merek','Merek / Brand','2023-10-02 08:10:54','2023-10-02 08:10:54',1),
	(2,'Grade','Grade (Bahan Jadi dsb)','2023-10-02 08:23:32','2023-10-02 08:23:32',1),
	(3,'Group','Group','2023-10-02 08:35:56','2023-10-02 08:35:56',1),
	(4,'Tipe','Tipe','2023-10-03 15:38:01','2023-10-03 15:38:01',1),
	(5,'Item Tipe','Tipe','2023-10-03 15:38:50','2023-10-03 15:38:50',1),
	(6,'Made In','Made In','2023-10-03 15:39:46','2023-10-03 15:39:46',1);

/*!40000 ALTER TABLE `master_values` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2023_04_30_072200_add_username_and_phoro_to_users_table',1),
	(6,'2023_04_30_150318_create_customers_table',1),
	(7,'2023_05_01_111143_create_suppliers_table',1),
	(8,'2023_05_02_114617_create_categories_table',1),
	(9,'2023_05_02_122454_create_units_table',1),
	(10,'2023_05_02_140630_create_products_table',1),
	(11,'2023_05_04_084431_create_orders_table',1),
	(12,'2023_05_04_084646_create_order_details_table',1),
	(13,'2023_05_04_173440_create_shoppingcart_table',1),
	(14,'2023_05_06_142348_create_purchases_table',1),
	(15,'2023_05_06_143104_create_purchase_details_table',1),
	(16,'2023_09_10_035201_create_permission_tables',1),
	(17,'2023_09_15_172237_create_master_values_table',2),
	(18,'2023_09_15_172301_create_detail_master_values_table',2),
	(19,'2023_09_15_172425_create_master_status_table',3),
	(20,'2023_09_15_172854_add_status_id_to_all_tables',4),
	(21,'2023_10_09_152728_create_agens_table',5),
	(22,'2023_10_08_005455_create_productions_table',6),
	(23,'2023_10_08_005532_create_item_products_table',6),
	(24,'2023_11_27_030219_create_delivery_orders_table',7),
	(25,'2023_12_16_031824_create_identity_files_table',8),
	(26,'2024_04_14_061204_create_settings_general_table',9);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\Role',2);

/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\User',1),
	(3,'App\\Models\\User',2),
	(4,'App\\Models\\User',3),
	(5,'App\\Models\\User',4),
	(6,'App\\Models\\User',5),
	(5,'App\\Models\\User',6),
	(5,'App\\Models\\User',7),
	(5,'App\\Models\\User',8),
	(5,'App\\Models\\User',9),
	(4,'App\\Models\\User',10),
	(4,'App\\Models\\User',11);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `fee` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `unitcost` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `bagian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;

INSERT INTO `order_details` (`id`, `order_id`, `type_fee`, `type_discount`, `product_id`, `quantity`, `fee`, `discount`, `unitcost`, `total`, `bagian`, `created_at`, `updated_at`)
VALUES
	(30,'23','amount','amount','20',1,0,0,100000,100000,'Gudang','2024-05-09 10:43:54',NULL),
	(31,'25',NULL,NULL,'21',1,NULL,NULL,13000,13000,'Gudang','2024-06-18 03:12:02',NULL),
	(32,'25',NULL,NULL,'1037',2,NULL,NULL,12000,24000,'Gudang','2024-06-18 03:12:02',NULL),
	(33,'26',NULL,NULL,'1037',2,NULL,NULL,12000,24000,'Toko','2024-06-18 03:30:29',NULL),
	(34,'26',NULL,NULL,'24',2,NULL,NULL,13000,26000,'Toko','2024-06-18 03:30:29',NULL),
	(35,'27',NULL,NULL,'1037',1,NULL,NULL,12000,12000,'Toko','2024-06-18 06:54:24',NULL),
	(37,'29',NULL,NULL,'1037',1,NULL,NULL,11280,11280,'Toko','2024-06-18 09:39:22',NULL),
	(38,'30',NULL,NULL,'1544',3,NULL,NULL,17100,51300,'Toko','2024-06-19 12:25:47',NULL),
	(39,'30',NULL,NULL,'1545',3,NULL,NULL,23750,71250,'Toko','2024-06-19 12:25:47',NULL),
	(40,'37',NULL,NULL,'1544',5,NULL,NULL,18000,100800,'Gudang','2024-06-20 15:00:16',NULL),
	(41,'38',NULL,NULL,'1544',4,NULL,NULL,18000,72000,'Gudang','2024-06-22 12:19:24',NULL),
	(42,'38',NULL,NULL,'1545',2,NULL,NULL,20000,40000,'Gudang','2024-06-22 12:19:24',NULL),
	(44,'40',NULL,NULL,'1544',5,NULL,NULL,18000,90000,'Gudang','2024-06-22 12:36:54',NULL);

/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `agen_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_products` int DEFAULT NULL,
  `sub_total` int DEFAULT NULL,
  `totalDiscount` int DEFAULT NULL,
  `totalFee` int DEFAULT NULL,
  `vat` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay` int DEFAULT NULL,
  `due` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `bagian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orders_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `agen_id`, `customer_id`, `due_date`, `order_date`, `order_status`, `total_products`, `sub_total`, `totalDiscount`, `totalFee`, `vat`, `total`, `invoice_no`, `payment_type`, `pay`, `due`, `created_at`, `updated_at`, `status_id`, `bagian`)
VALUES
	(23,'2','1','2024-05-09 10:43:50','2024-05-09','complete',1,100000,0,0,11000,111000,'INV-000001','DUE',111000,0,'2024-05-09 10:43:53','2024-05-18 14:28:57',1,'Gudang'),
	(25,'1','2',NULL,'2024-06-18','complete',3,37000,NULL,NULL,0,37000,'INV-000003','Due',37000,0,'2024-06-18 03:12:02','2024-06-18 05:00:43',1,'Toko'),
	(26,'2','1',NULL,'2024-06-18','pending',4,50000,NULL,NULL,0,50000,'INV-000004','Due',40000,10000,'2024-06-18 03:30:29','2024-06-18 05:52:02',1,'Toko'),
	(27,'1','6',NULL,'2024-06-18','pending',1,12000,NULL,NULL,1320,13320,'INV-000005','Due',13320,0,'2024-06-18 06:54:24',NULL,1,'Toko'),
	(29,'1','12',NULL,'2024-06-18','complete',1,11280,NULL,NULL,1241,12521,'INV-000006','HandCash',12521,0,'2024-06-18 09:39:22','2024-06-18 09:51:01',1,'Toko'),
	(30,'2','1',NULL,'2024-06-19','complete',6,122550,NULL,NULL,13481,136031,'INV-000007','HandCash',120000,16031,'2024-06-19 12:25:47','2024-06-19 12:59:05',1,'Gudang'),
	(37,'2','1',NULL,'2024-06-20','complete',1,90000,NULL,NULL,10800,100800,'INV-000013','Due',50000,50800,'2024-06-20 15:00:16','2024-06-20 15:05:02',1,'Gudang'),
	(38,'1','1',NULL,'2024-06-22','complete',2,112000,NULL,NULL,13440,125440,'INV-000014','Due',100000,25440,'2024-06-22 12:19:24','2024-06-22 12:20:47',1,'Gudang'),
	(40,'2','1',NULL,'2024-06-22','complete',1,90000,NULL,NULL,10800,100800,'INV-000015','HandCash',100800,0,'2024-06-22 12:36:54','2024-06-22 12:41:36',1,'Gudang');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'list','web','2023-09-10 14:26:55','2023-09-10 14:26:55'),
	(2,'create','web','2023-09-10 14:26:55','2023-09-10 14:26:55'),
	(3,'edit','web','2023-09-10 14:26:55','2023-09-10 14:26:55'),
	(4,'delete','web','2023-09-10 14:26:55','2023-09-10 14:26:55');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_tokos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_tokos`;

CREATE TABLE `product_tokos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weightKg` int DEFAULT '0',
  `weight` int DEFAULT '0',
  `min_stock` int DEFAULT '1',
  `discount_percent` int DEFAULT '0',
  `discount_price` int DEFAULT '0',
  `bag` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `buying_price` int DEFAULT NULL,
  `selling_price` int DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint unsigned DEFAULT NULL,
  `gudang_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `brand_id` bigint unsigned DEFAULT NULL,
  `grade_id` bigint unsigned DEFAULT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `type_id` bigint unsigned DEFAULT NULL,
  `item_type_id` bigint unsigned DEFAULT NULL,
  `made_in_id` bigint unsigned DEFAULT NULL,
  `product_base_bag` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `products_status_id_foreign` (`status_id`) USING BTREE,
  KEY `products_brand_id_foreign` (`brand_id`) USING BTREE,
  KEY `products_grade_id_foreign` (`grade_id`) USING BTREE,
  KEY `products_group_id_foreign` (`group_id`) USING BTREE,
  KEY `products_type_id_foreign` (`type_id`) USING BTREE,
  KEY `products_item_type_id_foreign` (`item_type_id`) USING BTREE,
  KEY `made_in_id` (`made_in_id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `product_tokos_ibfk` (`gudang_id`),
  CONSTRAINT `product_tokos_ibfk` FOREIGN KEY (`gudang_id`) REFERENCES `list_gudangs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_4` FOREIGN KEY (`made_in_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_5` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_6` FOREIGN KEY (`item_type_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_7` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `product_tokos_ibfk_8` FOREIGN KEY (`type_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_tokos` WRITE;
/*!40000 ALTER TABLE `product_tokos` DISABLE KEYS */;

INSERT INTO `product_tokos` (`id`, `product_name`, `category_id`, `detail`, `unit_id`, `product_code`, `weightKg`, `weight`, `min_stock`, `discount_percent`, `discount_price`, `bag`, `stock`, `buying_price`, `selling_price`, `product_image`, `created_at`, `updated_at`, `supplier_id`, `gudang_id`, `status_id`, `brand_id`, `grade_id`, `group_id`, `type_id`, `item_type_id`, `made_in_id`, `product_base_bag`)
VALUES
	(20,'Santana A','1',NULL,'1','Santana A',5,5000,1,0,0,0,-6,12000,13000,NULL,'2024-03-29 13:17:41','2024-06-19 07:15:54',2,1,1,106,NULL,108,NULL,NULL,NULL,5),
	(21,'FfGV5OOcRa','1',NULL,'1','XVMBFdLnha',0,0,1,0,0,0,1,12000,13000,NULL,'2024-03-29 13:22:22','2024-06-18 05:00:43',2,1,1,106,NULL,108,NULL,NULL,NULL,1),
	(22,'hSuX8Jrqvq','1',NULL,'1','0HQs8ZcElm',0,0,1,0,0,0,0,12000,13000,NULL,'2024-03-29 13:23:01','2024-06-18 11:02:19',2,1,1,106,NULL,108,NULL,NULL,NULL,1),
	(23,'Santana B','1',NULL,'1','SN B',0,0,1,0,0,0,0,12000,13000,NULL,'2024-05-18 14:24:10','2024-05-18 14:24:10',2,1,1,106,NULL,108,NULL,NULL,NULL,12),
	(24,'Santana C','1',NULL,'1','SN XZ',0,0,1,0,0,0,2,12000,13000,NULL,'2024-05-18 14:24:52','2024-05-18 14:45:44',2,1,1,106,NULL,108,NULL,NULL,NULL,1),
	(1037,'test','1','testjjhkhkh',NULL,'PC01',0,1,1,6,0,0,3,10000,12000,NULL,'2024-06-17 13:28:09','2024-06-18 09:51:01',1,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1038,'HST ( JIHYD )',NULL,'HST SEAT',NULL,'HST-45CC',0,0,1,0,0,0,0,NULL,17750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1039,'OIL SEAL',NULL,'OIL SEAL',NULL,'25*35*6',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1040,'OIL SEAL',NULL,'OIL SEAL',NULL,'25*35*6',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1041,'SHAFT ( PUMP )',NULL,'AS POMPA ATAS',NULL,'WHST40-04B',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1042,'SHAFT ( PUMP )',NULL,'AS POMPA ATAS',NULL,'WHST40-04B',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1043,'POSITIONING SEAT',NULL,'TUTUP SEAL HST NEW',NULL,'WHST45-05X',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1044,'SHAFT MOTOR ( NEW TYPE )',NULL,'AS MOTOR BAWAH',NULL,'WHST40-06X',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1045,'POSITIONING SEAT',NULL,'TUTUP SEAL HST LAMA',NULL,'WHST40-05X',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1046,'PLUNGER ASSEMBLY',NULL,'PISTON HST',NULL,'WHST45-08-07',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1047,'PLUNGER ASSEMBLY',NULL,'PISTON HST',NULL,'WHST45-08-07',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1048,'PLUNGER ASSEMBLY',NULL,'RING PISTON HST',NULL,'WHST45-08-4',0,0,1,0,0,0,0,NULL,745000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1049,'PLUNGER ASSEMBLY',NULL,'RING PISTON HST',NULL,'WHST45-08-4',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1050,'PLUNGER ASSEMBLY',NULL,'BALGUID/ TOPI HST',NULL,'WHST40-08-5B',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1051,'PLUNGER ASSEMBLY',NULL,'BALGUID/ TOPI HST',NULL,'WHST40-08-5B',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1052,'PIN',NULL,'PIN',NULL,'WHST40-08-6',0,0,1,0,0,0,0,NULL,75000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1053,'HOUSING',NULL,'BURENG HST',NULL,'WHST45-08-1',0,0,1,0,0,0,0,NULL,2750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1054,'HOUSING',NULL,'BURENG HST',NULL,'WHST45-08-1',0,0,1,0,0,0,0,NULL,1750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1055,'SPRING SEAT',NULL,'PER BORENG HST',NULL,'WHST40-08-3',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1056,'SPRING ( HOUSING )',NULL,'PER BORENG HST',NULL,'WHST40-08-02',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1057,'ASSIGMENT PLATE ( PUMP )',NULL,'KUNINGAN POMPA (VALVE PUMP)',NULL,'WHST40-03',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1058,'ASSIGMENT PLATE ( PUMP )',NULL,'KUNINGAN POMPA (VALVE PUMP)',NULL,'WHST40-03',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1059,'ASSIGMENT PLATE ( MOTOR )',NULL,'KUNINGAN MOTOR (VALVE MOTOR)',NULL,'WHST40-07G*',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1060,'ASSIGMENT PLATE ( MOTOR )',NULL,'KUNINGAN MOTOR (VALVE MOTOR)',NULL,'WHST40-07G*',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1061,'CHARGE PUMP GEAR ( OUTER )',NULL,'POMPA OLI HST (INNER OUTER)',NULL,'WHST40-13A-02',0,0,1,0,0,0,0,NULL,415000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1062,'GENERATOR GEAR (INNER)',NULL,'POMPA OLI HST ',NULL,'WHST40-13A-03',0,0,1,0,0,0,0,NULL,415000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1063,'RELIEF VALVE ASS\'Y',NULL,'PENTIL OLI HST',NULL,'WHST40-02-9',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1064,'CHECK',NULL,'JARUM PRESURE',NULL,'WHST40-02-2',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1065,'LIMIT PLATE WELD',NULL,'SETELAN RODA SET',NULL,'WD.4FE.27.1',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1066,'LIMIT PLATE',NULL,'SETELAN RODA SET',NULL,'WD.4FE.27-04',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1067,'AIR FILTER',NULL,'FILTER UDARA',NULL,'K35C9',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1068,'HST FILTER',NULL,'FILTER HST',NULL,'W2.5M-05M-18-01-X',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1069,'HST FILTER',NULL,'FILTER HST',NULL,'W2.5M-05M-18-01-X',0,0,1,0,0,0,0,NULL,165000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1070,'OIL PUMP PARTD',NULL,'POMPA OLI MESIN',NULL,'4G33TC-131000B',0,0,1,0,0,0,0,NULL,550000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1071,'SUPERCHARGER',NULL,'TURBO',NULL,'4G33TC-34100022',0,0,1,0,0,0,0,NULL,4500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1072,'SUPERCHARGER',NULL,'TURBO',NULL,'4G33TC-34100022',0,0,1,0,0,0,0,NULL,3100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1073,'ALTERNATOR',NULL,'DINAMO AMPER',NULL,'4G33TC-290000C',0,0,1,0,0,0,0,NULL,2350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1074,'ALTERNATOR',NULL,'DINAMO AMPER',NULL,'4G33TC-290000C',0,0,1,0,0,0,0,NULL,1700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1075,'CAMSHAFT',NULL,'NOKEN AS',NULL,'4G33V16-070001B',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1076,'CRANK SHAFT',NULL,'KROK AS',NULL,'600*185*130',0,0,1,0,0,0,0,NULL,3150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1077,'LEST HOUSING OF GEARBOX',NULL,'BLOK GEARBOX KIRI',NULL,'ZKB85-306-001J',0,0,1,0,0,0,0,NULL,2750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1078,'GEAR',NULL,'GEAR PENERUS HST',NULL,'ZKB85-3072-001',0,0,1,0,0,0,0,NULL,215000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1079,'HEADER GEAR',NULL,NULL,NULL,'ZKB85-3012-002',0,0,1,0,0,0,0,NULL,210000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1080,'HEADER SHAFT',NULL,'AS HEADER',NULL,'ZKB85-301-001',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1081,'SPEED SHIFTING GEAR',NULL,'GIGI RENTENG',NULL,'ZKB85-3012-003',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1082,'SPEED SHIFTING SHAFT',NULL,'AS GIGI 123',NULL,'ZKB85-302-001',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1083,'GEAR I',NULL,NULL,NULL,'ZKB85-302a-002',0,0,1,0,0,0,0,NULL,215000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1084,'GEAR II',NULL,NULL,NULL,'ZKB85-302a-003',0,0,1,0,0,0,0,NULL,190000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1085,'GEAR III',NULL,NULL,NULL,'ZKB85-302A-004',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1086,'STEERING CLUTCH GEAR DAN SHAFT',NULL,NULL,NULL,'ZKB85-203-100',0,0,1,0,0,0,0,NULL,815000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1087,'STEERING GEAR',NULL,'GIGI BELOK',NULL,'ZKB80-303-002,012',0,0,1,0,0,0,0,NULL,475000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1088,'IDLE WHEEL',NULL,NULL,NULL,'ZKB80-304-1-00',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1089,'INNER SHAFT RING',NULL,NULL,NULL,'ZKB80-303-006',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1090,'STEERING SPRING',NULL,NULL,NULL,'ZKB80-009',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1091,'EXTERNAL SHAFT RING',NULL,NULL,NULL,'ZKB80-303-005',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1092,'THRUST COLLAR',NULL,NULL,NULL,'ZKB80-303-007a',0,0,1,0,0,0,0,NULL,115000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1093,'PRESSURE PLATE',NULL,NULL,NULL,'ZKB75-303-009',0,0,1,0,0,0,0,NULL,85000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1094,'INNER FRIECTION SHEET',NULL,'KAMPAS',NULL,'ZKB80-303-004a',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1095,'COLLAR',NULL,NULL,NULL,'ZKB65-305-008',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1096,'DRIVING GEAR',NULL,NULL,NULL,'ZKB80-305A-004',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1097,'SLEEVE',NULL,NULL,NULL,'ZKB65-305-003A',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1098,'锐龙齿轮泵CBN-F312 18*22',NULL,'POMPA HIDROLIK',NULL,'W2.5DD-05DC-09-00E',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1099,'RADIATOR',NULL,NULL,NULL,'W2.5DA-03FK-11-01-00',0,0,1,0,0,0,0,NULL,4800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1100,'DRIVING CHAIN WHEEL',NULL,NULL,NULL,'WD.4MC.2-01C',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1101,'TENSION PULLEY ASSY, WALKING',NULL,'SETELAN VANBELT SET',NULL,'W3.5H-03B-17-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1102,'SUPPORT ROLLER ASSY',NULL,NULL,NULL,'W3.5H-03A-06-00',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1103,'RUBBER TRACK YACHOO',NULL,NULL,NULL,'5509056',0,0,1,0,0,0,0,NULL,12200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1104,'CHAIN IMPURITY AUGER',NULL,'RANTAI BELAKANG',NULL,'W2.5-02-02-11-06',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1105,'RIGHT COVER, HEADER',NULL,NULL,NULL,'W2.0-01-06A-00',0,0,1,0,0,0,0,NULL,470000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1106,'LEFT COVER HEADER',NULL,NULL,NULL,'W2.0-01-03-00',0,0,1,0,0,0,0,NULL,550000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1107,'upper cutter swing lever assy',NULL,'ENGKOL',NULL,'W2.0-01-01-07-01-00',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1108,'grain lifting chain',NULL,NULL,NULL,'W2.5K-02PB-10A-15',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1109,'washer',NULL,'RING PENAHAN GIR HST',NULL,'w2.0-03(R)-03-03A',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1110,'o ring seal',NULL,NULL,NULL,'58x1.8 (GB/T3452.1-92)',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1111,'tension pulley assy',NULL,'HEDLER',NULL,'W5.0-03X-27-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1112,'cylinder header',NULL,'HIDROLIS BAKET BESAR',NULL,'W3.5-05-01-00ML',0,0,1,0,0,0,0,NULL,1450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1113,'cylinder header',NULL,'HIDROLIS BAKET KECIL',NULL,'W3.5-05-02-00M',0,0,1,0,0,0,0,NULL,1200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1114,'割台油封',NULL,NULL,NULL,'W2.5E-05-01-11',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1115,'canopy',NULL,NULL,NULL,'W2.0-13-03A',0,0,1,0,0,0,0,NULL,550000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1116,'SLEVE ASSY, UPPER A',NULL,'SIRIP AYAK SEAT DEPAN',NULL,'W3.5H-02HA-13-01-02-00',0,0,1,0,0,0,0,NULL,575000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1117,'SLEVE ASSY, UPPER B',NULL,'SIRIP AYAK SEAT BELAKANG',NULL,'W3.5H-02HA-13-01-10-00',0,0,1,0,0,0,0,NULL,745000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1118,'CONVEYOR TEETH, LEFT',NULL,'GRAJI PESO PENDEK',NULL,'W2-0-01-01-03G-18',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1119,'CONVEYOR TEETH, RIGHT',NULL,'GRAJI PESO PANJANG',NULL,'W2.5E-01D-01-03-01',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1120,'SWING SHAFT',NULL,'AS PENDEKAN ENGKOL PESO',NULL,'W2.0-01-01-07-01-01',0,0,1,0,0,0,0,NULL,85000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1121,'SLEEVE',NULL,'BAGIAN OSLOK',NULL,'W2.0-01-01-07-01-06',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1122,'DASH COVER',NULL,'BAGIAN OSLOK',NULL,'W2.0-01-01-07-01-04',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1123,'MIDDLE SPACER',NULL,'BAGIAN OSLOK',NULL,'W2.0-01-01-07-01-05',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1124,'SLEEVE',NULL,'BAGIAN OSLOK',NULL,'W2-0-01-01-07-01-07',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1125,'ECCENTRIC CRANK WELD',NULL,'GIR LENGAN GARENG',NULL,'W2.5E-01B-01-07-02-02A-00',0,0,1,0,0,0,0,NULL,310000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1126,'DRIVING WELD BALER',NULL,'V-BOLT AYAK 1986',NULL,'w3.5-16-20-03',0,0,1,0,0,0,0,NULL,330000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1127,'CHAIN BOX ASSY',NULL,'RUMAH RANTAI BELAKANG',NULL,'W2.0-02-11-14-00',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1128,'BEARING SHAFT',NULL,'KUPINGAN AYAK',NULL,'W2.0-02-13-01-03',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1129,'ECCENTRIC WELD',NULL,'BOSING AYAK',NULL,'W2.0-02-13-01-08',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1130,'BEARING SEAT',NULL,NULL,NULL,'W2.5-02B-02-13-02-03',0,0,1,0,0,0,0,NULL,130000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1131,'SLEEVE',NULL,NULL,NULL,'W2.5-02B-02-13-02-08',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1132,'COVER PLATE',NULL,NULL,NULL,'W2.5K-02PB-10A-05',0,0,1,0,0,0,0,NULL,130000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1133,'COVER WELD',NULL,NULL,NULL,'W2.5K-02PB-10A-04-00',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1134,'OIL SEAL',NULL,NULL,NULL,'MC90*60*18',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1135,'BALANCE ROLLER ASSY',NULL,'LOLER BAWAH KECIL',NULL,'W3.5H-03A-07-00',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1136,'COVER',NULL,'TUTUP TAMIA LUAR',NULL,'W2.5DX-03C-06-03-00',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1137,'SLEEVE',NULL,'SELAT BERING 6305',NULL,'W1.8-33-06-02',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1138,'TRACK ROLLER',NULL,'TAMIA KOSONGAN',NULL,'W2.5DX.03C.06.01.00',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1139,'OIL SEAL ASSY',NULL,NULL,NULL,'W1.8-33-06-04-00A',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1140,'SLEEVE',NULL,'SIL TAMIA NEW',NULL,'W2.5DX-03C-06-05-00',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1141,'OUTER COVER',NULL,NULL,NULL,'W2.5DX-03C-06-10',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1142,'SHAFT',NULL,'AS TAMIA',NULL,'WD.4MC-32-06',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1143,'SPECIAL WASHER',NULL,NULL,NULL,'W1.8-33-06-07',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1144,'RETAINING RING',NULL,NULL,NULL,'W1.8-33-06-07',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1145,'BOLT M 12 X 1.5 X 30',NULL,NULL,NULL,'GB/T5786',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1146,'WAHSER 12',NULL,NULL,NULL,'GB/T93',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1147,'OIL CUP M6',NULL,NULL,NULL,'JB\\T7940.1-M6',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1148,'SEAL COVER',NULL,NULL,NULL,'W2.5DX-03C-06-11',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1149,'CHARGE SPRING',NULL,NULL,NULL,'WHST40-02-3',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1150,'Swash plate(p)',NULL,NULL,NULL,'WHST45-11',0,0,1,0,0,0,0,NULL,1250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1151,'SPLINE SLEEVE',NULL,NULL,NULL,'W2.0-03-10-03',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1152,'FLUNGE 19',NULL,NULL,NULL,'W2.5C-03D-10-04',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1153,'FLUNGE 22',NULL,NULL,NULL,'W2.5C-03D-10-04',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1154,'SPLINE SHAFT 19',NULL,NULL,NULL,'W2.5C-03D-10-05',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1155,'SPLINE SHAFT 22',NULL,NULL,NULL,'W2.5DA-03H-10D-05',0,0,1,0,0,0,0,NULL,250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1156,'grain lifting auger',NULL,'ULIR DEPAN BERDIRI',NULL,'W3.5H - 02PD - 10 - 01 - 03 - 00',0,0,1,0,0,0,0,NULL,880000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1157,'GRAIN LIFTING AUGER HOUSING',NULL,'RUMAH ULIR DEPAN',NULL,'W3.5H-02PD-10S-01-02-00',0,0,1,0,0,0,0,NULL,945000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1158,'PLATE I + BOLT',NULL,'TAPAKAN',NULL,'W3.5H-02-11A-02-02',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1159,'PLATE II + BOLT',NULL,'TAPAKAN',NULL,'W3.5H-02-11A-02-03',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1160,'HORIZONTAL AUGER WELD, GRAIN',NULL,'ULIR DEPAN BAWAH',NULL,'W2.5A-02B-02-10-02-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1161,'HOUSING WELD, IMPURITY LIFTING AUGER',NULL,'RUMAH ULOR BELAKANG',NULL,'W3.5H-02HB-11B-01-01-00',0,0,1,0,0,0,0,NULL,1200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1162,'FRICTION FORK ROD',NULL,'GIGI BELOK PENDORONG',NULL,'ZKB85-206-400-1-01',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1163,'SPEED SHIFTING SHAFT',NULL,NULL,NULL,'ZKB65-106-500-1a1',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1164,'GEAR SHIFT FORK',NULL,NULL,NULL,'ZKB60-106-500-01',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1165,'GEAR SHIFTOR SHAFT',NULL,NULL,NULL,'ZKB85-106-500-04',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1166,'PISTON PIN +  SNAP H',NULL,'PEN PISTON ENGINE',NULL,'4G33TC-050004A',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1167,'WATER PUMP',NULL,NULL,NULL,'4G33TC-082000A',0,0,1,0,0,0,0,NULL,780000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1168,'INJECTOR PART',NULL,'NOSE',NULL,'4G33TC-251000',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1169,'INNER SKELETON ROTATING SHAFT LIP SEAL RING',NULL,NULL,NULL,'DL85 X 110 X 12B/P',0,0,1,0,0,0,0,NULL,140000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1170,'INNER SKELETON ROTATING SHAFT LIP SEAL RING',NULL,NULL,NULL,'DR 52 X 72 X 12',0,0,1,0,0,0,0,NULL,110000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1171,'CYLINDER HEAD GASKET',NULL,'PERPAK CINDERKOP',NULL,'4L88-030013D',0,0,1,0,0,0,0,NULL,375000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1172,'GEAR CHAMBER COVER GASKET',NULL,NULL,NULL,'N85T-12003',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1173,'EXHOUST PIPE GASKET',NULL,NULL,NULL,'4L88-020006',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1174,'All Gasket',NULL,'PERPAK ENGINE SET',NULL,'4L88',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1175,'ENGINE FRONT S (GOOD QUALITY)',NULL,'DUDUKAN MESIN',NULL,'W2.0-03-05-01-03-00',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1176,'SHOCK ABSORBING CUSHION',NULL,NULL,NULL,'W2.0-03-05-09-00',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1177,'BEARING',NULL,NULL,NULL,'6206 -2RS',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1178,'BEARING',NULL,NULL,NULL,'6205 - 2RS',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1179,'BEARING',NULL,NULL,NULL,'6204 - 2RS',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1180,'BEARING',NULL,NULL,NULL,'1205 RS',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1181,'BEARING',NULL,NULL,NULL,'6203 RS',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1182,'BEARING',NULL,NULL,NULL,'6210 - 2 RS',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1183,'BEARING',NULL,NULL,NULL,'6307 - 2 RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1184,'BUSH (1620)',NULL,NULL,NULL,'1620',0,0,1,0,0,0,0,NULL,24000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1185,'BEARING',NULL,NULL,NULL,'6308 RS',0,0,1,0,0,0,0,NULL,145000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1186,'BEARING',NULL,NULL,NULL,'6309 RS',0,0,1,0,0,0,0,NULL,195000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1187,'BEARING',NULL,NULL,NULL,'6307  RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1188,'BEARING',NULL,NULL,NULL,'6307 RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1189,'BEARING',NULL,NULL,NULL,'6202 RS',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1190,'BEARING',NULL,NULL,NULL,'6204 RS',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1191,'BEARING',NULL,NULL,NULL,'6005 RS',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1192,'BEARING',NULL,NULL,NULL,'6301 RS',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1193,'BEARING',NULL,NULL,NULL,'6012 2 RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1194,'BEARING',NULL,NULL,NULL,'6304 2 RS',0,0,1,0,0,0,0,NULL,55000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1195,'BEARING',NULL,NULL,NULL,'6303 2 RS',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1196,'BEARING',NULL,NULL,NULL,'6302 RS',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1197,'BEARING',NULL,NULL,NULL,'6004 RS',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1198,'BEARING',NULL,NULL,NULL,'6210 RS',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1199,'BEARING',NULL,NULL,NULL,'6007 RS',0,0,1,0,0,0,0,NULL,65000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1200,'BEARING',NULL,NULL,NULL,'6306 RS',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1201,'BEARING',NULL,NULL,NULL,'6305 RS',0,0,1,0,0,0,0,NULL,65000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1202,'BEARING',NULL,NULL,NULL,'NJ305E',0,0,1,0,0,0,0,NULL,250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1203,'BEARING',NULL,NULL,NULL,'NJ307E',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1204,'SLEEVE',NULL,NULL,NULL,'ZKB80-304-005',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1205,NULL,NULL,NULL,NULL,'ZKB-303-002',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1206,'C2060-OL',NULL,'SAMBUNGAN RANTAI',NULL,'C2060-OL',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1207,'锐龙滚筒轴轴柄',NULL,NULL,NULL,'W2.5K-02S-02-01-01',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1208,'Grain Horizontal Bearing Seat',NULL,'R. LAKER SCREW DEPAN',NULL,'W2.5P-02-02-10-07',0,0,1,0,0,0,0,NULL,145000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1209,'BEARING SEAT 2ND',NULL,'R. LAKER SCREW BELAKANG',NULL,'W2.5-02-02-11-04',0,0,1,0,0,0,0,NULL,165000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1210,'CoverWeld, Re-threshing',NULL,NULL,NULL,'W2.0-02-11-03-06-00',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1211,'B STARTER MOTOR QDJ1408 ORIGINAL',NULL,'DINAMO STATER',NULL,'4G33-300000C',0,0,1,0,0,0,0,NULL,2350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1212,'SPRING PIN',NULL,'KANCING SETELAN RODA',NULL,'W2.5DA-03H-27-10',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1213,'Friction Plate',NULL,'KANCING SETELAN RODA',NULL,'W2. 0-01-01-03G-06',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1214,'FRICTION PLATE',NULL,'BANTALAN PESO',NULL,'W2.0-01-01-03G-08',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1215,'Press Plate',NULL,'BANTALAN PESO',NULL,'W2.0-01-01-03G-09',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1216,'Bolt M10*35',NULL,'BAUT JALU',NULL,'GB/T12-88',0,0,1,0,0,0,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1217,'Bolt M10×30',NULL,'BAUT JALU',NULL,'GB/T12-88',0,0,1,0,0,0,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1218,'PLATE,ADJUST',NULL,'BANTALAN PESO',NULL,'W2.0-01-01-03G-07',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1219,'B FAN φ490 ORIGINAL',NULL,'KIPAS RADIATOR',NULL,'CZ4102Q-080020B',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1220,'Gear',NULL,NULL,NULL,'ZKB85-307-001',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1221,'SIEVE PLATE 1',NULL,'SIRIP AYAK BIJIAN',NULL,'W2.5-02-02-13-01-02-02-00',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1222,'Sieve Plate (2)',NULL,'SIRIP AYAK SETELAN',NULL,'W2.5-02-02-13-01-02-04-00',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1223,'Belt Pulley',NULL,'PULLY SAMBUNG V-BELT AYAK',NULL,'W3.5H-02HA-12-02',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1224,'V belt',NULL,'V-BELT RADIATOR',NULL,'AV19*-13*1150(5W)',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1225,'Collar',NULL,NULL,NULL,'ZKB60-302-005',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1226,'BUSH',NULL,'HST',NULL,'W9501-53201',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1227,'bearing',NULL,NULL,NULL,'5211',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1228,'Conveyor Chain Assy',NULL,'CONVEYOR SET',NULL,'W3.5H-01-02-09B-00',0,0,1,0,0,0,0,NULL,2350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1229,'Dust cover',NULL,'KARET TUTUP RANTAI BELAKANG',NULL,'W2.0-02-11-15',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1230,'COVER BEVEL',NULL,'TUTUP RANTAI BELAKANG',NULL,'W2.0-02-11-13',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1231,'CLOTH',NULL,'KARPET',NULL,'1mm*150mm*20m',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1232,'CLOTH',NULL,'KARPET',NULL,'2mm*150mm*20m',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1233,'HEX, BOLT/ (10 PCS)',NULL,'BAUT 10M',NULL,'GB/T5783-86',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1234,'OIL SEAL(HST)',NULL,NULL,NULL,'25*35*6',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1235,'OIL SEAL(HST)',NULL,NULL,NULL,'25*35*6',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1236,'OIL SEAL',NULL,'SIL TAMIA ',NULL,'W1.8L-03-06-04-00',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1237,'SEAL,OIL',NULL,'SIL GERBOX DALAM (55x75x8)',NULL,'GB13871-92',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1238,'BEARING',NULL,'BERING BAMBU HST',NULL,'25*33*30',0,0,1,0,0,0,0,NULL,145000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1239,'BEARING',NULL,'BERING BAMBU HST',NULL,'25*33*30',0,0,1,0,0,0,0,NULL,75000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1240,'BELT',NULL,'V-BELT KERJA 45B 1490',NULL,'4SB1490',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1241,'B BELT TINE RIGHT HAND',NULL,'V-BELT ULIR 3259',NULL,'HC3259LW',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1242,'BELT',NULL,'V-BELT SISIR 2700',NULL,'W2.5E-01XCP-01-18',0,0,1,0,0,0,0,NULL,545000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1243,'Bearing (NSK)',NULL,NULL,NULL,'6310 RS',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1244,'2 nd cylinder high pressure fuel pipe',NULL,'PIPA NOZEL/ SELANG CACING',NULL,'4G33140000',0,0,1,0,0,0,0,NULL,385000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1245,'SUPER CHARGER',NULL,'TURBO',NULL,'4G33TC-341000ZZ',0,0,1,0,0,0,0,NULL,3250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1246,'STARTER ASSEMBLY (NEW TYPE)',NULL,'DINAMO STATER',NULL,'4G33-300000C',0,0,1,0,0,0,0,NULL,1750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1247,'FUEL INJECTION PUMP',NULL,'BOSPUM',NULL,'4G33TC-181000Z',0,0,1,0,0,0,0,NULL,4000000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1248,'ROD WELD',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5DA-03H-17A-06-00',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1249,'NYLON SLEEVE',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5DA-03H-17B-10',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1250,'SPRING',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5DA-03H-17A-05A',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1251,'BALL SEAT',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5-03-10-03',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1252,'EXTERNAL FRICKCITON SHEET',NULL,'SELAT KAMPAS BELOK',NULL,'ZKB75-303-003',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1253,'BELT PULLEY',NULL,'PULLY JALAN',NULL,'W2.5C-03D-10-06',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1254,'SPLINE SHAFT (21,4CM)',NULL,'AS PULLEY JALAN',NULL,'w2.5da-03h-10d-05',0,0,1,0,0,0,0,NULL,250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1255,'SPLINE SHAFT (19.5 CM)',NULL,'AS PULLEY JALAN ',NULL,'W2.5C-03D-10-05',0,0,1,0,0,0,0,NULL,230000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1256,'BELT PULLY VIBRATING SLEEVE',NULL,'V-BELT AYAK',NULL,'W2.5K-02HB-13-02-07-00',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1257,'Belt Pulley, Grain Auger',NULL,'PULLEY ULIR DEPAN',NULL,'W2.5K-02HB-10-06',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1258,'OIL SEAL',NULL,NULL,NULL,'MC60*90*18',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1259,'SLEEVE',NULL,NULL,NULL,'ZKB80-305-003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1260,'OIL SEAL',NULL,NULL,NULL,'FB55*75*8',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1261,'PULLEY',NULL,'PULLY BLOER',NULL,'W2.5C-02-02-05-06A',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1262,'BELT PULLY IMPURITY',NULL,'PULLY ULIR BELAKANG',NULL,'W2.5K-02HB-11-05',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1263,'SEAT TELESCOPIC TEETH',NULL,NULL,NULL,'W2.0-01-01-02-07-01',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1264,'GUIDE SLEEVE TELESCOPIC TEETH',NULL,'MATA YUYU',NULL,'W2.0-01-01-02A-11',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1265,'NYLON SEAT',NULL,'BANTALAN SISIR',NULL,'W2.0B-01B-01-05Q-13',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1266,'RIGHT SHAFT (GEARBOX 85)',NULL,'AS PIKUL KANAN',NULL,'ZKB80-305-002',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1267,'SEAL,OIL42*20*8',NULL,'SIL PELATUK BELOK',NULL,'FB20*8',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1268,'PAPER PAD',NULL,'PERPAK HST',NULL,'WHST40-16A',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1269,'ROD, TELESCOPIC, TEETH',NULL,NULL,NULL,'W2.0-01-01-02A-07-02',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1270,'BEVEL GEAR 1ST',NULL,NULL,NULL,'L1.8A-03-04-03-05',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1271,'SPRING',NULL,NULL,NULL,'W2.5-02-02-10-08A',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1272,'TENSION CHAIN WHEEL',NULL,NULL,NULL,'L1.8A-03-02-04-00',0,0,1,0,0,0,0,NULL,175000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1273,'Housing Plate ',NULL,NULL,NULL,'ZKB85-306-003',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1274,'CHAIN WHEEL 17',NULL,NULL,NULL,'L1.8A-03-02-01-04A',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1275,'Chain Wheel (15)',NULL,NULL,NULL,'L1.8A-03-02-03-01',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1276,'CHAIN WHEEL II',NULL,NULL,NULL,'W2.0-02-11-10',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1277,'CHAIN WHEEL',NULL,NULL,NULL,'W2.0.02-11-07',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1278,'BEVEL GEAR',NULL,NULL,NULL,'W2.5-02G-02-10-01-04',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1279,'Tension Pulley',NULL,'PULLY KLETEK JALAN',NULL,'W2.5K-02SA-09A-01A-00',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1280,'DIST COVER',NULL,NULL,NULL,'W2.0-01-01-07-01-04',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1281,'NUT M12',NULL,NULL,NULL,'6B6173-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1282,'SPACER SKAT BEARING HEADER',NULL,NULL,NULL,'L18X.4.27-03',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1283,'COLLAR',NULL,NULL,NULL,'L18X.4.29-02',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1284,'FOG light',NULL,'LAMPU',NULL,'WD-150-07-03-03B',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1285,'NUT M12',NULL,NULL,NULL,'GBT6170-M12-8-A3L',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1286,'INLET ASSY LEFT',NULL,NULL,NULL,'W2.5-02G-01-05-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1287,'INLET ASSY RIGHT',NULL,NULL,NULL,'w2.5-02g-01-03-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1288,'HOUSING PLATE',NULL,NULL,NULL,'ZKB65-306-003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1289,'BEARING',NULL,NULL,NULL,'6310 2RS',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1290,'Shaft, Tension Pulley',NULL,NULL,NULL,'W2.5DA-B3B-27-08',0,0,1,0,0,0,0,NULL,115000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1291,'Bar, Blade Fixed',NULL,'SIKU PESO 110',NULL,'W3.5D-01D-01-03-02',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1292,'BAR-BLADE-FIXED',NULL,'SIKU PESO 102',NULL,'W2.0B-01B-01-03G-02',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1293,'CUTTER BAR ASSY',NULL,'PESO SET 110',NULL,'W3.5D-01D-01-03-03-00',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1294,'SUPPORT ARM ASSY',NULL,'TUTUP GULUNGAN CONVEYOR',NULL,'W2.5E-01B-02-02-01-00',0,0,1,0,0,0,0,NULL,175000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1295,'FEATHER KEY',NULL,NULL,NULL,'A8X45',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1296,'FEATHER KEY',NULL,NULL,NULL,'A8X50',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1297,'FEATHER KEY',NULL,NULL,NULL,'A10X32',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1298,'KEY',NULL,NULL,NULL,'A10X56',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1299,'FEATHER KEY',NULL,NULL,NULL,'A12X40',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1300,'FEATHER KEY',NULL,NULL,NULL,'C6X25',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1301,'FEATHER KEY',NULL,NULL,NULL,'PJC825',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1302,'FEATHER KEY',NULL,NULL,NULL,'C8X28',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1303,'FEATHER KEY',NULL,NULL,NULL,'C8X30',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1304,'FEATHER KEY',NULL,NULL,NULL,'C8X23',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1305,'FEATHER KEY',NULL,NULL,NULL,'KEYC8X36',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1306,'FEATHER KEY',NULL,NULL,NULL,'C8X40',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1307,'KEY',NULL,NULL,NULL,'A5X25',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1308,'KEY',NULL,NULL,NULL,'Key A5x28',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1309,'KEY',NULL,NULL,NULL,'A6X22',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1310,'KEY',NULL,NULL,NULL,'A7X30',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1311,'FEATHER KEY',NULL,NULL,NULL,'A8X20',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1312,'KEY',NULL,NULL,NULL,'A8X25',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1313,'FEATHER KEY',NULL,NULL,NULL,'A8X28',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1314,'KEY',NULL,NULL,NULL,'A8X32',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1315,'REEL SPRING TEETH (LEFT-HANDED',NULL,'TAKUR',NULL,'W2.5E-01M-01-05-06-02',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1316,'FILTER ASSY (16)',NULL,NULL,NULL,'W2.5K-02HX-13-01-40A-00',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1317,'Bearing',NULL,'STIK',NULL,'JB/T5306-2007SQ10C-RS',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1318,'BEARING PHSA10',NULL,NULL,NULL,'W2.5DA-07E-04-21R',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1319,'BEARING PHSA11',NULL,NULL,NULL,'W2.5DA-07E-04-21L',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1320,'COMBINATION INSTRUMENT',NULL,NULL,NULL,'W2.5DA-06X-G2-2A',0,0,1,0,0,0,0,NULL,1200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1321,'COMBINATION SWITCH',NULL,NULL,NULL,'W2.5C-06-01-20-00G*',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1322,'Center Control Box (12V)',NULL,NULL,NULL,'W2.5C-06-01-19-00',0,0,1,0,0,0,0,NULL,1050000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1323,'STARTING CABLE ASSY',NULL,'KUNCI KONTAK',NULL,'JK430',0,0,1,0,0,0,0,NULL,295000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1324,'THROTTLE WIRE',NULL,NULL,NULL,'W2.5-07-08-05-00',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1325,'FLAMEOUT WIRE',NULL,NULL,NULL,'W2.0-07-02-08-00',0,0,1,0,0,0,0,NULL,115000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1326,'REVERSE WIRE',NULL,NULL,NULL,'W2.5-07-05-04-00',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1327,'MAINPOWER SWEET',NULL,NULL,NULL,'JK861',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1328,'STARING SILINDER',NULL,NULL,NULL,'W2.0-05-33-01',0,0,1,0,0,0,0,NULL,1300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1329,'PREHEAT STARTING RELAY (12V)',NULL,NULL,NULL,'JD155Relay(12V)',0,0,1,0,0,0,0,NULL,245000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1330,'Shaft(motor)',NULL,'OLD HST',NULL,'WHST40-06B',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1331,'Main Clutch Tension Pulley',NULL,NULL,NULL,'W2.5C-02-02-22C-01',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1332,'Guide Rail Weld, Rear',NULL,'KAPALAN',NULL,'WD.4FE.33',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1333,'Cover S-Roller Nipple Attached',NULL,NULL,NULL,'W2.5DX-03C-06-03-00',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1334,'Press Cover, Outside S-ROLLER',NULL,NULL,NULL,'W2.5DX-03C-06-10',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1335,'Shoe Plate',NULL,'HST',NULL,'WHST40-09',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1336,'Pin Shaft',NULL,NULL,NULL,'W2.0-01-01-07-01-09',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1337,'SWING SHAFT CUTT.',NULL,'MANDREL',NULL,'W2.0-01-01-07-01-03',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1338,'Oil filter (4L88-261100)',NULL,'FILTER OLI',NULL,'4L88-261000A',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1339,'Oil Seal Assy',NULL,'SIL MIDLER',NULL,'W2.5DA-03H-27-06-00B',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1340,'Shaft, Tension Pulley',NULL,NULL,NULL,'W2.5DA-033-27-08',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1341,'Tension Frame Weld (New Model)',NULL,'SAPIT URANG',NULL,'W5.0-03X-27-02-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1342,'FILTER',NULL,NULL,NULL,'W2.5M-05M-18-01-X',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1343,'SELF MOTOR',NULL,NULL,NULL,'4G33TC-290000C',0,0,1,0,0,0,0,NULL,1750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1344,'BEVEL GEAR BOX',NULL,NULL,NULL,'L1.8A-03-02-03-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1345,'Gearbox Assy , Impurity',NULL,NULL,NULL,'W2.5-02-02-11-01-09-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1346,'HST ASSY  JD',NULL,NULL,NULL,'HST-45CC',0,0,1,0,0,0,0,NULL,17800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1347,'Roller Assy, Support',NULL,'TAMIA SET BESAR',NULL,'W3.5H-03A-06-00',0,0,1,0,0,0,0,NULL,875000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1348,'DIESEL FILTER',NULL,NULL,NULL,'N485-28100',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1349,'Upper Shaft',NULL,NULL,NULL,'W2.5E-01B-02-05Y',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1350,'Frame Weld, Fan',NULL,NULL,NULL,'W2.5-02B-02-05-07-00',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1351,'Square Four-way Welding',NULL,NULL,NULL,'W2.5K-02PB-10A-01-01-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1352,'IDLE SHAFT',NULL,NULL,NULL,'ZKB80-304-001',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1353,'Bearing Assy',NULL,NULL,NULL,'W2.5-02B-02-05-03-00',0,0,1,0,0,0,0,NULL,265000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1354,'Sieve Assy, Upper A  Old Model',NULL,'AYAK DEPAN SET',NULL,'W3.5H-02HA-13-01-02-00',0,0,1,0,0,0,0,NULL,575000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1355,'UPPER, SIEVE ASSY B',NULL,'AYAK BELAKANG SET',NULL,'W3.5H-02HA-13-01-10-00',0,0,1,0,0,0,0,NULL,745000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1356,'FILTER',NULL,'FILTER HST KECIL ATAS',NULL,'W2.5DD-05DB-01-03A',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1357,'Shaft',NULL,'ASS AYAK',NULL,'W2.5-02B-02-13-02-01',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1358,'Fan Shaft',NULL,'ASS BLOWER KIPAS',NULL,'W2.5P-02-02-05-01',0,0,1,0,0,0,0,NULL,675000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1359,'Balance Roller Weld',NULL,'TAMIA KECIL',NULL,'W1.8-33-07-01-00',0,0,1,0,0,0,0,NULL,190000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1360,'Press Plate (II)',NULL,NULL,NULL,'W3.5H-03A-28-01-00',0,0,1,0,0,0,0,NULL,190000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1361,'Oil Seal 40 x 90 x 10',NULL,'GEAR BOX ATAS',NULL,'W2.5-02A-01-17-11',0,0,1,0,0,0,0,NULL,55000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1362,'SEAL,OIL 45 x 68 x 10',NULL,'GEAR BOX ATAS',NULL,'W2.5-02S-01-17-14',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1363,'SEAL,OIL 35 x 80 x 10',NULL,'GEAR BOX ATAS',NULL,'W2.5-02S-01-17-15',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1364,'SEAL, OIL42 x 20 x 8',NULL,NULL,NULL,'GB/T13871-92',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1365,'FILTER',NULL,NULL,NULL,'W2.5DD-05DB-01-03A ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1366,'SUPPORT FRONT INTERNAL ENGINE',NULL,NULL,NULL,'W2.5DA-03YC-05-04-00',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1367,'Washer',NULL,NULL,NULL,'W1.8-33-06-07',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1368,'Conveyor Chain Assy',NULL,NULL,NULL,'W3.5H-01-02-09-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1369,'Passive Shaft',NULL,NULL,NULL,'W2.5-02S-01-17-09',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1370,'REEL BELT C 2700',NULL,NULL,NULL,'W2.5E-01XCP-01-04-08-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1371,'CUTTER BAR ASSY, BLADE FIXED 29.5',NULL,'PISAU SET',NULL,'W 2.5E - 01- 01 - 03 - 03 - 00A',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1372,'Blade guide B (WDZ) GOOD QUALITY',NULL,'KUKU MACAN',NULL,'W2.0-01-01-03G-04',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1373,'Blade',NULL,'PISAU BIJIAN',NULL,'W2.0-01-01-03G-03.05',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1374,'BEARING',NULL,'TIEROD',NULL,'W2.0-01-01-07-05-00',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1375,'Rotary Axis',NULL,NULL,NULL,'W 2.5 E - 01B - 01 - 04 -08A - 08',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1376,'Upper Connecting Rod Weld',NULL,'TANGAN GARENG',NULL,'W 2.0 - 01 - 01 - 07 - 06 - 06',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1377,'UPPER CUTTER SWING LEVER',NULL,'ENGKOL PISAU KOSONGAN',NULL,'W2.0-01-01-07-01-02',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1378,'BELT CONVEYOR ( B3201 / 3175 )',NULL,'V-BELT GULU',NULL,'W3.5H-01-02-11A  ',0,0,1,0,0,0,0,NULL,525000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1379,'CONVEYOR CHAIN',NULL,'RANTAI KONVEYOR',NULL,'W3.5-01A-02-09-01',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1380,'Belt Pulley, Upper Shaft',NULL,'PULLEY ATAS SET',NULL,'W 2.5E . 01B . 02 . 32',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1381,'Driving Hub, Left',NULL,'PULLEY ATAS SET',NULL,'W 2.5E . 01B . 02 . 38X',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1382,'HEADER DRIVING PULLY 3020 BELT',NULL,'PULLEY ATAS SET',NULL,'W 2.5E - 01B - 02 - 07B',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1383,'DRIVING WHEEL, RIGHT',NULL,NULL,NULL,'W2.5DA-01-02-04-00',0,0,1,0,0,0,0,NULL,295000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1384,'Chain Wheel, Conveyor',NULL,NULL,NULL,'W2.5E-01B-02-04Y',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1385,'SHAFT SLEEVE',NULL,'BUSING UPPERSHAFT',NULL,'W2.5E-01B-02-40',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1386,'SPRING',NULL,NULL,NULL,'W2.0-01-02-05-01',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1387,'HANGING PLATE',NULL,'PALANGAN KONVEYOR',NULL,'W2.5E-01B-02Y-09-03',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1388,'PASSIVE WHEEL SHAFT',NULL,'ASS KONVEYOR BAWAH',NULL,'W2.5E-01B-02-02-02',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1389,'PASSIVE WHEEL',NULL,'GULUNGAN BAWAH',NULL,'W2.5E-01B-02-02-03-00',0,0,1,0,0,0,0,NULL,1050000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1390,'Thresher cylinder assy',NULL,'TLESER SET',NULL,'W2.5K-02S-02-00',0,0,1,0,0,0,0,NULL,8250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1391,'Concave Grid Assy, Rear',NULL,NULL,NULL,'W2.5-02G-01-06A-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1392,'Concave Grid Weld, Front',NULL,NULL,NULL,'W2.5-02G-01-04A-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1393,'Feeding Auger',NULL,NULL,NULL,'W2.5K-02S-02-02-00B-00',0,0,1,0,0,0,0,NULL,3000000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1394,'Rack Weld B',NULL,'GEBUKAN RAPAT',NULL,'W 2.5 K - 02S - 02 - 04 - 00B',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1395,'Rack Weld A',NULL,'GEBUKAN RENGGANG',NULL,'W2.5K-025-02-03-00A',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1396,'Shaft Weld',NULL,NULL,NULL,'W 2.5 K - 02S - 02 - 01 - 00A',0,0,1,0,0,0,0,NULL,3250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1397,'BEARING BLOCK, REAR',NULL,NULL,NULL,'W2.5-02-01-02-12',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1398,'VIBRATING SCREEN ASSY',NULL,'AYAK SET',NULL,'W3.5H-02HA-13-01-00',0,0,1,0,0,0,0,NULL,8000000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1399,'BELT PULLEY VIBRATING SLEVE',NULL,'PELLEY AYAK',NULL,'W2.5K-02HB-13-02-07-00',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1400,'GUIDE PLATE ( SHAKE SCREEN )',NULL,'R. LAKER AYAK DEPAN',NULL,'W2.5-02-02-02G*',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1401,'FRAME WELD, FAN',NULL,'PEREMPATAN RUMAH KIPAS',NULL,'W2.5-02B-02-05-07-00 G*',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1402,'BLADE FAN',NULL,'TIPUS',NULL,'W2.5K-02HX-05-08',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1403,'HORIZONTAL AUGER ASSY',NULL,'SCREW BELAKANG TIDUR',NULL,'W3.5H-02-11A-02-00',0,0,1,0,0,0,0,NULL,720000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1404,'BELT PULLEY, IMPURITY',NULL,'PULLEY SCREW BELAKANG',NULL,'W2.5K-02HB-11-05',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1405,'AUGER WELD, IMPURITY',NULL,'SCREW BELEKANG BERDIRI',NULL,'W3.5H-02-11-01-07-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1406,'HOUSING WELD, RETHRESHING',NULL,'KEONG SET',NULL,'W3.5H-02HB-11-03-01-00',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1407,'INNER PLATE, RETHRESHING',NULL,'KEONG SET',NULL,'W3.5H-02HB-11-03-03',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1408,'Cover Weld, Observe',NULL,'KEONG SET',NULL,'W 3.5 H - 02HB - 11 - 03 - 02 - 00',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1409,'HORIZONTAL AUGER ASSY, IMPURITY',NULL,'SCREW BELAKANG',NULL,'W3.5H-02-11-02-01-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1410,'GEARBOX ASSY',NULL,NULL,NULL,'L1.8A-03-02-03-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1411,'TENSION CHAIN WHEEL',NULL,NULL,NULL,'L1.8A-03-02-04-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1412,'BEVEL GEAR',NULL,NULL,NULL,'L1.8A-03-04-03-05',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1413,'SHAFT CHAIM WHEEL',NULL,NULL,NULL,'L1.8A-03-04-03-03',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1414,'MAIN CLUCTH TENSION ASSY',NULL,NULL,NULL,'W2.5C-02-02-22C-00',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1415,'MAIN CLUCTH TENSION WHEEL',NULL,NULL,NULL,'W2.5C-02-02-22C-01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1416,'SQUARE FOUR - WAY WELD',NULL,NULL,NULL,'W2.5K-02PB-10A-01-01-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1417,'BELT',NULL,NULL,NULL,'W 2.5 L - 02 - 02 - 05 - 10A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1418,'FAN GEARBOX BELT ( C2G68 ) V',NULL,'2SB 1490',NULL,'W3.5-02-36',0,0,1,0,0,0,0,NULL,430000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1419,'BELT',NULL,NULL,NULL,'W 2.5K - 02MB - 36',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1420,'BELT',NULL,'V-BELT BALIK',NULL,'W2.5-02S-01-38',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1421,'BELT',NULL,'2508',NULL,'W 2.5-023-01A-37',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1422,'JOINT BELT WALKING ( 9J - 5 - 1605 )',NULL,'V-BELT JALAN',NULL,'W2.5DA-03H-31',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1423,'HST ASSY  JD',NULL,NULL,NULL,'W2.0-03(R)-03-01-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1424,'POSITIONING SEAT',NULL,NULL,NULL,'WHST 45-05',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1425,'POSITIONING SEAT',NULL,NULL,NULL,'W HST 40 - 05 X',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1426,'PLUG_PF1/2',NULL,NULL,NULL,'WHST40-08-3',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1427,'O RING',NULL,NULL,NULL,'69*2.65',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1428,'SWASH PLATE',NULL,NULL,NULL,'WHST40-10',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1429,'DIESEL OIL FILTER',NULL,NULL,NULL,'4G33TC-281000W',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1430,'DIESEL OIL PRE - FILTER',NULL,NULL,NULL,'4G33TC-281000V',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1431,'DIESEL FILTER ASSEMBLY',NULL,NULL,NULL,'N485-28000',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1432,'DIESEL OIL PRE - FILTER ASSY ( ELECTRON PUMP )',NULL,NULL,NULL,'4G33TC-280000W',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1433,'GUIDE RAIL WELD, FRONT',NULL,NULL,NULL,'W2.5D-03-32-00 ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1434,'TENSION WHEEL',NULL,NULL,NULL,'WD.4MC.27.01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1435,'ADJUSTING SCREW',NULL,NULL,NULL,'WD.4FE.27-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1436,'COVER',NULL,NULL,NULL,'L18X.4.29-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1437,'OIL SEAL COMBINATION',NULL,NULL,NULL,'W2.5DA-03H-27-06-00B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1438,'BALANCE ROLLER ASSY',NULL,NULL,NULL,' #C70SH-46L',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1439,'OIL PUMP PARTD',NULL,NULL,NULL,'4G33TC-131000BG*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1440,'TURBO CHARGER ASSY',NULL,NULL,NULL,'4G33TC - 341000ZZ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1441,'B CONNECTING ROD ORIGINAL',NULL,NULL,NULL,'4G33TC-05 2001B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1442,'PISTON',NULL,NULL,NULL,'4G33TC-050001AG*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1443,'Ring Piston',NULL,NULL,NULL,'4G33TC-PISTON RING KIT',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1444,'CILINDER LINER',NULL,NULL,NULL,'4G33TC-030003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1445,'B BEARING CONNECTING ROD ORIGINAL',NULL,NULL,NULL,'4G33TC-050005',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1446,'TTHRUSTPIECEUP',NULL,NULL,NULL,'4B 28V16 - 030010 & 4B28V16 - 030009',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1447,'B BEARING MAIN LOWER ORIGINAL',NULL,NULL,NULL,'4L68 - 030006 & 4L68 - 030008',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1448,'RIGHT HOUSING OF GEARBOX',NULL,NULL,NULL,'ZKB85-306-002J',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1449,'RIGHT ROCK ASSY',NULL,NULL,NULL,'ZKB40 - 206A - 401 - 2 - 00S',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1450,'LEFT ROCK ASSY',NULL,NULL,NULL,'ZKB40 - 206A - 401 - 1 - 00S',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1451,'Header Gear',NULL,NULL,NULL,'ZKB85-301-002',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1452,'VARIABLE SPEED GEAR',NULL,NULL,NULL,'ZKB85 - 301 - 003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1453,'GEAR 3',NULL,NULL,NULL,'ZKB85- 302-004',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1454,'EXTERNAL SHAFT RING',NULL,NULL,NULL,'ZKB80-303-005G*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1455,'Clasp',NULL,NULL,NULL,'ZKB85 - 303 - 010A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1456,'PRESSURE PLATE',NULL,NULL,NULL,'ZKB75-303-009G*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1457,'EXTERNAL FRICTION SHEET',NULL,NULL,NULL,'ZKB75-303-303',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1458,'BRAKE BOX BASKET',NULL,NULL,NULL,'ZKB65-306-010-003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1459,'Brake Box Gasket',NULL,NULL,NULL,'ZKB65 - 12 - 01L',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1460,'HALF SHAFT RIGHT ARM',NULL,NULL,NULL,'ZKB65a-W3.5H-205-600B1G1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1461,'HALF SHAFT LEFT ARM',NULL,NULL,NULL,'ZKB65A - W3 . 5H . 205 - 500BG',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1462,'LEFT SHAFT GB 637MM ARM',NULL,NULL,NULL,'ZKB65A - W3 . 5H . 305 - 002',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1463,'GASKET OF HALF OF SHAFT',NULL,NULL,NULL,'ZKB65-12-14LK',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1464,'Left Shaft',NULL,NULL,NULL,'ZKB65-305-001',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1465,'MULTIFUNCTIONAL SLIDE VALVE',NULL,NULL,NULL,'W2.5DD-05DC-17-01C',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1466,'INVOLUTE GEAR PUMP',NULL,NULL,NULL,'W2.5DD-05DC-09-00E ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1467,'S PLINE SHAFT',NULL,NULL,NULL,'WD.4M.10-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1468,'SUPPORT ROLLER ASSY',NULL,NULL,NULL,'W5.0-03X-28-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1469,'BOSS PUMP',NULL,NULL,NULL,'4G33TC181000Z',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1470,'INVLOUTE GEAR',NULL,NULL,NULL,'W2.DD-05C-09-00E',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1471,'HEADER DRIVING PULLY',NULL,NULL,NULL,'W2.5E-01B-02-07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1472,'DRIVING HUB, LEFT',NULL,NULL,NULL,'W2.5E-01B-02-38X',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1473,'DIESEL OIL PRE FILTER',NULL,NULL,NULL,'4G33TC-281000 V',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1474,'B CONNECTING ROD ORIGINAL',NULL,NULL,NULL,'4G33TC-052001A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1475,'CONNECTION ROD BEARING KIT',NULL,NULL,NULL,'5G33TC-053000',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1476,'CONCAVEGRID',NULL,NULL,NULL,'W2.5E-0B-02-032',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1477,'CONCAVE GRID FRONT',NULL,NULL,NULL,'W2.5E-01B-02-07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1478,'BELT, ACTIVE TRANSMISSION, FAN',NULL,NULL,NULL,'W2.5C-02-02-05-10A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1479,'HUB',NULL,NULL,NULL,'W2.5K-02HB-05-15',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1480,'BELT PULLEY',NULL,NULL,NULL,'W2.5-02B-02-05-16',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1481,'ASSIGMENT PLATE ( MOTOR )',NULL,NULL,NULL,'W HST 40 - 07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1482,'COVER',NULL,NULL,NULL,'W2.5DX - 30C -06 - 03 - 00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1483,'TRACK ROLLER',NULL,NULL,NULL,'W2.5DX - 03C - 06 - 01 - 00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1484,'HORIZONTAL AUGER WELD, GRAIN',NULL,NULL,NULL,'W2.5A - 02B - 02 - 10 - 02 -00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1485,'HOUSING WELD, IMPURITY LIFTING AUGER',NULL,NULL,NULL,'W3.5H - 02HB - 11B - 01 - 01 - 00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1486,'FRICTION FORK ROD',NULL,NULL,NULL,'ZKB85 - 206 - 400 - 1 - 01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1487,'GEAR SHIFT FORK',NULL,NULL,NULL,'ZKB60 - 106 - 500 - 01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1488,'GEAR SHIFTOR SHAFT',NULL,NULL,NULL,'ZKB85 - 106 - 500 - 04',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1489,'INJECTOR PART',NULL,NULL,NULL,'4G3TC - 251000',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1490,'FRICTION PLATE',NULL,NULL,NULL,'W2.0-01-01-03G-06',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1491,'BOTTOM PLATE, IMPURITY',NULL,NULL,NULL,'W2.5-02-02-07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1492,'SPONGE, SEAL',NULL,NULL,NULL,'W2.5-02-02-32',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1493,'BOTTOM PLATE WELD',NULL,NULL,NULL,'W2.5K-02PC-06-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1494,'SPIDER WELD, FRONT',NULL,NULL,NULL,'W2.5-02-01-02-05-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1495,'RETAINING RING FOR SHAFT 50',NULL,NULL,NULL,'GB/T894. 1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1496,'SPIDER WELD, REAR',NULL,NULL,NULL,'W2.5-02-01-02-06-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1497,'RETAINING RING FOR HOLE 80',NULL,NULL,NULL,'GB/T893.1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1498,'SPIRAL PLATE',NULL,NULL,NULL,'W2.5K-02S-02-02-08B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1499,'TENSION BOLT',NULL,NULL,NULL,'W2.5K-02S-09-01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1500,'CIRCLIP FOR HOLE 47',NULL,NULL,NULL,'GB/T893.1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1501,'TENSION ARMASSY',NULL,NULL,NULL,'W2.5-02B-01G-17-18-02-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1502,'RETAINING RING 15',NULL,NULL,NULL,'GB/T894.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1503,'CIRCLIP FOR SHAFT 25',NULL,NULL,NULL,'GB894.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1504,'CIRCLIP FOR HOLE 52',NULL,NULL,NULL,'GB893.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1505,'CIRCLIP 40',NULL,NULL,NULL,'GB893.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1506,'2# PLATE WELD, VERTICAL',NULL,NULL,NULL,'W2.5-02-02-1101-02-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1507,'COVER WELD',NULL,NULL,NULL,'W2.5-02-02-11-01-06-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1508,'PLATE (2#)',NULL,NULL,NULL,'W2.5-02-02-11-01-08',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1509,'BEARING SEAT (2#AUGER)',NULL,NULL,NULL,'WD-150A-03A.05.10-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1510,'IMPUT SHAFT',NULL,NULL,NULL,'WD-150A-03A.05.10.01-01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1511,'SEAL RING 25 × 47 × 7',NULL,NULL,NULL,'GB/T893.1-92',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1512,'RETAINING RING 47',NULL,NULL,NULL,'GB/T893.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1513,'RETAINING RING 20',NULL,NULL,NULL,'GB/T894.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1514,'BEVEL GEAR',NULL,NULL,NULL,'WD-150-03.05.10.01-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1515,'BEVEL GEAR',NULL,NULL,NULL,'WD-150-03.05.10.01-04',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1516,'SLEEVE',NULL,NULL,NULL,'WD-150A-03A.05.10.01-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1517,'REAR SIEVE ASSY',NULL,NULL,NULL,'W2.5K-02H-13-01-03A-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1518,'BAFFLE PLATE, REAR',NULL,NULL,NULL,'W2.5-02-02-13-01-09',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1519,'GRAIN TENSION PULLEY ASSY',NULL,NULL,NULL,'W3.5H-02HA-10-05-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1520,'RETAINING RING 63',NULL,NULL,NULL,'GB/T894.1-85',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1521,'VERTICAL LIFTING AUGER ASSY',NULL,NULL,NULL,'W3.5H-02HA-10-01-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1522,'TENSION BOLT',NULL,NULL,NULL,'W2.5-02-02-10-14',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1523,'PLATE (NO.1, VERTICAL)',NULL,NULL,NULL,'W2.5-02GX-02-10-01-05',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1524,'PLATE',NULL,NULL,NULL,'W2.5-02GX-02-10-01-06',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1525,'TRANSITION WHEEL',NULL,NULL,NULL,'W2.5K-02HB-12-01A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1526,'RETAINING RING 42',NULL,NULL,NULL,'GB/T893.1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1527,'BELT PULLEY ASSY',NULL,NULL,NULL,'W2.5P-02-02-12-04-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1528,'TENSION FRAME WELD',NULL,NULL,NULL,'W2.5K-02HB-12-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1529,'SPRING (ROCKING)',NULL,NULL,NULL,'W2.5K-02HB-12-09',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1530,'BUCKLE',NULL,NULL,NULL,'WD.2MA.73-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1531,'ACTIVE SHAFT WELD',NULL,NULL,NULL,'W2.0B-01B-01-02-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1532,'TENSION PULLEY ASSY',NULL,NULL,NULL,'W2.5E-01M-02S-05-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1533,'BAFFLE PLATE',NULL,NULL,NULL,'W3.5H-01-02-15',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1534,'DRIVING WHEEL B, HEADER',NULL,NULL,NULL,'W2.5E-01B-02-07B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1535,'SLEEVE ASSY, UPPER',NULL,NULL,NULL,'W2.5E-01B-02-06B-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1536,'ECCENTRIC ROLLER ASSY',NULL,NULL,NULL,'W2.0B-01B-01-05Q-12-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1537,'CHAIN WHEEL WELD',NULL,NULL,NULL,'W2.5E-01B-01-02D-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1538,'NYLON SLEEVE B',NULL,NULL,NULL,'W2.5E-01B-01-22',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1539,'NYLON SLEEVE A',NULL,NULL,NULL,'W2.5E-01B-01-21',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1540,'CHAIN',NULL,NULL,NULL,'08B-1 X 114',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1541,'CHAIN',NULL,NULL,NULL,'08B-1 X 98',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1542,'CHAIN WHEEL WELD',NULL,NULL,NULL,'W2.5E-01B-01-04-11-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1543,'GRAIN LIFTING AUGER (1730 mm)',NULL,NULL,NULL,'W3.5H-02HA-10A-01-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1544,'Test Toko','2','test',NULL,'pppipoioioi',0,12,1,5,0,0,21,18000,21000,NULL,'2024-06-18 10:09:07','2024-06-19 09:44:50',1,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1545,'Test Produk Again','2','teest detail',NULL,'TPA',0,12,1,5,0,0,10,20000,25000,NULL,'2024-06-18 12:34:40','2024-06-19 09:24:49',7,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1546,'produk Gudang','2','yegjgjbjb',NULL,'2456789',0,10,1,5,0,0,10,10000,7000,NULL,'2024-06-19 06:26:43','2024-06-19 06:34:35',6,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1547,'Test produk gudang again','2','jhjhkhkhkh',NULL,'77686868',0,12,1,5,0,0,10,50000,45000,NULL,'2024-06-19 06:31:54','2024-06-19 06:31:54',6,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1549,'Produk Toko','1','jhjjhjhjhj',NULL,'8688787',0,12,1,0,0,0,5,12000,15000,NULL,'2024-06-19 08:02:45','2024-06-19 08:02:45',1,1,1,NULL,107,NULL,NULL,NULL,111,0);

/*!40000 ALTER TABLE `product_tokos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table productions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `productions`;

CREATE TABLE `productions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `stock_production` int NOT NULL DEFAULT '1',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` bigint unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_production` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `productions_unit_id_foreign` (`unit_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  CONSTRAINT `productions_ibfk_1` FOREIGN KEY (`name`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productions_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `productions` WRITE;
/*!40000 ALTER TABLE `productions` DISABLE KEYS */;

INSERT INTO `productions` (`id`, `stock_production`, `detail`, `name`, `unit_id`, `start_date`, `end_date`, `created_at`, `updated_at`, `status_production`)
VALUES
	(38,1,NULL,20,1,'2024-03-29',NULL,'2024-03-29 13:30:50','2024-03-29 13:30:50','0'),
	(39,1,'-',24,1,'2024-05-18',NULL,'2024-05-18 14:26:03','2024-05-18 14:26:03','0'),
	(40,1,'-',24,1,'2024-05-18',NULL,'2024-05-18 14:44:36','2024-05-18 14:44:36','1'),
	(41,1,'-',24,1,'2024-05-18',NULL,'2024-05-18 14:45:44','2024-05-18 14:45:44','1');

/*!40000 ALTER TABLE `productions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weightKg` int DEFAULT '0',
  `weight` int DEFAULT '0',
  `min_stock` int DEFAULT '1',
  `discount_percent` int DEFAULT '0',
  `discount_price` int DEFAULT '0',
  `bag` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `buying_price` int DEFAULT NULL,
  `selling_price` int DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint unsigned DEFAULT NULL,
  `gudang_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `brand_id` bigint unsigned DEFAULT NULL,
  `grade_id` bigint unsigned DEFAULT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `type_id` bigint unsigned DEFAULT NULL,
  `item_type_id` bigint unsigned DEFAULT NULL,
  `made_in_id` bigint unsigned DEFAULT NULL,
  `product_base_bag` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `products_status_id_foreign` (`status_id`) USING BTREE,
  KEY `products_brand_id_foreign` (`brand_id`) USING BTREE,
  KEY `products_grade_id_foreign` (`grade_id`) USING BTREE,
  KEY `products_group_id_foreign` (`group_id`) USING BTREE,
  KEY `products_type_id_foreign` (`type_id`) USING BTREE,
  KEY `products_item_type_id_foreign` (`item_type_id`) USING BTREE,
  KEY `made_in_id` (`made_in_id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `products_ibfk_3` (`gudang_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`made_in_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`gudang_id`) REFERENCES `list_gudangs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_item_type_id_foreign` FOREIGN KEY (`item_type_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `products_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `products_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `detail_master_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `product_name`, `category_id`, `detail`, `unit_id`, `product_code`, `weightKg`, `weight`, `min_stock`, `discount_percent`, `discount_price`, `bag`, `stock`, `buying_price`, `selling_price`, `product_image`, `created_at`, `updated_at`, `supplier_id`, `gudang_id`, `status_id`, `brand_id`, `grade_id`, `group_id`, `type_id`, `item_type_id`, `made_in_id`, `product_base_bag`)
VALUES
	(20,'Santana A','1',NULL,'1','Santana A',5,5000,1,0,0,0,-6,12000,13000,NULL,'2024-03-29 13:17:41','2024-06-19 07:15:54',2,NULL,1,106,NULL,108,NULL,NULL,NULL,5),
	(21,'FfGV5OOcRa','1',NULL,'1','XVMBFdLnha',0,0,1,0,0,0,1,12000,13000,NULL,'2024-03-29 13:22:22','2024-06-18 05:00:43',2,NULL,1,106,NULL,108,NULL,NULL,NULL,1),
	(22,'hSuX8Jrqvq','1',NULL,'1','0HQs8ZcElm',0,0,1,0,0,0,0,12000,13000,NULL,'2024-03-29 13:23:01','2024-06-18 11:02:19',2,NULL,1,106,NULL,108,NULL,NULL,NULL,1),
	(23,'Santana B','1',NULL,'1','SN B',0,0,1,0,0,0,0,12000,13000,NULL,'2024-05-18 14:24:10','2024-05-18 14:24:10',2,NULL,1,106,NULL,108,NULL,NULL,NULL,12),
	(24,'Santana C','1',NULL,'1','SN XZ',0,0,1,0,0,0,2,12000,13000,NULL,'2024-05-18 14:24:52','2024-05-18 14:45:44',2,NULL,1,106,NULL,108,NULL,NULL,NULL,1),
	(1037,'test','1','testjjhkhkh',NULL,'PC01',0,1,1,6,0,0,3,10000,12000,NULL,'2024-06-17 13:28:09','2024-06-18 09:51:01',1,NULL,1,NULL,107,NULL,NULL,NULL,111,0),
	(1038,'HST ( JIHYD )',NULL,'HST SEAT',NULL,'HST-45CC',0,0,1,0,0,0,0,NULL,17750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1039,'OIL SEAL',NULL,'OIL SEAL',NULL,'25*35*6',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1040,'OIL SEAL',NULL,'OIL SEAL',NULL,'25*35*6',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1041,'SHAFT ( PUMP )',NULL,'AS POMPA ATAS',NULL,'WHST40-04B',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1042,'SHAFT ( PUMP )',NULL,'AS POMPA ATAS',NULL,'WHST40-04B',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1043,'POSITIONING SEAT',NULL,'TUTUP SEAL HST NEW',NULL,'WHST45-05X',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1044,'SHAFT MOTOR ( NEW TYPE )',NULL,'AS MOTOR BAWAH',NULL,'WHST40-06X',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1045,'POSITIONING SEAT',NULL,'TUTUP SEAL HST LAMA',NULL,'WHST40-05X',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1046,'PLUNGER ASSEMBLY',NULL,'PISTON HST',NULL,'WHST45-08-07',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1047,'PLUNGER ASSEMBLY',NULL,'PISTON HST',NULL,'WHST45-08-07',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1048,'PLUNGER ASSEMBLY',NULL,'RING PISTON HST',NULL,'WHST45-08-4',0,0,1,0,0,0,0,NULL,745000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1049,'PLUNGER ASSEMBLY',NULL,'RING PISTON HST',NULL,'WHST45-08-4',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1050,'PLUNGER ASSEMBLY',NULL,'BALGUID/ TOPI HST',NULL,'WHST40-08-5B',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1051,'PLUNGER ASSEMBLY',NULL,'BALGUID/ TOPI HST',NULL,'WHST40-08-5B',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1052,'PIN',NULL,'PIN',NULL,'WHST40-08-6',0,0,1,0,0,0,0,NULL,75000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1053,'HOUSING',NULL,'BURENG HST',NULL,'WHST45-08-1',0,0,1,0,0,0,0,NULL,2750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1054,'HOUSING',NULL,'BURENG HST',NULL,'WHST45-08-1',0,0,1,0,0,0,0,NULL,1750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1055,'SPRING SEAT',NULL,'PER BORENG HST',NULL,'WHST40-08-3',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1056,'SPRING ( HOUSING )',NULL,'PER BORENG HST',NULL,'WHST40-08-02',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1057,'ASSIGMENT PLATE ( PUMP )',NULL,'KUNINGAN POMPA (VALVE PUMP)',NULL,'WHST40-03',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1058,'ASSIGMENT PLATE ( PUMP )',NULL,'KUNINGAN POMPA (VALVE PUMP)',NULL,'WHST40-03',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1059,'ASSIGMENT PLATE ( MOTOR )',NULL,'KUNINGAN MOTOR (VALVE MOTOR)',NULL,'WHST40-07G*',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1060,'ASSIGMENT PLATE ( MOTOR )',NULL,'KUNINGAN MOTOR (VALVE MOTOR)',NULL,'WHST40-07G*',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1061,'CHARGE PUMP GEAR ( OUTER )',NULL,'POMPA OLI HST (INNER OUTER)',NULL,'WHST40-13A-02',0,0,1,0,0,0,0,NULL,415000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1062,'GENERATOR GEAR (INNER)',NULL,'POMPA OLI HST ',NULL,'WHST40-13A-03',0,0,1,0,0,0,0,NULL,415000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1063,'RELIEF VALVE ASS\'Y',NULL,'PENTIL OLI HST',NULL,'WHST40-02-9',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1064,'CHECK',NULL,'JARUM PRESURE',NULL,'WHST40-02-2',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1065,'LIMIT PLATE WELD',NULL,'SETELAN RODA SET',NULL,'WD.4FE.27.1',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1066,'LIMIT PLATE',NULL,'SETELAN RODA SET',NULL,'WD.4FE.27-04',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1067,'AIR FILTER',NULL,'FILTER UDARA',NULL,'K35C9',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1068,'HST FILTER',NULL,'FILTER HST',NULL,'W2.5M-05M-18-01-X',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1069,'HST FILTER',NULL,'FILTER HST',NULL,'W2.5M-05M-18-01-X',0,0,1,0,0,0,0,NULL,165000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1070,'OIL PUMP PARTD',NULL,'POMPA OLI MESIN',NULL,'4G33TC-131000B',0,0,1,0,0,0,0,NULL,550000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1071,'SUPERCHARGER',NULL,'TURBO',NULL,'4G33TC-34100022',0,0,1,0,0,0,0,NULL,4500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1072,'SUPERCHARGER',NULL,'TURBO',NULL,'4G33TC-34100022',0,0,1,0,0,0,0,NULL,3100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1073,'ALTERNATOR',NULL,'DINAMO AMPER',NULL,'4G33TC-290000C',0,0,1,0,0,0,0,NULL,2350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1074,'ALTERNATOR',NULL,'DINAMO AMPER',NULL,'4G33TC-290000C',0,0,1,0,0,0,0,NULL,1700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1075,'CAMSHAFT',NULL,'NOKEN AS',NULL,'4G33V16-070001B',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1076,'CRANK SHAFT',NULL,'KROK AS',NULL,'600*185*130',0,0,1,0,0,0,0,NULL,3150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1077,'LEST HOUSING OF GEARBOX',NULL,'BLOK GEARBOX KIRI',NULL,'ZKB85-306-001J',0,0,1,0,0,0,0,NULL,2750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1078,'GEAR',NULL,'GEAR PENERUS HST',NULL,'ZKB85-3072-001',0,0,1,0,0,0,0,NULL,215000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1079,'HEADER GEAR',NULL,NULL,NULL,'ZKB85-3012-002',0,0,1,0,0,0,0,NULL,210000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1080,'HEADER SHAFT',NULL,'AS HEADER',NULL,'ZKB85-301-001',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1081,'SPEED SHIFTING GEAR',NULL,'GIGI RENTENG',NULL,'ZKB85-3012-003',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1082,'SPEED SHIFTING SHAFT',NULL,'AS GIGI 123',NULL,'ZKB85-302-001',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1083,'GEAR I',NULL,NULL,NULL,'ZKB85-302a-002',0,0,1,0,0,0,0,NULL,215000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1084,'GEAR II',NULL,NULL,NULL,'ZKB85-302a-003',0,0,1,0,0,0,0,NULL,190000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1085,'GEAR III',NULL,NULL,NULL,'ZKB85-302A-004',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1086,'STEERING CLUTCH GEAR DAN SHAFT',NULL,NULL,NULL,'ZKB85-203-100',0,0,1,0,0,0,0,NULL,815000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1087,'STEERING GEAR',NULL,'GIGI BELOK',NULL,'ZKB80-303-002,012',0,0,1,0,0,0,0,NULL,475000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1088,'IDLE WHEEL',NULL,NULL,NULL,'ZKB80-304-1-00',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1089,'INNER SHAFT RING',NULL,NULL,NULL,'ZKB80-303-006',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1090,'STEERING SPRING',NULL,NULL,NULL,'ZKB80-009',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1091,'EXTERNAL SHAFT RING',NULL,NULL,NULL,'ZKB80-303-005',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1092,'THRUST COLLAR',NULL,NULL,NULL,'ZKB80-303-007a',0,0,1,0,0,0,0,NULL,115000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1093,'PRESSURE PLATE',NULL,NULL,NULL,'ZKB75-303-009',0,0,1,0,0,0,0,NULL,85000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1094,'INNER FRIECTION SHEET',NULL,'KAMPAS',NULL,'ZKB80-303-004a',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1095,'COLLAR',NULL,NULL,NULL,'ZKB65-305-008',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1096,'DRIVING GEAR',NULL,NULL,NULL,'ZKB80-305A-004',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1097,'SLEEVE',NULL,NULL,NULL,'ZKB65-305-003A',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1098,'锐龙齿轮泵CBN-F312 18*22',NULL,'POMPA HIDROLIK',NULL,'W2.5DD-05DC-09-00E',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1099,'RADIATOR',NULL,NULL,NULL,'W2.5DA-03FK-11-01-00',0,0,1,0,0,0,0,NULL,4800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1100,'DRIVING CHAIN WHEEL',NULL,NULL,NULL,'WD.4MC.2-01C',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1101,'TENSION PULLEY ASSY, WALKING',NULL,'SETELAN VANBELT SET',NULL,'W3.5H-03B-17-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1102,'SUPPORT ROLLER ASSY',NULL,NULL,NULL,'W3.5H-03A-06-00',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1103,'RUBBER TRACK YACHOO',NULL,NULL,NULL,'5509056',0,0,1,0,0,0,0,NULL,12200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1104,'CHAIN IMPURITY AUGER',NULL,'RANTAI BELAKANG',NULL,'W2.5-02-02-11-06',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1105,'RIGHT COVER, HEADER',NULL,NULL,NULL,'W2.0-01-06A-00',0,0,1,0,0,0,0,NULL,470000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1106,'LEFT COVER HEADER',NULL,NULL,NULL,'W2.0-01-03-00',0,0,1,0,0,0,0,NULL,550000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1107,'upper cutter swing lever assy',NULL,'ENGKOL',NULL,'W2.0-01-01-07-01-00',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1108,'grain lifting chain',NULL,NULL,NULL,'W2.5K-02PB-10A-15',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1109,'washer',NULL,'RING PENAHAN GIR HST',NULL,'w2.0-03(R)-03-03A',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1110,'o ring seal',NULL,NULL,NULL,'58x1.8 (GB/T3452.1-92)',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1111,'tension pulley assy',NULL,'HEDLER',NULL,'W5.0-03X-27-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1112,'cylinder header',NULL,'HIDROLIS BAKET BESAR',NULL,'W3.5-05-01-00ML',0,0,1,0,0,0,0,NULL,1450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1113,'cylinder header',NULL,'HIDROLIS BAKET KECIL',NULL,'W3.5-05-02-00M',0,0,1,0,0,0,0,NULL,1200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1114,'割台油封',NULL,NULL,NULL,'W2.5E-05-01-11',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1115,'canopy',NULL,NULL,NULL,'W2.0-13-03A',0,0,1,0,0,0,0,NULL,550000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1116,'SLEVE ASSY, UPPER A',NULL,'SIRIP AYAK SEAT DEPAN',NULL,'W3.5H-02HA-13-01-02-00',0,0,1,0,0,0,0,NULL,575000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1117,'SLEVE ASSY, UPPER B',NULL,'SIRIP AYAK SEAT BELAKANG',NULL,'W3.5H-02HA-13-01-10-00',0,0,1,0,0,0,0,NULL,745000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1118,'CONVEYOR TEETH, LEFT',NULL,'GRAJI PESO PENDEK',NULL,'W2-0-01-01-03G-18',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1119,'CONVEYOR TEETH, RIGHT',NULL,'GRAJI PESO PANJANG',NULL,'W2.5E-01D-01-03-01',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1120,'SWING SHAFT',NULL,'AS PENDEKAN ENGKOL PESO',NULL,'W2.0-01-01-07-01-01',0,0,1,0,0,0,0,NULL,85000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1121,'SLEEVE',NULL,'BAGIAN OSLOK',NULL,'W2.0-01-01-07-01-06',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1122,'DASH COVER',NULL,'BAGIAN OSLOK',NULL,'W2.0-01-01-07-01-04',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1123,'MIDDLE SPACER',NULL,'BAGIAN OSLOK',NULL,'W2.0-01-01-07-01-05',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1124,'SLEEVE',NULL,'BAGIAN OSLOK',NULL,'W2-0-01-01-07-01-07',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1125,'ECCENTRIC CRANK WELD',NULL,'GIR LENGAN GARENG',NULL,'W2.5E-01B-01-07-02-02A-00',0,0,1,0,0,0,0,NULL,310000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1126,'DRIVING WELD BALER',NULL,'V-BOLT AYAK 1986',NULL,'w3.5-16-20-03',0,0,1,0,0,0,0,NULL,330000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1127,'CHAIN BOX ASSY',NULL,'RUMAH RANTAI BELAKANG',NULL,'W2.0-02-11-14-00',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1128,'BEARING SHAFT',NULL,'KUPINGAN AYAK',NULL,'W2.0-02-13-01-03',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1129,'ECCENTRIC WELD',NULL,'BOSING AYAK',NULL,'W2.0-02-13-01-08',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1130,'BEARING SEAT',NULL,NULL,NULL,'W2.5-02B-02-13-02-03',0,0,1,0,0,0,0,NULL,130000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1131,'SLEEVE',NULL,NULL,NULL,'W2.5-02B-02-13-02-08',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1132,'COVER PLATE',NULL,NULL,NULL,'W2.5K-02PB-10A-05',0,0,1,0,0,0,0,NULL,130000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1133,'COVER WELD',NULL,NULL,NULL,'W2.5K-02PB-10A-04-00',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1134,'OIL SEAL',NULL,NULL,NULL,'MC90*60*18',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1135,'BALANCE ROLLER ASSY',NULL,'LOLER BAWAH KECIL',NULL,'W3.5H-03A-07-00',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1136,'COVER',NULL,'TUTUP TAMIA LUAR',NULL,'W2.5DX-03C-06-03-00',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1137,'SLEEVE',NULL,'SELAT BERING 6305',NULL,'W1.8-33-06-02',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1138,'TRACK ROLLER',NULL,'TAMIA KOSONGAN',NULL,'W2.5DX.03C.06.01.00',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1139,'OIL SEAL ASSY',NULL,NULL,NULL,'W1.8-33-06-04-00A',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1140,'SLEEVE',NULL,'SIL TAMIA NEW',NULL,'W2.5DX-03C-06-05-00',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1141,'OUTER COVER',NULL,NULL,NULL,'W2.5DX-03C-06-10',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1142,'SHAFT',NULL,'AS TAMIA',NULL,'WD.4MC-32-06',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1143,'SPECIAL WASHER',NULL,NULL,NULL,'W1.8-33-06-07',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1144,'RETAINING RING',NULL,NULL,NULL,'W1.8-33-06-07',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1145,'BOLT M 12 X 1.5 X 30',NULL,NULL,NULL,'GB/T5786',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1146,'WAHSER 12',NULL,NULL,NULL,'GB/T93',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1147,'OIL CUP M6',NULL,NULL,NULL,'JB\\T7940.1-M6',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1148,'SEAL COVER',NULL,NULL,NULL,'W2.5DX-03C-06-11',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1149,'CHARGE SPRING',NULL,NULL,NULL,'WHST40-02-3',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1150,'Swash plate(p)',NULL,NULL,NULL,'WHST45-11',0,0,1,0,0,0,0,NULL,1250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1151,'SPLINE SLEEVE',NULL,NULL,NULL,'W2.0-03-10-03',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1152,'FLUNGE 19',NULL,NULL,NULL,'W2.5C-03D-10-04',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1153,'FLUNGE 22',NULL,NULL,NULL,'W2.5C-03D-10-04',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1154,'SPLINE SHAFT 19',NULL,NULL,NULL,'W2.5C-03D-10-05',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1155,'SPLINE SHAFT 22',NULL,NULL,NULL,'W2.5DA-03H-10D-05',0,0,1,0,0,0,0,NULL,250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1156,'grain lifting auger',NULL,'ULIR DEPAN BERDIRI',NULL,'W3.5H - 02PD - 10 - 01 - 03 - 00',0,0,1,0,0,0,0,NULL,880000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1157,'GRAIN LIFTING AUGER HOUSING',NULL,'RUMAH ULIR DEPAN',NULL,'W3.5H-02PD-10S-01-02-00',0,0,1,0,0,0,0,NULL,945000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1158,'PLATE I + BOLT',NULL,'TAPAKAN',NULL,'W3.5H-02-11A-02-02',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1159,'PLATE II + BOLT',NULL,'TAPAKAN',NULL,'W3.5H-02-11A-02-03',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1160,'HORIZONTAL AUGER WELD, GRAIN',NULL,'ULIR DEPAN BAWAH',NULL,'W2.5A-02B-02-10-02-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1161,'HOUSING WELD, IMPURITY LIFTING AUGER',NULL,'RUMAH ULOR BELAKANG',NULL,'W3.5H-02HB-11B-01-01-00',0,0,1,0,0,0,0,NULL,1200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1162,'FRICTION FORK ROD',NULL,'GIGI BELOK PENDORONG',NULL,'ZKB85-206-400-1-01',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1163,'SPEED SHIFTING SHAFT',NULL,NULL,NULL,'ZKB65-106-500-1a1',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1164,'GEAR SHIFT FORK',NULL,NULL,NULL,'ZKB60-106-500-01',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1165,'GEAR SHIFTOR SHAFT',NULL,NULL,NULL,'ZKB85-106-500-04',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1166,'PISTON PIN +  SNAP H',NULL,'PEN PISTON ENGINE',NULL,'4G33TC-050004A',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1167,'WATER PUMP',NULL,NULL,NULL,'4G33TC-082000A',0,0,1,0,0,0,0,NULL,780000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1168,'INJECTOR PART',NULL,'NOSE',NULL,'4G33TC-251000',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1169,'INNER SKELETON ROTATING SHAFT LIP SEAL RING',NULL,NULL,NULL,'DL85 X 110 X 12B/P',0,0,1,0,0,0,0,NULL,140000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1170,'INNER SKELETON ROTATING SHAFT LIP SEAL RING',NULL,NULL,NULL,'DR 52 X 72 X 12',0,0,1,0,0,0,0,NULL,110000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1171,'CYLINDER HEAD GASKET',NULL,'PERPAK CINDERKOP',NULL,'4L88-030013D',0,0,1,0,0,0,0,NULL,375000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1172,'GEAR CHAMBER COVER GASKET',NULL,NULL,NULL,'N85T-12003',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1173,'EXHOUST PIPE GASKET',NULL,NULL,NULL,'4L88-020006',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1174,'All Gasket',NULL,'PERPAK ENGINE SET',NULL,'4L88',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1175,'ENGINE FRONT S (GOOD QUALITY)',NULL,'DUDUKAN MESIN',NULL,'W2.0-03-05-01-03-00',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1176,'SHOCK ABSORBING CUSHION',NULL,NULL,NULL,'W2.0-03-05-09-00',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1177,'BEARING',NULL,NULL,NULL,'6206 -2RS',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1178,'BEARING',NULL,NULL,NULL,'6205 - 2RS',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1179,'BEARING',NULL,NULL,NULL,'6204 - 2RS',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1180,'BEARING',NULL,NULL,NULL,'1205 RS',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1181,'BEARING',NULL,NULL,NULL,'6203 RS',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1182,'BEARING',NULL,NULL,NULL,'6210 - 2 RS',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1183,'BEARING',NULL,NULL,NULL,'6307 - 2 RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1184,'BUSH (1620)',NULL,NULL,NULL,'1620',0,0,1,0,0,0,0,NULL,24000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1185,'BEARING',NULL,NULL,NULL,'6308 RS',0,0,1,0,0,0,0,NULL,145000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1186,'BEARING',NULL,NULL,NULL,'6309 RS',0,0,1,0,0,0,0,NULL,195000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1187,'BEARING',NULL,NULL,NULL,'6307  RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1188,'BEARING',NULL,NULL,NULL,'6307 RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1189,'BEARING',NULL,NULL,NULL,'6202 RS',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1190,'BEARING',NULL,NULL,NULL,'6204 RS',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1191,'BEARING',NULL,NULL,NULL,'6005 RS',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1192,'BEARING',NULL,NULL,NULL,'6301 RS',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1193,'BEARING',NULL,NULL,NULL,'6012 2 RS',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1194,'BEARING',NULL,NULL,NULL,'6304 2 RS',0,0,1,0,0,0,0,NULL,55000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1195,'BEARING',NULL,NULL,NULL,'6303 2 RS',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1196,'BEARING',NULL,NULL,NULL,'6302 RS',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1197,'BEARING',NULL,NULL,NULL,'6004 RS',0,0,1,0,0,0,0,NULL,35000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1198,'BEARING',NULL,NULL,NULL,'6210 RS',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1199,'BEARING',NULL,NULL,NULL,'6007 RS',0,0,1,0,0,0,0,NULL,65000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1200,'BEARING',NULL,NULL,NULL,'6306 RS',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1201,'BEARING',NULL,NULL,NULL,'6305 RS',0,0,1,0,0,0,0,NULL,65000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1202,'BEARING',NULL,NULL,NULL,'NJ305E',0,0,1,0,0,0,0,NULL,250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1203,'BEARING',NULL,NULL,NULL,'NJ307E',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1204,'SLEEVE',NULL,NULL,NULL,'ZKB80-304-005',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1205,NULL,NULL,NULL,NULL,'ZKB-303-002',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1206,'C2060-OL',NULL,'SAMBUNGAN RANTAI',NULL,'C2060-OL',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1207,'锐龙滚筒轴轴柄',NULL,NULL,NULL,'W2.5K-02S-02-01-01',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1208,'Grain Horizontal Bearing Seat',NULL,'R. LAKER SCREW DEPAN',NULL,'W2.5P-02-02-10-07',0,0,1,0,0,0,0,NULL,145000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1209,'BEARING SEAT 2ND',NULL,'R. LAKER SCREW BELAKANG',NULL,'W2.5-02-02-11-04',0,0,1,0,0,0,0,NULL,165000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1210,'CoverWeld, Re-threshing',NULL,NULL,NULL,'W2.0-02-11-03-06-00',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1211,'B STARTER MOTOR QDJ1408 ORIGINAL',NULL,'DINAMO STATER',NULL,'4G33-300000C',0,0,1,0,0,0,0,NULL,2350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1212,'SPRING PIN',NULL,'KANCING SETELAN RODA',NULL,'W2.5DA-03H-27-10',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1213,'Friction Plate',NULL,'KANCING SETELAN RODA',NULL,'W2. 0-01-01-03G-06',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1214,'FRICTION PLATE',NULL,'BANTALAN PESO',NULL,'W2.0-01-01-03G-08',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1215,'Press Plate',NULL,'BANTALAN PESO',NULL,'W2.0-01-01-03G-09',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1216,'Bolt M10*35',NULL,'BAUT JALU',NULL,'GB/T12-88',0,0,1,0,0,0,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1217,'Bolt M10×30',NULL,'BAUT JALU',NULL,'GB/T12-88',0,0,1,0,0,0,0,NULL,7500,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1218,'PLATE,ADJUST',NULL,'BANTALAN PESO',NULL,'W2.0-01-01-03G-07',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1219,'B FAN φ490 ORIGINAL',NULL,'KIPAS RADIATOR',NULL,'CZ4102Q-080020B',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1220,'Gear',NULL,NULL,NULL,'ZKB85-307-001',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1221,'SIEVE PLATE 1',NULL,'SIRIP AYAK BIJIAN',NULL,'W2.5-02-02-13-01-02-02-00',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1222,'Sieve Plate (2)',NULL,'SIRIP AYAK SETELAN',NULL,'W2.5-02-02-13-01-02-04-00',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1223,'Belt Pulley',NULL,'PULLY SAMBUNG V-BELT AYAK',NULL,'W3.5H-02HA-12-02',0,0,1,0,0,0,0,NULL,225000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1224,'V belt',NULL,'V-BELT RADIATOR',NULL,'AV19*-13*1150(5W)',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1225,'Collar',NULL,NULL,NULL,'ZKB60-302-005',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1226,'BUSH',NULL,'HST',NULL,'W9501-53201',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1227,'bearing',NULL,NULL,NULL,'5211',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1228,'Conveyor Chain Assy',NULL,'CONVEYOR SET',NULL,'W3.5H-01-02-09B-00',0,0,1,0,0,0,0,NULL,2350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1229,'Dust cover',NULL,'KARET TUTUP RANTAI BELAKANG',NULL,'W2.0-02-11-15',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1230,'COVER BEVEL',NULL,'TUTUP RANTAI BELAKANG',NULL,'W2.0-02-11-13',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1231,'CLOTH',NULL,'KARPET',NULL,'1mm*150mm*20m',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1232,'CLOTH',NULL,'KARPET',NULL,'2mm*150mm*20m',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1233,'HEX, BOLT/ (10 PCS)',NULL,'BAUT 10M',NULL,'GB/T5783-86',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1234,'OIL SEAL(HST)',NULL,NULL,NULL,'25*35*6',0,0,1,0,0,0,0,NULL,120000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1235,'OIL SEAL(HST)',NULL,NULL,NULL,'25*35*6',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1236,'OIL SEAL',NULL,'SIL TAMIA ',NULL,'W1.8L-03-06-04-00',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1237,'SEAL,OIL',NULL,'SIL GERBOX DALAM (55x75x8)',NULL,'GB13871-92',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1238,'BEARING',NULL,'BERING BAMBU HST',NULL,'25*33*30',0,0,1,0,0,0,0,NULL,145000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1239,'BEARING',NULL,'BERING BAMBU HST',NULL,'25*33*30',0,0,1,0,0,0,0,NULL,75000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1240,'BELT',NULL,'V-BELT KERJA 45B 1490',NULL,'4SB1490',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1241,'B BELT TINE RIGHT HAND',NULL,'V-BELT ULIR 3259',NULL,'HC3259LW',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1242,'BELT',NULL,'V-BELT SISIR 2700',NULL,'W2.5E-01XCP-01-18',0,0,1,0,0,0,0,NULL,545000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1243,'Bearing (NSK)',NULL,NULL,NULL,'6310 RS',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1244,'2 nd cylinder high pressure fuel pipe',NULL,'PIPA NOZEL/ SELANG CACING',NULL,'4G33140000',0,0,1,0,0,0,0,NULL,385000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1245,'SUPER CHARGER',NULL,'TURBO',NULL,'4G33TC-341000ZZ',0,0,1,0,0,0,0,NULL,3250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1246,'STARTER ASSEMBLY (NEW TYPE)',NULL,'DINAMO STATER',NULL,'4G33-300000C',0,0,1,0,0,0,0,NULL,1750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1247,'FUEL INJECTION PUMP',NULL,'BOSPUM',NULL,'4G33TC-181000Z',0,0,1,0,0,0,0,NULL,4000000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1248,'ROD WELD',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5DA-03H-17A-06-00',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1249,'NYLON SLEEVE',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5DA-03H-17B-10',0,0,1,0,0,0,0,NULL,10000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1250,'SPRING',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5DA-03H-17A-05A',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1251,'BALL SEAT',NULL,'STELAN V-BELT JALAN (195)',NULL,'W2.5-03-10-03',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1252,'EXTERNAL FRICKCITON SHEET',NULL,'SELAT KAMPAS BELOK',NULL,'ZKB75-303-003',0,0,1,0,0,0,0,NULL,70000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1253,'BELT PULLEY',NULL,'PULLY JALAN',NULL,'W2.5C-03D-10-06',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1254,'SPLINE SHAFT (21,4CM)',NULL,'AS PULLEY JALAN',NULL,'w2.5da-03h-10d-05',0,0,1,0,0,0,0,NULL,250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1255,'SPLINE SHAFT (19.5 CM)',NULL,'AS PULLEY JALAN ',NULL,'W2.5C-03D-10-05',0,0,1,0,0,0,0,NULL,230000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1256,'BELT PULLY VIBRATING SLEEVE',NULL,'V-BELT AYAK',NULL,'W2.5K-02HB-13-02-07-00',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1257,'Belt Pulley, Grain Auger',NULL,'PULLEY ULIR DEPAN',NULL,'W2.5K-02HB-10-06',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1258,'OIL SEAL',NULL,NULL,NULL,'MC60*90*18',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1259,'SLEEVE',NULL,NULL,NULL,'ZKB80-305-003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1260,'OIL SEAL',NULL,NULL,NULL,'FB55*75*8',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1261,'PULLEY',NULL,'PULLY BLOER',NULL,'W2.5C-02-02-05-06A',0,0,1,0,0,0,0,NULL,900000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1262,'BELT PULLY IMPURITY',NULL,'PULLY ULIR BELAKANG',NULL,'W2.5K-02HB-11-05',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1263,'SEAT TELESCOPIC TEETH',NULL,NULL,NULL,'W2.0-01-01-02-07-01',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1264,'GUIDE SLEEVE TELESCOPIC TEETH',NULL,'MATA YUYU',NULL,'W2.0-01-01-02A-11',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1265,'NYLON SEAT',NULL,'BANTALAN SISIR',NULL,'W2.0B-01B-01-05Q-13',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1266,'RIGHT SHAFT (GEARBOX 85)',NULL,'AS PIKUL KANAN',NULL,'ZKB80-305-002',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1267,'SEAL,OIL42*20*8',NULL,'SIL PELATUK BELOK',NULL,'FB20*8',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1268,'PAPER PAD',NULL,'PERPAK HST',NULL,'WHST40-16A',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1269,'ROD, TELESCOPIC, TEETH',NULL,NULL,NULL,'W2.0-01-01-02A-07-02',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1270,'BEVEL GEAR 1ST',NULL,NULL,NULL,'L1.8A-03-04-03-05',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1271,'SPRING',NULL,NULL,NULL,'W2.5-02-02-10-08A',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1272,'TENSION CHAIN WHEEL',NULL,NULL,NULL,'L1.8A-03-02-04-00',0,0,1,0,0,0,0,NULL,175000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1273,'Housing Plate ',NULL,NULL,NULL,'ZKB85-306-003',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1274,'CHAIN WHEEL 17',NULL,NULL,NULL,'L1.8A-03-02-01-04A',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1275,'Chain Wheel (15)',NULL,NULL,NULL,'L1.8A-03-02-03-01',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1276,'CHAIN WHEEL II',NULL,NULL,NULL,'W2.0-02-11-10',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1277,'CHAIN WHEEL',NULL,NULL,NULL,'W2.0.02-11-07',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1278,'BEVEL GEAR',NULL,NULL,NULL,'W2.5-02G-02-10-01-04',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1279,'Tension Pulley',NULL,'PULLY KLETEK JALAN',NULL,'W2.5K-02SA-09A-01A-00',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1280,'DIST COVER',NULL,NULL,NULL,'W2.0-01-01-07-01-04',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1281,'NUT M12',NULL,NULL,NULL,'6B6173-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1282,'SPACER SKAT BEARING HEADER',NULL,NULL,NULL,'L18X.4.27-03',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1283,'COLLAR',NULL,NULL,NULL,'L18X.4.29-02',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1284,'FOG light',NULL,'LAMPU',NULL,'WD-150-07-03-03B',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1285,'NUT M12',NULL,NULL,NULL,'GBT6170-M12-8-A3L',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1286,'INLET ASSY LEFT',NULL,NULL,NULL,'W2.5-02G-01-05-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1287,'INLET ASSY RIGHT',NULL,NULL,NULL,'w2.5-02g-01-03-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1288,'HOUSING PLATE',NULL,NULL,NULL,'ZKB65-306-003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1289,'BEARING',NULL,NULL,NULL,'6310 2RS',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1290,'Shaft, Tension Pulley',NULL,NULL,NULL,'W2.5DA-B3B-27-08',0,0,1,0,0,0,0,NULL,115000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1291,'Bar, Blade Fixed',NULL,'SIKU PESO 110',NULL,'W3.5D-01D-01-03-02',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1292,'BAR-BLADE-FIXED',NULL,'SIKU PESO 102',NULL,'W2.0B-01B-01-03G-02',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1293,'CUTTER BAR ASSY',NULL,'PESO SET 110',NULL,'W3.5D-01D-01-03-03-00',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1294,'SUPPORT ARM ASSY',NULL,'TUTUP GULUNGAN CONVEYOR',NULL,'W2.5E-01B-02-02-01-00',0,0,1,0,0,0,0,NULL,175000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1295,'FEATHER KEY',NULL,NULL,NULL,'A8X45',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1296,'FEATHER KEY',NULL,NULL,NULL,'A8X50',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1297,'FEATHER KEY',NULL,NULL,NULL,'A10X32',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1298,'KEY',NULL,NULL,NULL,'A10X56',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1299,'FEATHER KEY',NULL,NULL,NULL,'A12X40',0,0,1,0,0,0,0,NULL,30000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1300,'FEATHER KEY',NULL,NULL,NULL,'C6X25',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1301,'FEATHER KEY',NULL,NULL,NULL,'PJC825',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1302,'FEATHER KEY',NULL,NULL,NULL,'C8X28',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1303,'FEATHER KEY',NULL,NULL,NULL,'C8X30',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1304,'FEATHER KEY',NULL,NULL,NULL,'C8X23',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1305,'FEATHER KEY',NULL,NULL,NULL,'KEYC8X36',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1306,'FEATHER KEY',NULL,NULL,NULL,'C8X40',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1307,'KEY',NULL,NULL,NULL,'A5X25',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1308,'KEY',NULL,NULL,NULL,'Key A5x28',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1309,'KEY',NULL,NULL,NULL,'A6X22',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1310,'KEY',NULL,NULL,NULL,'A7X30',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1311,'FEATHER KEY',NULL,NULL,NULL,'A8X20',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1312,'KEY',NULL,NULL,NULL,'A8X25',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1313,'FEATHER KEY',NULL,NULL,NULL,'A8X28',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1314,'KEY',NULL,NULL,NULL,'A8X32',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1315,'REEL SPRING TEETH (LEFT-HANDED',NULL,'TAKUR',NULL,'W2.5E-01M-01-05-06-02',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1316,'FILTER ASSY (16)',NULL,NULL,NULL,'W2.5K-02HX-13-01-40A-00',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1317,'Bearing',NULL,'STIK',NULL,'JB/T5306-2007SQ10C-RS',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1318,'BEARING PHSA10',NULL,NULL,NULL,'W2.5DA-07E-04-21R',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1319,'BEARING PHSA11',NULL,NULL,NULL,'W2.5DA-07E-04-21L',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1320,'COMBINATION INSTRUMENT',NULL,NULL,NULL,'W2.5DA-06X-G2-2A',0,0,1,0,0,0,0,NULL,1200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1321,'COMBINATION SWITCH',NULL,NULL,NULL,'W2.5C-06-01-20-00G*',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1322,'Center Control Box (12V)',NULL,NULL,NULL,'W2.5C-06-01-19-00',0,0,1,0,0,0,0,NULL,1050000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1323,'STARTING CABLE ASSY',NULL,'KUNCI KONTAK',NULL,'JK430',0,0,1,0,0,0,0,NULL,295000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1324,'THROTTLE WIRE',NULL,NULL,NULL,'W2.5-07-08-05-00',0,0,1,0,0,0,0,NULL,105000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1325,'FLAMEOUT WIRE',NULL,NULL,NULL,'W2.0-07-02-08-00',0,0,1,0,0,0,0,NULL,115000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1326,'REVERSE WIRE',NULL,NULL,NULL,'W2.5-07-05-04-00',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1327,'MAINPOWER SWEET',NULL,NULL,NULL,'JK861',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1328,'STARING SILINDER',NULL,NULL,NULL,'W2.0-05-33-01',0,0,1,0,0,0,0,NULL,1300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1329,'PREHEAT STARTING RELAY (12V)',NULL,NULL,NULL,'JD155Relay(12V)',0,0,1,0,0,0,0,NULL,245000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1330,'Shaft(motor)',NULL,'OLD HST',NULL,'WHST40-06B',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1331,'Main Clutch Tension Pulley',NULL,NULL,NULL,'W2.5C-02-02-22C-01',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1332,'Guide Rail Weld, Rear',NULL,'KAPALAN',NULL,'WD.4FE.33',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1333,'Cover S-Roller Nipple Attached',NULL,NULL,NULL,'W2.5DX-03C-06-03-00',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1334,'Press Cover, Outside S-ROLLER',NULL,NULL,NULL,'W2.5DX-03C-06-10',0,0,1,0,0,0,0,NULL,15000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1335,'Shoe Plate',NULL,'HST',NULL,'WHST40-09',0,0,1,0,0,0,0,NULL,435000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1336,'Pin Shaft',NULL,NULL,NULL,'W2.0-01-01-07-01-09',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1337,'SWING SHAFT CUTT.',NULL,'MANDREL',NULL,'W2.0-01-01-07-01-03',0,0,1,0,0,0,0,NULL,60000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1338,'Oil filter (4L88-261100)',NULL,'FILTER OLI',NULL,'4L88-261000A',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1339,'Oil Seal Assy',NULL,'SIL MIDLER',NULL,'W2.5DA-03H-27-06-00B',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1340,'Shaft, Tension Pulley',NULL,NULL,NULL,'W2.5DA-033-27-08',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1341,'Tension Frame Weld (New Model)',NULL,'SAPIT URANG',NULL,'W5.0-03X-27-02-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1342,'FILTER',NULL,NULL,NULL,'W2.5M-05M-18-01-X',0,0,1,0,0,0,0,NULL,160000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1343,'SELF MOTOR',NULL,NULL,NULL,'4G33TC-290000C',0,0,1,0,0,0,0,NULL,1750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1344,'BEVEL GEAR BOX',NULL,NULL,NULL,'L1.8A-03-02-03-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1345,'Gearbox Assy , Impurity',NULL,NULL,NULL,'W2.5-02-02-11-01-09-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1346,'HST ASSY  JD',NULL,NULL,NULL,'HST-45CC',0,0,1,0,0,0,0,NULL,17800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1347,'Roller Assy, Support',NULL,'TAMIA SET BESAR',NULL,'W3.5H-03A-06-00',0,0,1,0,0,0,0,NULL,875000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1348,'DIESEL FILTER',NULL,NULL,NULL,'N485-28100',0,0,1,0,0,0,0,NULL,40000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1349,'Upper Shaft',NULL,NULL,NULL,'W2.5E-01B-02-05Y',0,0,1,0,0,0,0,NULL,700000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1350,'Frame Weld, Fan',NULL,NULL,NULL,'W2.5-02B-02-05-07-00',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1351,'Square Four-way Welding',NULL,NULL,NULL,'W2.5K-02PB-10A-01-01-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1352,'IDLE SHAFT',NULL,NULL,NULL,'ZKB80-304-001',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1353,'Bearing Assy',NULL,NULL,NULL,'W2.5-02B-02-05-03-00',0,0,1,0,0,0,0,NULL,265000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1354,'Sieve Assy, Upper A  Old Model',NULL,'AYAK DEPAN SET',NULL,'W3.5H-02HA-13-01-02-00',0,0,1,0,0,0,0,NULL,575000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1355,'UPPER, SIEVE ASSY B',NULL,'AYAK BELAKANG SET',NULL,'W3.5H-02HA-13-01-10-00',0,0,1,0,0,0,0,NULL,745000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1356,'FILTER',NULL,'FILTER HST KECIL ATAS',NULL,'W2.5DD-05DB-01-03A',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1357,'Shaft',NULL,'ASS AYAK',NULL,'W2.5-02B-02-13-02-01',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1358,'Fan Shaft',NULL,'ASS BLOWER KIPAS',NULL,'W2.5P-02-02-05-01',0,0,1,0,0,0,0,NULL,675000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1359,'Balance Roller Weld',NULL,'TAMIA KECIL',NULL,'W1.8-33-07-01-00',0,0,1,0,0,0,0,NULL,190000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1360,'Press Plate (II)',NULL,NULL,NULL,'W3.5H-03A-28-01-00',0,0,1,0,0,0,0,NULL,190000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1361,'Oil Seal 40 x 90 x 10',NULL,'GEAR BOX ATAS',NULL,'W2.5-02A-01-17-11',0,0,1,0,0,0,0,NULL,55000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1362,'SEAL,OIL 45 x 68 x 10',NULL,'GEAR BOX ATAS',NULL,'W2.5-02S-01-17-14',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1363,'SEAL,OIL 35 x 80 x 10',NULL,'GEAR BOX ATAS',NULL,'W2.5-02S-01-17-15',0,0,1,0,0,0,0,NULL,50000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1364,'SEAL, OIL42 x 20 x 8',NULL,NULL,NULL,'GB/T13871-92',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1365,'FILTER',NULL,NULL,NULL,'W2.5DD-05DB-01-03A ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1366,'SUPPORT FRONT INTERNAL ENGINE',NULL,NULL,NULL,'W2.5DA-03YC-05-04-00',0,0,1,0,0,0,0,NULL,450000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1367,'Washer',NULL,NULL,NULL,'W1.8-33-06-07',0,0,1,0,0,0,0,NULL,5000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1368,'Conveyor Chain Assy',NULL,NULL,NULL,'W3.5H-01-02-09-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1369,'Passive Shaft',NULL,NULL,NULL,'W2.5-02S-01-17-09',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1370,'REEL BELT C 2700',NULL,NULL,NULL,'W2.5E-01XCP-01-04-08-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1371,'CUTTER BAR ASSY, BLADE FIXED 29.5',NULL,'PISAU SET',NULL,'W 2.5E - 01- 01 - 03 - 03 - 00A',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1372,'Blade guide B (WDZ) GOOD QUALITY',NULL,'KUKU MACAN',NULL,'W2.0-01-01-03G-04',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1373,'Blade',NULL,'PISAU BIJIAN',NULL,'W2.0-01-01-03G-03.05',0,0,1,0,0,0,0,NULL,20000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1374,'BEARING',NULL,'TIEROD',NULL,'W2.0-01-01-07-05-00',0,0,1,0,0,0,0,NULL,180000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1375,'Rotary Axis',NULL,NULL,NULL,'W 2.5 E - 01B - 01 - 04 -08A - 08',0,0,1,0,0,0,0,NULL,95000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1376,'Upper Connecting Rod Weld',NULL,'TANGAN GARENG',NULL,'W 2.0 - 01 - 01 - 07 - 06 - 06',0,0,1,0,0,0,0,NULL,325000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1377,'UPPER CUTTER SWING LEVER',NULL,'ENGKOL PISAU KOSONGAN',NULL,'W2.0-01-01-07-01-02',0,0,1,0,0,0,0,NULL,135000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1378,'BELT CONVEYOR ( B3201 / 3175 )',NULL,'V-BELT GULU',NULL,'W3.5H-01-02-11A  ',0,0,1,0,0,0,0,NULL,525000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1379,'CONVEYOR CHAIN',NULL,'RANTAI KONVEYOR',NULL,'W3.5-01A-02-09-01',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1380,'Belt Pulley, Upper Shaft',NULL,'PULLEY ATAS SET',NULL,'W 2.5E . 01B . 02 . 32',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1381,'Driving Hub, Left',NULL,'PULLEY ATAS SET',NULL,'W 2.5E . 01B . 02 . 38X',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1382,'HEADER DRIVING PULLY 3020 BELT',NULL,'PULLEY ATAS SET',NULL,'W 2.5E - 01B - 02 - 07B',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1383,'DRIVING WHEEL, RIGHT',NULL,NULL,NULL,'W2.5DA-01-02-04-00',0,0,1,0,0,0,0,NULL,295000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1384,'Chain Wheel, Conveyor',NULL,NULL,NULL,'W2.5E-01B-02-04Y',0,0,1,0,0,0,0,NULL,315000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1385,'SHAFT SLEEVE',NULL,'BUSING UPPERSHAFT',NULL,'W2.5E-01B-02-40',0,0,1,0,0,0,0,NULL,200000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1386,'SPRING',NULL,NULL,NULL,'W2.0-01-02-05-01',0,0,1,0,0,0,0,NULL,45000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1387,'HANGING PLATE',NULL,'PALANGAN KONVEYOR',NULL,'W2.5E-01B-02Y-09-03',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1388,'PASSIVE WHEEL SHAFT',NULL,'ASS KONVEYOR BAWAH',NULL,'W2.5E-01B-02-02-02',0,0,1,0,0,0,0,NULL,300000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1389,'PASSIVE WHEEL',NULL,'GULUNGAN BAWAH',NULL,'W2.5E-01B-02-02-03-00',0,0,1,0,0,0,0,NULL,1050000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1390,'Thresher cylinder assy',NULL,'TLESER SET',NULL,'W2.5K-02S-02-00',0,0,1,0,0,0,0,NULL,8250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1391,'Concave Grid Assy, Rear',NULL,NULL,NULL,'W2.5-02G-01-06A-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1392,'Concave Grid Weld, Front',NULL,NULL,NULL,'W2.5-02G-01-04A-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1393,'Feeding Auger',NULL,NULL,NULL,'W2.5K-02S-02-02-00B-00',0,0,1,0,0,0,0,NULL,3000000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1394,'Rack Weld B',NULL,'GEBUKAN RAPAT',NULL,'W 2.5 K - 02S - 02 - 04 - 00B',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1395,'Rack Weld A',NULL,'GEBUKAN RENGGANG',NULL,'W2.5K-025-02-03-00A',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1396,'Shaft Weld',NULL,NULL,NULL,'W 2.5 K - 02S - 02 - 01 - 00A',0,0,1,0,0,0,0,NULL,3250000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1397,'BEARING BLOCK, REAR',NULL,NULL,NULL,'W2.5-02-01-02-12',0,0,1,0,0,0,0,NULL,275000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1398,'VIBRATING SCREEN ASSY',NULL,'AYAK SET',NULL,'W3.5H-02HA-13-01-00',0,0,1,0,0,0,0,NULL,8000000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1399,'BELT PULLEY VIBRATING SLEVE',NULL,'PELLEY AYAK',NULL,'W2.5K-02HB-13-02-07-00',0,0,1,0,0,0,0,NULL,400000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1400,'GUIDE PLATE ( SHAKE SCREEN )',NULL,'R. LAKER AYAK DEPAN',NULL,'W2.5-02-02-02G*',0,0,1,0,0,0,0,NULL,125000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1401,'FRAME WELD, FAN',NULL,'PEREMPATAN RUMAH KIPAS',NULL,'W2.5-02B-02-05-07-00 G*',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1402,'BLADE FAN',NULL,'TIPUS',NULL,'W2.5K-02HX-05-08',0,0,1,0,0,0,0,NULL,90000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1403,'HORIZONTAL AUGER ASSY',NULL,'SCREW BELAKANG TIDUR',NULL,'W3.5H-02-11A-02-00',0,0,1,0,0,0,0,NULL,720000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1404,'BELT PULLEY, IMPURITY',NULL,'PULLEY SCREW BELAKANG',NULL,'W2.5K-02HB-11-05',0,0,1,0,0,0,0,NULL,350000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1405,'AUGER WELD, IMPURITY',NULL,'SCREW BELEKANG BERDIRI',NULL,'W3.5H-02-11-01-07-00',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1406,'HOUSING WELD, RETHRESHING',NULL,'KEONG SET',NULL,'W3.5H-02HB-11-03-01-00',0,0,1,0,0,0,0,NULL,650000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1407,'INNER PLATE, RETHRESHING',NULL,'KEONG SET',NULL,'W3.5H-02HB-11-03-03',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1408,'Cover Weld, Observe',NULL,'KEONG SET',NULL,'W 3.5 H - 02HB - 11 - 03 - 02 - 00',0,0,1,0,0,0,0,NULL,150000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1409,'HORIZONTAL AUGER ASSY, IMPURITY',NULL,'SCREW BELAKANG',NULL,'W3.5H-02-11-02-01-00',0,0,1,0,0,0,0,NULL,750000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1410,'GEARBOX ASSY',NULL,NULL,NULL,'L1.8A-03-02-03-00',0,0,1,0,0,0,0,NULL,600000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1411,'TENSION CHAIN WHEEL',NULL,NULL,NULL,'L1.8A-03-02-04-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1412,'BEVEL GEAR',NULL,NULL,NULL,'L1.8A-03-04-03-05',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1413,'SHAFT CHAIM WHEEL',NULL,NULL,NULL,'L1.8A-03-04-03-03',0,0,1,0,0,0,0,NULL,100000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1414,'MAIN CLUCTH TENSION ASSY',NULL,NULL,NULL,'W2.5C-02-02-22C-00',0,0,1,0,0,0,0,NULL,850000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1415,'MAIN CLUCTH TENSION WHEEL',NULL,NULL,NULL,'W2.5C-02-02-22C-01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1416,'SQUARE FOUR - WAY WELD',NULL,NULL,NULL,'W2.5K-02PB-10A-01-01-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1417,'BELT',NULL,NULL,NULL,'W 2.5 L - 02 - 02 - 05 - 10A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1418,'FAN GEARBOX BELT ( C2G68 ) V',NULL,'2SB 1490',NULL,'W3.5-02-36',0,0,1,0,0,0,0,NULL,430000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1419,'BELT',NULL,NULL,NULL,'W 2.5K - 02MB - 36',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1420,'BELT',NULL,'V-BELT BALIK',NULL,'W2.5-02S-01-38',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1421,'BELT',NULL,'2508',NULL,'W 2.5-023-01A-37',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1422,'JOINT BELT WALKING ( 9J - 5 - 1605 )',NULL,'V-BELT JALAN',NULL,'W2.5DA-03H-31',0,0,1,0,0,0,0,NULL,800000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1423,'HST ASSY  JD',NULL,NULL,NULL,'W2.0-03(R)-03-01-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1424,'POSITIONING SEAT',NULL,NULL,NULL,'WHST 45-05',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1425,'POSITIONING SEAT',NULL,NULL,NULL,'W HST 40 - 05 X',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1426,'PLUG_PF1/2',NULL,NULL,NULL,'WHST40-08-3',0,0,1,0,0,0,0,NULL,80000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1427,'O RING',NULL,NULL,NULL,'69*2.65',0,0,1,0,0,0,0,NULL,25000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1428,'SWASH PLATE',NULL,NULL,NULL,'WHST40-10',0,0,1,0,0,0,0,NULL,500000,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1429,'DIESEL OIL FILTER',NULL,NULL,NULL,'4G33TC-281000W',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1430,'DIESEL OIL PRE - FILTER',NULL,NULL,NULL,'4G33TC-281000V',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1431,'DIESEL FILTER ASSEMBLY',NULL,NULL,NULL,'N485-28000',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1432,'DIESEL OIL PRE - FILTER ASSY ( ELECTRON PUMP )',NULL,NULL,NULL,'4G33TC-280000W',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1433,'GUIDE RAIL WELD, FRONT',NULL,NULL,NULL,'W2.5D-03-32-00 ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1434,'TENSION WHEEL',NULL,NULL,NULL,'WD.4MC.27.01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1435,'ADJUSTING SCREW',NULL,NULL,NULL,'WD.4FE.27-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1436,'COVER',NULL,NULL,NULL,'L18X.4.29-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1437,'OIL SEAL COMBINATION',NULL,NULL,NULL,'W2.5DA-03H-27-06-00B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1438,'BALANCE ROLLER ASSY',NULL,NULL,NULL,' #C70SH-46L',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1439,'OIL PUMP PARTD',NULL,NULL,NULL,'4G33TC-131000BG*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1440,'TURBO CHARGER ASSY',NULL,NULL,NULL,'4G33TC - 341000ZZ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1441,'B CONNECTING ROD ORIGINAL',NULL,NULL,NULL,'4G33TC-05 2001B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1442,'PISTON',NULL,NULL,NULL,'4G33TC-050001AG*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1443,'Ring Piston',NULL,NULL,NULL,'4G33TC-PISTON RING KIT',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1444,'CILINDER LINER',NULL,NULL,NULL,'4G33TC-030003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1445,'B BEARING CONNECTING ROD ORIGINAL',NULL,NULL,NULL,'4G33TC-050005',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1446,'TTHRUSTPIECEUP',NULL,NULL,NULL,'4B 28V16 - 030010 & 4B28V16 - 030009',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1447,'B BEARING MAIN LOWER ORIGINAL',NULL,NULL,NULL,'4L68 - 030006 & 4L68 - 030008',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1448,'RIGHT HOUSING OF GEARBOX',NULL,NULL,NULL,'ZKB85-306-002J',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1449,'RIGHT ROCK ASSY',NULL,NULL,NULL,'ZKB40 - 206A - 401 - 2 - 00S',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1450,'LEFT ROCK ASSY',NULL,NULL,NULL,'ZKB40 - 206A - 401 - 1 - 00S',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1451,'Header Gear',NULL,NULL,NULL,'ZKB85-301-002',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1452,'VARIABLE SPEED GEAR',NULL,NULL,NULL,'ZKB85 - 301 - 003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1453,'GEAR 3',NULL,NULL,NULL,'ZKB85- 302-004',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1454,'EXTERNAL SHAFT RING',NULL,NULL,NULL,'ZKB80-303-005G*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1455,'Clasp',NULL,NULL,NULL,'ZKB85 - 303 - 010A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1456,'PRESSURE PLATE',NULL,NULL,NULL,'ZKB75-303-009G*',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1457,'EXTERNAL FRICTION SHEET',NULL,NULL,NULL,'ZKB75-303-303',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1458,'BRAKE BOX BASKET',NULL,NULL,NULL,'ZKB65-306-010-003',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1459,'Brake Box Gasket',NULL,NULL,NULL,'ZKB65 - 12 - 01L',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1460,'HALF SHAFT RIGHT ARM',NULL,NULL,NULL,'ZKB65a-W3.5H-205-600B1G1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1461,'HALF SHAFT LEFT ARM',NULL,NULL,NULL,'ZKB65A - W3 . 5H . 205 - 500BG',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1462,'LEFT SHAFT GB 637MM ARM',NULL,NULL,NULL,'ZKB65A - W3 . 5H . 305 - 002',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1463,'GASKET OF HALF OF SHAFT',NULL,NULL,NULL,'ZKB65-12-14LK',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1464,'Left Shaft',NULL,NULL,NULL,'ZKB65-305-001',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1465,'MULTIFUNCTIONAL SLIDE VALVE',NULL,NULL,NULL,'W2.5DD-05DC-17-01C',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1466,'INVOLUTE GEAR PUMP',NULL,NULL,NULL,'W2.5DD-05DC-09-00E ',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1467,'S PLINE SHAFT',NULL,NULL,NULL,'WD.4M.10-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1468,'SUPPORT ROLLER ASSY',NULL,NULL,NULL,'W5.0-03X-28-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1469,'BOSS PUMP',NULL,NULL,NULL,'4G33TC181000Z',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1470,'INVLOUTE GEAR',NULL,NULL,NULL,'W2.DD-05C-09-00E',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1471,'HEADER DRIVING PULLY',NULL,NULL,NULL,'W2.5E-01B-02-07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1472,'DRIVING HUB, LEFT',NULL,NULL,NULL,'W2.5E-01B-02-38X',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1473,'DIESEL OIL PRE FILTER',NULL,NULL,NULL,'4G33TC-281000 V',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1474,'B CONNECTING ROD ORIGINAL',NULL,NULL,NULL,'4G33TC-052001A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1475,'CONNECTION ROD BEARING KIT',NULL,NULL,NULL,'5G33TC-053000',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1476,'CONCAVEGRID',NULL,NULL,NULL,'W2.5E-0B-02-032',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1477,'CONCAVE GRID FRONT',NULL,NULL,NULL,'W2.5E-01B-02-07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1478,'BELT, ACTIVE TRANSMISSION, FAN',NULL,NULL,NULL,'W2.5C-02-02-05-10A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1479,'HUB',NULL,NULL,NULL,'W2.5K-02HB-05-15',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1480,'BELT PULLEY',NULL,NULL,NULL,'W2.5-02B-02-05-16',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1481,'ASSIGMENT PLATE ( MOTOR )',NULL,NULL,NULL,'W HST 40 - 07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1482,'COVER',NULL,NULL,NULL,'W2.5DX - 30C -06 - 03 - 00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1483,'TRACK ROLLER',NULL,NULL,NULL,'W2.5DX - 03C - 06 - 01 - 00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1484,'HORIZONTAL AUGER WELD, GRAIN',NULL,NULL,NULL,'W2.5A - 02B - 02 - 10 - 02 -00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1485,'HOUSING WELD, IMPURITY LIFTING AUGER',NULL,NULL,NULL,'W3.5H - 02HB - 11B - 01 - 01 - 00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1486,'FRICTION FORK ROD',NULL,NULL,NULL,'ZKB85 - 206 - 400 - 1 - 01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1487,'GEAR SHIFT FORK',NULL,NULL,NULL,'ZKB60 - 106 - 500 - 01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1488,'GEAR SHIFTOR SHAFT',NULL,NULL,NULL,'ZKB85 - 106 - 500 - 04',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1489,'INJECTOR PART',NULL,NULL,NULL,'4G3TC - 251000',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1490,'FRICTION PLATE',NULL,NULL,NULL,'W2.0-01-01-03G-06',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1491,'BOTTOM PLATE, IMPURITY',NULL,NULL,NULL,'W2.5-02-02-07',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1492,'SPONGE, SEAL',NULL,NULL,NULL,'W2.5-02-02-32',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1493,'BOTTOM PLATE WELD',NULL,NULL,NULL,'W2.5K-02PC-06-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1494,'SPIDER WELD, FRONT',NULL,NULL,NULL,'W2.5-02-01-02-05-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1495,'RETAINING RING FOR SHAFT 50',NULL,NULL,NULL,'GB/T894. 1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1496,'SPIDER WELD, REAR',NULL,NULL,NULL,'W2.5-02-01-02-06-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1497,'RETAINING RING FOR HOLE 80',NULL,NULL,NULL,'GB/T893.1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1498,'SPIRAL PLATE',NULL,NULL,NULL,'W2.5K-02S-02-02-08B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1499,'TENSION BOLT',NULL,NULL,NULL,'W2.5K-02S-09-01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1500,'CIRCLIP FOR HOLE 47',NULL,NULL,NULL,'GB/T893.1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1501,'TENSION ARMASSY',NULL,NULL,NULL,'W2.5-02B-01G-17-18-02-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1502,'RETAINING RING 15',NULL,NULL,NULL,'GB/T894.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1503,'CIRCLIP FOR SHAFT 25',NULL,NULL,NULL,'GB894.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1504,'CIRCLIP FOR HOLE 52',NULL,NULL,NULL,'GB893.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1505,'CIRCLIP 40',NULL,NULL,NULL,'GB893.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1506,'2# PLATE WELD, VERTICAL',NULL,NULL,NULL,'W2.5-02-02-1101-02-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1507,'COVER WELD',NULL,NULL,NULL,'W2.5-02-02-11-01-06-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1508,'PLATE (2#)',NULL,NULL,NULL,'W2.5-02-02-11-01-08',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1509,'BEARING SEAT (2#AUGER)',NULL,NULL,NULL,'WD-150A-03A.05.10-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1510,'IMPUT SHAFT',NULL,NULL,NULL,'WD-150A-03A.05.10.01-01',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1511,'SEAL RING 25 × 47 × 7',NULL,NULL,NULL,'GB/T893.1-92',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1512,'RETAINING RING 47',NULL,NULL,NULL,'GB/T893.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1513,'RETAINING RING 20',NULL,NULL,NULL,'GB/T894.1-86',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1514,'BEVEL GEAR',NULL,NULL,NULL,'WD-150-03.05.10.01-03',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1515,'BEVEL GEAR',NULL,NULL,NULL,'WD-150-03.05.10.01-04',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1516,'SLEEVE',NULL,NULL,NULL,'WD-150A-03A.05.10.01-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1517,'REAR SIEVE ASSY',NULL,NULL,NULL,'W2.5K-02H-13-01-03A-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1518,'BAFFLE PLATE, REAR',NULL,NULL,NULL,'W2.5-02-02-13-01-09',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1519,'GRAIN TENSION PULLEY ASSY',NULL,NULL,NULL,'W3.5H-02HA-10-05-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1520,'RETAINING RING 63',NULL,NULL,NULL,'GB/T894.1-85',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1521,'VERTICAL LIFTING AUGER ASSY',NULL,NULL,NULL,'W3.5H-02HA-10-01-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1522,'TENSION BOLT',NULL,NULL,NULL,'W2.5-02-02-10-14',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1523,'PLATE (NO.1, VERTICAL)',NULL,NULL,NULL,'W2.5-02GX-02-10-01-05',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1524,'PLATE',NULL,NULL,NULL,'W2.5-02GX-02-10-01-06',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1525,'TRANSITION WHEEL',NULL,NULL,NULL,'W2.5K-02HB-12-01A',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1526,'RETAINING RING 42',NULL,NULL,NULL,'GB/T893.1',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1527,'BELT PULLEY ASSY',NULL,NULL,NULL,'W2.5P-02-02-12-04-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1528,'TENSION FRAME WELD',NULL,NULL,NULL,'W2.5K-02HB-12-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1529,'SPRING (ROCKING)',NULL,NULL,NULL,'W2.5K-02HB-12-09',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1530,'BUCKLE',NULL,NULL,NULL,'WD.2MA.73-02',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1531,'ACTIVE SHAFT WELD',NULL,NULL,NULL,'W2.0B-01B-01-02-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1532,'TENSION PULLEY ASSY',NULL,NULL,NULL,'W2.5E-01M-02S-05-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1533,'BAFFLE PLATE',NULL,NULL,NULL,'W3.5H-01-02-15',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1534,'DRIVING WHEEL B, HEADER',NULL,NULL,NULL,'W2.5E-01B-02-07B',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1535,'SLEEVE ASSY, UPPER',NULL,NULL,NULL,'W2.5E-01B-02-06B-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1536,'ECCENTRIC ROLLER ASSY',NULL,NULL,NULL,'W2.0B-01B-01-05Q-12-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1537,'CHAIN WHEEL WELD',NULL,NULL,NULL,'W2.5E-01B-01-02D-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1538,'NYLON SLEEVE B',NULL,NULL,NULL,'W2.5E-01B-01-22',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1539,'NYLON SLEEVE A',NULL,NULL,NULL,'W2.5E-01B-01-21',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1540,'CHAIN',NULL,NULL,NULL,'08B-1 X 114',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1541,'CHAIN',NULL,NULL,NULL,'08B-1 X 98',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1542,'CHAIN WHEEL WELD',NULL,NULL,NULL,'W2.5E-01B-01-04-11-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1543,'GRAIN LIFTING AUGER (1730 mm)',NULL,NULL,NULL,'W3.5H-02HA-10A-01-03-00',0,0,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(1544,'Test Toko','2','test',NULL,'pppipoioioi',0,12,1,5,0,0,23,15000,18000,NULL,'2024-06-18 10:09:07','2024-06-22 12:51:42',1,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1545,'Test Produk Again','2','teest detail',NULL,'TPA',0,12,1,5,0,0,13,20000,25000,NULL,'2024-06-18 12:34:40','2024-06-22 12:21:04',7,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1546,'produk Gudang','2','yegjgjbjb',NULL,'2456789',0,10,1,5,0,0,10,10000,7000,NULL,'2024-06-19 06:26:43','2024-06-19 06:34:35',6,1,1,NULL,107,NULL,NULL,NULL,111,0),
	(1547,'Test produk gudang again','2','jhjhkhkhkh',NULL,'77686868',0,12,1,5,0,0,10,50000,45000,NULL,'2024-06-19 06:31:54','2024-06-19 06:31:54',6,1,1,NULL,107,NULL,NULL,NULL,111,0);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchase_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_details`;

CREATE TABLE `purchase_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `unitcost_selling` int NOT NULL DEFAULT '0',
  `unitcost` int NOT NULL,
  `total` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `weightKg` int DEFAULT NULL,
  `weightGram` int DEFAULT NULL,
  `bag` int DEFAULT NULL,
  `bagian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;

INSERT INTO `purchase_details` (`id`, `purchase_id`, `product_id`, `quantity`, `unitcost_selling`, `unitcost`, `total`, `created_at`, `updated_at`, `weightKg`, `weightGram`, `bag`, `bagian`)
VALUES
	(19,'18','20',5,0,12000,60000,'2024-04-14 05:59:39',NULL,5,5000,0,'Toko'),
	(20,'21','1037',2,0,10000,20000,'2024-06-17 22:56:54',NULL,NULL,NULL,NULL,'Toko'),
	(21,'21','21',2,0,12000,24000,'2024-06-17 22:56:54',NULL,NULL,NULL,NULL,'Toko'),
	(23,'23','1544',4,0,15000,60000,'2024-06-18 12:49:06',NULL,NULL,NULL,NULL,'Toko'),
	(24,'24','1544',5,0,15000,75000,'2024-06-18 12:55:46',NULL,NULL,NULL,NULL,'Toko'),
	(25,'25','1544',5,0,15000,75000,'2024-06-19 06:50:54',NULL,NULL,NULL,NULL,NULL),
	(26,'26','1545',3,0,20000,60000,'2024-06-19 10:37:58',NULL,NULL,NULL,NULL,'Gudang'),
	(27,'27','1544',5,0,18000,100800,'2024-06-20 09:06:54',NULL,NULL,NULL,NULL,'Toko'),
	(28,'28','1544',4,0,18000,72000,'2024-06-22 11:48:54',NULL,NULL,NULL,NULL,'Toko'),
	(29,'28','1545',2,0,20000,40000,'2024-06-22 11:48:54',NULL,NULL,NULL,NULL,'Toko'),
	(30,'29','1544',5,0,18000,90000,'2024-06-22 12:23:33',NULL,NULL,NULL,NULL,'Toko');

/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_due_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_faktur_pajak_pembelian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_purchase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `total_amount_paid` int NOT NULL,
  `total_amount` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `bagian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchases_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `purchases_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `supplier_id`, `purchase_due_date`, `arrival_date`, `no_faktur_pajak_pembelian`, `description_purchase`, `purchase_date`, `purchase_no`, `purchase_status`, `total_amount_paid`, `total_amount`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status_id`, `bagian`)
VALUES
	(18,'1','2024-04-24','2024-04-14 06:01:54',NULL,NULL,'2024-04-14','POD-000002','4',60000,60000,'1','1','2024-04-14 05:59:39','2024-06-22 12:20:35',1,'Toko'),
	(21,'1','2024-06-25','2024-06-18 00:31:27','98989898',NULL,'2024-06-18','POD-000005','4',44000,44000,'5','5','2024-06-17 22:56:54','2024-06-22 12:20:35',1,'Toko'),
	(23,'1','2024-06-22','2024-06-18 13:08:42','868767678678',NULL,'2024-06-15','POD-000006','4',60000,60000,'3','3','2024-06-18 12:49:06','2024-06-22 12:20:35',1,'Toko'),
	(24,'1','2024-06-23','2024-06-18 12:58:56','656575757',NULL,'2024-06-16','POD-000007','4',20000,75000,'3','3','2024-06-18 12:55:46','2024-06-22 12:20:35',1,'Toko'),
	(25,'2','2024-06-29','2024-06-19 06:58:07','767668686868',NULL,'2024-06-19','POD-000008','1',20000,75000,'4','4','2024-06-19 06:50:54','2024-06-19 06:58:07',1,'Gudang'),
	(26,'2','2024-06-26','2024-06-19 10:42:36','3556768',NULL,'2024-06-19','POD-000009','1',50000,60000,'4','4','2024-06-19 10:37:58','2024-06-19 10:42:36',1,'Gudang'),
	(27,'1','2024-06-21','2024-06-22 12:51:43','12345679',NULL,'2024-06-20','POD-000010','1',50000,100800,'3','3','2024-06-20 09:06:54','2024-06-22 12:51:43',1,'Toko'),
	(28,'1','2024-06-27','2024-06-22 12:21:04','123456789',NULL,'2024-06-22','POD-000011','4',100000,125440,'3','3','2024-06-22 11:48:54','2024-06-22 12:28:44',1,'Toko'),
	(29,'1','2024-06-27',NULL,'2345678',NULL,'2024-06-22','POD-000012','4',100800,100800,'3',NULL,'2024-06-22 12:23:33','2024-06-22 12:41:30',1,'Toko');

/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table return_purchase_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return_purchase_details`;

CREATE TABLE `return_purchase_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `unitcost` int NOT NULL,
  `total` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table return_purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `return_purchases`;

CREATE TABLE `return_purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_faktur_pajak_pembelian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=Pending, 1=Approved',
  `total_amount` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_id` bigint unsigned DEFAULT '1',
  `status_id` bigint unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `purchases_status_id_foreign` (`status_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(1,3),
	(1,6),
	(2,6),
	(3,6),
	(4,6);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','web','2023-09-10 14:26:57','2023-09-10 14:26:57'),
	(3,'Admin_Sale','web','2023-09-10 14:45:37','2023-09-10 14:45:37'),
	(4,'Admin_Toko','web','2023-09-10 14:45:37','2023-09-10 14:45:37'),
	(5,'Admin_Gud','web','2023-09-10 14:45:37','2023-09-10 14:45:37'),
	(6,'Owner','web','2023-09-10 14:45:37','2023-09-10 14:45:37');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setting_generals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setting_generals`;

CREATE TABLE `setting_generals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `my_company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `my_company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `my_company_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `setting_generals` WRITE;
/*!40000 ALTER TABLE `setting_generals` DISABLE KEYS */;

INSERT INTO `setting_generals` (`id`, `my_company_name`, `my_company_phone`, `my_company_address`, `created_at`, `updated_at`)
VALUES
	(1,'CV. MUSTIKA JAYA SANTARA','0852-3133-8500','Jl. Kemuning Raya 04/05 Bojong Menteng\nRawalumbu, Kota Bekasi, Jawa Barat','2024-04-14 13:15:41','2024-04-14 13:15:38');

/*!40000 ALTER TABLE `setting_generals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shoppingcart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `suppliers_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `suppliers_phone_unique` (`phone`) USING BTREE,
  KEY `suppliers_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `suppliers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `npwp`, `shopname`, `type`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`, `status_id`, `company_name`, `company_phone`)
VALUES
	(1,'Pabrik Gulaku','supplier@mail.com','31239102213902910','dnskakndknak','6786767','supplier 1','Distributor',NULL,'kdoaksdosa','31293198','BNI','2023-09-12 02:20:22','2024-06-17 10:20:20',1,'PT HO','93012392190'),
	(2,'Another Pabrik Gulaku','supplier2@mail.com','312391022139029210','dnskakndknak','89907867','supplier 1','Distributor',NULL,'kdoaksdosa','31293198','BNI','2023-09-12 02:20:22','2023-09-12 02:20:22',1,'PT HA','3901239120'),
	(6,'Supplier Test','suppliertest@gmail.com','7676768768','Address Supplier',NULL,NULL,'Distributor',NULL,'suplier test','5454464545','BCA','2024-06-16 12:53:31','2024-06-16 12:53:31',1,NULL,NULL),
	(7,'Supp 2','supp2@gmail.com','6878787','hhkhkkkjljlj','655575557757557',NULL,'Distributor',NULL,'supp2','6868789797','BRI','2024-06-16 12:58:25','2024-06-16 12:58:25',1,NULL,NULL);

/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table units
# ------------------------------------------------------------

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `units_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `units_slug_unique` (`slug`) USING BTREE,
  KEY `units_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `units_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;

INSERT INTO `units` (`id`, `name`, `slug`, `created_at`, `updated_at`, `status_id`)
VALUES
	(1,'GRAM','gram','2024-01-12 00:29:56','2024-01-12 00:29:56',1);

/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  KEY `users_status_id_foreign` (`status_id`) USING BTREE,
  CONSTRAINT `users_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `master_status` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `photo`, `status_id`)
VALUES
	(1,'Dimas','admin@gmail.com',NULL,'$2y$10$4l6DaE1c7VpJdsNifIVw/uh8ocrGGpyEC5/cG3gL6u5YbTiltoX3O','S6dlEw9UbcXcOEEnrKaK8AqsFIQboNgiBlADBdALhdciFXLyC4JTdRHwEGcX','2023-09-10 14:26:57','2023-09-10 14:26:57','Dimas',NULL,1),
	(2,'Admin Penjualan','selleradmin@gmail.com',NULL,'$2y$10$7oPZWFsJFpFyivRfJtjM9.Nx4ir3VxO4TiYxmz9AQ9Mv582Nax2Ie',NULL,'2023-12-30 07:08:05','2024-06-16 08:49:48','seller_admin',NULL,1),
	(3,'Admin Toko','admintoko@gmail.com',NULL,'$2y$10$USzYi2cCt6XLvXH5GMvwFuobx.DqOKsKMDp0d7RlgnT4pxHMJuF0.',NULL,'2024-06-16 09:36:07','2024-06-16 09:36:07','admin_toko',NULL,1),
	(4,'Admin Gudang','admingudang@gmail.com',NULL,'$2y$10$pvcjtVZSiIrDxLK.0JGOdOQfKHNPUCZQ8DrWj3q7tOYGCK.HhVHMy',NULL,'2024-06-16 09:36:47','2024-06-16 09:36:47','admin_gudang',NULL,1),
	(5,'Owner','owner@gmail.com',NULL,'$2y$10$FxKC7EfujXeWFBcUD0qhfOSzcrSPY85W6DKuyZZdcl58/4/YtMke2',NULL,'2024-06-16 10:37:42','2024-06-16 10:37:42','Owner',NULL,1),
	(9,'Gudang Gula Jaya','ggj@gmail.com',NULL,'$2y$10$qa/REKaPXoub4QPzmL1elORuVcoCmgUWqoGY9Yo/YIKs1Nrtkb3Em',NULL,'2024-06-19 08:49:23','2024-06-19 08:49:23','gudanggula',NULL,1),
	(11,'Gula Jaya','gj@gmail.com',NULL,'$2y$10$lbk8MHVVAJobUgllbw8eJOtgPqPBXnOitV/KdG87e8fYkxuQAMmbS',NULL,'2024-06-19 09:04:04','2024-06-19 09:04:04','gulajaya',NULL,1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
