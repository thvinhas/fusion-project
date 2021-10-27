-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: fusion-project
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (3917,'Belfast',NULL,NULL),(3953,'Kerry',NULL,NULL),(3955,'Cork',NULL,NULL),(3956,'Wexford',NULL,NULL),(3966,'Offaly',NULL,NULL),(3969,'Dublin',NULL,NULL),(3970,'Mayo',NULL,NULL),(3978,'Donegal',NULL,NULL),(3985,'Galway',NULL,NULL),(3986,'teste','2021-10-26 13:14:03','2021-10-26 13:14:03');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (24,'2014_10_12_000000_create_users_table',1),(25,'2014_10_12_100000_create_password_resets_table',1),(26,'2019_08_19_000000_create_failed_jobs_table',1),(27,'2019_12_14_000001_create_personal_access_tokens_table',1),(28,'2021_10_24_132404_create_locations_table',1),(29,'2021_10_24_141829_create_weather_table',1),(30,'2021_10_27_013406_update_table_user',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `eircode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'vinhas.thiago@gmail.com',NULL,'$2y$10$z9y3gnE17c6y58.NCu/1yej6r1StAxsgu2axWQ14t7yEXmaR/4r72',NULL,'2021-10-26 13:03:28','2021-10-26 13:03:28','D07Y169'),(11,'at@at',NULL,'$2y$10$B7.n7xOd2yC1ZgirXYGRteoBchPtnTntGntM50vS29LSM3W4p6aRC',NULL,'2021-10-27 15:16:58','2021-10-27 15:16:58','at');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `day_num` int(11) DEFAULT NULL,
  `date_check` date DEFAULT NULL,
  `min_temp` int(11) DEFAULT NULL,
  `max_temp` int(11) DEFAULT NULL,
  `weather` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weather_night` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weather_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weather_textN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wind_speed` int(11) DEFAULT NULL,
  `wind_dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wind_speed_night` int(11) DEFAULT NULL,
  `wind_dir_night` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weather_location_id_foreign` (`location_id`),
  CONSTRAINT `weather_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (11,3969,14,'2018-11-14',11,14,'05d.png','04.png','MEDIUM_RAIN_SHOWERS','GREYCLOUD',25,'SSW',25,'SSW'),(12,3969,15,'2018-11-15',5,15,'05d.png','02n.png','MEDIUM_RAIN_SHOWERS','SUN_WITH_LIGHT_CLOUD',25,'SSE',10,'SE'),(13,3969,16,'2018-11-16',11,14,'04.png','04.png','GREYCLOUD','GREYCLOUD',25,'SSE',20,'SE'),(14,3969,17,'2018-11-17',8,12,'05d.png','01n.png','MEDIUM_RAIN_SHOWERS','CLEAR_WEATHER_SUN',20,'ESE',20,'ESE'),(15,3969,18,'2018-11-18',8,11,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',20,'E',25,'E'),(16,3956,14,'2018-11-14',12,13,'46.png','04.png','LIGHT_RAIN','GREYCLOUD',40,'SSW',30,'SSW'),(17,3956,15,'2018-11-15',10,14,'05d.png','03n.png','MEDIUM_RAIN_SHOWERS','SUN_WITH_GREY_CLOUD',30,'SSW',20,'SW'),(18,3956,16,'2018-11-16',11,13,'04.png','04.png','GREYCLOUD','GREYCLOUD',25,'SSE',25,'SE'),(19,3956,17,'2018-11-17',8,12,'03d.png','01n.png','SUN_WITH_GREY_CLOUD','CLEAR_WEATHER_SUN',25,'ESE',25,'ESE'),(20,3956,18,'2018-11-18',8,11,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',25,'ENE',25,'ENE'),(22,3955,15,'2018-11-15',6,13,'46.png','02n.png','LIGHT_RAIN','SUN_WITH_LIGHT_CLOUD',25,'SSW',20,'SSE'),(23,3955,16,'2018-11-16',12,13,'04.png','04.png','GREYCLOUD','GREYCLOUD',25,'SE',25,'SE'),(24,3955,17,'2018-11-17',9,13,'46.png','03n.png','DRIZZLE','SUN_WITH_GREY_CLOUD',20,'ESE',20,'ESE'),(25,3955,18,'2018-11-18',8,11,'02d.png','02n.png','SUN_WITH_LIGHT_CLOUD','SUN_WITH_LIGHT_CLOUD',25,'E',20,'E'),(26,3953,14,'2018-11-14',11,14,'46.png','09.png','LIGHT_RAIN','MEDIUM_RAIN',40,'SSW',40,'SSW'),(27,3953,15,'2018-11-15',10,12,'46.png','02n.png','LIGHT_RAIN','SUN_WITH_LIGHT_CLOUD',30,'SW',30,'SSE'),(28,3953,16,'2018-11-16',11,14,'04.png','04.png','GREYCLOUD','GREYCLOUD',35,'SSE',30,'SE'),(29,3953,17,'2018-11-17',9,13,'04.png','02n.png','GREYCLOUD','SCATTERED_CLOUDS',30,'SE',30,'ESE'),(30,3953,18,'2018-11-18',7,12,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',25,'ESE',20,'E'),(31,3985,14,'2018-11-14',12,15,'10.png','10.png','HEAVY_RAIN','HEAVY_RAIN',30,'SSW',25,'SSW'),(32,3985,15,'2018-11-15',6,12,'46.png','01n.png','LIGHT_RAIN','CLEAR_WEATHER_SUN',25,'SSE',15,'SE'),(33,3985,16,'2018-11-16',12,14,'03d.png','04.png','SUN_WITH_GREY_CLOUD','GREYCLOUD',20,'ESE',20,'ESE'),(34,3985,17,'2018-11-17',6,14,'04.png','01n.png','GREYCLOUD','CLEAR_WEATHER_SUN',25,'ESE',20,'ESE'),(35,3985,18,'2018-11-18',5,11,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',20,'ESE',20,'E'),(36,3978,14,'2018-11-14',12,14,'46.png','46.png','LIGHT_RAIN','LIGHT_RAIN',30,'SSW',30,'SSE'),(37,3978,15,'2018-11-15',6,13,'46.png','01n.png','LIGHT_RAIN','CLEAR_WEATHER_SUN',30,'SSW',20,'SSW'),(38,3978,16,'2018-11-16',11,13,'02d.png','04.png','SCATTERED_CLOUDS','GREYCLOUD',25,'SE',25,'SE'),(39,3978,17,'2018-11-17',7,13,'04.png','02n.png','GREYCLOUD','SCATTERED_CLOUDS',30,'SE',25,'ESE'),(40,3978,18,'2018-11-18',6,10,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',25,'ESE',25,'E'),(41,3966,14,'2018-11-14',12,14,'05d.png','46.png','MEDIUM_RAIN_SHOWERS','DRIZZLE',30,'SSW',25,'SSE'),(42,3966,15,'2018-11-15',6,14,'46.png','02n.png','LIGHT_RAIN','SCATTERED_CLOUDS',25,'SSE',20,'SE'),(43,3966,16,'2018-11-16',11,13,'04.png','04.png','GREYCLOUD','GREYCLOUD',25,'SSE',25,'SE'),(44,3966,17,'2018-11-17',6,13,'04.png','02n.png','GREYCLOUD','SCATTERED_CLOUDS',25,'SE',20,'ESE'),(45,3966,18,'2018-11-18',5,10,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',20,'ESE',15,'E'),(46,3970,14,'2018-11-14',12,14,'09.png','10.png','MEDIUM_RAIN','HEAVY_RAIN',30,'SSW',30,'SSW'),(47,3970,15,'2018-11-15',6,11,'09.png','01n.png','MEDIUM_RAIN','CLEAR_WEATHER_SUN',25,'SSE',20,'SE'),(48,3970,16,'2018-11-16',11,14,'03d.png','04.png','SUN_WITH_GREY_CLOUD','GREYCLOUD',25,'SE',25,'SE'),(49,3970,17,'2018-11-17',5,13,'04.png','02n.png','GREYCLOUD','SCATTERED_CLOUDS',25,'SE',20,'ESE'),(50,3970,18,'2018-11-18',6,10,'01d.png','01n.png','CLEAR_WEATHER_SUN','CLEAR_WEATHER_SUN',20,'ESE',20,'ESE'),(51,3917,14,'2018-11-14',11,13,'05d.png','04.png','MEDIUM_RAIN_SHOWERS','GREYCLOUD',30,'SSW',30,'SSW'),(52,3917,15,'2018-11-15',6,14,'05d.png','02n.png','MEDIUM_RAIN_SHOWERS','SCATTERED_CLOUDS',30,'SSE',15,'SW'),(53,3917,16,'2018-11-16',9,13,'04.png','04.png','GREYCLOUD','GREYCLOUD',20,'SE',20,'SE'),(54,3917,17,'2018-11-17',7,10,'04.png','01n.png','GREYCLOUD','CLEAR_WEATHER_SUN',20,'ESE',25,'ESE'),(55,3917,18,'2018-11-18',7,10,'01d.png','02n.png','CLEAR_WEATHER_SUN','SCATTERED_CLOUDS',25,'ESE',25,'E'),(56,3917,NULL,'1995-12-01',1,1,NULL,NULL,NULL,NULL,1,'N',1,'N'),(57,3917,NULL,'1955-06-02',1,1,NULL,NULL,NULL,NULL,1,'S',1,'N'),(59,3917,NULL,'1995-06-02',0,0,NULL,NULL,NULL,NULL,0,'N',1,'N');
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fusion-project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-27 17:41:24
