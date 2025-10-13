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
-- Table structure for table `admit_patient_invoice`
--

DROP TABLE IF EXISTS `admit_patient_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admit_patient_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admit_patient_invoice`
--

LOCK TABLES `admit_patient_invoice` WRITE;
/*!40000 ALTER TABLE `admit_patient_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `admit_patient_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admitted_patients`
--

DROP TABLE IF EXISTS `admitted_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitted_patients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admission_date` datetime(6) DEFAULT NULL,
  `discharge_date` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `treatment_plan` varchar(255) DEFAULT NULL,
  `bed_id` bigint DEFAULT NULL,
  `bed_booking_id` bigint DEFAULT NULL,
  `bill_id` bigint DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `ward_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKrql2vpquruswvamb3o39cbcti` (`bill_id`),
  KEY `FK8slaqwk2yqvv0yqjoqb3u71s1` (`bed_id`),
  KEY `FKdp7oihvxeikgvsfjs0nm3nk53` (`bed_booking_id`),
  KEY `FKjd1ytbsew82tgasga0s9tacvc` (`department_id`),
  KEY `FKqs4j0lwk8608t8prdc9nch9cf` (`doctor_id`),
  KEY `FK4ll91f8xs8fcdrlyd7cq669ho` (`ward_id`),
  CONSTRAINT `FK4ll91f8xs8fcdrlyd7cq669ho` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`),
  CONSTRAINT `FK8slaqwk2yqvv0yqjoqb3u71s1` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`),
  CONSTRAINT `FKdp7oihvxeikgvsfjs0nm3nk53` FOREIGN KEY (`bed_booking_id`) REFERENCES `bed_bookings` (`id`),
  CONSTRAINT `FKjd1ytbsew82tgasga0s9tacvc` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `FKqs4j0lwk8608t8prdc9nch9cf` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `FKtkug11255ak0lhw0xlvd8f92s` FOREIGN KEY (`bill_id`) REFERENCES `billing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitted_patients`
--

LOCK TABLES `admitted_patients` WRITE;
/*!40000 ALTER TABLE `admitted_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `admitted_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appoinments`
--

DROP TABLE IF EXISTS `appoinments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appoinments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `patient_contact` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  `slot_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr99muiirrabuqc6hk3vb397bp` (`department_id`),
  KEY `FKip2dkbjrdf0otyhfwr1709iba` (`doctor_id`),
  KEY `FK3ymt1lgnm588xuqr09fskag56` (`slot_id`),
  CONSTRAINT `FK3ymt1lgnm588xuqr09fskag56` FOREIGN KEY (`slot_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `FKip2dkbjrdf0otyhfwr1709iba` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `FKr99muiirrabuqc6hk3vb397bp` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinments`
--

LOCK TABLES `appoinments` WRITE;
/*!40000 ALTER TABLE `appoinments` DISABLE KEYS */;
INSERT INTO `appoinments` VALUES (1,'012365477844','Atiqul Islam','Regular checkup',1,1,1),(2,'0123698745','Ratri mollik','Regular checkup',1,1,2),(3,'05644198','imran','Regular checkup',2,5,3),(4,'0564141414141','Rahim khan','Regular checkup',1,4,10),(5,'05644198','Atiqul Islam','Regular checkup',1,1,19),(6,'05644198','Atiqul Islam','Regular checkup',1,3,15),(7,'05644198','Atiqul Islam','Regular checkup',1,1,20),(8,'05644198','Atiqul Islam','Regular checkup',1,1,21),(9,'0123456789','Porosh Moni','Regular checkup',2,2,6);
/*!40000 ALTER TABLE `appoinments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_bookings`
--

DROP TABLE IF EXISTS `bed_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed_bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `admission_date` datetime(6) DEFAULT NULL,
  `age` int NOT NULL,
  `brought_by` varchar(255) DEFAULT NULL,
  `discharge_date` datetime(6) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total_charge` double NOT NULL,
  `admitted_patient_id` bigint DEFAULT NULL,
  `bed_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4xso2lb6lvww2ny7ujxbwvvyy` (`admitted_patient_id`),
  KEY `FK472cgissype8afuny2sjqxw0t` (`bed_id`),
  CONSTRAINT `FK472cgissype8afuny2sjqxw0t` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`),
  CONSTRAINT `FK4xso2lb6lvww2ny7ujxbwvvyy` FOREIGN KEY (`admitted_patient_id`) REFERENCES `admitted_patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_bookings`
--

LOCK TABLES `bed_bookings` WRITE;
/*!40000 ALTER TABLE `bed_bookings` DISABLE KEYS */;
INSERT INTO `bed_bookings` VALUES (1,'Azimpur Dhaka','2025-09-11 06:00:00.000000',8,'Father','2025-09-20 06:00:00.000000','Orpa','017123456789',1500,NULL,1),(2,'Lalbagh Dhaka ','2025-09-11 06:00:00.000000',42,'Husband','2025-09-17 06:00:00.000000','Soniya ','019123456789',2200,NULL,5),(3,'Muladi','2025-09-11 06:00:00.000000',28,'Wife','2025-09-18 06:00:00.000000','Rahim Khan','017123987456',2200,NULL,8),(4,'afcdasc','2025-09-17 06:00:00.000000',33,'csdc','2025-09-30 06:00:00.000000','Muladi','1025156',2200,NULL,6),(5,'tfgh','2025-09-20 06:00:00.000000',52,'yt',NULL,'drd','e723',1500,NULL,1),(6,'Bhola ','2025-09-25 06:00:00.000000',30,'Brother',NULL,'Atiq','0198746223',7800,NULL,12),(7,'sdfds','2025-09-30 06:00:00.000000',2,'sdfv',NULL,'df','3',1500,NULL,1);
/*!40000 ALTER TABLE `bed_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beds`
--

DROP TABLE IF EXISTS `beds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beds` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bed_number` varchar(255) DEFAULT NULL,
  `is_occupied` bit(1) NOT NULL,
  `price_per_day` double NOT NULL,
  `ward_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKccoswfceny9biqfp1jkcpcrqy` (`ward_id`),
  CONSTRAINT `FKccoswfceny9biqfp1jkcpcrqy` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beds`
--

LOCK TABLES `beds` WRITE;
/*!40000 ALTER TABLE `beds` DISABLE KEYS */;
INSERT INTO `beds` VALUES (1,'101',_binary '',1500,1),(2,'102-C',_binary '\0',1500,1),(3,'103-C',_binary '\0',1500,1),(4,'104-C',_binary '\0',1500,1),(5,'201-F',_binary '\0',2200,2),(6,'202-F',_binary '\0',2200,2),(7,'203-F',_binary '\0',2200,2),(8,'301-M',_binary '\0',2200,3),(9,'302-M',_binary '\0',2200,3),(10,'303-M',_binary '\0',2200,3),(11,'304-M',_binary '\0',2200,3),(12,'VIP-901',_binary '',7800,4),(13,'VIP-902',_binary '\0',7800,4),(14,'VIP-903',_binary '\0',7800,4),(15,'1001-AA',_binary '\0',22000,5),(16,'1001-AB',_binary '\0',22000,5),(17,'1001-AC',_binary '\0',22000,5),(18,'416',_binary '\0',14654,6),(19,'105-C',_binary '\0',1500,1);
/*!40000 ALTER TABLE `beds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doctor_charge` double NOT NULL,
  `meal_cost` double NOT NULL,
  `medicine_cost` double NOT NULL,
  `other_charge` double NOT NULL,
  `test_cost` double NOT NULL,
  `total_cost` double NOT NULL,
  `ward_cost` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Cardiology','Diagnosis and treatment of heart and vascular conditions'),(2,'Urology','Diagnosis and treatment of Kidney and vascular conditions'),(3,'Neourology','Diagnosis and treatment of nerve and others conditions');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_charges`
--

DROP TABLE IF EXISTS `doctor_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_charges` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `admitted_patient_id` bigint DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `bed_booking_id` bigint DEFAULT NULL,
  `visit_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK23vncvgslcvslrv6la9qw1ea5` (`admitted_patient_id`),
  KEY `FKluop8hll5534l9rtwtjp8on8s` (`doctor_id`),
  KEY `FKlj3q05fr04986mwpfyma52u2j` (`bed_booking_id`),
  CONSTRAINT `FK23vncvgslcvslrv6la9qw1ea5` FOREIGN KEY (`admitted_patient_id`) REFERENCES `admitted_patients` (`id`),
  CONSTRAINT `FKlj3q05fr04986mwpfyma52u2j` FOREIGN KEY (`bed_booking_id`) REFERENCES `bed_bookings` (`id`),
  CONSTRAINT `FKluop8hll5534l9rtwtjp8on8s` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_charges`
--

LOCK TABLES `doctor_charges` WRITE;
/*!40000 ALTER TABLE `doctor_charges` DISABLE KEYS */;
INSERT INTO `doctor_charges` VALUES (1,150000,'Surgery ',NULL,3,1,'2025-09-17 06:00:00.000000'),(2,1000,'visiting',NULL,1,1,'2025-09-17 06:00:00.000000'),(3,2000,'Visiting',NULL,4,4,'2025-09-25 06:00:00.000000'),(4,80000,'Surgery',NULL,4,4,'2025-09-25 06:00:00.000000'),(5,1500,'dfgfd',NULL,1,1,'2025-09-30 06:00:00.000000'),(6,5265,'sgdr',NULL,2,1,'2025-09-30 06:00:00.000000');
/*!40000 ALTER TABLE `doctor_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chamber` varchar(255) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `join_date` datetime(6) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `study` varchar(255) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt1f6cueqyjwx5ghew9ar1exe3` (`user_id`),
  KEY `FKl2mro81neln9topymd898urh1` (`department_id`),
  CONSTRAINT `FKe9pf5qtxxkdyrwibaevo9frtk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKl2mro81neln9topymd898urh1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Health Care of Bangladesh','suprovashemanto@gmail.com','FEMALE','2025-09-11 06:00:00.000000','Prof. Suprova Shemanto','019100000000','Suprova_Shemanto_af0004d8-c684-4a52-b363-af756a10ce30','Specialists','MBBS',1,1),(2,'Health Care of Bangladesh','shemanto08101999@gmail.com','FEMALE','2025-09-15 06:00:00.000000','Prof. Shemanto','019236987451','zdxfcsd_42a9c0fb-5907-4fb3-b1d4-e054f271008b','Specialists','MBBS',2,2),(3,'Health Care of Bangladesh','mr.t.imran11@gmail.com','MALE','2025-09-15 06:00:00.000000','Prof. Imran Mia','01723456789','Prof._Imran_Mia_886c1603-8414-4bd1-9d71-74e3ea99833c','Specialists','MBBS',1,3),(4,'Health Care of Bangladesh','psadiar@gmail.com','MALE','2025-09-16 06:00:00.000000','Prof. Sadiar Rahman','01628195945','tfhft_e14b4011-5371-4aef-9aee-62672604accc','Specialists','MBBS',1,7),(5,'Health Care of Bangladesh','shemanto08101999@gmail.com','MALE','2025-09-16 06:00:00.000000','Prof. Eiasin Prodhan','016123456789','dxgvf_238296c0-ad17-44c1-9c5d-eff4cbd5dc92','Specialists','MBBS',2,8);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_patients`
--

DROP TABLE IF EXISTS `emergency_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_patients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admission_date` datetime(6) DEFAULT NULL,
  `admitted_to_ward` bit(1) NOT NULL,
  `brought_by` varchar(255) DEFAULT NULL,
  `condition_level` varchar(255) DEFAULT NULL,
  `immediate_treatment` varchar(255) DEFAULT NULL,
  `incident_details` varchar(255) DEFAULT NULL,
  `medical_history` varchar(255) DEFAULT NULL,
  `patient_address` varchar(255) DEFAULT NULL,
  `patient_age` int NOT NULL,
  `patient_contact` varchar(255) DEFAULT NULL,
  `patient_gender` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_patients`
--

LOCK TABLES `emergency_patients` WRITE;
/*!40000 ALTER TABLE `emergency_patients` DISABLE KEYS */;
INSERT INTO `emergency_patients` VALUES (1,'2025-09-25 06:00:00.000000',_binary '','Police','Critical','Oxigen','Dhanmondi','Bike accident','Muladi',33,'0198745632','Male','Abdur Rahim Khan','Active'),(2,'2025-09-25 06:00:00.000000',_binary '\0','Husband','Stable','Seline push','Fall down in Washroom','Injured in leg','Muladi ',34,'0198746600','Female','Fariha Moriam','Active');
/*!40000 ALTER TABLE `emergency_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `is_available` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ward_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqrl4hrotg1v3r9m6go6xeh65c` (`ward_id`),
  CONSTRAINT `FKqrl4hrotg1v3r9m6go6xeh65c` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'Facilities for newborns including incubators, NICU for premature infants.',_binary '\0','Neonatal Care',1),(2,'Educational and recreational activities to keep children engaged during long stays.',_binary '\0','Activity Room',1),(3,'Comfortable waiting area for parents/guardians, sometimes with play corner.',_binary '\0','Parent Waiting Lounge',1),(4,'Collection of safe toys that children can borrow/play during hospital stay.',_binary '\0','Sanitized Toy Library',1),(5,'Therapy services for child recovery, e.g., after surgery or injury.',_binary '\0','Pediatric Physiotherapy',1),(6,'Specialized emergency care for pediatric patients.',_binary '\0','Trauma Unit',1),(7,'Dedicated ward for pregnant women for labor, delivery, and postnatal care.',_binary '\0','Maternity Ward',2),(8,'Outpatient services for women’s health issues, reproductive health consultations.',_binary '\0','Gynecology Clinic',2),(9,'Support for newborns and mothers after delivery, lactation rooms.',_binary '\0','Neonatal & Mother Care',2),(10,'Emergency care specially designed for women, including obstetric emergencies.',_binary '\0','Women’s Emergency Unit',2),(11,'Emotional and mental health support specifically for women.',_binary '\0','Women Psychologist',2),(12,'Regular checkups, nutrition, and care programs for expecting and new mothers',_binary '\0','Prenatal & Postnatal Care',2);
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `delivery_time` int DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `due` double DEFAULT NULL,
  `invoice_date` datetime(6) DEFAULT NULL,
  `patient_contact` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `payable` double DEFAULT NULL,
  `prepared_by` varchar(255) DEFAULT NULL,
  `received` double DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4irx2uctk18dcfhpe6js6l1jw` (`doctor_id`),
  CONSTRAINT `FK4irx2uctk18dcfhpe6js6l1jw` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,880,'2025-09-16 18:26:56.585000',24,20,604,'2025-09-16 18:26:56.585000','fgvfdx','fgvf',704,NULL,100,_binary '\0',704,176,1),(2,880,'2025-09-18 17:49:30.870000',24,10,292,'2025-09-18 17:49:30.870000','fgvc','gfsdzf',792,NULL,500,_binary '\0',792,88,1),(3,880,'2025-09-20 19:15:00.321000',24,5,736,'2025-09-20 19:15:00.321000','4619','dzsgd',836,NULL,100,_binary '\0',836,44,1),(4,23280,'2025-09-30 14:42:03.454000',24,20,8624,'2025-09-30 14:42:03.454000','6498','atik',18624,NULL,10000,_binary '\0',18624,4656,1),(5,22480,'2025-09-30 17:30:52.220000',24,20,7984,'2025-09-30 17:30:52.220000','549','sdfsd',17984,NULL,10000,_binary '\0',17984,4496,1);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_masters`
--

DROP TABLE IF EXISTS `meal_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `meal_name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_masters`
--

LOCK TABLES `meal_masters` WRITE;
/*!40000 ALTER TABLE `meal_masters` DISABLE KEYS */;
INSERT INTO `meal_masters` VALUES (1,'Breakfast','Bread & Egg',NULL,150,'Set1','Bread '),(2,'Lunch','1 cup rice & Fish veg ',NULL,200,'Set2','Rice &Fish'),(3,'Dinner','2ps Bread & 1 cup ofveg',NULL,100,'Set3','Bread & veg'),(4,'Snack','Fruits Salad',NULL,400,'Special','Fruits Salad'),(5,'Snack','1cup of Milk & nut',NULL,150,'Diet','Diet ');
/*!40000 ALTER TABLE `meal_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `meal_cost` double NOT NULL,
  `meal_type` varchar(255) DEFAULT NULL,
  `served_at` datetime(6) DEFAULT NULL,
  `admitted_patient_id` bigint DEFAULT NULL,
  `bed_booking_id` bigint DEFAULT NULL,
  `meal_master_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqtunbuaqnsdo0kcvekdbit3hm` (`admitted_patient_id`),
  KEY `FKkagrnni3u4w7dc5wd8lf60ki4` (`bed_booking_id`),
  KEY `FKnmb5ip2nsv733l59ngj2lnm4n` (`meal_master_id`),
  CONSTRAINT `FKkagrnni3u4w7dc5wd8lf60ki4` FOREIGN KEY (`bed_booking_id`) REFERENCES `bed_bookings` (`id`),
  CONSTRAINT `FKnmb5ip2nsv733l59ngj2lnm4n` FOREIGN KEY (`meal_master_id`) REFERENCES `meal_masters` (`id`),
  CONSTRAINT `FKqtunbuaqnsdo0kcvekdbit3hm` FOREIGN KEY (`admitted_patient_id`) REFERENCES `admitted_patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,300,NULL,'2025-09-16 16:27:14.015000',NULL,2,3),(2,400,NULL,'2025-09-16 16:27:14.060000',NULL,2,4),(3,300,NULL,'2025-09-16 16:32:17.485000',NULL,1,3),(4,400,NULL,'2025-09-16 16:32:17.490000',NULL,1,4),(5,300,NULL,'2025-09-16 16:44:59.651000',NULL,3,3),(6,400,NULL,'2025-09-16 16:44:59.708000',NULL,3,4),(7,300,NULL,'2025-09-16 16:51:58.120000',NULL,2,3),(8,400,NULL,'2025-09-16 16:51:58.123000',NULL,2,4),(9,300,NULL,'2025-09-16 16:52:18.462000',NULL,2,3),(10,400,NULL,'2025-09-16 16:52:18.471000',NULL,2,4),(11,300,NULL,'2025-09-16 17:49:01.484000',NULL,1,3),(12,400,NULL,'2025-09-16 17:49:01.518000',NULL,1,4),(13,100,NULL,'2025-09-16 17:49:29.601000',NULL,1,1),(14,200,NULL,'2025-09-16 17:49:29.625000',NULL,1,2),(15,100,NULL,'2025-09-16 17:51:38.687000',NULL,3,1),(16,200,NULL,'2025-09-16 17:51:38.705000',NULL,3,2),(31,100,NULL,'2025-09-17 18:06:38.160000',NULL,3,1),(40,100,NULL,'2025-09-17 18:08:32.046000',NULL,2,1),(43,100,NULL,'2025-09-17 18:09:47.371000',NULL,1,1),(48,150,NULL,'2025-09-25 18:44:35.385000',NULL,4,1),(49,200,NULL,'2025-09-25 18:44:45.902000',NULL,4,2);
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_admited_patient`
--

DROP TABLE IF EXISTS `medicine_admited_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_admited_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apply_way` varchar(255) DEFAULT NULL,
  `medicine_cost` double NOT NULL,
  `medicine_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `admitted_patient_id` bigint DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `bed_booking_id` bigint DEFAULT NULL,
  `pharmacy_medicine_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaddl96e9es0m43s7uwk2klve1` (`admitted_patient_id`),
  KEY `FKfwjffnbqypohao5j8tas8gw3d` (`bed_booking_id`),
  KEY `FK73hbsd48ifdfxah8jkiosqipe` (`pharmacy_medicine_id`),
  CONSTRAINT `FK73hbsd48ifdfxah8jkiosqipe` FOREIGN KEY (`pharmacy_medicine_id`) REFERENCES `pharmacy_medicines` (`id`),
  CONSTRAINT `FKaddl96e9es0m43s7uwk2klve1` FOREIGN KEY (`admitted_patient_id`) REFERENCES `admitted_patients` (`id`),
  CONSTRAINT `FKfwjffnbqypohao5j8tas8gw3d` FOREIGN KEY (`bed_booking_id`) REFERENCES `bed_bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_admited_patient`
--

LOCK TABLES `medicine_admited_patient` WRITE;
/*!40000 ALTER TABLE `medicine_admited_patient` DISABLE KEYS */;
INSERT INTO `medicine_admited_patient` VALUES (1,'awklmk',300,NULL,20,NULL,'2025-09-17 15:41:45.769000',1,2),(2,'qwda',80,NULL,10,NULL,'2025-09-17 15:41:45.770000',1,1),(3,'fre',8,NULL,1,NULL,'2025-09-17 15:43:19.760000',1,1),(4,'ews',48,NULL,6,NULL,'2025-09-17 15:43:34.321000',1,1),(5,'dd',45,NULL,3,NULL,'2025-09-17 16:26:38.712000',2,2),(6,'zxd',16,NULL,2,NULL,'2025-09-17 16:26:38.712000',2,1);
/*!40000 ALTER TABLE `medicine_admited_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_stocks`
--

DROP TABLE IF EXISTS `medicine_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_stocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `purchase_price` double NOT NULL,
  `quantity` int NOT NULL,
  `pharmacy_medicine_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk4yo8p7fhl9k9co5mkig6lmij` (`pharmacy_medicine_id`),
  CONSTRAINT `FKk4yo8p7fhl9k9co5mkig6lmij` FOREIGN KEY (`pharmacy_medicine_id`) REFERENCES `pharmacy_medicines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_stocks`
--

LOCK TABLES `medicine_stocks` WRITE;
/*!40000 ALTER TABLE `medicine_stocks` DISABLE KEYS */;
INSERT INTO `medicine_stocks` VALUES (1,'123',NULL,'2025-10-11 06:00:00.000000',8,2370,1),(2,'124',NULL,'2025-10-11 06:00:00.000000',15,3200,2),(3,'1',NULL,'2025-10-11 06:00:00.000000',8,200,1),(4,'102',NULL,'2025-10-11 06:00:00.000000',8,100,1);
/*!40000 ALTER TABLE `medicine_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(255) DEFAULT NULL,
  `prescription_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrqhwsxfcnuyfqxueeitym2t4w` (`prescription_id`),
  CONSTRAINT `FKrqhwsxfcnuyfqxueeitym2t4w` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'Napa',26),(2,'Napa One',20),(3,'Ace',NULL),(4,'Aletrol',26),(5,'fgvfd',NULL),(6,'Rupa',26);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `nurse_type` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `working_hours` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKml2dkuvlx0yrr9ajhb9hx5sxl` (`user_id`),
  CONSTRAINT `FK91rtea8eoy5devpkpwuqsjk7c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (1,'Gopalgang','abdurrahimkhan214dc@gmail.com','MALE','2025-09-15','Rahim Khan','InternShip','019710564896','Rahim_Khan_2175c6c6-66a5-45ca-9029-231754f3545e','Morning','12',4),(2,'Jajira','imran@gmail.com','MALE','2025-09-16','Tushar ','Senior','018356419898','safcsdac_7e7365f3-b64a-4354-99fe-b06107c96c83','Morning','8',9),(3,'Shaymoli','sahrukh@gmail.com','MALE','2025-09-20','Rohmat Ullah','Senior','01963641865','rohmot_0674e89a-1e87-4e2d-b387-01e57157d29b','Morning','8',11),(4,'Azimpur','simki@gmail.com','FEMALE','2025-09-20','Simki Sanim','Junior','019123456789','afcsc_82f9ad7a-4f70-4b6e-874c-0e7af33f71d6','Evening','6',13);
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officestaffs`
--

DROP TABLE IF EXISTS `officestaffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officestaffs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `working_hours` varchar(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKegday3nfpmf46cy96wpfui5je` (`user_id`),
  CONSTRAINT `FKejf3exj78f3pn4vmf634l4cc1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officestaffs`
--

LOCK TABLES `officestaffs` WRITE;
/*!40000 ALTER TABLE `officestaffs` DISABLE KEYS */;
INSERT INTO `officestaffs` VALUES (1,'29','IT','sadiar@gmail.com','MALE','2025-09-16','Sadiar Rahman','056498894582','Sadiar_Rahman_c1f6ea7b-5d01-4f7c-ae96-9cc3483097ee','Senior It Officer','8',6);
/*!40000 ALTER TABLE `officestaffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `others_charges`
--

DROP TABLE IF EXISTS `others_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `others_charges` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `admitted_patient_id` bigint DEFAULT NULL,
  `bed_booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8otxp2yvymrb6qad5s0hoctrg` (`admitted_patient_id`),
  KEY `FKcwtu1qak6vok4cjkwpe4tc5y4` (`bed_booking_id`),
  CONSTRAINT `FK8otxp2yvymrb6qad5s0hoctrg` FOREIGN KEY (`admitted_patient_id`) REFERENCES `admitted_patients` (`id`),
  CONSTRAINT `FKcwtu1qak6vok4cjkwpe4tc5y4` FOREIGN KEY (`bed_booking_id`) REFERENCES `bed_bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `others_charges`
--

LOCK TABLES `others_charges` WRITE;
/*!40000 ALTER TABLE `others_charges` DISABLE KEYS */;
INSERT INTO `others_charges` VALUES (1,10000,'oxygen',NULL,1),(2,12500,'Icu equipments',NULL,4),(3,3000,'Oxygen ',NULL,4),(4,4000,'Emergency service ',NULL,4);
/*!40000 ALTER TABLE `others_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_selected_tests`
--

DROP TABLE IF EXISTS `patient_selected_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_selected_tests` (
  `patient_test_id` bigint NOT NULL,
  `test_master_id` bigint NOT NULL,
  KEY `FKrsdmolipmk31gmf76pmu3kjjr` (`test_master_id`),
  KEY `FKn68ir04e44ns74lbkl60wav0k` (`patient_test_id`),
  CONSTRAINT `FKn68ir04e44ns74lbkl60wav0k` FOREIGN KEY (`patient_test_id`) REFERENCES `test_admited_patient` (`id`),
  CONSTRAINT `FKrsdmolipmk31gmf76pmu3kjjr` FOREIGN KEY (`test_master_id`) REFERENCES `test_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_selected_tests`
--

LOCK TABLES `patient_selected_tests` WRITE;
/*!40000 ALTER TABLE `patient_selected_tests` DISABLE KEYS */;
INSERT INTO `patient_selected_tests` VALUES (7,1),(7,2),(8,1),(8,2),(8,3),(8,4),(9,1),(9,3),(10,1),(10,2),(11,1),(11,2),(11,3),(12,2),(12,4),(13,1),(13,3),(14,1),(14,2),(15,3),(15,4),(16,4),(17,1),(17,2),(18,1),(18,2),(19,1),(19,2),(19,3),(19,4),(20,1),(20,2),(20,3);
/*!40000 ALTER TABLE `patient_selected_tests` ENABLE KEYS */;
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
  `age` int NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `medical_history` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrg3am220txjbtiaqb0eslidxq` (`department_id`),
  KEY `FKperqpk72jxd90l8yq7qf5fsx0` (`doctor_id`),
  CONSTRAINT `FKperqpk72jxd90l8yq7qf5fsx0` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `FKrg3am220txjbtiaqb0eslidxq` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
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
-- Table structure for table `pharmacy_medicines`
--

DROP TABLE IF EXISTS `pharmacy_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_medicines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `generic_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `selling_price` double NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `strength` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicines`
--

LOCK TABLES `pharmacy_medicines` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicines` DISABLE KEYS */;
INSERT INTO `pharmacy_medicines` VALUES (1,NULL,'Peracetamol','Napa',10,'th','10mg','Tablet'),(2,NULL,'Omaprazol','Sergel',15,'rfgvr','drgrd','4000');
/*!40000 ALTER TABLE `pharmacy_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `apply_way` varchar(255) DEFAULT NULL,
  `bp` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `appointment_id` bigint DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5vl101ps5sx15cvvs260ek9xf` (`appointment_id`),
  KEY `FK24chc88e4so7cd6melh11rv6` (`doctor_id`),
  CONSTRAINT `FK24chc88e4so7cd6melh11rv6` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  CONSTRAINT `FK5vl101ps5sx15cvvs260ek9xf` FOREIGN KEY (`appointment_id`) REFERENCES `appoinments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,'','','',NULL,'','','',NULL,NULL),(2,'','','',NULL,'','','',NULL,NULL),(3,'','','',NULL,'','','',NULL,NULL),(4,'','','',NULL,'','','',1,NULL),(5,'','','',NULL,'','','',1,NULL),(6,'drgr','','d',NULL,'ty','ertgr','g',1,1),(7,'','','',NULL,'','','',NULL,NULL),(8,'','','',NULL,'','','',NULL,NULL),(9,'','','',NULL,'','','',NULL,NULL),(10,'','','',NULL,'','','',NULL,NULL),(11,'','','',NULL,'','','',1,NULL),(12,'','','',NULL,'','','',1,NULL),(13,'','','',NULL,'','','',1,NULL),(14,'d','','f',NULL,'2','fdvxf','45',1,1),(15,'','','',NULL,'','','',1,NULL),(16,'','','',NULL,'','','',1,NULL),(17,'df','','4',NULL,'69','dd','44',1,1),(18,'','','',NULL,'','','',1,NULL),(19,'','','',NULL,'','','',1,NULL),(20,'zc','','5',NULL,'5','fsdz','5',1,1),(21,'','','',NULL,'','','',1,NULL),(22,'','','',NULL,'','','',1,NULL),(23,'sfcdz','','45',NULL,'582','rfthytgf','582',1,3),(24,'','','',NULL,'','','',1,NULL),(25,'','','',NULL,'','','',1,NULL),(26,'srfrs','','120/80',NULL,'22','rwetferf','55',1,1);
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `subtotal` double NOT NULL,
  `unit_price` double NOT NULL,
  `stock_id` bigint DEFAULT NULL,
  `purchase_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6ekk4k5aiw3005dilumk4seq9` (`stock_id`),
  KEY `FKhcski0jcuja0o3vhb7o15yqvi` (`purchase_id`),
  CONSTRAINT `FK6ekk4k5aiw3005dilumk4seq9` FOREIGN KEY (`stock_id`) REFERENCES `medicine_stocks` (`id`),
  CONSTRAINT `FKhcski0jcuja0o3vhb7o15yqvi` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_items`
--

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;
INSERT INTO `purchase_items` VALUES (1,100,0,8,1,1),(2,100,0,15,2,1),(3,100,0,15,2,2),(4,100,0,8,1,2),(5,200,0,8,1,3),(6,100,0,15,2,3);
/*!40000 ALTER TABLE `purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ho3w23v5du4x0hrp6rqs1wmh` (`supplier_id`),
  CONSTRAINT `FK9ho3w23v5du4x0hrp6rqs1wmh` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,NULL,'123','2025-09-11 06:00:00.000000',2300,1),(2,NULL,'102','2025-09-30 06:00:00.000000',2300,1),(3,NULL,'1','2025-09-30 06:00:00.000000',3100,1);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receptionists`
--

LOCK TABLES `receptionists` WRITE;
/*!40000 ALTER TABLE `receptionists` DISABLE KEYS */;
INSERT INTO `receptionists` VALUES (1,'Bhola','atiq@gmail.com','Male','2025-09-16','Atik Islam','0584856651','Atik_Islam_2c51a0a1-51cb-4b76-acad-f86c64986832','Active',5),(2,'Munshigang','reiasin@gmail.com','Male','2025-09-20','Eiasin Prodhan','1444444444469','djsf_e37055c1-0c59-474a-b8f9-a94df7e5d5e2','Active',12);
/*!40000 ALTER TABLE `receptionists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `interpretation` varchar(255) DEFAULT NULL,
  `patient_contact` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `prepared_by` varchar(255) DEFAULT NULL,
  `report_result` varchar(255) DEFAULT NULL,
  `sample_id` varchar(255) DEFAULT NULL,
  `test_date` datetime(6) DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe15irdccqo5pnppe1t1d7lvqr` (`doctor_id`),
  CONSTRAINT `FKe15irdccqo5pnppe1t1d7lvqr` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'2025-09-18 17:49:13.752000','2025-09-18 06:00:00.000000','fsvdf','Male',NULL,'fhfg','fchb','fgd','dgfvdxf','SMP-1758196153788','2025-09-18 06:00:00.000000',1),(2,'2025-09-20 19:15:57.751000','2025-09-20 06:00:00.000000','setfr','Male',NULL,'258','sefsec','esf','wr','SMP-1758374157761','2025-09-20 06:00:00.000000',1),(3,'2025-09-30 17:23:59.610000','2025-10-10 06:00:00.000000','sfsfs','Male',NULL,'654196','gdfgdf','dgdf','sfs','SMP-1759231439623','2025-09-30 06:00:00.000000',1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `subtotal` double NOT NULL,
  `unit_price` double NOT NULL,
  `stock_id` bigint DEFAULT NULL,
  `sale_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKaq7w0gxymfevvhxpbr6iqiwcg` (`stock_id`),
  KEY `FK7tcpbc5c5mpnm8fl2phl8ep7l` (`sale_id`),
  CONSTRAINT `FK7tcpbc5c5mpnm8fl2phl8ep7l` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  CONSTRAINT `FKaq7w0gxymfevvhxpbr6iqiwcg` FOREIGN KEY (`stock_id`) REFERENCES `medicine_stocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_items`
--

LOCK TABLES `sale_items` WRITE;
/*!40000 ALTER TABLE `sale_items` DISABLE KEYS */;
INSERT INTO `sale_items` VALUES (1,2,20,10,1,1),(2,2,40,20,2,1),(5,10,100,10,1,3),(6,20,400,20,2,3),(7,13,130,10,1,4),(8,58,1160,20,2,4);
/*!40000 ALTER TABLE `sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `sale_date` datetime(6) DEFAULT NULL,
  `total_amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,NULL,'1','Atiq','2025-09-11 06:00:00.000000',60),(3,NULL,'102','atgifc','2025-09-30 06:00:00.000000',500),(4,NULL,'1','yhdr','2025-09-30 06:00:00.000000',1290);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `is_booked` bit(1) NOT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2xgwttjn6bxcrnserm1g7hg4x` (`doctor_id`),
  CONSTRAINT `FK2xgwttjn6bxcrnserm1g7hg4x` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2025-10-02 06:00:00.000000','20:01',_binary '','16:00',1),(2,'2025-10-03 06:00:00.000000','20:01',_binary '','16:00',1),(3,'2025-09-28 06:00:00.000000','17:20',_binary '','17:01',5),(4,'2025-09-28 06:00:00.000000','17:40',_binary '\0','17:21',5),(5,'2025-09-28 06:00:00.000000','18:01',_binary '\0','17:41',5),(6,'2025-09-25 06:00:00.000000','16:15',_binary '','16:00',2),(7,'2025-09-25 06:00:00.000000','16:30',_binary '\0','16:16',2),(8,'2025-09-25 06:00:00.000000','16:45',_binary '\0','16:31',2),(9,'2025-09-25 06:00:00.000000','17:00',_binary '\0','16:45',2),(10,'2025-09-25 06:00:00.000000','17:00',_binary '','16:45',4),(11,'2025-09-25 06:00:00.000000','17:15',_binary '\0','17:01',4),(12,'2025-09-25 06:00:00.000000','17:30',_binary '\0','17:16',4),(13,'2025-09-25 06:00:00.000000','17:45',_binary '\0','17:31',4),(14,'2025-09-25 06:00:00.000000','18:00',_binary '\0','17:45',4),(15,'2025-10-01 06:00:00.000000','15:15',_binary '','15:01',3),(16,'2025-10-01 06:00:00.000000','15:30',_binary '\0','15:16',3),(17,'2025-10-01 06:00:00.000000','15:45',_binary '\0','15:31',3),(18,'2025-10-01 06:00:00.000000','16:00',_binary '\0','15:45',3),(19,'2025-09-29 06:00:00.000000','15:30',_binary '','15:15',1),(20,'2025-09-29 06:00:00.000000','15:45',_binary '','15:31',1),(21,'2025-09-29 06:00:00.000000','16:00',_binary '','15:46',1),(22,'2025-09-30 06:00:00.000000','14:35',_binary '\0','14:29',1),(23,'2025-09-30 06:00:00.000000','14:59',_binary '\0','14:37',1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Agargaon,dhaka','Atiqul Islam',NULL,'atiq@gmail.com','Square Pharma','01612369874');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_admited_patient`
--

DROP TABLE IF EXISTS `test_admited_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_admited_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_cost` double NOT NULL,
  `admitted_patient_id` bigint DEFAULT NULL,
  `bed_booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfw8q7s0vjm1ektftnay68j7u7` (`admitted_patient_id`),
  KEY `FK5h1s7oojchepmhla3hdgomnry` (`bed_booking_id`),
  CONSTRAINT `FK5h1s7oojchepmhla3hdgomnry` FOREIGN KEY (`bed_booking_id`) REFERENCES `bed_bookings` (`id`),
  CONSTRAINT `FKfw8q7s0vjm1ektftnay68j7u7` FOREIGN KEY (`admitted_patient_id`) REFERENCES `admitted_patients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_admited_patient`
--

LOCK TABLES `test_admited_patient` WRITE;
/*!40000 ALTER TABLE `test_admited_patient` DISABLE KEYS */;
INSERT INTO `test_admited_patient` VALUES (1,0,NULL,1),(2,0,NULL,1),(3,0,NULL,1),(4,0,NULL,1),(5,0,NULL,1),(6,0,NULL,1),(7,880,NULL,1),(8,54880,NULL,1),(9,32400,NULL,1),(10,880,NULL,1),(11,32880,NULL,1),(12,22480,NULL,1),(13,32400,NULL,1),(14,880,NULL,1),(15,54000,NULL,3),(16,22000,NULL,3),(17,880,NULL,3),(18,880,NULL,1),(19,54880,NULL,4),(20,32880,NULL,1);
/*!40000 ALTER TABLE `test_admited_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_masters`
--

DROP TABLE IF EXISTS `test_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_masters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) DEFAULT NULL,
  `test_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_masters`
--

LOCK TABLES `test_masters` WRITE;
/*!40000 ALTER TABLE `test_masters` DISABLE KEYS */;
INSERT INTO `test_masters` VALUES (1,'CBC',400),(2,'RBC',480),(3,'MRI',32000),(4,'Ct Scan',22000),(5,'ewfew',5216);
/*!40000 ALTER TABLE `test_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_name` varchar(255) DEFAULT NULL,
  `test_price` double DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `prescription_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi7nw120n93ijkk7xh97ifjwo6` (`invoice_id`),
  KEY `FK4bj7th1ne9u2o29r46cmw1nxn` (`prescription_id`),
  CONSTRAINT `FK4bj7th1ne9u2o29r46cmw1nxn` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
  CONSTRAINT `FKi7nw120n93ijkk7xh97ifjwo6` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (2,'RBC',480,5,NULL),(3,'CT Scan',22000,5,26),(4,'X-Ray Cest',800,4,23),(5,'NSI',15800,NULL,20),(6,'MRI',32000,NULL,23),(7,'dfxgvbfd',5125,NULL,20),(8,'CBC',400,NULL,26);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_log_out` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj8rfw4x0wjjyibfqq566j4qng` (`user_id`),
  CONSTRAINT `FKj8rfw4x0wjjyibfqq566j4qng` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzU4MTcxNywiZXhwIjoxNzU3NjY4MTE3fQ.-OS7BLpo6LswxAy7bfHNA4WkQRHbsiohNxT3wRwTVzY',1),(2,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkyNjAzNywiZXhwIjoxNzU4MDEyNDM3fQ.Svrh9ODQTwODoPZTI-IrmDZtY_AAOvd_2ZuJWsI9pBk',1),(3,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkyNjAzNywiZXhwIjoxNzU4MDEyNDM3fQ.Svrh9ODQTwODoPZTI-IrmDZtY_AAOvd_2ZuJWsI9pBk',1),(4,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjcxMzUsImV4cCI6MTc1ODAxMzUzNX0.qgBVUHLoTGczZYivNbqMbpaz3DQIByfYpOVi171nKx4',2),(5,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjcxNzcsImV4cCI6MTc1ODAxMzU3N30.NIED_dFtt_gCjfxUVxJB0Oaqwm2KMpdbetmkfutzk9Q',2),(6,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjcyMTYsImV4cCI6MTc1ODAxMzYxNn0.t7zIKQ6pwusuLvhbIT6ghhEnqtkNITWa9Gjvwr-dVK0',2),(7,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjkxMDEsImV4cCI6MTc1ODAxNTUwMX0.gz6mu2Zz7tY2Ms6XQkikbz1QRcM3wEunS_Y54ZVpUAg',2),(8,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjkxMDIsImV4cCI6MTc1ODAxNTUwMn0.29dXJVzo58qGUHZK9aR7FGRietfaAkOBc4TvbXNtXws',2),(9,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjkxMDYsImV4cCI6MTc1ODAxNTUwNn0.ZxSkH5jVUzRw92L449FC8ifrc3TQ8bEt3v5lsEbSSiA',2),(10,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTc5MjkxOTYsImV4cCI6MTc1ODAxNTU5Nn0.AeKRhlVZx5CCH4cCqloRRjjneVocEWQkvvaDRxl8Xa4',2),(11,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkyOTk2NywiZXhwIjoxNzU4MDE2MzY3fQ.S82y_HAvDk1gio-3-2CfPbY_rbbq8P3Eq55v4f1MPVE',1),(12,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkyOTk4MywiZXhwIjoxNzU4MDE2MzgzfQ.JhxtwPW4m2cZittD8cyiWliNTIG-kgfCu_rl1DDt-oY',1),(13,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkzMDA2MywiZXhwIjoxNzU4MDE2NDYzfQ.3PimW8-Frxwj-GZuW9Fpi7TmOieLvpLeq2xrfHvRlMU',1),(14,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtci50LmltcmFuMTFAZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkzMDIxMywiZXhwIjoxNzU4MDE2NjEzfQ.CtNP6vtQy9u3MN7n8PSuce0SA8Wurxgz46DXhcZXoOk',3),(15,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtci50LmltcmFuMTFAZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1NzkzMDIzNiwiZXhwIjoxNzU4MDE2NjM2fQ.IwBsbZhZxmWV5tSST5sLY7AFbxhRbJqZPWaqGarzQmw',3),(16,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1NzkzMDY2NiwiZXhwIjoxNzU4MDE3MDY2fQ.r6aetCIyr4i-TetZ0aSVzSO5fQRJ8HkZSKCHFAPsoGM',4),(17,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1NzkzMDcxMCwiZXhwIjoxNzU4MDE3MTEwfQ.QUtCKL09dR_C4im01gMk7gPREXsmhLB_D-wzU1NhkWc',4),(18,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1NzkzNzI5NiwiZXhwIjoxNzU4MDIzNjk2fQ.Qb7VJ_6VqasB2t9OUry310EnjRnex60PcjB-LZky65g',4),(19,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1NzkzNzM0NiwiZXhwIjoxNzU4MDIzNzQ2fQ.uCwRhKuLEB4_yjRP6v8gd6CHyxythrE8QLNepdpCzzs',4),(20,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1NzkzNzkwMCwiZXhwIjoxNzU4MDI0MzAwfQ.kriI40h3PHTxChAKRV05TUMyY_I0NIvWbaYCyZgsDCE',4),(21,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgwMTMzNjcsImV4cCI6MTc1ODA5OTc2N30.J7BB3DpiXys8iye7SEuYx_Z-DjSMwXMDYLUH0bUP3tw',5),(22,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MDEzNDM1LCJleHAiOjE3NTgwOTk4MzV9.8QOp3ipYbhD1up9f8OIBnKcRLspuaG_20i8h3m1UADY',6),(23,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MDE1NTA2LCJleHAiOjE3NTgxMDE5MDZ9.xzbQDzOsPUvy-IYAJgYkw6x39BPbqJwb9h0jgk3Fonw',6),(24,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmaHRAaGIuZmRndiIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMTY4NTcsImV4cCI6MTc1ODEwMzI1N30.-4j9zJngMHpZq6h04y0ezaDf-J6e_yzS1_qmos7PgyA',7),(25,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMTk2MzgsImV4cCI6MTc1ODEwNjAzOH0.QNmnkFOhMKQ-32qoMnLdcXCsy44J8vaHlzQURTKN21A',2),(26,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjQ4MzIsImV4cCI6MTc1ODExMTIzMn0.vroYPOT9t9G5OCUA_KOsj9W7zYWFKSREpkA7zi2IauM',2),(27,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjQ4NzksImV4cCI6MTc1ODExMTI3OX0.tuFgvKq8Tqqmz6xmI-RGML6_KuSIMOS681YXQLfg9d4',2),(28,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjQ5NDgsImV4cCI6MTc1ODExMTM0OH0.-WtScnM01pXXq2uBbNxNnCGs2Gf-LzT6F3nAD5mu4Ns',2),(29,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjQ5NjUsImV4cCI6MTc1ODExMTM2NX0.VNdh5zAFt9Ms2LPFLqRD-LN44vTTMpnZl2qT4skzF2I',2),(30,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MDI1MDAxLCJleHAiOjE3NTgxMTE0MDF9.cxMHw17eZUz992-XUKJkXOP5o4RWP2hpE78b6YtObeo',6),(31,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjUwODcsImV4cCI6MTc1ODExMTQ4N30.9zrcJ77rZ0FpIs-qoaHBCVFu4HoNPIY57PHgHYF9Fas',2),(32,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjUyNjIsImV4cCI6MTc1ODExMTY2Mn0.DC84-N2AkCUZj9ax6dQjlI7J6CnhuH8hL3Bxa2j2Lkw',2),(33,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjU0ODIsImV4cCI6MTc1ODExMTg4Mn0.7JOQK7uFShS7YHvZlA_oNItxi9ZgUYkX_xbWIeUZ-SQ',2),(34,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjU0OTIsImV4cCI6MTc1ODExMTg5Mn0.Xs62k0c13Vm4QyF7vvV5IeFfQq82tYFIEDvZYJZsh80',2),(35,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjU1MzcsImV4cCI6MTc1ODExMTkzN30.QoLajvwHUDyQ75z6eCoB2WZJMKGu5PbLPHqKXHAywXs',2),(36,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaGVtYW50bzA4MTAxOTk5QGdtYWlsLmNvbSIsInJvbGUiOiJEb2N0b3IiLCJpYXQiOjE3NTgwMjU1NzEsImV4cCI6MTc1ODExMTk3MX0.YbqetOlQpkFVJKHojY_IFi7TJmgbpibNfLghKxG4Rp4',8),(37,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MDI2MDA5LCJleHAiOjE3NTgxMTI0MDl9.3IzDb31ZObLmGDI8xDBReLwfnsHtrWjtGb8sCah74AU',6),(38,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgwMjYwNDksImV4cCI6MTc1ODExMjQ0OX0.urmTiXTwLwL5B7zV1u0gz9wFiY0_gX6FOd5KoscNzSs',5),(39,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgwMjYxMTAsImV4cCI6MTc1ODExMjUxMH0.DTSyy-ZQmxvlqxEn_u9olGgGWZ5aQerx37Xz2kb03Os',9),(40,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgwMjYxMzIsImV4cCI6MTc1ODExMjUzMn0.WPdkQgFHbz224BJ38qWyezayAq0-S2vaDTRwf4wXc8o',9),(41,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgwMjcxMTAsImV4cCI6MTc1ODExMzUxMH0.L6YVB_odjVX8ipj7wgY7oNvMhA1FGvHz5locRc1-r9I',5),(42,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgxMDE5OTAsImV4cCI6MTc1ODE4ODM5MH0.Chhh0V4GEHD5EXNGkegVIccGjXwyKnoWRAs5AFBua0U',9),(43,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgxMDI3MDUsImV4cCI6MTc1ODE4OTEwNX0.ValuQBH8mtb8nUdbL1wEpSxhOLd43HP3oP2MqgwXnnE',5),(44,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgxMDUwOTgsImV4cCI6MTc1ODE5MTQ5OH0.AujENRZ2hgJllcJacPK1ZqWHERk-ZzhvOYIl2b1n3RM',5),(45,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgxMTMyMDUsImV4cCI6MTc1ODE5OTYwNX0.APUoBe-79NiMQtLVLfluvuvPICFqkPvlBiCXwPhVF6s',9),(46,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgxODUxNTIsImV4cCI6MTc1ODI3MTU1Mn0.PtAe4SYpU70DVhp0LGVJCUAOjNaDDzg9Liqw18-i5tg',5),(47,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgxODY0NDEsImV4cCI6MTc1ODI3Mjg0MX0.dQ_gDgTZjgBArc1lI4ihINH498U5s81AetFNqEGFkc8',5),(48,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgxOTUzNjMsImV4cCI6MTc1ODI4MTc2M30.itOkyFs3x-19k2X3sr85-HNSbhk1cXOBmB0ATRhsVG0',5),(49,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODE5ODg5NiwiZXhwIjoxNzU4Mjg1Mjk2fQ.xQygDZ2EaR4E4-1j8zO0TYhq48e29DbLdJRyvn1JVog',4),(50,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgzNTg3MjcsImV4cCI6MTc1ODQ0NTEyN30.DXtF1rDl-0WnTpKpAIeWHrRR19HQYbGSP-tvS4BjYHw',5),(51,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNTg3ODYsImV4cCI6MTc1ODQ0NTE4Nn0.e0dgz1ep_PRuUr4mWAzmfIWyjrmwslcvfNth3ldtQks',10),(52,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNTg4MzIsImV4cCI6MTc1ODQ0NTIzMn0.TN-CoQrYY9pA0Nh29HeYJpzZRkB8f0RcqlaK49ubOAs',10),(53,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWhydWtoQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM1OTcwNiwiZXhwIjoxNzU4NDQ2MTA2fQ.Hkuf4sQdJLouZ-prOMWN8OfV5AUFRRAktkyQY6pXGs4',11),(54,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWhydWtoQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM1OTc3MSwiZXhwIjoxNzU4NDQ2MTcxfQ.cr9Og1BXskEn0XCWWxOH1p5lmrEKQUigAA-A9EVj1Sw',11),(55,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2MTI2OCwiZXhwIjoxNzU4NDQ3NjY4fQ.FUUv83NHl-lNkp25pCRAOKRuAg6NJq0S4qGUH6sV7tU',4),(56,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MzYxMjgzLCJleHAiOjE3NTg0NDc2ODN9.lTSxcde_mAGhRHHCK49EJpKupG-LW_D7-uqLsc5tOA0',6),(57,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjE5MzIsImV4cCI6MTc1ODQ0ODMzMn0.RePFHjnwkgQ5oN59Mk-SWDOSmrZmIQVzSb-m2wKTvfw',9),(58,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjE5NTEsImV4cCI6MTc1ODQ0ODM1MX0.jXm9gt8GuvmPnCP0_wJl-kfGMES7dHEWnqMENHiSJD4',9),(59,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjE5ODgsImV4cCI6MTc1ODQ0ODM4OH0.vqsDHBOPHmExxCN2Y9RYElZWeteihUHx_E9Oc7FWezE',9),(60,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MzYyMDEzLCJleHAiOjE3NTg0NDg0MTN9.6l1OV_rT5P8liGHgTVAJ66N1uIK2bUXjOu2CK39Rwjk',6),(61,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjIwNjcsImV4cCI6MTc1ODQ0ODQ2N30.fammv_YCqT9y5Ip1CH5GtRGtJzCkV_dznll5MbCthXE',9),(62,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjIxMzMsImV4cCI6MTc1ODQ0ODUzM30.G9ZBsTPppIt7Bf_sU_900ybW90EtpgtZIuflS1VsKSw',9),(63,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjIxNTAsImV4cCI6MTc1ODQ0ODU1MH0.EESnjXCOU7t2wW-xu9_qCzvM7vkdB2femMDopMnQ8cI',9),(64,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgzNjI0MzksImV4cCI6MTc1ODQ0ODgzOX0.NhSY58U3yon8F0ydqGW-23U8sF4KxqRGzhMUIAHu11E',5),(65,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2MjY0OCwiZXhwIjoxNzU4NDQ5MDQ4fQ.uaoaEZdeAzmKnIEfHSbC1826jgevJT-qMJdHFQE4scM',4),(66,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2MjY5OSwiZXhwIjoxNzU4NDQ5MDk5fQ.YVe55VNq-BQrRcEZq9b_cJ44o5Sd4DOCxELY1sgSiiY',4),(67,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2Mjc5MCwiZXhwIjoxNzU4NDQ5MTkwfQ.HttOqnt7qRneCVaAeOnRlzNImHhC8MdwLUeoL7HLWu4',4),(68,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2Mjg3OCwiZXhwIjoxNzU4NDQ5Mjc4fQ.wrFUVoVqxQoGltmxe3ZMTbye8RHJNNDZQG73UCgtkzs',4),(69,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2Mjk3NSwiZXhwIjoxNzU4NDQ5Mzc1fQ.kJoktq3LotPxhKWk3rKE8qMwtuBVnPO-oZXATi4JHPg',4),(70,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2MzM5MywiZXhwIjoxNzU4NDQ5NzkzfQ.kIT20WVzRgO_-3oHBbHyexKtGucgXNhlxgXB9i9XJ4Y',4),(71,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2MzczMCwiZXhwIjoxNzU4NDUwMTMwfQ.1A94oZv-Sge_VDQDSj5UDQSxtW1HNZoRl6mWpu154H4',4),(72,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2Mzg3OSwiZXhwIjoxNzU4NDUwMjc5fQ.7xwjwvlxznLhIfPaGGpc5zLFIGCMFPy0Jyxmmibdl-M',4),(73,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NDAyMCwiZXhwIjoxNzU4NDUwNDIwfQ.t9HymRa6rhY_H5ehIunIdyoXPAdBkIC5ECyouXjl4So',4),(74,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NDEwOSwiZXhwIjoxNzU4NDUwNTA5fQ.3sPAfd--mqJ_F12KMhi8cVdwanvWj4lwUC80RuxNT5w',4),(75,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjQyMTIsImV4cCI6MTc1ODQ1MDYxMn0.RUp2pi5H7PT2BzSKe71kGVQYB4gVyxGDJjcvqwOtfBo',9),(76,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NDIzMywiZXhwIjoxNzU4NDUwNjMzfQ.ifS1fQAf781m260UemWnWJW6_LdEwUmlWuBCiudZYJ4',4),(77,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjQyNTEsImV4cCI6MTc1ODQ1MDY1MX0.eJBwKPgVD2Y0Jx5gYUPMHKRtaZyoRL2358irXLeDFws',9),(78,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjQzMDMsImV4cCI6MTc1ODQ1MDcwM30.Bh4W4i9MwsrpplH9NeTeofpWs_uNNVcm_ECwjPVe04Q',9),(79,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNjQzNDAsImV4cCI6MTc1ODQ1MDc0MH0.PdFpa3MQBZAHHq8Ftfl4zgnHwgHVNaeIL38hlF_ZjHs',10),(80,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NDUwOCwiZXhwIjoxNzU4NDUwOTA4fQ.4TuLXEU3aWkbguD6F0T_HRwhLKFXoigmQf7LZxcENaA',4),(81,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NDUyNCwiZXhwIjoxNzU4NDUwOTI0fQ.h-rDCtG9k2cgfIMnJC8KpdJTqlX6Zq2fKXcUB63_5nQ',4),(82,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM2NDY2NiwiZXhwIjoxNzU4NDUxMDY2fQ.ENfyyIkVl-gCbgcnx9MJyTcJer-gxaQX_EczdsJMWoU',1),(83,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM2NDc1MCwiZXhwIjoxNzU4NDUxMTUwfQ.JZYSrq_0dvuS9lRC2bWIuaXiSFTWx3kLmnjmbLQ5zmU',1),(84,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MzY0ODI5LCJleHAiOjE3NTg0NTEyMjl9.uyzzlMa0ixnWvqMn0jJZsdlaySbwQf7TGhCB9Ifz7Jg',6),(85,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM2NDkyMywiZXhwIjoxNzU4NDUxMzIzfQ.x8XQcMSjeGrJHeiWzXSKRNyuyHDNuSjqlMDvOySPeN4',1),(86,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgzNjUwNDgsImV4cCI6MTc1ODQ1MTQ0OH0.AQdkvx6NiWIximIG1m0W5yDNf_g8caTLo8MatK32zWk',5),(87,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXBAZ21haWwuY29tIiwicm9sZSI6IlJlY2VwdGlvbmlzdCIsImlhdCI6MTc1ODM2NTEyNSwiZXhwIjoxNzU4NDUxNTI1fQ.fHHbqcZeylE8FGTvapuKOEVv7vLWkqbG9lv_NGel2Nk',12),(88,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXBAZ21haWwuY29tIiwicm9sZSI6IlJlY2VwdGlvbmlzdCIsImlhdCI6MTc1ODM2NTE0NiwiZXhwIjoxNzU4NDUxNTQ2fQ.lndoAEVfbPEgFRZUrMUU1cpJsXNM4px0RsC1I6An-64',12),(89,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM2NTI0NSwiZXhwIjoxNzU4NDUxNjQ1fQ.wIJy47OgfY0lznHnwoZXeB5OkU0jkOZ12-qlzEtToq0',1),(90,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM2NTMzOCwiZXhwIjoxNzU4NDUxNzM4fQ.YBigzIdlSKyHqGJ1AIlgwYDGJj7TBsHL3GfZFFrXaO8',1),(91,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM2NTUwMiwiZXhwIjoxNzU4NDUxOTAyfQ.F84VHPtHduA2lENILfBdhN5SyjmpJ-u-PtIsQIv7klY',1),(92,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MzY3MTQwLCJleHAiOjE3NTg0NTM1NDB9.oy7CKzXPNkJUWJLzWa-QbEdYAg7BfBrkJf41JKRToZU',6),(93,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NzE2NSwiZXhwIjoxNzU4NDUzNTY1fQ.tAtuv-e_6k43IZLrv2Psy3tyV7FRdSoH8cI0JkNP3dE',4),(94,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgzNjcyMTEsImV4cCI6MTc1ODQ1MzYxMX0.bnJOh5jQazOXrhTDdbG6f9clnYGZ3FeFQ-pOftgd-IE',5),(95,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjcyNDQsImV4cCI6MTc1ODQ1MzY0NH0.r98JwF_QQEkqzlYE0yJ556nPvachN1AVYFwjwblZ3J4',9),(96,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaW1raUBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjczMjMsImV4cCI6MTc1ODQ1MzcyM30.8sJl9gwIgB1RVjxdpb_ineii0rVOUm8HhZCGT6fGoMM',13),(97,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaW1raUBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjczNDYsImV4cCI6MTc1ODQ1Mzc0Nn0.qhpJqu22g0zYTzdNjEPnym8Iu3v8elqKalP5mPCVomQ',13),(98,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2NzM5NywiZXhwIjoxNzU4NDUzNzk3fQ.p7pYqpD0c-rKaG01cpY9AWbbERNwnrM1bYsZzvM436I',4),(99,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjc0NTEsImV4cCI6MTc1ODQ1Mzg1MX0.Mayb6BMp09ZI7FVW4i6MQQV4CY9dQ0iPzQEE2L5jisk',9),(100,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4MzY3NTQ4LCJleHAiOjE3NTg0NTM5NDh9.pkXK7N3TbPUermXBTorUAm-rTddZUjYPcUqtLNc1Dio',6),(101,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgzNjc1NjMsImV4cCI6MTc1ODQ1Mzk2M30.-kYTHGvlEJoSHThcqJG2q4eETsNCTM8QD0klEKhYWTA',5),(102,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODM2ODg1NiwiZXhwIjoxNzU4NDU1MjU2fQ.KUFGk9L5vMGsFtaGg7Lu-TxG13zlmKEDX5991Kegz2s',4),(103,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaW1raUBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNjk3MjcsImV4cCI6MTc1ODQ1NjEyN30.lTTkHVIdI-xsqHYGddFWBbnBnmMSSdjbkG8G1yfLDM0',13),(104,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTgzNzA3NzgsImV4cCI6MTc1ODQ1NzE3OH0.dBNR2XP80D_NQIEkAcYF0XyTA7OYjMhqiAl5hCXSThA',9),(105,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODM3MDgzNSwiZXhwIjoxNzU4NDU3MjM1fQ.8ALqk0AZia7H2f1hBmd7WyrhjBc5dGnMKNGNXKh2tLs',1),(106,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTgzNzA4NzIsImV4cCI6MTc1ODQ1NzI3Mn0.tHg-lVy_qd_deXSszB3tppgvB1nzewwi6H8WVYsgpmU',5),(107,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNzA5MDAsImV4cCI6MTc1ODQ1NzMwMH0.9NSGRcUrelJG8ZvstgQTY0p7ONRjx-ERBr6NXL-RyyQ',10),(108,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNzE2MDgsImV4cCI6MTc1ODQ1ODAwOH0.R1O5-h5zghXEUQubOU5i5dHQj5vYMcN3dtBqh5NqwWk',10),(109,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNzIzODUsImV4cCI6MTc1ODQ1ODc4NX0.BY_wiS6ja_nF1gd0p9rFozkgeVWZhXU8rnWdr66J72E',10),(110,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTgzNzM2ODMsImV4cCI6MTc1ODQ2MDA4M30.Pomiiy9XK9zdBdeZkZm89k9BW7TZSpzjHtguxzR_twc',10),(111,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4Mzc0MTgzLCJleHAiOjE3NTg0NjA1ODN9.4NuMbYD6PIYWM_e1HXnWD-o3YPx67GE1FnttMD8Odq0',6),(112,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTQwMjQsImV4cCI6MTc1ODU0MDQyNH0.ztG2gDh7amPuaWR4tN63AEc-ql1zId2DlSIGPXIkfto',9),(113,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTQzODksImV4cCI6MTc1ODU0MDc4OX0.lJRcoc3ybfBKtudAgXkWXL3ESqDWnF3VVeKQz1ijrRU',9),(114,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODQ1NDUxMywiZXhwIjoxNzU4NTQwOTEzfQ.uLXl-xxYLZ3Apqgnzhq1PNPOotGKay3sPNgfby9eULw',1),(115,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTQ3ODIsImV4cCI6MTc1ODU0MTE4Mn0.9CwQ91bJZLZ67Yj-Xub0oBJwhuEZVBOQGyvIM4BzgMg',9),(116,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTU4MTYsImV4cCI6MTc1ODU0MjIxNn0.KWJwXmeHPh6m5QQZjB0KhwcsYBqg1SN9oUgrBZiE1FE',9),(117,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTYwMjMsImV4cCI6MTc1ODU0MjQyM30.Kim3HkIgfyAzX0TENiqiRJihIxMsEvzuSjUNkwk99ug',9),(118,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTg1NzEsImV4cCI6MTc1ODU0NDk3MX0.ej0WhAbOSZlSR2HAtYimdLnCu_Gdcmy72eKJZJUk3fY',9),(119,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg0NTg2MzAsImV4cCI6MTc1ODU0NTAzMH0.3uW2bxg8DFZWwN2we42TmTkeGFULYMFyST-uV8jDXuY',9),(120,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODQ1ODY1NCwiZXhwIjoxNzU4NTQ1MDU0fQ.YOE-zni1sLvmVvI7E2990nwlKrKhEE1c6uA66SP_MQM',1),(121,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODc5MDI1MiwiZXhwIjoxNzU4ODc2NjUyfQ.mFmMx87S5s89QufFiqGVZG0KuKAxzuEgcOW7vrT7CgI',4),(122,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODc5MzQ3OSwiZXhwIjoxNzU4ODc5ODc5fQ.DCkKvSjDC_k7U0DCEy-0wCGMeqU5wmTN0O5P33N-dZc',4),(123,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTg3OTM0OTksImV4cCI6MTc1ODg3OTg5OX0.p8pgCu6IF4ygof1vorThnooxyO5LsEbq3MwyzCmkxw8',10),(124,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4NzkzNTE3LCJleHAiOjE3NTg4Nzk5MTd9.HW0dX1MrwpHD1qz1mMCbjiKAte7-FA11ZfTK5t6TKCI',6),(125,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTg3OTM1NTgsImV4cCI6MTc1ODg3OTk1OH0.dbmdjHmPQM4k4M9b_YqHT-D_6EztSs59hqRagEoDGrg',5),(126,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtci50LmltcmFuMTFAZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODc5MzU5NSwiZXhwIjoxNzU4ODc5OTk1fQ.XOd2xaaDzzoQ4j5r7FDflHSkXyilicm7MSzc1NC3LDQ',3),(127,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg3OTQxNDQsImV4cCI6MTc1ODg4MDU0NH0.C0EY3yPfV4m6VBN3NozJJtjyu1MLJO3cnsKXs6p1_gU',9),(128,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTg3OTQxNjksImV4cCI6MTc1ODg4MDU2OX0.iAQ7AX8cwiCdmuXXBnoW8_diHZR3GoG90b6rgz75tQ0',9),(129,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1ODgwMzE3MSwiZXhwIjoxNzU4ODg5NTcxfQ.43UrkLz8ahGspdLOqprafdfk1_vwjqAxf4BNhYlrtG8',4),(130,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTg4MDMyMDcsImV4cCI6MTc1ODg4OTYwN30.rFF0OPojj3vUwsHp0_lW6uPs-f1QFtuoZSuQyqAur9g',10),(131,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODgwMzI1MCwiZXhwIjoxNzU4ODg5NjUwfQ.7s0MBSUyrkqwlkkt7c9MBC7QPnxPoXQ374m6m_vtgGw',1),(132,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTg4MDM2MDksImV4cCI6MTc1ODg5MDAwOX0.cJxCq927hNutqZwEyvfxbYxZ-3azf_32cYenydn8jvg',10),(133,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU4ODA0NDUwLCJleHAiOjE3NTg4OTA4NTB9.nidIm-9Wr97GN6jDI7SWvD7uaOF_ls1jTAe4EKW6CdE',6),(134,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTg4MDQ3MTAsImV4cCI6MTc1ODg5MTExMH0.TW-Rn2g3i9fI60ROgHmsL1AWt2WF2s0k2G7mRzWhj8M',10),(135,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1ODgwNDg4MCwiZXhwIjoxNzU4ODkxMjgwfQ.l43a6CVuqkD49nlqw5l-1DDZz_nqPPVxiaixxvTkV3c',1),(136,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTkxMzY1MDEsImV4cCI6MTc1OTIyMjkwMX0.c24DeQeTYT5b-mzpMcHHbtqqnZI1EclSUVMmed8vNz4',9),(137,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTEzNjUxNSwiZXhwIjoxNzU5MjIyOTE1fQ.YdPqHYOJTXVXsUDLUsizQpYSbrDSraATCs_Up-zJ3rE',4),(138,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU5MTM2NTM2LCJleHAiOjE3NTkyMjI5MzZ9.ibxA7-Zf99rJAh74SvjnSSYA-oPq8dT-AB9muC-Xzcw',6),(139,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTEzNjU2MCwiZXhwIjoxNzU5MjIyOTYwfQ.Eu5ewlBT0AG0etFJnP_I1EymdDtClO5_KOawWsPFsqg',1),(140,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTkxMzY2MzgsImV4cCI6MTc1OTIyMzAzOH0.aEIn3OIzShyFU7jGv2XCmbMBMb8YBMONrtIpV6sd2ws',10),(141,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTkyMjA5MzQsImV4cCI6MTc1OTMwNzMzNH0.SS1reNghWVMLCcdTIroWUHrFs96zEJGWQHQ7T45SFsQ',10),(142,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTkyMjExNTYsImV4cCI6MTc1OTMwNzU1Nn0.z4IkIxSwB5-MehR8Vk897yMXw_ePgXolUa9XAO-Q7Ps',10),(143,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTkyMjE0MTQsImV4cCI6MTc1OTMwNzgxNH0.4ySBfPWITgR4DgXB9rKh_a5Kx9CHgaQ5qYZiIFlwUbY',10),(144,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTIzMTM0NiwiZXhwIjoxNzU5MzE3NzQ2fQ.xKxFEHcbf3YcmPItohh4q_sj2flXst69ortVrUcQs1k',1),(145,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTIzMTQ3OSwiZXhwIjoxNzU5MzE3ODc5fQ.U2oFa_ME7Do-BZ3tFa67F1jNy9NeVHfmIRZTshDv3DI',4),(146,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU5MjMxNTE1LCJleHAiOjE3NTkzMTc5MTV9.hJ6ZbwxYexrN3toe_XR3xfAbomcLUkldybVBdhsZw7Q',6),(147,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTkyMzE3NzMsImV4cCI6MTc1OTMxODE3M30.s5WBYa3iVn7sNJA8cdccytbHrf2XCuneJ9vYl9hBXQ8',5),(148,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTkyMzE3OTMsImV4cCI6MTc1OTMxODE5M30.DUTze_v4JT7UzvEVNIsaoJokw-xXdXjBRKP5EyWMrlw',5),(149,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTkyMzIyOTYsImV4cCI6MTc1OTMxODY5Nn0.VPkjueQfW68ik6Ns2Lo4cpX9cvLKEcv7uxCrYDWEakY',10),(150,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTk4NDA2ODAsImV4cCI6MTc1OTkyNzA4MH0.6wfGUIOAJsSypVyMbHWGzw1oHvsgyWcD4itVukERyew',10),(151,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTk4NDA2ODAsImV4cCI6MTc1OTkyNzA4MH0.6wfGUIOAJsSypVyMbHWGzw1oHvsgyWcD4itVukERyew',10),(152,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NTk4NDA2ODEsImV4cCI6MTc1OTkyNzA4MX0.jr8wAt5Mpdv_x_wkArVcAWidWoO3noDFMNMpuVhQNS4',10),(153,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTg0MDc0OCwiZXhwIjoxNzU5OTI3MTQ4fQ.fQY1T_7kRBtZieHA3l-rs4VXRPauBU3mYHhnhxr-uLE',4),(154,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTg0MDg0MSwiZXhwIjoxNzU5OTI3MjQxfQ.aAMXTdG617zFUceXaUE28ySNTbXeBkDaJqSgjhM9ODE',1),(155,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTg0MTUxNiwiZXhwIjoxNzU5OTI3OTE2fQ.M-1oFtH6duvWj8mdPkAokOBlAf9-NUmU_iEdthUx7LU',1),(156,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTg0MTUzMSwiZXhwIjoxNzU5OTI3OTMxfQ.ofc_dLVzebSC1lb55HBhDR9VF5lL0qtSljpl0bQHGh8',1),(157,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTg0MTkwNywiZXhwIjoxNzU5OTI4MzA3fQ.PVA61sliswZNRORNH4RhqaVdS72BWR4a0FxuvPDOFYM',1),(158,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MTYyMjYsImV4cCI6MTc2MDAwMjYyNn0.Uk6RLfsAse_1BG20XZetN1MWr0RCHeemOGVTQwT3ySw',5),(159,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MTYyMjgsImV4cCI6MTc2MDAwMjYyOH0.10W4tgExJWVePtMEhBW2s6qGqDeolMtutwzce-P0i88',5),(160,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MTYyMjgsImV4cCI6MTc2MDAwMjYyOH0.10W4tgExJWVePtMEhBW2s6qGqDeolMtutwzce-P0i88',5),(161,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MTYyMjgsImV4cCI6MTc2MDAwMjYyOH0.10W4tgExJWVePtMEhBW2s6qGqDeolMtutwzce-P0i88',5),(162,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTkxNjUwOCwiZXhwIjoxNzYwMDAyOTA4fQ._duTYIw9VkdvXh_VkgQdNc4A4XrNG17F1mBn8M1jFCc',1),(163,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxNzUxNiwiZXhwIjoxNzYwMDAzOTE2fQ.Xlxv0etjsUDTEyHp0kzaDXytXOOj4wKlayYMe1OkH5o',4),(164,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxNzcxNSwiZXhwIjoxNzYwMDA0MTE1fQ.6EYC32GxvbZlcxLd3APpcngFD3F2erT6LT5NtYGhvLQ',4),(165,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxNzcxNiwiZXhwIjoxNzYwMDA0MTE2fQ.T1ER3yKC_Dm8kj7PccB1vm0nK0fwGAmBfoYLsl7lD_I',4),(166,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxNzc2MSwiZXhwIjoxNzYwMDA0MTYxfQ.fdt3JcLvaEIeoG8jQmgcrHiAjzK-5rkGV4_U18JsaHU',4),(167,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxNzc3NSwiZXhwIjoxNzYwMDA0MTc1fQ.rD5pESlbvCXGPxefaImsu9tfWw7puhh-jFIZi_SuvM4',4),(168,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODQ3OSwiZXhwIjoxNzYwMDA0ODc5fQ.J1XxGOovImextPaLQDIUDbOBS8OwEeWv36ziAZjXkA4',4),(169,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODQ4MSwiZXhwIjoxNzYwMDA0ODgxfQ.fPhYl8pcEaacGtIhZJpTxbMzJUpQ6hOt3ZXQ19f7LRw',4),(170,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODQ4MiwiZXhwIjoxNzYwMDA0ODgyfQ.qXUvgWJMa9-DFrBD63YTCekSuDMaTokPddVz8_gSy4U',4),(171,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODQ4MiwiZXhwIjoxNzYwMDA0ODgyfQ.qXUvgWJMa9-DFrBD63YTCekSuDMaTokPddVz8_gSy4U',4),(172,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODQ4MiwiZXhwIjoxNzYwMDA0ODgyfQ.qXUvgWJMa9-DFrBD63YTCekSuDMaTokPddVz8_gSy4U',4),(173,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODQ4MywiZXhwIjoxNzYwMDA0ODgzfQ.rSiL3HTl3Abb2YuDhCp5wc_lEs6egXXVk1AqdyWtJ40',4),(174,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODU4MCwiZXhwIjoxNzYwMDA0OTgwfQ.G3niM7fwa_KHV0A3XsqAjvvc8xl3xlxi4C5MpOTBrQA',4),(175,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkxODg2NCwiZXhwIjoxNzYwMDA1MjY0fQ.Dm_h_laGnJQQh-90rCLVUp91XNSCCn3hoPn6GwVoMB4',4),(176,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTkyMDYwNywiZXhwIjoxNzYwMDA3MDA3fQ.VYARzpY4D0j9LgTYb5E7caIi50vQKDI7H0eCEnQ7llg',1),(177,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc1OTkyMTYyMiwiZXhwIjoxNzYwMDA4MDIyfQ.hms2BQnmZ501qLQZ_MilvA3FN7vv17o0_YMM7KvNrH0',4),(178,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTk5MjIyNTcsImV4cCI6MTc2MDAwODY1N30.3hCYZ_af8xhr0YpfF3sP7FNbusvfV_cf587hYV109ps',9),(179,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NTk5MjIyNTcsImV4cCI6MTc2MDAwODY1N30.3hCYZ_af8xhr0YpfF3sP7FNbusvfV_cf587hYV109ps',9),(180,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc1OTkyMjMwMiwiZXhwIjoxNzYwMDA4NzAyfQ.XxOe9ecSH33vksyHX2HWVaNnk3NXFWbPnbXglc0TawY',1),(181,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQyMjAsImV4cCI6MTc2MDAxMDYyMH0.DJw0G6hKhHxG6NdQHa_crBBEzXc8vxcB4woc6lyz0FE',5),(182,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQzMjgsImV4cCI6MTc2MDAxMDcyOH0.bySu9rqOP_cdHfUP5uPFXO6ixRdgJKcwWZ00QHtWkm8',5),(183,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQzMzAsImV4cCI6MTc2MDAxMDczMH0.peVdlCo2n5FCLqAvv5AYrJteIZn2fAiz9e3uNEG3wIU',5),(184,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQ1NjQsImV4cCI6MTc2MDAxMDk2NH0.3Z4cn55GhoqWquXqxAq1ITNmd_CUu0fRyrsjY_zKb3k',5),(185,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQ1NjYsImV4cCI6MTc2MDAxMDk2Nn0.SUwxocfdH7H5VgHckxyIUY0Qj29c2jNiCM9wStMrhsw',5),(186,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQ1NjcsImV4cCI6MTc2MDAxMDk2N30.uK1AkDCP7Is05-kcklWvz0tjKhzIP8ZpD3_4BX123Ao',5),(187,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjQ1NjcsImV4cCI6MTc2MDAxMDk2N30.uK1AkDCP7Is05-kcklWvz0tjKhzIP8ZpD3_4BX123Ao',5),(188,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjUxMDUsImV4cCI6MTc2MDAxMTUwNX0.PtWdDEGmBB4UoptK-ikrEuaxilB-OuEGto-ny5XY8vg',5),(189,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjUxMDcsImV4cCI6MTc2MDAxMTUwN30.YGZTO8CCRnt20cNctpqghXf9Ni_CoDZgqWcHoX1BpOU',5),(190,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjUxMDgsImV4cCI6MTc2MDAxMTUwOH0.-dyS-k2RS6v49EHLE1pLNUPQe6zYRXSOvbturoQt91o',5),(191,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5MjYwMTEsImV4cCI6MTc2MDAxMjQxMX0.UCc5nwPDDhesy7dYBCtMCsot-F3r_GJ_sqlncgOpfU4',5),(192,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5Mjc1ODcsImV4cCI6MTc2MDAxMzk4N30.VzRbAXtZaYx_DZKuko0RdOvgseOcWJRvFnDSDkry3z4',5),(193,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU5OTI4MjUwLCJleHAiOjE3NjAwMTQ2NTB9.1-PhC1mFV_NBDyVBKC5bkkBFDXwYjQO0EukMdeeokjQ',6),(194,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzU5OTI4MjcwLCJleHAiOjE3NjAwMTQ2NzB9.-6b2mJksF5RPQ4ylTYMcR03m302DderoIDpVj77D0Xo',6),(195,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NTk5Mjk0NTcsImV4cCI6MTc2MDAxNTg1N30.IxEmLsW1tqDTUgG0Vq0maopw68zMAqBz5nrdIYetoCY',5),(196,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAwMDA2MTksImV4cCI6MTc2MDA4NzAxOX0.MCOfA4Y3lDh5eDffu0oKQZl4UIiSoWOOaeM71ubi8no',5),(197,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMDAwODYzLCJleHAiOjE3NjAwODcyNjN9.K7lno9g9qoB1WcGSHXXnIzRxaTcOouWIg-TelQPzKYk',6),(198,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMDAxMzc1LCJleHAiOjE3NjAwODc3NzV9.GueHNhcuyzZSvSq5-eoGXhJ4HSOQZLbo5twWSqmRefw',6),(199,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDI3MjUsImV4cCI6MTc2MDA4OTEyNX0.mf3XUCInARbFKbHqF93Q7UwpgeLG4McNyPLjA9S8Nzw',10),(200,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDM4MTAsImV4cCI6MTc2MDA5MDIxMH0.g20UgpOt6aDJlTLllWWywzTRo-oqcuZaOUuAbMTPA0M',10),(201,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDM4MTEsImV4cCI6MTc2MDA5MDIxMX0.aHQz0YsxzeB9a30-8eac0fUsjmYkZGNSghQtBeXaVVQ',10),(202,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDM4MTMsImV4cCI6MTc2MDA5MDIxM30.LS5jIZMKNoKmThuqJHa7BX6qW7U2ZSiDb-rzbcWGagU',10),(203,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDM4MTMsImV4cCI6MTc2MDA5MDIxM30.LS5jIZMKNoKmThuqJHa7BX6qW7U2ZSiDb-rzbcWGagU',10),(204,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDM4MTMsImV4cCI6MTc2MDA5MDIxM30.LS5jIZMKNoKmThuqJHa7BX6qW7U2ZSiDb-rzbcWGagU',10),(205,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDM5NjUsImV4cCI6MTc2MDA5MDM2NX0.frYw0306A1eIS1prOmxSedTwaAcbANDZSH43wT5o6CA',10),(206,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDAwNTA1MywiZXhwIjoxNzYwMDkxNDUzfQ.SBkNAgmF3F0s_F91rPmZeCIxvk6b6Js4-LnK6dr5HLA',1),(207,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDUxMDAsImV4cCI6MTc2MDA5MTUwMH0.I-oV0ncIuwM0MXR8Uy6VfMzUj2lm5AOYXwQzjl5SXbI',10),(208,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDY0NTIsImV4cCI6MTc2MDA5Mjg1Mn0.XTBSXliOmlek7nsgCCCBt6mfDkQhEpxWxarmVgBKJMU',10),(209,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDY3MDksImV4cCI6MTc2MDA5MzEwOX0.ZK_wMN4EuCNalZkB9CwSnX95VKMjj_dTsOKMUP3qd8o',10),(210,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDY3NzcsImV4cCI6MTc2MDA5MzE3N30.AdFfI-fCvzp3pcA0QeTyV3U0C-yGdMPYU2lktkyAVtk',10),(211,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDgyNTYsImV4cCI6MTc2MDA5NDY1Nn0.tRoXZT0J7AGhJmFzQ8Fk8OL49q2MumuuBtDGW9EunU8',10),(212,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDgzNDAsImV4cCI6MTc2MDA5NDc0MH0.0VUW48zDhJXblEVP00Dmmc2xwSXEUnngHmGmoEQZD3M',10),(213,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDg4NTAsImV4cCI6MTc2MDA5NTI1MH0.39fSJowKy8id0srdIk-nPS1JO4t4mTeTmC9vOzwBuaY',10),(214,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMDkyNjYsImV4cCI6MTc2MDA5NTY2Nn0.MKIBfoJRY4W9AvYqnqs9-8P8fznETJVmv4Fr9tHgGLg',10),(215,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTAzMTAsImV4cCI6MTc2MDA5NjcxMH0.IYZONByM7nv3IrwcdvgftKBGtRDrGWC4irHBXn0DUpA',10),(216,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTA0ODksImV4cCI6MTc2MDA5Njg4OX0.C8i0V9w4XOOIxWaBvCfnWgSs2aBqX-3Qxrmf4Xl0OBU',10),(217,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTA2NDgsImV4cCI6MTc2MDA5NzA0OH0.80xc8Kul8xeZaGSlch7eErzufs7rwZr_2IhWJctgkeY',10),(218,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTA4MTksImV4cCI6MTc2MDA5NzIxOX0.iuR6oOF2IeoimphMX5Jb5_kts-Zn5d4YHjUTle0EtMU',10),(219,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTEyMzIsImV4cCI6MTc2MDA5NzYzMn0.8Pohgg_IbPbA99NrHnqY7_xgXc4acTVjftMBDQ7RFsY',10),(220,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTE0NjcsImV4cCI6MTc2MDA5Nzg2N30.C5YnMU53iUBqav-RDj2ahaqHOWYGCr55znMNdytaG7c',10),(221,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAwMTE3NDksImV4cCI6MTc2MDA5ODE0OX0.yyC9aOsS3-2mOPvDZXaxBs0GoyH1UWXHstteZ87h6SY',10),(222,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDAxMjI5NCwiZXhwIjoxNzYwMDk4Njk0fQ.8r68y_FU38aAwtsY8mm4vnngVs7AYcOA9ZI9vYcxt8M',1),(223,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMDEzMTY0LCJleHAiOjE3NjAwOTk1NjR9.N3ufKMub0uykPqFUk73hbtn0UZxsUYrDCp_D33HlwLk',6),(224,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMDEzNDU0LCJleHAiOjE3NjAwOTk4NTR9.7NzW2g-RzP8ZNRKZbaUDBL48aZJcUBZcs8xSFRR7kqY',6),(225,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMDEzNzE3LCJleHAiOjE3NjAxMDAxMTd9.oYtrTDx4H970gT36OaxuUhjcph1h20KYOmW6QBbmyw4',6),(226,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAwMTQ4MDYsImV4cCI6MTc2MDEwMTIwNn0.r5OG4EjcIfDF89ZjUPYgf9MWhY8uwUaPV91g-n0KxpI',5),(227,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAwMTUyODIsImV4cCI6MTc2MDEwMTY4Mn0.9Ojljq9pNKEJPEryMWtyHRFU17Jmhzc0x7VaZlB2eoM',5),(228,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxNzMwODUsImV4cCI6MTc2MDI1OTQ4NX0.qoy6IFgU2v2xNa4mLGTR7wOUjgAEJ7c8AJ6N65oTc-4',10),(229,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAxNzMxNzIsImV4cCI6MTc2MDI1OTU3Mn0.Eyio8MxaI-vVObHpWAgXhkCywgKWQJYihmwmrHMS9rE',5),(230,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMTczMjIxLCJleHAiOjE3NjAyNTk2MjF9.697K4h-nQ5oSHZou05MfAFnGrRcjSgky_Rtr65TFUx8',6),(231,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc2MDE3MzMxOCwiZXhwIjoxNzYwMjU5NzE4fQ.kg1lfoTB8Dgc-MIx8g8Nz4FVIY7xEOE7W7QLVkHOdbk',4),(232,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWhydWtoQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc2MDE3MzM3NSwiZXhwIjoxNzYwMjU5Nzc1fQ.6cgbXipvP6zi1JvWr6ybHBWetfOYuwwYh8Duvl6FyPQ',11),(233,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxNzM0MTMsImV4cCI6MTc2MDI1OTgxM30.jMZPIlvOMySgaqjWqfRDwYDH1eVuQKhtMSeFKqtvqcc',10),(234,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NjAxNzM0NTEsImV4cCI6MTc2MDI1OTg1MX0.OHdURjg6XOKlD39B4fzIok2--fCh8340J8AYJavhe68',9),(235,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWhydWtoQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc2MDE3Mzc5OCwiZXhwIjoxNzYwMjYwMTk4fQ.Ju-5cT2q3JZhdkFOkePn_x_UvJkHEoPAz8Qj_9srK4o',11),(236,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDE3NDYwNywiZXhwIjoxNzYwMjYxMDA3fQ.3NpjjF0nwYeaUMPk59qp-9ElWM3wLk3foqGX-rdlAgs',1),(237,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxNzcwNjAsImV4cCI6MTc2MDI2MzQ2MH0.vMGfgww0FWDrBepcwouWIbcUxgUWn3u9Hs5Z80e7LFo',10),(238,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAxNzgwMDYsImV4cCI6MTc2MDI2NDQwNn0.HSFNVxXSabyHfeNyGg5Dibg48fOg15uZRdDeJF98ft0',5),(239,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDE3ODI1NiwiZXhwIjoxNzYwMjY0NjU2fQ.810qIRNfgdhMd1BKVYXv79oLeo8caNSPWsdlXd6YKeE',1),(240,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODE4OTIsImV4cCI6MTc2MDI2ODI5Mn0.GNu0SIVejTPJvNzASt_zkKS4stXYV1BZKKpXHvT4OYs',10),(241,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODE5OTAsImV4cCI6MTc2MDI2ODM5MH0.vpeF-Jhsg7bEu1qgbCMLfqZ8MsVDGanh_GfKZExe4mE',10),(242,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODI0MTEsImV4cCI6MTc2MDI2ODgxMX0.3uYAqPiLDzxAsClUgPWKIStyuutcaWGUm5GqWP8AMoA',10),(243,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODM5OTcsImV4cCI6MTc2MDI3MDM5N30.WMea6ebrvsqQyRJRsqeo_tjJQOUBtW-1Jl75PjDhCY0',10),(244,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODQxODksImV4cCI6MTc2MDI3MDU4OX0.W6QqzAG0UwfUdUdVFq8bWUCjjv6ShjIuJ9QbVfWwV2Q',10),(245,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODQ0NTYsImV4cCI6MTc2MDI3MDg1Nn0.E_u5W7o1krKE2VjDoJPA7Hx4p7gw_ixwdvW8Mkbo648',10),(246,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODU0MjAsImV4cCI6MTc2MDI3MTgyMH0.yNvT2lSGPkpDRlqY-NiO_ZRbVPNcPoz_jgaMMX38UsI',10),(247,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAxODU4MzMsImV4cCI6MTc2MDI3MjIzM30.TuNChhHFcOsf_T9tUtWQfhpMla9UKB9YKvGg5svuY_8',10),(248,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDE4ODE3NiwiZXhwIjoxNzYwMjc0NTc2fQ.hlLXGyYNIF0Czs32bw5YW5kr3AmAw4KRkclwKMDRnO4',1),(249,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAxODgyMTUsImV4cCI6MTc2MDI3NDYxNX0.2B1PikiKTq16KB43_uE4QvhGV9IAE713HQj7tE79-QY',5),(250,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAyNjQ0MTcsImV4cCI6MTc2MDM1MDgxN30.DUV46wU8V-XAhbr-jn2_B-pqKe-mbFVuLYxXHU36CpM',10),(251,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAyNjUwMDcsImV4cCI6MTc2MDM1MTQwN30.WZ4WHDWSXv0I7Xx2Cw30XKYgU_QUQNtKpu-WdM5Sp6M',10),(252,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAyNjYxOTYsImV4cCI6MTc2MDM1MjU5Nn0.8md0cet_9T72KFLjqRFWXZqOK4VDfkqcOyZciFzxO2s',10),(253,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDI2NjI2NywiZXhwIjoxNzYwMzUyNjY3fQ._fj0Y2TtcX9Lxq5khJIE3eCG20w-g8VfRZHPKKzqh7Y',1),(254,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMjY2OTYzLCJleHAiOjE3NjAzNTMzNjN9.qY2s0ZyCxHxbwbJ8hxKkgcagsk0hYdVi5tvUrhqFThg',6),(255,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMjY3MTQ0LCJleHAiOjE3NjAzNTM1NDR9.hcqhtr0N9OWQTkyxKFBmYeboDWdJ2NBoACfvitGv254',6),(256,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMjY3NDA4LCJleHAiOjE3NjAzNTM4MDh9.6TLqzk6gnE2ODOyvzy8yeltIM8duD51Kaz1C0FgDacY',6),(257,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAyNjc1MTIsImV4cCI6MTc2MDM1MzkxMn0.pz5vpiAZGVmdgAXChsSWKCXPtivqAQ5hexdy-0SN1DQ',5),(258,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAyNzEyOTgsImV4cCI6MTc2MDM1NzY5OH0.QCICK7dmPFlHukQAe959yq_jrD5rVktVViTVcN1S9UY',5),(259,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAyNzI1OTksImV4cCI6MTc2MDM1ODk5OX0.hWrfKNDAc1ZmmyyMkeHuzU1ZX0hpbXLp6od_ZDInQLk',10),(260,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc2MDI3MzcxNCwiZXhwIjoxNzYwMzYwMTE0fQ.fQBkzy8LebBr16s_Ka2pMqlDUJyjI2Ej49Jh1TSvcNA',4),(261,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NjAyNzM3NjIsImV4cCI6MTc2MDM2MDE2Mn0.2f4uqf-gsvNzqZQd7TeIgQ6PkXpUtWDRdhy-p2vx8ug',9),(262,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAyNzM3ODIsImV4cCI6MTc2MDM2MDE4Mn0.hoiiUSlB4t39Gb1kEQKWaGd3-QjrIFve_BuS1KThtZg',10),(263,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMjczOTQzLCJleHAiOjE3NjAzNjAzNDN9.AFE2KcjkMoJTVIuyQIFhej3qzHlfrYuoPDS9SVmOCyU',6),(264,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAyNzM5ODgsImV4cCI6MTc2MDM2MDM4OH0.8IwMZm_2i_3uR5J6RtCD_MxvDqFCYma-a72U7I1Un4Q',5),(265,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAzNTAwMzYsImV4cCI6MTc2MDQzNjQzNn0.mwiLIDU7UfYRm3OPFFB_6uZLwmy4v5luaUtL91F5joI',10),(266,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhdGlxQGdtYWlsLmNvbSIsInJvbGUiOiJSZWNlcHRpb25pc3QiLCJpYXQiOjE3NjAzNTAwOTUsImV4cCI6MTc2MDQzNjQ5NX0.RfuUOXAqcX-D2GTsR5HTKMCynVneKlmxbAGT89uFUig',5),(267,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDM1MDE4NiwiZXhwIjoxNzYwNDM2NTg2fQ.dsGURmK1BPhZ8tiqBB4sLoEQ10iQzwXe1L12wnLYF1w',1),(268,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMzUwMjY1LCJleHAiOjE3NjA0MzY2NjV9.8cXrH04VjQZIvtMpEsdyLMu-zBUEtVnYWsul_lDWkpk',6),(269,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAzNTE3ODYsImV4cCI6MTc2MDQzODE4Nn0.xR_16aMN3RS3Fg7WzVFtXgiZl0f_kD6msOX_UMA4xXk',10),(270,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMzUyNDMyLCJleHAiOjE3NjA0Mzg4MzJ9.2ykkwaltWPx9Q7KUYZNcyYXJY_c7xeDkitWpY2lGUXQ',6),(271,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXByb3Zhc2hlbWFudG9AZ21haWwuY29tIiwicm9sZSI6IkRvY3RvciIsImlhdCI6MTc2MDM1MjQ2MSwiZXhwIjoxNzYwNDM4ODYxfQ.9MG-V4vOcJMIH2a6u9z4UzVjfeaCVubMBXK9FIWJD6U',1),(272,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmR1cnJhaGlta2hhbjIxNGRjQGdtYWlsLmNvbSIsInJvbGUiOiJOdXJzZSIsImlhdCI6MTc2MDM1MjQ4MSwiZXhwIjoxNzYwNDM4ODgxfQ.jLYXNWIkBwFkYjXYENZ9A8mGx2ICAWKOg4Qa0j7aeAo',4),(273,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAzNTI0OTksImV4cCI6MTc2MDQzODg5OX0.zgUU92o6KaNgbCMPQ8U2gifrelk_2KpNNqljWdbsBoY',10),(274,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiTnVyc2UiLCJpYXQiOjE3NjAzNTI5MDMsImV4cCI6MTc2MDQzOTMwM30.5LmuU--7Xm65c2oE02LaYcrs50CerSOjYt7XYbN4P2M',9),(275,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMzUyOTMzLCJleHAiOjE3NjA0MzkzMzN9.ehFKlK8v_6HJZJbpEzLV7h-Uolp7niGluifcJpYE9d4',6),(276,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMzUzMTE2LCJleHAiOjE3NjA0Mzk1MTZ9.H45ew-8q_JnUN1h47Q1B5Wso8XzZtK1wEgzuYRIki0E',6),(277,_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMzUzMjc0LCJleHAiOjE3NjA0Mzk2NzR9.s66iF3fXdqSO8HAtgLDjJOimZH6eMMvtaDwvf2TsQdw',6),(278,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlbXJhbkBnbWFpbC5jb20iLCJyb2xlIjoiQWRtaW4iLCJpYXQiOjE3NjAzNTMzNTIsImV4cCI6MTc2MDQzOTc1Mn0.hfUUMnUfipSP135hR2-lZtQmLIARhQnvTeU6Yooxa3I',10),(279,_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWRpYXJAZ21haWwuY29tIiwicm9sZSI6Ik9mZmljZVN0YWZmIiwiaWF0IjoxNzYwMzU0MDkxLCJleHAiOjE3NjA0NDA0OTF9.ZbFwEOTUmtzM2hf_WQbBEuIpgx-oV3Qry0alKoKGT5U',6);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_lock` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Doctor','Nurse','OfficeStaff','Receptionist') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,_binary '','suprovashemanto@gmail.com',_binary '\0','Suprova Shemanto','$2a$10$Q2zrNbj0w8PkX2ug60W0IO56oyLr5c.Owk5.isMCL6HTTc8HUZAQC','01628195945','Suprova Shemanto_fb5948bc-4424-43ac-8d2f-f412e9901111','Doctor'),(2,_binary '','shemanto08101999@gmail.com',_binary '\0','zdxfcsd','$2a$10$NHjSsoSXQJqP1.867E.zTOJAxDG9t45mvv7sJwp2iDz52oWotNe6q','56416','zdxfcsd_bc1e03a8-d57e-401d-bd1d-97bbea0818f6','Doctor'),(3,_binary '','mr.t.imran11@gmail.com',_binary '\0','Prof. Imran Mia','$2a$10$/SYRueFQMySBLGzwB/1cMerxHizJsSJiTbNXVH2T2YcCn.PTBULFW','4518+9','Prof. Imran Mia_8d59b0f4-d4b5-4cf3-a251-67af75d75d47','Doctor'),(4,_binary '','abdurrahimkhan214dc@gmail.com',_binary '\0','Rahim Khan','$2a$10$ho1qlh5VNBLCRPOZWESka.98aGy2U5LnKYQgu71J19c9myAMlgD/O','10564896','Rahim Khan_fc689727-3f11-41e1-b197-11b1eaf7ca3c','Nurse'),(5,_binary '','atiq@gmail.com',_binary '\0','Atik Islam','$2a$10$m8igzAqN0dogg9GCkgQwveUJBM1RipxhjvS34XDzKso68fVGfZna.','0584856651','Atik Islam_ce56f46f-635f-4ca5-8388-13e854b98dbd','Receptionist'),(6,_binary '','sadiar@gmail.com',_binary '\0','Sadiar Rahman','$2a$10$sMHqZ9W6gyAw567GTrRE3.0TjHHECwfXX0qOtNWoKbPBV1rA8layG','056498894582','Sadiar Rahman_27db1a10-3292-4bc9-b603-18c4b2ed39dc','OfficeStaff'),(7,_binary '','fht@hb.fdgv',_binary '\0','tfhft','$2a$10$j7WMECk.bmcA1KUoDN.AYuKVqP0LZpbej1GwHixiGY.btfJdNaBeW','01628195945','tfhft_0015cca0-f5f0-4846-9488-a6030c3c359a','Doctor'),(8,_binary '','shemanto08101999@gmail.com',_binary '\0','dxgvf','$2a$10$1Ace5Xn15PVNcVc.jD4UbOlRWqK5XaDeiSbXxFHyBpebbhN2rQeVC','fgvdfv','dxgvf_9938b6ec-3099-4b86-b0be-1785199932c3','Doctor'),(9,_binary '','imran@gmail.com',_binary '\0','safcsdac','$2a$10$0Y7/VudNR6zboog7wISlnuAYgqF4bmJj1uz.SSECvSaOB77tfP5/.','419898','safcsdac_bab056f7-1bfc-4b16-b3f4-97f4e1a5b923','Nurse'),(10,_binary '','emran@gmail.com',_binary '\0','Mohammad Emran Hossain','$2a$10$6qrt5em4CloLoUpr8kLWYe3HAcSi4b5iD3HdfoNsxHL5pye13XeNS','0197413635885','Mohammad Emran Hossain_8c7bf6fe-b003-4ed0-b7be-268ce4592ec1','Admin'),(11,_binary '','sahrukh@gmail.com',_binary '\0','rohmot','$2a$10$PfJQcd0l.18OJjW7xPKtoOSqCPQp29vNAyUMuDd66Xev9UUY6lSwe','641865','rohmot_bd0d0e2e-437a-4e6c-a082-409f2534837d','Nurse'),(12,_binary '','sup@gmail.com',_binary '\0','djsf','$2a$10$KXCvcNC1/ENYEj7p1O1rRubZYcfaOMOKeqIGdHeE.UnCj51HmSXBK','1444444444469','djsf_2f3378a4-8e8e-4453-8202-7f6d3e9e2891','Receptionist'),(13,_binary '','simki@gmail.com',_binary '\0','afcsc','$2a$10$FTisT8VYvRVJF0B6w.2GxeXu5819dZLLtTazNFwkhM4lYK6h15OP6','sc','afcsc_2fb4c9c4-847a-43ea-82a1-c147676595ee','Nurse');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_tokens`
--

DROP TABLE IF EXISTS `users_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_tokens` (
  `user_id` int NOT NULL,
  `tokens_id` bigint NOT NULL,
  UNIQUE KEY `UKf4rxms009ktbqt31o6p4y8vhw` (`tokens_id`),
  KEY `FK1xl95grn90nu35htsi9o5kbxw` (`user_id`),
  CONSTRAINT `FK1xl95grn90nu35htsi9o5kbxw` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK2b23nqo552bhfydxn9plx4vod` FOREIGN KEY (`tokens_id`) REFERENCES `token` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_tokens`
--

LOCK TABLES `users_tokens` WRITE;
/*!40000 ALTER TABLE `users_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wards` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price_per_day` double NOT NULL,
  `ward_name` varchar(255) DEFAULT NULL,
  `ward_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
INSERT INTO `wards` VALUES (1,1800,'Child','GENERAL'),(2,2200,'Female','GENERAL'),(3,2200,'Male','GENERAL'),(4,7800,'VIP','CABIN'),(5,22000,'1001','ICU'),(6,5156,'sdfdsv','GENERAL'),(7,9000,'ffg','CABIN');
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-13 17:29:56
