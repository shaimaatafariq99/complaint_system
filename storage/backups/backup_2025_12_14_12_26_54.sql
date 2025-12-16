-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: complaints_system
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `old_data` text DEFAULT NULL,
  `new_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,NULL,'add','User',NULL,'{\"name\":\"shaimaa\",\"email\":\"sh.tafarigfhsssfdffgq@gmail.com\",\"role\":\"citizen\",\"updated_at\":\"2025-12-14T06:56:14.000000Z\",\"created_at\":\"2025-12-14T06:56:14.000000Z\",\"id\":1}','2025-12-14 03:56:14','2025-12-14 03:56:14'),(2,NULL,'send_otp','User',NULL,'{\"user_id\":1,\"otp\":322768}','2025-12-14 03:56:19','2025-12-14 03:56:19'),(3,NULL,'add','User',NULL,'{\"name\":\"shaimaa\",\"email\":\"ssfdffgq@gmail.com\",\"role\":\"citizen\",\"updated_at\":\"2025-12-14T06:58:24.000000Z\",\"created_at\":\"2025-12-14T06:58:24.000000Z\",\"id\":5}','2025-12-14 03:58:24','2025-12-14 03:58:24'),(4,NULL,'send_otp','User',NULL,'{\"user_id\":5,\"otp\":513984}','2025-12-14 03:58:30','2025-12-14 03:58:30'),(5,NULL,'add','User',NULL,'{\"name\":\"shaimaa\",\"email\":\"sh@gmail.com\",\"role\":\"admin\",\"updated_at\":\"2025-12-14T07:25:42.000000Z\",\"created_at\":\"2025-12-14T07:25:42.000000Z\",\"id\":7}','2025-12-14 04:25:42','2025-12-14 04:25:42'),(6,NULL,'send_otp','User',NULL,'{\"user_id\":7,\"otp\":939303}','2025-12-14 04:25:47','2025-12-14 04:25:47'),(7,7,'add','Category',NULL,'{\"name\":\"bcvfdsfbcvb Supplies\",\"updated_at\":\"2025-12-14T07:27:14.000000Z\",\"created_at\":\"2025-12-14T07:27:14.000000Z\",\"id\":1}','2025-12-14 04:27:14','2025-12-14 04:27:14'),(8,NULL,'add','User',NULL,'{\"name\":\"gdgd\",\"email\":\"adgdmddgfin@gmail.com\",\"role\":\"citizen\",\"updated_at\":\"2025-12-14T07:27:51.000000Z\",\"created_at\":\"2025-12-14T07:27:51.000000Z\",\"id\":8}','2025-12-14 04:27:51','2025-12-14 04:27:51'),(9,NULL,'send_otp','User',NULL,'{\"user_id\":8,\"otp\":695999}','2025-12-14 04:27:56','2025-12-14 04:27:56'),(10,8,'create','Complaint',NULL,'{\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 \\u064a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0622\\u0646.\",\"category_id\":1,\"user_id\":8,\"priority_id\":1,\"status_id\":1,\"assigned_to\":null,\"updated_at\":\"2025-12-14T07:39:31.000000Z\",\"created_at\":\"2025-12-14T07:39:31.000000Z\",\"id\":4}','2025-12-14 04:39:31','2025-12-14 04:39:31'),(11,8,'create','Complaint',NULL,'{\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0645\\u0645\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 \\u064a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0622\\u0646.\",\"category_id\":1,\"user_id\":8,\"priority_id\":1,\"status_id\":1,\"assigned_to\":null,\"updated_at\":\"2025-12-14T07:56:36.000000Z\",\"created_at\":\"2025-12-14T07:56:36.000000Z\",\"id\":5}','2025-12-14 04:56:36','2025-12-14 04:56:36'),(12,NULL,'add','User',NULL,'{\"name\":\"shaimaa\",\"email\":\"sffdh@gmail.com\",\"role\":\"employee\",\"updated_at\":\"2025-12-14T08:02:00.000000Z\",\"created_at\":\"2025-12-14T08:02:00.000000Z\",\"id\":9}','2025-12-14 05:02:00','2025-12-14 05:02:00'),(13,NULL,'send_otp','User',NULL,'{\"user_id\":9,\"otp\":293504}','2025-12-14 05:02:06','2025-12-14 05:02:06'),(14,8,'create','Complaint',NULL,'{\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0645\\u0645\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 ffs \\u0627\\u0644\\u0622\\u0646.\",\"category_id\":1,\"user_id\":8,\"priority_id\":1,\"status_id\":1,\"assigned_to\":null,\"updated_at\":\"2025-12-14T08:27:39.000000Z\",\"created_at\":\"2025-12-14T08:27:39.000000Z\",\"id\":6}','2025-12-14 05:27:39','2025-12-14 05:27:39'),(15,9,'update','Complaint','{\"id\":5,\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0645\\u0645\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 \\u064a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0622\\u0646.\",\"user_id\":8,\"category_id\":1,\"priority_id\":1,\"status_id\":1,\"assigned_to\":null,\"created_at\":\"2025-12-14T07:56:36.000000Z\",\"updated_at\":\"2025-12-14T07:56:36.000000Z\",\"locked_by\":null,\"locked_at\":null,\"lock_expire_at\":null,\"user\":{\"role\":\"citizen\",\"id\":8,\"name\":\"gdgd\",\"email\":\"adgdmddgfin@gmail.com\",\"email_verified_at\":null,\"fcm_token\":null,\"created_at\":\"2025-12-14T07:27:51.000000Z\",\"updated_at\":\"2025-12-14T07:27:51.000000Z\",\"otp\":\"695999\",\"otp_expires_at\":\"2025-12-14 07:32:51\",\"is_verified\":0},\"status\":{\"id\":1,\"name\":\"new\",\"created_at\":null,\"updated_at\":null},\"priority\":{\"id\":1,\"level\":\"low\",\"created_at\":null,\"updated_at\":null}}','{\"id\":5,\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0645\\u0645\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 \\u064a\\u0639\\u0645\\u0644 \\u0627\\u0644\\u0622\\u0646.\",\"user_id\":8,\"category_id\":1,\"priority_id\":1,\"status_id\":4,\"assigned_to\":null,\"created_at\":\"2025-12-14T07:56:36.000000Z\",\"updated_at\":\"2025-12-14T09:14:37.000000Z\",\"locked_by\":null,\"locked_at\":null,\"lock_expire_at\":null,\"user\":{\"role\":\"citizen\",\"id\":8,\"name\":\"gdgd\",\"email\":\"adgdmddgfin@gmail.com\",\"email_verified_at\":null,\"fcm_token\":null,\"created_at\":\"2025-12-14T07:27:51.000000Z\",\"updated_at\":\"2025-12-14T07:27:51.000000Z\",\"otp\":\"695999\",\"otp_expires_at\":\"2025-12-14 07:32:51\",\"is_verified\":0},\"status\":{\"id\":4,\"name\":\"solved\",\"created_at\":null,\"updated_at\":null},\"priority\":{\"id\":1,\"level\":\"low\",\"created_at\":null,\"updated_at\":null}}','2025-12-14 06:14:37','2025-12-14 06:14:37'),(16,NULL,'add','User',NULL,'{\"name\":\"shaimaa\",\"email\":\"sffdfsfsh@gmail.com\",\"role\":\"admin\",\"updated_at\":\"2025-12-14T09:52:30.000000Z\",\"created_at\":\"2025-12-14T09:52:30.000000Z\",\"id\":10}','2025-12-14 06:52:30','2025-12-14 06:52:30'),(17,NULL,'send_otp','User',NULL,'{\"user_id\":10,\"otp\":297710}','2025-12-14 06:52:34','2025-12-14 06:52:34'),(18,9,'update','Complaint','{\"id\":6,\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0645\\u0645\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 ffs \\u0627\\u0644\\u0622\\u0646.\",\"user_id\":8,\"category_id\":1,\"priority_id\":1,\"status_id\":1,\"assigned_to\":null,\"created_at\":\"2025-12-14T08:27:39.000000Z\",\"updated_at\":\"2025-12-14T08:27:39.000000Z\",\"locked_by\":null,\"locked_at\":null,\"lock_expire_at\":null,\"user\":{\"role\":\"citizen\",\"id\":8,\"name\":\"gdgd\",\"email\":\"adgdmddgfin@gmail.com\",\"email_verified_at\":null,\"fcm_token\":null,\"created_at\":\"2025-12-14T07:27:51.000000Z\",\"updated_at\":\"2025-12-14T07:27:51.000000Z\",\"otp\":\"695999\",\"otp_expires_at\":\"2025-12-14 07:32:51\",\"is_verified\":0},\"status\":{\"id\":1,\"name\":\"new\",\"created_at\":null,\"updated_at\":null},\"priority\":{\"id\":1,\"level\":\"low\",\"created_at\":null,\"updated_at\":null}}','{\"id\":6,\"title\":\"\\u062a\\u062c\\u0631\\u0628\\u0645\\u0645\\u0629 \\u0634\\u0643\\u0648\\u0649 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"description\":\"\\u0647\\u0630\\u0627 \\u0627\\u062e\\u062a\\u0628\\u0627\\u0631 \\u0644\\u0644\\u062a\\u0623\\u0643\\u062f \\u0645\\u0646 \\u0623\\u0646 \\u0627\\u0644\\u062d\\u0641\\u0638 ffs \\u0627\\u0644\\u0622\\u0646.\",\"user_id\":8,\"category_id\":1,\"priority_id\":1,\"status_id\":4,\"assigned_to\":null,\"created_at\":\"2025-12-14T08:27:39.000000Z\",\"updated_at\":\"2025-12-14T11:45:28.000000Z\",\"locked_by\":null,\"locked_at\":null,\"lock_expire_at\":null,\"user\":{\"role\":\"citizen\",\"id\":8,\"name\":\"gdgd\",\"email\":\"adgdmddgfin@gmail.com\",\"email_verified_at\":null,\"fcm_token\":null,\"created_at\":\"2025-12-14T07:27:51.000000Z\",\"updated_at\":\"2025-12-14T07:27:51.000000Z\",\"otp\":\"695999\",\"otp_expires_at\":\"2025-12-14 07:32:51\",\"is_verified\":0},\"status\":{\"id\":4,\"name\":\"solved\",\"created_at\":null,\"updated_at\":null},\"priority\":{\"id\":1,\"level\":\"low\",\"created_at\":null,\"updated_at\":null}}','2025-12-14 08:45:28','2025-12-14 08:45:28');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'bcvfdsfbcvb Supplies','2025-12-14 04:27:14','2025-12-14 04:27:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_replies`
--

DROP TABLE IF EXISTS `complaint_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `replay_text` text NOT NULL,
  `complaint_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaint_replies_complaint_id_foreign` (`complaint_id`),
  KEY `complaint_replies_user_id_foreign` (`user_id`),
  CONSTRAINT `complaint_replies_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE,
  CONSTRAINT `complaint_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_replies`
--

LOCK TABLES `complaint_replies` WRITE;
/*!40000 ALTER TABLE `complaint_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `priority_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `assigned_to` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `locked_by` bigint(20) unsigned DEFAULT NULL,
  `locked_at` timestamp NULL DEFAULT NULL,
  `lock_expire_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complaints_user_id_foreign` (`user_id`),
  KEY `complaints_category_id_foreign` (`category_id`),
  KEY `complaints_priority_id_foreign` (`priority_id`),
  KEY `complaints_status_id_foreign` (`status_id`),
  KEY `complaints_assigned_to_foreign` (`assigned_to`),
  CONSTRAINT `complaints_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  CONSTRAINT `complaints_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `complaints_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`),
  CONSTRAINT `complaints_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `complaints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
INSERT INTO `complaints` VALUES (4,'تجربة شكوى جديدة','هذا اختبار للتأكد من أن الحفظ يعمل الآن.',8,1,1,1,NULL,'2025-12-14 04:39:31','2025-12-14 04:39:31',NULL,NULL,NULL),(5,'تجربممة شكوى جديدة','هذا اختبار للتأكد من أن الحفظ يعمل الآن.',8,1,1,4,NULL,'2025-12-14 04:56:36','2025-12-14 06:14:37',NULL,NULL,NULL),(6,'تجربممة شكوى جديدة','هذا اختبار للتأكد من أن الحفظ ffs الآن.',8,1,1,4,NULL,'2025-12-14 05:27:39','2025-12-14 08:45:28',NULL,NULL,NULL);
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifies`
--

DROP TABLE IF EXISTS `email_verifies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_verifies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifies`
--

LOCK TABLES `email_verifies` WRITE;
/*!40000 ALTER TABLE `email_verifies` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verifies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2016_06_01_000001_create_oauth_auth_codes_table',1),(5,'2016_06_01_000002_create_oauth_access_tokens_table',1),(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(7,'2016_06_01_000004_create_oauth_clients_table',1),(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(9,'2019_08_19_000000_create_failed_jobs_table',1),(10,'2019_12_14_000001_create_personal_access_tokens_table',1),(11,'2024_07_16_065441_create_customers_table',1),(12,'2024_07_16_065939_create_admins_table',1),(13,'2024_07_25_060642_create_email_verifies_table',1),(14,'2025_11_16_034631_create_categories_table',1),(15,'2025_11_16_034748_create_statuses_table',1),(16,'2025_11_16_034956_create_priorities_table',1),(17,'2025_11_16_035100_create_complaints_table',1),(18,'2025_11_16_035217_create_complaint_replies_table',1),(19,'2025_12_12_064432_add_lock_fields_to_complaints_table',1),(20,'2025_12_12_071406_add_fcm_token_to_users_table',1),(21,'2025_12_13_173156_create_activity_logs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('2af930cf5e44d81932661bbe2d4ab1d226f03126d84f63b5518af1f24a3674913a3e5bd04dce0368',7,1,'authToken','[]',0,'2025-12-14 04:25:48','2025-12-14 04:25:48','2025-12-29 07:25:48'),('2e1be0d81f53e8bf131eb972e06bcfdc8e20b3d2377e7d5d2e8e5640369764465731ecf7cf2347f7',10,1,'authToken','[]',0,'2025-12-14 08:36:41','2025-12-14 08:36:41','2025-12-29 11:36:41'),('31fb158f8572ae10330b1e55470db2e99e849179cb1114b8351fb400256885cabde6475f51127089',9,1,'authToken','[]',0,'2025-12-14 05:02:06','2025-12-14 05:02:06','2025-12-29 08:02:06'),('37bc17b33002e374312ce86deaa8e611e0e5a7841162453723dc2f704f3f5a46d6c5e4d894a33215',10,1,'authToken','[]',0,'2025-12-14 06:52:34','2025-12-14 06:52:34','2025-12-29 09:52:34'),('475ac414d8ba7175dc12d135fa48c7b34fe7f85fccd0352de24ea9d9439dfc086be279c9c28a6f46',5,1,'authToken','[]',0,'2025-12-14 03:58:30','2025-12-14 03:58:30','2025-12-29 06:58:30'),('6a243bcc7fa6e3105af1ea385a1b9538a94f1b28e20b67738f04b01f68215441c0937372df5e2f49',8,1,'authToken','[]',0,'2025-12-14 04:27:56','2025-12-14 04:27:56','2025-12-29 07:27:56'),('a03fce171c6c3176c84fc6dd3cf4ab929032b3adf3905f0b3f2a34c82c2fc6f958b22feb2b5e9286',5,1,'authToken','[]',0,'2025-12-14 03:58:50','2025-12-14 03:58:50','2025-12-29 06:58:50'),('bb22437a73e92d054bd08c589cc945d488e534e787a47b0e2d828e57cd27fc2495bcd5fb2c70ad0c',9,1,'authToken','[]',0,'2025-12-14 05:02:33','2025-12-14 05:02:33','2025-12-29 08:02:33'),('db3647f70b92441b76abf1c6b84d5be430babb33d13c9cf01842ecf48b55325b29012fd84e65cae9',8,1,'authToken','[]',0,'2025-12-14 04:29:03','2025-12-14 04:29:03','2025-12-29 07:29:03'),('fe637aa70774e090c65a5b36391f9c8c48305c00ce76cdb7f75d41f42fcecb819660ed6ff91abf14',10,1,'authToken','[]',0,'2025-12-14 06:53:36','2025-12-14 06:53:36','2025-12-29 09:53:36');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','NngoSeE8LuNFirV4O34EMayjBejSwBhmMnHxdiqo',NULL,'http://localhost',1,0,0,'2025-12-14 03:57:16','2025-12-14 03:57:16'),(2,NULL,'Laravel Password Grant Client','mvPQ9bRtf8fUijze8Jvmy00RXMDzLLOrkznK92BZ','users','http://localhost',0,1,0,'2025-12-14 03:57:16','2025-12-14 03:57:16');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2025-12-14 03:57:16','2025-12-14 03:57:16');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priorities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level` enum('low','medium','high') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorities`
--

LOCK TABLES `priorities` WRITE;
/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` VALUES (1,'low',NULL,NULL);
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('new','in_progress','solved','closed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'new',NULL,NULL),(2,'new',NULL,NULL),(3,'in_progress',NULL,NULL),(4,'solved',NULL,NULL),(5,'closed',NULL,NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `role` varchar(255) NOT NULL DEFAULT 'citizen',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('citizen',1,'shaimaa','sh.tafarigfhsssfdffgq@gmail.com',NULL,'$2y$12$2rOuX6HZM2aIrlO7kR7J8.P4oWFb.8xJsDzDkHipHIz73WZLCaNFu',NULL,NULL,'2025-12-14 03:56:14','2025-12-14 03:56:14','322768','2025-12-14 04:01:14',0),('citizen',5,'shaimaa','ssfdffgq@gmail.com',NULL,'$2y$12$wm855JmT4siI4PRj/sWHl.lKCTg2w7YiE3mRocggsLpndScljrz4O',NULL,NULL,'2025-12-14 03:58:24','2025-12-14 03:58:24','513984','2025-12-14 04:03:24',0),('admin',7,'shaimaa','sh@gmail.com',NULL,'$2y$12$WW37LozCfLjkX5qhyc4W5u8WYYEbeLDzIFFYR9yupq/jp.V05brt2',NULL,NULL,'2025-12-14 04:25:42','2025-12-14 04:25:42','939303','2025-12-14 04:30:42',0),('citizen',8,'gdgd','adgdmddgfin@gmail.com',NULL,'$2y$12$6BR8oOSAXc9ZRdmLQvDi1OwryKnQLegYnG6w17dELYMAqtnElUHeS',NULL,NULL,'2025-12-14 04:27:51','2025-12-14 04:27:51','695999','2025-12-14 04:32:51',0),('employee',9,'shaimaa','sffdh@gmail.com',NULL,'$2y$12$Q2pPFqt/zeEiUVu8yC95QOJOUHb8TSHi.ihP/JUPx3r3rnwTEO7.W',NULL,NULL,'2025-12-14 05:02:00','2025-12-14 05:02:00','293504','2025-12-14 05:07:00',0),('admin',10,'shaimaa','sffdfsfsh@gmail.com',NULL,'$2y$12$1lYA/tpTKb.IRJLnjNtY6eMBK2TePfsR3vAx5jeHUv3EVuqAFC3Ei',NULL,NULL,'2025-12-14 06:52:30','2025-12-14 06:52:30','297710','2025-12-14 06:57:30',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-14 15:26:57
