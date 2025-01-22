-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: teamproject
-- ------------------------------------------------------
-- Server version	9.1.0

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-28 02:00:24.205842'),(2,'contenttypes','0002_remove_content_type_name','2024-11-28 02:00:24.296381'),(3,'auth','0001_initial','2024-11-28 02:00:24.598532'),(4,'auth','0002_alter_permission_name_max_length','2024-11-28 02:00:24.662075'),(5,'auth','0003_alter_user_email_max_length','2024-11-28 02:00:24.670092'),(6,'auth','0004_alter_user_username_opts','2024-11-28 02:00:24.676971'),(7,'auth','0005_alter_user_last_login_null','2024-11-28 02:00:24.685487'),(8,'auth','0006_require_contenttypes_0002','2024-11-28 02:00:24.689495'),(9,'auth','0007_alter_validators_add_error_messages','2024-11-28 02:00:24.695501'),(10,'auth','0008_alter_user_username_max_length','2024-11-28 02:00:24.703506'),(11,'auth','0009_alter_user_last_name_max_length','2024-11-28 02:00:24.710183'),(12,'auth','0010_alter_group_name_max_length','2024-11-28 02:00:24.730381'),(13,'auth','0011_update_proxy_permissions','2024-11-28 02:00:24.739642'),(14,'auth','0012_alter_user_first_name_max_length','2024-11-28 02:00:24.746645'),(15,'accounts','0001_initial','2024-11-28 02:00:25.133198'),(16,'accounts','0002_alter_customuser_groups_and_more','2024-11-28 02:00:25.148192'),(17,'admin','0001_initial','2024-11-28 02:00:25.282167'),(18,'admin','0002_logentry_remove_auto_add','2024-11-28 02:00:25.289569'),(19,'admin','0003_logentry_add_action_flag_choices','2024-11-28 02:00:25.296158'),(27,'formapp','0001_initial','2024-11-28 02:01:16.661334'),(28,'formapp','0002_quest_delete_questrequest','2024-11-28 02:01:16.698132'),(29,'formapp','0003_questregister_alter_quest_payment_and_more','2024-11-28 02:01:16.812543'),(30,'formapp','0004_remove_questregister_hours_and_more','2024-11-28 02:01:16.937455'),(31,'formapp','0005_alter_questregister_quest_id','2024-11-28 02:01:17.110343'),(32,'formapp','0006_alter_questregister_quest_id','2024-11-28 02:01:17.239954'),(33,'formapp','0007_questregister_latitude_questregister_longitude','2024-11-28 02:01:17.277584'),(34,'sessions','0001_initial','2024-11-28 02:35:10.893249'),(36,'formapp','0004_questregister_latitude_questregister_longitude','2024-11-28 05:23:53.700355'),(37,'formapp','0008_merge_20241126_1233','2024-11-28 05:23:53.707126'),(46,'team','0001_initial','2024-11-29 01:15:01.755824'),(47,'userquest','0001_initial','2024-11-29 01:15:17.634069'),(48,'userquest','0002_questsubmission_userquestnow','2024-11-29 03:39:15.752252');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-21 10:39:33
