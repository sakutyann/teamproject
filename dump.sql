-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: teamproject
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$870000$ZiJ8lVWOJiu4FWnKt5hC5W$S2HTk59qoNSLeaVdAPdwpUTFr5+sKlevvL8ZPadhA1U=','2025-01-24 00:26:07.488943',1,'admin','','','a@a.com',1,1,'2024-11-14 02:20:32.856928'),(2,'pbkdf2_sha256$870000$dXSAAHpPRgm9jI8tIU5od3$SBNuSUyzf6bwFvJdeRdnIXqsgCKhoogNkJVu45PvZ78=','2025-01-16 02:34:41.733359',0,'あ','','','a@gmail.com',0,1,'2025-01-16 02:34:40.800963'),(3,'pbkdf2_sha256$870000$sW4aXprxqpO01dd5PkYAU5$/t+u+0KpkXkwySAeED5KXOY/DksB8TYY0MRMbranR/4=','2025-01-21 00:51:54.637896',0,'あああああああ','','','tky2302130@stu.o-hara.ac.jp',0,1,'2025-01-21 00:51:53.709589');
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add quest request',6,'add_questrequest'),(22,'Can change quest request',6,'change_questrequest'),(23,'Can delete quest request',6,'delete_questrequest'),(24,'Can view quest request',6,'view_questrequest'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add photo',8,'add_photo'),(30,'Can change photo',8,'change_photo'),(31,'Can delete photo',8,'delete_photo'),(32,'Can view photo',8,'view_photo'),(33,'Can add quest request',9,'add_questrequest'),(34,'Can change quest request',9,'change_questrequest'),(35,'Can delete quest request',9,'delete_questrequest'),(36,'Can view quest request',9,'view_questrequest'),(37,'Can add quest',10,'add_quest'),(38,'Can change quest',10,'change_quest'),(39,'Can delete quest',10,'delete_quest'),(40,'Can view quest',10,'view_quest'),(41,'Can add quest register',11,'add_questregister'),(42,'Can change quest register',11,'change_questregister'),(43,'Can delete quest register',11,'delete_questregister'),(44,'Can view quest register',11,'view_questregister'),(45,'Can add photo submission',12,'add_photosubmission'),(46,'Can change photo submission',12,'change_photosubmission'),(47,'Can delete photo submission',12,'delete_photosubmission'),(48,'Can view photo submission',12,'view_photosubmission'),(49,'Can add coupon',13,'add_coupon'),(50,'Can change coupon',13,'change_coupon'),(51,'Can delete coupon',13,'delete_coupon'),(52,'Can view coupon',13,'view_coupon'),(53,'Can add user coupon',14,'add_usercoupon'),(54,'Can change user coupon',14,'change_usercoupon'),(55,'Can delete user coupon',14,'delete_usercoupon'),(56,'Can view user coupon',14,'view_usercoupon'),(57,'Can add quest sub mission',15,'add_questsubmission'),(58,'Can change quest sub mission',15,'change_questsubmission'),(59,'Can delete quest sub mission',15,'delete_questsubmission'),(60,'Can view quest sub mission',15,'view_questsubmission'),(61,'Can add user quest now',16,'add_userquestnow'),(62,'Can change user quest now',16,'change_userquestnow'),(63,'Can delete user quest now',16,'delete_userquestnow'),(64,'Can view user quest now',16,'view_userquestnow');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-15 02:31:01.200814','1','/media/photos/image-preview.png',1,'[{\"added\": {}}]',8,1),(2,'2024-11-15 02:50:53.385023','1','/media/photos/image-preview.png',3,'',8,1),(3,'2024-11-18 02:00:28.553891','2','Photo object (2)',1,'[{\"added\": {}}]',8,1),(4,'2024-11-18 02:02:05.489386','2','Photo object (2)',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'form','photo'),(9,'form','questrequest'),(10,'formapp','quest'),(11,'formapp','questregister'),(5,'sessions','session'),(6,'team','questrequest'),(13,'userquest','coupon'),(12,'userquest','photosubmission'),(15,'userquest','questsubmission'),(14,'userquest','usercoupon'),(16,'userquest','userquestnow');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-14 02:15:58.194158'),(2,'contenttypes','0002_remove_content_type_name','2024-11-14 02:15:58.346329'),(3,'auth','0001_initial','2024-11-14 02:15:58.884530'),(4,'auth','0002_alter_permission_name_max_length','2024-11-14 02:15:59.001921'),(5,'auth','0003_alter_user_email_max_length','2024-11-14 02:15:59.010307'),(6,'auth','0004_alter_user_username_opts','2024-11-14 02:15:59.019779'),(7,'auth','0005_alter_user_last_login_null','2024-11-14 02:15:59.028634'),(8,'auth','0006_require_contenttypes_0002','2024-11-14 02:15:59.033720'),(9,'auth','0007_alter_validators_add_error_messages','2024-11-14 02:15:59.042820'),(10,'auth','0008_alter_user_username_max_length','2024-11-14 02:15:59.051545'),(11,'auth','0009_alter_user_last_name_max_length','2024-11-14 02:15:59.063058'),(12,'auth','0010_alter_group_name_max_length','2024-11-14 02:15:59.090023'),(13,'auth','0011_update_proxy_permissions','2024-11-14 02:15:59.101884'),(14,'auth','0012_alter_user_first_name_max_length','2024-11-14 02:15:59.110339'),(15,'accounts','0001_initial','2024-11-14 02:15:59.763898'),(16,'accounts','0002_alter_customuser_groups_and_more','2024-11-14 02:15:59.779115'),(17,'admin','0001_initial','2024-11-14 02:16:00.067667'),(18,'admin','0002_logentry_remove_auto_add','2024-11-14 02:16:00.079478'),(19,'admin','0003_logentry_add_action_flag_choices','2024-11-14 02:16:00.088182'),(20,'sessions','0001_initial','2024-11-14 02:16:00.161878'),(22,'form','0001_initial','2024-11-15 00:51:15.321975'),(26,'form','0002_alter_photo_table','2024-11-20 01:57:28.601653'),(27,'form','0003_alter_photo_image','2024-11-20 01:57:28.621265'),(28,'form','0004_alter_photo_image_alter_photo_table','2024-11-20 01:57:28.629823'),(29,'team','0001_initial','2024-11-20 02:06:46.166339'),(30,'team','0002_questrequest_delete_customer','2024-11-20 02:11:50.680022'),(31,'form','0005_alter_photo_image_alter_photo_table','2024-11-20 02:29:36.406685'),(32,'form','0006_alter_photo_table','2024-11-20 02:32:56.385251'),(33,'formapp','0001_initial','2024-11-21 03:20:14.486655'),(34,'formapp','0002_quest_delete_questrequest','2024-11-21 03:20:14.565948'),(35,'formapp','0003_questregister_alter_quest_payment_and_more','2024-11-21 03:20:14.898568'),(36,'formapp','0004_questregister_latitude_questregister_longitude','2024-11-21 05:18:39.525996'),(37,'userquest','0001_initial','2024-11-22 02:12:19.069033'),(38,'formapp','0004_remove_questregister_hours_and_more','2024-11-26 03:33:17.111573'),(39,'formapp','0005_alter_questregister_quest_id','2024-11-26 03:33:17.509355'),(40,'formapp','0006_alter_questregister_quest_id','2024-11-26 03:33:17.716962'),(41,'formapp','0007_questregister_latitude_questregister_longitude','2024-11-26 05:00:30.972314'),(42,'formapp','0008_merge_20241126_1233','2024-11-26 05:00:30.974339'),(43,'userquest','0002_coupon_usercoupon','2024-11-26 05:00:31.209817'),(44,'userquest','0003_photosubmission','2024-11-28 05:52:51.384919');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('24w1kxtzefw1tfdc5ajlud9dz7m71j79','.eJxVjEEOwiAQRe_C2hBoYRhcuvcMBIapVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hzuIstDj9binSg-sO8j3WW5PU6rrMSe6KPGiX15b5eTncv4MSe_nWdhrJRfQ8giY1WKUxDzgaBDA6o_EenGKlwCfnicESgceIzBYmRBbvD7HWNuU:1tb7WR:B90nMeR950fpJBAbaeMN60rJp_CVbfmBSdFb_gvZWpM','2025-02-07 00:26:07.501473'),('qigx8qxpn1z9ylffqx6o7n7bjfb3zbhv','.eJxVjEEOwiAQRe_C2hBoYRhcuvcMBIapVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hzuIstDj9binSg-sO8j3WW5PU6rrMSe6KPGiX15b5eTncv4MSe_nWdhrJRfQ8giY1WKUxDzgaBDA6o_EenGKlwCfnicESgceIzBYmRBbvD7HWNuU:1tGrm9:z1GwQoIkdjqhCGnoOCzEphp_s0plV3RqxwytuAM4pqY','2024-12-13 03:34:37.035239');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_photo`
--

DROP TABLE IF EXISTS `form_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_photo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_photo`
--

LOCK TABLES `form_photo` WRITE;
/*!40000 ALTER TABLE `form_photo` DISABLE KEYS */;
INSERT INTO `form_photo` VALUES (1,'photos/image-preview_7MDlCh0.png',NULL,NULL,'2024-11-20 02:38:57','2024-11-20 02:38:57'),(2,'photos/image-preview_UUEtXml.png',NULL,NULL,'2024-11-20 02:40:39','2024-11-20 02:40:39'),(3,'photos/image-preview_wDfOnGU.png',NULL,NULL,'2024-11-20 02:41:01','2024-11-20 02:41:01'),(4,'photos/image-preview_oEmsJsB.png',NULL,NULL,'2024-11-20 02:46:53','2024-11-20 02:46:53'),(5,'photos/image-preview_DKQ95HN.png',NULL,NULL,'2024-11-20 02:47:33','2024-11-20 02:47:33'),(6,'photos/image-preview_S9Nw6rG.png',NULL,NULL,'2024-11-20 03:05:54','2024-11-20 03:05:54'),(7,'photos/image-preview_7uIxm29.png',NULL,NULL,'2024-11-20 03:06:42','2024-11-20 03:06:42'),(8,'photos/image-preview_o1mhiIJ.png',NULL,NULL,'2024-11-20 03:09:10','2024-11-20 03:09:10'),(9,'photos/image-preview_DjLPWzx.png',NULL,NULL,'2024-11-20 03:09:25','2024-11-20 03:09:25'),(10,'photos/image-preview_VVVVYNC.png',NULL,NULL,'2024-11-20 03:09:39','2024-11-20 03:09:39'),(11,'photos/image-preview_RsODntO.png',NULL,NULL,'2024-11-20 03:11:01','2024-11-20 03:11:01'),(12,'photos/image-preview_YJ51YOY.png',NULL,NULL,'2024-11-20 03:13:03','2024-11-20 03:13:03'),(13,'photos/image-preview_IFZaJ5j.png',NULL,NULL,'2024-11-20 03:13:06','2024-11-20 03:13:06'),(14,'photos/image-preview_c4B9bE1.png',NULL,NULL,'2024-11-20 03:14:49','2024-11-20 03:14:49'),(15,'photos/WIN_20241120_12_16_10_Pro.jpg',NULL,NULL,'2024-11-20 03:17:15','2024-11-20 03:17:15'),(16,'photos/WIN_20241120_12_16_10_Pro_zvpAhgC.jpg',NULL,NULL,'2024-11-20 03:19:31','2024-11-20 03:19:31'),(17,'photos/WIN_20241120_12_16_10_Pro_gEiHA2v.jpg',NULL,NULL,'2024-11-20 03:26:58','2024-11-20 03:26:58'),(18,'photos/WIN_20241120_12_16_10_Pro_WAlAyN8.jpg',NULL,NULL,'2024-11-20 03:32:27','2024-11-20 03:32:27'),(19,'photos/WIN_20241120_12_16_10_Pro_zQam2Fx.jpg',NULL,NULL,'2024-11-20 03:35:50','2024-11-20 03:35:50'),(20,'photos/WIN_20241120_12_16_10_Pro_SXTBrvM.jpg',NULL,NULL,'2024-11-20 03:36:51','2024-11-20 03:36:51'),(21,'photos/WIN_20241120_12_16_10_Pro_vY85ugo.jpg',NULL,NULL,'2024-11-20 03:37:54','2024-11-20 03:37:54'),(22,'photos/WIN_20241120_12_16_10_Pro_olxXPep.jpg',NULL,NULL,'2024-11-21 00:25:39','2024-11-21 00:25:39'),(23,'photos/Image_1.jpg',NULL,NULL,'2024-11-21 00:31:26','2024-11-21 00:31:26'),(24,'photos/Image_1_T02lI8O.jpg',NULL,NULL,'2024-11-21 00:35:17','2024-11-21 00:35:17'),(25,'photos/Image_2.jpg',NULL,NULL,'2024-11-21 00:40:55','2024-11-21 00:40:55');
/*!40000 ALTER TABLE `form_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapp_quest`
--

DROP TABLE IF EXISTS `formapp_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapp_quest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `deadline` date NOT NULL,
  `requester` varchar(100) NOT NULL,
  `prefecture` varchar(100) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `reward` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapp_quest`
--

LOCK TABLES `formapp_quest` WRITE;
/*!40000 ALTER TABLE `formapp_quest` DISABLE KEYS */;
INSERT INTO `formapp_quest` VALUES (1,'q','q','2024-11-21','q','北海道','銀行振込','1'),(2,'q','q','2024-11-21','q','北海道','銀行振込','1'),(3,'a','a','2024-10-31','a','北海道','銀行振込','1'),(4,'a','a','2024-11-05','a','北海道','クレジットカード','1'),(5,'a','a','2024-11-21','a','北海道','銀行振込','1'),(6,'a','a','2024-11-15','a','北海道','銀行振込','1'),(7,'a','a','2024-10-31','a','北海道','クレジットカード','1'),(8,'あ','あ','2024-11-14','ありがとうございます。','山梨県','銀行振込','1'),(9,'ありがとうございます。あ','あ','2024-11-13','あ','北海道','銀行振込','1'),(10,'a','a','2024-11-14','a','山形県','銀行振込','1'),(11,'a','a','2024-11-01','a','北海道','銀行振込','1'),(12,'a','a','2024-11-07','a','北海道','銀行振込','1'),(13,'a','a','2024-11-14','a','北海道','銀行振込','1'),(14,'a','a','2024-11-06','a','北海道','銀行振込','1'),(15,'a','a','2024-11-13','a','北海道','銀行振込','1'),(16,'a','a','2024-11-07','a','北海道','銀行振込','1'),(17,'a','a','2024-10-30','a','北海道','銀行振込','1'),(18,'a','a','2024-11-06','a','北海道','銀行振込','1'),(19,'ありがとうございました。あ','あ','2024-11-07','あ','北海道','銀行振込','1'),(20,'a','a','2024-11-07','a','北海道','銀行振込','1'),(21,'a','a','2024-11-21','a','北海道','銀行振込','1'),(22,'a','a','2024-11-01','a','北海道','銀行振込','1'),(23,'a','a','2024-10-30','a','北海道','銀行振込','1'),(24,'a','a','2024-11-13','a','北海道','銀行振込','1'),(25,'a','a','2024-11-06','a','北海道','銀行振込','1'),(26,'ありがとうございます。','あ','2024-11-14','あ','北海道','銀行振込','1'),(27,'あ','あ','2024-11-15','あ','北海道','銀行振込','1'),(28,'a','a','2024-11-14','a','北海道','銀行振込','1'),(29,'あ','あ','2024-11-18','ああ','北海道','銀行振込','1'),(30,'a','a','2024-10-31','a','北海道','銀行振込','1'),(31,'あ','あ','2024-11-07','あ','北海道','銀行振込','1'),(32,'あ','あ','2024-11-26','あ','北海道','銀行振込','1'),(33,'a','a','2024-11-21','a','北海道','銀行振込','1'),(34,'あ','あ','2024-11-13','あ','北海道','銀行振込','1'),(35,'あ','あ','2024-11-07','あ','北海道','銀行振込','1'),(36,'1127','1127','2024-11-27','1127','0','銀行振込','1'),(37,'a','a','2024-11-20','a','0','銀行振込','1'),(38,'あ','あ','2024-11-15','あ','0','銀行振込','1'),(39,'テスト','ああ','2024-11-11','あ','0','銀行振込','1'),(40,'わ','ああ','2024-11-07','あ','0','銀行振込','1'),(41,'あ','あ','2024-11-14','ああ','0','銀行振込','1'),(42,'た','ああ','2024-11-12','ああ','0','銀行振込','1'),(43,'テスト','あ','2024-11-22','あ','0','銀行振込','1'),(44,'添付写真','あ','2024-11-29','あ','0','銀行振込','1'),(45,'あああああああああ','あ','2024-11-19','あ','0','銀行振込','1'),(46,'あ','ああ','2024-11-21','あ','0','銀行振込','1'),(47,'あ','あ','2024-11-20','ああ','0','銀行振込','1'),(48,'aaa','aaa','2024-11-14','aaa','0','銀行振込','1'),(49,'a','a','2025-01-29','a','0','銀行振込','1'),(50,'a','a','2025-01-18','a','0','銀行振込','1'),(51,'ｙ','ｙ','2025-01-28','ｙｙ','0','銀行振込','1'),(52,'ｚ','あ','2025-01-23','ざ','0','銀行振込','1');
/*!40000 ALTER TABLE `formapp_quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapp_questregister`
--

DROP TABLE IF EXISTS `formapp_questregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapp_questregister` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `answer_photo` varchar(100) NOT NULL,
  `additional_notes` longtext NOT NULL,
  `quest_id_id` bigint DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formapp_questregister_quest_id_id_37c3a049_fk_formapp_quest_id` (`quest_id_id`),
  CONSTRAINT `formapp_questregister_quest_id_id_37c3a049_fk_formapp_quest_id` FOREIGN KEY (`quest_id_id`) REFERENCES `formapp_quest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapp_questregister`
--

LOCK TABLES `formapp_questregister` WRITE;
/*!40000 ALTER TABLE `formapp_questregister` DISABLE KEYS */;
INSERT INTO `formapp_questregister` VALUES (39,'ああ','あ','quest_photos/aaa_QtniaKt.jpg','あ',45,35.698836111111106,139.75804166666666),(40,'ああ','あ','quest_photos/aaa_q4S3dmz.jpg','あああ',46,35.698836111111106,139.75804166666666),(41,'あ','あ','quest_photos/aaa_gnqK5IJ.jpg','あ',47,35.698836111111106,139.75804166666666),(42,'aaa','aaa','quest_photos/aaa_MULHy1k.jpg','aaa',48,35.698836111111106,139.75804166666666),(43,'a','a','quest_photos/aaa_rjurSaX.jpg','a',49,35.698836111111106,139.75804166666666),(44,'a','a','quest_photos/aaa_foGqlwv.jpg','a',50,35.698836111111106,139.75804166666666),(45,'a','a','quest_photos/aaa_qxbxfzS.jpg','a',50,35.698836111111106,139.75804166666666),(46,'ｆ','ｆ','quest_photos/aaa.jpg','y',51,35.698836111111106,139.75804166666666),(47,'あ','あ','quest_photos/aaa.jpg','ああ',52,35.698836111111106,139.75804166666666);
/*!40000 ALTER TABLE `formapp_questregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_questrequest`
--

DROP TABLE IF EXISTS `team_questrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_questrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `deadline` date NOT NULL,
  `requester` varchar(100) NOT NULL,
  `prefecture` varchar(50) NOT NULL,
  `payment` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_questrequest`
--

LOCK TABLES `team_questrequest` WRITE;
/*!40000 ALTER TABLE `team_questrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_questrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userquest_coupon`
--

DROP TABLE IF EXISTS `userquest_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userquest_coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `coupon_description` longtext,
  `used_at` datetime(6) NOT NULL,
  `quest_id_id` bigint NOT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `userquest_coupon_quest_id_id_c08b2fa1_fk_formapp_quest_id` (`quest_id_id`),
  CONSTRAINT `userquest_coupon_quest_id_id_c08b2fa1_fk_formapp_quest_id` FOREIGN KEY (`quest_id_id`) REFERENCES `formapp_quest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userquest_coupon`
--

LOCK TABLES `userquest_coupon` WRITE;
/*!40000 ALTER TABLE `userquest_coupon` DISABLE KEYS */;
INSERT INTO `userquest_coupon` VALUES (1,'ｚ の報酬クーポン','2025-01-24 01:08:23.981689',52);
/*!40000 ALTER TABLE `userquest_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userquest_photosubmission`
--

DROP TABLE IF EXISTS `userquest_photosubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userquest_photosubmission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userquest_photosubmission`
--

LOCK TABLES `userquest_photosubmission` WRITE;
/*!40000 ALTER TABLE `userquest_photosubmission` DISABLE KEYS */;
INSERT INTO `userquest_photosubmission` VALUES (1,'photos/aaa_n2g0Gk0.jpg',35.698836111111106,139.75804166666666,'2024-11-29 01:47:43.734802'),(2,'photos/aaa_sKi9ZM1.jpg',35.698836111111106,139.75804166666666,'2025-01-16 04:50:55.982180'),(3,'photos/aaa_MAOrlWP.jpg',35.698836111111106,139.75804166666666,'2025-01-16 04:51:09.473009'),(4,'photos/aaa_B0wYD6O.jpg',35.698836111111106,139.75804166666666,'2025-01-17 00:39:45.245599'),(5,'photos/aaa.jpg',35.698836111111106,139.75804166666666,'2025-01-21 01:09:06.731671'),(6,'photos/aaa.jpg',35.698836111111106,139.75804166666666,'2025-01-24 01:07:17.715986'),(7,'photos/aaa_PGiuf7v.jpg',35.698836111111106,139.75804166666666,'2025-01-24 01:08:21.903981');
/*!40000 ALTER TABLE `userquest_photosubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userquest_questsubmission`
--

DROP TABLE IF EXISTS `userquest_questsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userquest_questsubmission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) NOT NULL,
  `quest_register_id` bigint NOT NULL,
  `quest_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `a_idx` (`quest_id`),
  KEY `i_idx` (`quest_register_id`),
  CONSTRAINT `e` FOREIGN KEY (`quest_register_id`) REFERENCES `formapp_questregister` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `u` FOREIGN KEY (`quest_id`) REFERENCES `formapp_quest` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userquest_questsubmission`
--

LOCK TABLES `userquest_questsubmission` WRITE;
/*!40000 ALTER TABLE `userquest_questsubmission` DISABLE KEYS */;
INSERT INTO `userquest_questsubmission` VALUES (9,0,43,49),(10,1,46,51),(11,1,47,52);
/*!40000 ALTER TABLE `userquest_questsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userquest_usercoupon`
--

DROP TABLE IF EXISTS `userquest_usercoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userquest_usercoupon` (
  `user_coupon_id` int NOT NULL AUTO_INCREMENT,
  `issued_at` datetime(6) NOT NULL,
  `coupon_status` tinyint(1) NOT NULL,
  `coupon_id_id` int NOT NULL,
  `user_account_id_id` bigint NOT NULL,
  PRIMARY KEY (`user_coupon_id`),
  KEY `userquest_usercoupon_coupon_id_id_476293f6_fk_userquest` (`coupon_id_id`),
  KEY `userquest_usercoupon_user_account_id_id_de67870b_fk_accounts_` (`user_account_id_id`),
  CONSTRAINT `userquest_usercoupon_coupon_id_id_476293f6_fk_userquest` FOREIGN KEY (`coupon_id_id`) REFERENCES `userquest_coupon` (`coupon_id`),
  CONSTRAINT `userquest_usercoupon_user_account_id_id_de67870b_fk_accounts_` FOREIGN KEY (`user_account_id_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userquest_usercoupon`
--

LOCK TABLES `userquest_usercoupon` WRITE;
/*!40000 ALTER TABLE `userquest_usercoupon` DISABLE KEYS */;
INSERT INTO `userquest_usercoupon` VALUES (1,'2025-01-24 01:08:24.010850',1,1,1);
/*!40000 ALTER TABLE `userquest_usercoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userquest_userquestnow`
--

DROP TABLE IF EXISTS `userquest_userquestnow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userquest_userquestnow` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completed` tinyint(1) NOT NULL,
  `quest_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `a_idx` (`user_id`),
  KEY `i_idx` (`quest_id`),
  CONSTRAINT `a` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `i` FOREIGN KEY (`quest_id`) REFERENCES `formapp_quest` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userquest_userquestnow`
--

LOCK TABLES `userquest_userquestnow` WRITE;
/*!40000 ALTER TABLE `userquest_userquestnow` DISABLE KEYS */;
INSERT INTO `userquest_userquestnow` VALUES (1,0,49,1),(2,0,51,1),(3,0,52,1);
/*!40000 ALTER TABLE `userquest_userquestnow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-28  9:35:06
