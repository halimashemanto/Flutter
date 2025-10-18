-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chamber` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `study` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt1f6cueqyjwx5ghew9ar1exe3` (`user_id`),
  CONSTRAINT `FKe9pf5qtxxkdyrwibaevo9frtk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,NULL,NULL,'suhaib@gmail.com','male',NULL,'Suhaib',NULL,'Suhaib_aab4b40d-7feb-4f07-a028-313e0efefb02',NULL,NULL,6),(2,'fgdx','fdfd','ds@dg','FEMALE','2025-07-29','dfgd','ffhb','dfgd_99173e7b-8c39-49a6-a68a-24b62d2f0567','hbfdg','fdg',8),(3,'fgdx','fdfd','ds@dg','FEMALE','2025-07-29','dfgd','ffhb','dfgd_efc6ec53-e28d-4808-bde9-55182877fa5a','hbfdg','fdg',9),(4,'fgdx','fdfd','ds@dg','FEMALE','2025-07-29','dfgd','ffhb','dfgd_70758dc2-5a07-4381-876f-4b181a7f1b7d','hbfdg','fdg',10),(5,'fgdx','fdfd','ds@dg','FEMALE','2025-07-29','dfgd','ffhb','dfgd_0b2d14c0-d702-4d9e-bd4e-bb1ecfc1c019','hbfdg','fdg',11),(6,'fgdx','fdfd','ds@dg','FEMALE','2025-07-29','dfgd','ffhb','dfgd_348b29ad-5519-4157-a30c-d232fd18c13a','hbfdg','fdg',12),(7,'fgdx','fdfd','ds@dg','FEMALE','2025-07-29','dfgd','ffhb','dfgd_f725974a-b4ea-4c7a-8399-968b28dd92d1','hbfdg','fdg',13),(8,'fdx','xfgv','dgsz@fg','FEMALE','2025-07-29','D','fdgfd','D_37e864fc-374c-41af-985c-2cb4dde5183b','fdx','bfd',14),(9,'fdx','xfgv','dgsz@fg','FEMALE','2025-07-29','D','fdgfd','D_925cf514-d9d5-49a1-a669-daa8d710fb71','fdx','bfd',15),(10,'dz','dfz','dzfzds@gfh','FEMALE','2025-07-29','dfszd','dfzsf','dfszd_88135081-aad3-4311-89fe-84463941844c','zfzd','dzf',16),(11,'dz','dfz','dzfzds@gfh','FEMALE','2025-07-29','dfszd','dfzsf','dfszd_dddc0300-9480-4ad1-b739-574828a3b4cc','zfzd','dzf',17),(12,'dz','dfz','dzfzds@gfh','FEMALE','2025-07-29','dfszd','dfzsf','dfszd_3fc95b66-8655-4f3c-8176-74c5a01bca5e','zfzd','dzf',18);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shift` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `nurse_type` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `working_hours` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKml2dkuvlx0yrr9ajhb9hx5sxl` (`user_id`),
  CONSTRAINT `FK91rtea8eoy5devpkpwuqsjk7c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `admitted_date` date DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9tbsl3fmey0eofbm2xj69v4qs` (`user_id`),
  CONSTRAINT `FKuwca24wcd1tg6pjex8lmc0y7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receptionists`
--

DROP TABLE IF EXISTS `receptionists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receptionists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK462u8yi0c8wlnaiu9psryhtwh` (`user_id`),
  CONSTRAINT `FKq3ssn9a7reu88v2rnejl6vmte` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionists`
--

LOCK TABLES `receptionists` WRITE;
/*!40000 ALTER TABLE `receptionists` DISABLE KEYS */;
INSERT INTO `receptionists` VALUES (1,NULL,'sufu@gmail.com','male',NULL,'Suhaib',NULL,'Suhaib_0cec3bb5-e937-4819-94b3-94d630710e24',NULL,7);
/*!40000 ALTER TABLE `receptionists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','Doctor','Nurse','Patient','Receptionist') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mdatiqulislam59@gmail.com','Atik','1234',NULL,'Atik_56e8e9cd-ecfe-4298-b80e-3a97e221f107',NULL),(2,'suprovashemanto@gmail.com','Shemanto','12345','0123456789','Shemanto_200160c6-0807-41c1-a7d9-4311f3b1dab2','Doctor'),(3,'kzaman24@gmail.com','Zaman','12345','0123456789','Zaman_1508ecbf-69a0-424e-b65d-884ec643ef3b','Doctor'),(4,'suprovashemanto@gmail.com','Shemanto','12345','0123456789','Shemanto_b4e6a0ac-b91d-4d52-908f-e99e0d12f9e8','ADMIN'),(5,'suhaib@gmail.com','Suhaib','12345','0123456789','Suhaib_f610e8d4-da82-4c15-a40d-ecb37bb88d5b','ADMIN'),(6,'suhaib@gmail.com','Suhaib','12345','123654789','Suhaib_3b111a35-0c25-43d4-b4ac-eb0837abeaf4','Doctor'),(7,'safu@gmail.com','Suhaib','12345','123654789','Suhaib_56bc300d-7aeb-4220-8d80-043fa165086c','Receptionist'),(8,'ds@dg','dfgd','fhf','ffhb','dfgd_bb70c428-03c8-43ea-af13-af42c92d026d','Doctor'),(9,'ds@dg','dfgd','fhf','ffhb','dfgd_037dc9d2-344c-4f62-ab13-d5447f0ee7d7','Doctor'),(10,'ds@dg','dfgd','fhf','ffhb','dfgd_8ecb6ae8-d104-4d01-ab8c-eab9558c814c','Doctor'),(11,'ds@dg','dfgd','fhf','ffhb','dfgd_ad41c239-2e52-4d21-86d6-db2edcc97576','Doctor'),(12,'ds@dg','dfgd','fhf','ffhb','dfgd_a6178809-acd8-432a-9872-e7d2e7807e09','Doctor'),(13,'ds@dg','dfgd','fhf','ffhb','dfgd_defb3721-0997-4dc6-a7a0-bbbb8f0206f0','Doctor'),(14,'dgsz@fg','D','fgvf','fdgfd','D_ebbd352a-ed67-478e-9b4b-0776df78393c','Doctor'),(15,'dgsz@fg','D','fgvf','fdgfd','D_1b7634c6-3739-4d29-80d0-57646041c489','Doctor'),(16,'dzfzds@gfh','dfszd','zdf','dfzsf','dfszd_b94a1d9d-966a-4b8b-a492-28960af90a96','Doctor'),(17,'dzfzds@gfh','dfszd','zdf','dfzsf','dfszd_14216fd5-0862-4847-a4db-9043f5297ae3','Doctor'),(18,'dzfzds@gfh','dfszd','zdf','dfzsf','dfszd_13ace602-0eee-4229-a3f5-cd106fe66abe','Doctor');
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

-- Dump completed on 2025-07-29 18:49:54
