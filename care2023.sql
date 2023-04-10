-- MySQL dump 10.13  Distrib 5.7.23-23, for Linux (x86_64)
--
-- Host: localhost    Database: emjxoqjo_care
-- ------------------------------------------------------
-- Server version	5.7.23-23

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `acc_group`
--

DROP TABLE IF EXISTS `acc_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_group` (
  `groupid` int(150) NOT NULL AUTO_INCREMENT,
  `group_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_code` int(150) DEFAULT NULL,
  `add_date` int(150) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_group`
--

LOCK TABLES `acc_group` WRITE;
/*!40000 ALTER TABLE `acc_group` DISABLE KEYS */;
INSERT INTO `acc_group` VALUES (1,'Assets',101,NULL),(2,'Liabilities',102,NULL),(3,'Income',103,NULL),(4,'Expense',104,NULL),(5,'Capital',105,NULL);
/*!40000 ALTER TABLE `acc_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_head`
--

DROP TABLE IF EXISTS `acc_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_head` (
  `head_id` int(150) NOT NULL AUTO_INCREMENT,
  `acc_head_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acc_head_code` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_id` int(150) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `add_date_time` datetime DEFAULT NULL,
  `head_status` int(150) DEFAULT '1',
  `group_id` int(150) DEFAULT NULL,
  `current_balance` double(10,2) DEFAULT '0.00',
  `opening_balance` double(10,2) DEFAULT '0.00',
  `add_by` int(150) DEFAULT NULL,
  PRIMARY KEY (`head_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_head`
--

LOCK TABLES `acc_head` WRITE;
/*!40000 ALTER TABLE `acc_head` DISABLE KEYS */;
INSERT INTO `acc_head` VALUES (1,'Lab Reagent','01',NULL,'2022-12-03','2022-12-03 16:32:00',1,4,0.00,NULL,NULL),(2,'X-Ray Flim','02',NULL,'2022-12-03','2022-12-03 16:32:20',1,4,0.00,NULL,NULL),(3,'R/F','',NULL,'2023-02-24','2023-02-24 16:14:38',1,4,0.00,NULL,NULL),(4,'Others Income','',NULL,'2023-02-24','2023-02-24 16:23:07',1,3,0.00,NULL,NULL),(5,'Lab Machinerize Cost','',NULL,'2023-02-24','2023-02-24 16:24:32',1,1,0.00,NULL,NULL),(6,'Brack Bank','',NULL,'2023-02-24','2023-02-24 16:29:06',1,2,0.00,NULL,NULL);
/*!40000 ALTER TABLE `acc_head` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_income_expense`
--

DROP TABLE IF EXISTS `add_income_expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_income_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challan_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_gen_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acc_head_id` int(11) NOT NULL DEFAULT '0',
  `income_expense_purpose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Asset also',
  `total_amount` double NOT NULL DEFAULT '0',
  `per_amount` double NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_paid` int(11) NOT NULL DEFAULT '0',
  `paid_by` int(11) NOT NULL DEFAULT '0' COMMENT '1-cash 2-check 3-bkash',
  `bank_acc_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bkash_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_pass_date` datetime DEFAULT NULL,
  `tx_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1-add income 2-add expense 3=add asset',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inc_exp_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_income_expense`
--

LOCK TABLES `add_income_expense` WRITE;
/*!40000 ALTER TABLE `add_income_expense` DISABLE KEYS */;
INSERT INTO `add_income_expense` VALUES (1,'0123','000001_20221203163329_5',1,'Creatinine Reagen 100ml',3000,0,0,3000,1,'','','','0000-00-00 00:00:00','',2,'2022-12-03 16:33:29','2022-12-03 10:33:29','Manager',5,'care',1),(2,'0325','000002_20221203163353_5',2,'X-Ray Flim 12/12',12000,0,0,12000,1,'','','','0000-00-00 00:00:00','',2,'2022-12-03 16:33:53','2022-12-03 10:33:53','Manager',5,'care',1),(3,'ID-18','000003_20230224161521_5',3,'Bangla Inc',390,0,0,390,1,'','','','0000-00-00 00:00:00','',2,'2023-02-24 16:15:21','2023-02-24 10:15:21','Manager',5,'care',1),(4,'1001','000004_20230224162123_5',1,'Creatinene',2000,0,0,2000,1,'','','','0000-00-00 00:00:00','',2,'2023-02-24 16:21:23','2023-02-24 10:21:23','Manger',5,'care',1),(5,'011','000005_20230224162543_5',5,'Biochemistry Analyzer',2000,2000,1,2000,1,'','','','0000-00-00 00:00:00','',3,'2023-02-24 16:25:43','2023-02-24 10:25:43','Biotech Int',5,'care',1),(6,'011','000006_20230224162625_5',5,'Cell Counter',35000,35000,1,35000,1,'','','','0000-00-00 00:00:00','',3,'2023-02-24 16:26:25','2023-02-24 10:26:25','Biotech Int',5,'care',1);
/*!40000 ALTER TABLE `add_income_expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_specimen`
--

DROP TABLE IF EXISTS `add_specimen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_specimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 2=delete',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `specimen` (`specimen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_specimen`
--

LOCK TABLES `add_specimen` WRITE;
/*!40000 ALTER TABLE `add_specimen` DISABLE KEYS */;
INSERT INTO `add_specimen` VALUES (1,'Blood',1,'2020-05-01 16:37:17'),(2,'Imaging',1,'2020-05-02 16:37:33'),(3,'Urine',1,'2020-05-03 16:37:44'),(4,'Radiology',1,'2020-05-04 16:37:50'),(5,'Stool',1,'2020-05-05 16:37:57'),(6,'Any Others Sample',1,'2020-05-05 16:38:03'),(7,'Echo',1,'2020-05-06 16:38:08'),(10,'Electric Cardiograp',1,'2020-05-07 16:38:11');
/*!40000 ALTER TABLE `add_specimen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_technologist`
--

DROP TABLE IF EXISTS `add_technologist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_technologist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specimen_id` int(11) NOT NULL DEFAULT '0',
  `checked_by_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepared_by_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technologist_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_by_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepared_by_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technologist_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_by_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepared_by_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technologist_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technologist_add_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technologist_add_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepared_add_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prepared_add_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_add_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_add_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_technologist`
--

LOCK TABLES `add_technologist` WRITE;
/*!40000 ALTER TABLE `add_technologist` DISABLE KEYS */;
INSERT INTO `add_technologist` VALUES (1,16,'avvv','f','d','b','f','d','c','d','d','d','deee','d','dttyy','f','e','2020-08-16 15:38:18','2020-08-16 09:38:18'),(2,15,'a','c','c','c','g','c','e','b','c','c','m','c','c','d','c',NULL,'2020-08-16 10:09:16'),(3,1,'a','v','v','asd','asdas','da','dada','dad','da','dad','v','aad','ada','dad','ada',NULL,'2020-08-16 10:14:56'),(4,2,'Dr. Sagata Lakxmi Mimi','','','MBBS.CMU.PGT.(Medicine)','','','Medical Officer','','','','','','','Life-Line Hospital.(pvt)','',NULL,'2022-11-28 12:29:12');
/*!40000 ALTER TABLE `add_technologist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_type`
--

DROP TABLE IF EXISTS `admin_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '1=Software Superadmin,2=Software Agent,3=Hospital Admin,4=Hospital Subadmin,5=Hospital IPD,6=Hospital OPD,7=Hospital Pharmacy',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_type`
--

LOCK TABLES `admin_type` WRITE;
/*!40000 ALTER TABLE `admin_type` DISABLE KEYS */;
INSERT INTO `admin_type` VALUES (3,'Hospital Admin',1),(4,'Pharmacy Admin',1),(5,'Ipd Admin',1),(6,'Opd Admin',1),(7,'Lab Admin',1),(8,'Reception Admin',1),(9,'Accounts Admin',1),(10,'Doctor Admin',1),(11,'Attendant Admin',1);
/*!40000 ALTER TABLE `admin_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_payment`
--

DROP TABLE IF EXISTS `appointment_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `net_amount` double NOT NULL DEFAULT '0',
  `total_paid` double NOT NULL DEFAULT '0',
  `due` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_payment`
--

LOCK TABLES `appointment_payment` WRITE;
/*!40000 ALTER TABLE `appointment_payment` DISABLE KEYS */;
INSERT INTO `appointment_payment` VALUES (1,1,700,0,700,700,0,'2022-11-05 00:00:00','2022-11-05 15:59:51'),(2,2,1000,0,1000,1000,0,'2022-11-15 00:00:00','2022-11-15 16:31:44'),(3,3,500,0,500,0,500,'2022-11-28 00:00:00','2022-11-28 07:19:32'),(4,3,0,0,0,500,0,NULL,'2022-11-28 07:23:57'),(5,4,500,0,500,500,0,'2022-11-29 00:00:00','2022-11-29 16:55:54'),(6,5,500,0,500,500,0,'2023-01-07 00:00:00','2023-01-07 14:46:22'),(7,6,500,0,500,500,0,'2023-01-13 00:00:00','2023-01-13 15:13:53');
/*!40000 ALTER TABLE `appointment_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_prescription_details`
--

DROP TABLE IF EXISTS `appointment_prescription_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_prescription_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicine_id` int(11) DEFAULT '0',
  `medicine_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daily_dose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dose_qty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_prescription_details`
--

LOCK TABLES `appointment_prescription_details` WRITE;
/*!40000 ALTER TABLE `appointment_prescription_details` DISABLE KEYS */;
INSERT INTO `appointment_prescription_details` VALUES (17,1,'Tablate',1,'Tab:Napa 500mg','1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4','1+1+1','10day','খাওয়ার পরে খাবেন',1,'2022-11-06 12:03:34','2022-11-05 18:03:34'),(18,1,'Tablate',2,'Tab:Ciprocin 500mg',NULL,'1+0+1','7day','খাওয়ার পরে খাবেন',1,'2022-11-06 12:03:34','2022-11-05 18:03:34'),(19,1,'Capsule',3,'Cap:Surgle 20mg',NULL,'1+0+1','7day','খাওয়ার 20 মিনিট আগে খাবেন',1,'2022-11-06 12:03:34','2022-11-05 18:03:34'),(20,1,'Capsule',4,'Cap:Fimoxyl 500mg',NULL,'1+0+1','7Day','খাওয়ার পরে খাবেন',1,'2022-11-06 12:03:34','2022-11-05 18:03:34'),(22,3,'Tablate',1,'Tab:Napa 500mg','1,2,3,4','(1  +  1  +  1)','10day','',1,'2022-11-28 01:21:58','2022-11-28 07:21:58'),(23,3,'Tablate',2,'Tab:Ciprocin 500mg','1,2,3,4','1+0+1','10day','',1,'2022-11-28 01:21:58','2022-11-28 07:21:58'),(24,3,'Capsule',3,'Cap:Surgle 20mg','1,2,3,4','(1  +  0  +  1)','10day','',1,'2022-11-28 01:21:58','2022-11-28 07:21:58'),(25,3,'Capsule',4,'Cap:Fimoxyl 500mg','1,2,3,4','(1  +  0  +  1)','7Day','',1,'2022-11-28 01:21:58','2022-11-28 07:21:58'),(28,4,'Tablate',1,'Tab:Napa 500mg','1,2,3,4','(1  +  1  +  1)','7day','',1,'2022-11-29 10:59:58','2022-11-29 16:59:58'),(29,4,'Tablate',2,'Tab:Ciprocin 500mg','1,2,3,4','1+0+1','7day','',1,'2022-11-29 10:59:58','2022-11-29 16:59:58'),(30,4,'Capsule',3,'Cap:Surgle 20mg','1,2,3,4','1+0+1','7day','',1,'2022-11-29 10:59:58','2022-11-29 16:59:58'),(31,4,'Capsule',0,'Tab: Clofanac 500mg','1,2,3,4','1+0+1','7day','',1,'2022-11-29 10:59:58','2022-11-29 16:59:58'),(35,5,'Tablate',1,'Tab:Napa 500mg','1,2,3,4,1,2,3,4,1,2,3,4','প্রতিদিন সকালে একটা বিকালে একটা ','১০ দিন','খাওয়ার ২০ মিনিট আগে খাবেন ',1,'2023-01-13 09:09:06','2023-01-13 15:09:06'),(36,5,'Tablate',2,'Tab:Ciprocin 500mg',NULL,'প্রতিদিন সকালে একটি খাবেন ','১০ দিন','খাওয়ার আগে',1,'2023-01-13 09:09:06','2023-01-13 15:09:06'),(37,5,'Capsule',3,'Cap:Surgle 20mg',NULL,'১টা করে দিন ২ বার','১০ দিন','খাওয়ার ২০ মিনিট আগে',1,'2023-01-13 09:09:06','2023-01-13 15:09:06'),(38,6,'Tablate',1,'Tab:Napa 500mg','1,2,3,4','1 + 0 + 1','7Day','',1,'2023-01-13 09:14:52','2023-01-13 15:14:52'),(39,6,'Tablate',2,'Tab:Ciprocin 500mg','1,2,3,4','1 + 0 + 1','7Day','',1,'2023-01-13 09:14:52','2023-01-13 15:14:52'),(40,6,'Capsule',3,'Cap:Surgle 20mg','1,2,3,4','1 + 0 + 1','7Day','',1,'2023-01-13 09:14:52','2023-01-13 15:14:52'),(41,6,'Capsule',4,'Cap:Fimoxyl 500mg','1,2,3,4','1 + 0 + 1','7Day','',1,'2023-01-13 09:14:52','2023-01-13 15:14:52');
/*!40000 ALTER TABLE `appointment_prescription_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `area_id` int(150) NOT NULL AUTO_INCREMENT,
  `area_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_title_bangla` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `division_id` int(11) NOT NULL,
  `district_id` int(150) DEFAULT NULL,
  `area_st` int(150) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'mirpur','মিরপুর','','2017-12-19 11:34:16',3,1,NULL),(2,'Uttara','উত্তরা','','2017-12-19 11:34:56',3,1,NULL),(3,'Dhanmondi','ধানমন্ডি','','2017-12-19 11:35:56',3,1,NULL),(4,'Gulshan','গুলশান','','2017-12-19 11:36:54',3,1,NULL),(5,'Mohammadpur','মোহাম্মদপুর','','2017-12-19 11:38:01',3,1,NULL),(6,'Elephant Road','এলিফ্যান্ট রোড','','2017-12-19 11:44:21',3,1,NULL),(7,'Wari','ওয়ারী','','2017-12-19 11:44:54',3,1,NULL),(8,'Kawranbazar','কাওরানবাজার','','2017-12-19 11:45:38',3,1,NULL),(9,'Kafrul','কাফরুল','','2017-12-19 11:47:56',3,1,NULL),(10,'Kamrangirchar','কামরাঙ্গীরচর','','2017-12-19 11:49:06',3,1,NULL),(11,'Keraniganj','কেরানীগঞ্জ','','2017-12-19 11:50:16',3,1,NULL),(12,'Kotowali','কোতোয়ালী','','2017-12-19 11:50:51',3,1,NULL),(13,'Cantonment','ক্যান্টনমেন্ট','','2017-12-19 11:51:25',3,1,NULL),(14,'Khilkhet','খিলক্ষেত','','2017-12-19 11:52:39',3,1,NULL),(15,'Khilgaon','খিলগাঁও','','2017-12-19 11:53:31',3,1,NULL),(16,'Chaukbazar','চকবাজার','','2017-12-19 11:54:05',3,1,NULL),(17,'Tongi','টঙ্গী','','2017-12-19 11:54:29',3,1,NULL),(18,'Demra','ডেমরা','','2017-12-19 11:55:10',3,1,NULL),(19,'Tejgaon','তেজগাঁও','','2017-12-19 11:55:42',3,1,NULL),(20,'Dohar','দোহার','','2017-12-19 11:56:29',3,1,NULL),(21,'Dhamrai','ধামরাই','','2017-12-19 11:56:57',3,1,NULL),(22,'Nawabganj','নবাবগঞ্জ','','2017-12-19 11:57:31',3,1,NULL),(23,'New market','নিউমার্কেট','','2017-12-19 11:57:58',3,1,NULL),(24,'Paltan','পল্টন','','2017-12-19 11:58:29',3,1,NULL),(25,'Purbachal','পূর্বাচল','','2017-12-19 11:58:59',3,1,NULL),(26,'Bangshal','বংশাল','','2017-12-19 11:59:38',3,1,NULL),(27,'Banani','বনানী','','2017-12-19 11:59:57',3,1,NULL),(28,'Banani DHOS','বনানী ডিওএইচএস','','2017-12-19 12:00:37',3,1,NULL),(29,'Bashundhara','বসুন্ধরা','','2017-12-19 12:01:04',3,1,NULL),(30,'Bangla-motor','বাংলামোটর','','2017-12-19 12:02:10',3,1,NULL),(31,'Badda','বাড্ডা','','2017-12-19 12:02:40',3,1,NULL),(32,'Baridhara','বারিধারা','','2017-12-19 12:03:04',3,1,NULL),(33,'Basabo','বাসাবো','','2017-12-19 12:03:35',3,1,NULL),(34,'Mogbazar','মগবাজার','','2017-12-19 12:04:01',3,1,NULL),(35,'Motijheel','মতিঝিল','','2017-12-19 12:05:46',3,35,NULL),(36,'Mohakali','মহাখালী','','2017-12-19 12:05:09',3,1,NULL),(37,'Mohakali DOHS','মহাখালী ডিওএইচএস','','2017-12-19 12:06:40',3,1,NULL),(38,'Malibag','মালিবাগ','','2017-12-19 12:07:05',3,1,NULL),(39,'Mirpur DOHS','মিরপুর ডিওএইচএস','','2017-12-19 12:07:43',3,1,NULL),(40,'Jattarabadi','যাত্রাবাড়ি','','2017-12-19 12:08:44',3,1,NULL),(41,'Ramna','রমনা','','2017-12-19 12:09:11',3,1,NULL),(42,'Rampura','রামপুরা','','2017-12-19 12:09:36',3,1,NULL),(43,'Lalbag','লালবাগ','','2017-12-19 12:10:04',3,1,NULL),(44,'Shajahanpur','শাজাহানপুর','','2017-12-19 12:10:37',3,1,NULL),(45,'Savar','সাভার','','2017-12-19 12:11:00',3,1,NULL),(46,'Sutrapur','সুত্রাপুর','','2017-12-19 12:11:45',3,1,NULL),(47,'Hazaribag','হাজারীবাগ','','2017-12-19 12:12:27',3,1,NULL),(48,'Agrabad','আগ্রাবাদ','','2017-12-19 12:16:07',2,43,NULL),(49,'Chawkbazar','চকবাজার','','2017-12-19 12:16:57',2,43,NULL),(50,'Halishahar','হালিশহর','','2017-12-19 12:17:52',2,43,NULL),(51,'Nasribad','নাসিরাবাদ','','2017-12-19 12:18:16',2,43,NULL),(52,'Chandgaon','চাঁদগাও','','2017-12-19 12:19:29',2,43,NULL),(53,'Anowara','আনোয়ারা','','2017-12-19 12:35:22',2,43,NULL),(54,'Anderkilla','আন্দরকিল্লা','','2017-12-19 12:36:10',2,43,NULL),(55,'Karnafuly','কর্ণফুলী','','2017-12-19 12:36:53',2,43,NULL),(56,'Cornelhat','কর্নেলহাট','','2017-12-19 12:37:21',2,43,NULL),(57,'Kotwali','কোতয়ালী','','2017-12-19 12:37:53',2,43,NULL),(58,'Khulshi','খুলশি','','2017-12-19 12:38:14',2,43,NULL),(59,'Chandanaish','চন্দনাঈশ','','2017-12-19 12:38:48',2,43,NULL),(60,'Jamalkhan','জামালখান','','2017-12-19 12:39:30',2,43,NULL),(61,'Double mooring','ডাবল মুরিং','','2017-12-19 12:39:57',2,43,NULL),(62,'Patiya','পটিয়া','','2017-12-19 12:40:21',2,43,NULL),(63,'Patenga','পতেঙ্গা','','2017-12-19 12:40:47',2,43,NULL),(64,'Panchlaish','পাঁচলাইশ','','2017-12-19 12:41:31',2,43,NULL),(65,'Pahartali','পাহাড়তলী','','2017-12-19 12:42:03',2,43,NULL),(66,'Fatikchari','ফটিকছড়ি','','2017-12-19 12:42:38',2,43,NULL),(67,'Bandar','বন্দর','','2017-12-19 12:43:03',2,43,NULL),(68,'Banskhali','বাঁশখালী','','2017-12-19 12:43:30',2,43,NULL),(69,'Baizid','বাইজিদ','','2017-12-19 12:44:32',2,43,NULL),(70,'Bakoliya','বাকলিয়া','','2017-12-19 12:45:22',2,43,NULL),(71,'Boalkhali','বোয়ালখালী','','2017-12-19 12:45:50',2,43,NULL),(72,'Mirsharai','মীরসরাই','','2017-12-19 12:46:38',2,43,NULL),(73,'Muradpur','মুরাদপুর','','2017-12-19 12:47:04',2,43,NULL),(74,'Raozan','রাউজান','','2017-12-19 12:47:36',2,43,NULL),(75,'Rangunia','রাঙ্গুনিয়া','','2017-12-19 12:48:06',2,43,NULL),(76,'Lalkhan bazar','লালখান বাজার','','2017-12-19 12:48:35',2,43,NULL),(77,'Lohagara','লোহাগাড়া','','2017-12-19 12:49:06',2,43,NULL),(78,'Sholasahar','ষোলশহর','','2017-12-19 12:49:52',2,43,NULL),(79,'Sandwip','সন্দ্বীপ','','2017-12-19 12:50:20',2,43,NULL),(80,'Satkania','সাতকানিয়া','','2017-12-19 12:50:51',2,43,NULL),(81,'CDA Avenue','সিডিএ এভিনিউ','','2017-12-19 12:51:22',2,43,NULL),(82,'Shitakunda','সীতাকুন্ড','','2017-12-19 12:51:52',2,43,NULL),(83,'Hathazari','হাটহাজারী','','2017-12-19 12:52:22',2,43,NULL),(84,'Panthapath',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(85,'shyamoli',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(86,'GEC Circle',NULL,NULL,'2018-03-03 21:02:47',2,43,NULL),(87,'Norshindi Sadar ',NULL,NULL,'2018-03-03 21:02:47',3,12,NULL),(88,'Agargoan ',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(89,'Konabari',NULL,NULL,'2018-03-03 21:02:47',3,3,NULL),(90,'Mawna',NULL,NULL,'2018-03-03 21:02:47',3,3,NULL),(91,'Gazipur Sadar',NULL,NULL,'2018-03-03 21:02:47',3,3,NULL),(92,'Kathalbagan ',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(93,'Postogola',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(94,'Green Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(95,'Badargonj Road',NULL,NULL,'2018-03-03 21:02:47',6,32,NULL),(96,'Brahmanbaria Road',NULL,NULL,'2018-03-03 21:02:47',2,41,NULL),(97,'Adabor',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(98,'Manikganj',NULL,NULL,'2018-03-03 21:02:47',3,8,NULL),(99,'Kalabagan',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(100,'Tangail',NULL,NULL,'2018-03-03 21:02:47',3,17,NULL),(101,'Chuadanga',NULL,NULL,'2018-03-03 21:02:47',4,56,NULL),(102,'Lalmatia',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(103,'Kakrail',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(104,'Tikatuli',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(105,'Kallyanpur',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(106,'Jamalpur',NULL,NULL,'2018-03-03 21:02:47',3,5,NULL),(107,'Pabna',NULL,NULL,'2018-03-03 21:02:47',5,23,NULL),(108,'Rajarbagh',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(109,'Eskaton',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(110,'Bogra',NULL,NULL,'2018-03-03 21:02:47',5,18,NULL),(111,'Kamlapur',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(112,'Becharam Dewri Lane',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(113,'Nayapaltan',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(114,'Sadarghat',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(115,'Nilkhet',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(116,'Medical College Rd',NULL,NULL,'2018-03-03 21:02:47',7,54,NULL),(117,'Hatirpool',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(118,'New Eskaton',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(119,'Islampur Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(120,'Armanitola',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(121,'Mymensingh Sadar',NULL,NULL,'2018-03-03 21:02:47',3,10,NULL),(122,'Narayanganj',NULL,NULL,'2018-03-03 21:02:47',3,11,NULL),(123,'Maijdee',NULL,NULL,'2018-03-03 21:02:47',2,49,NULL),(124,'Satmasjid Road, Mohammadpur',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(125,'Bangabandhu Road',NULL,NULL,'2018-03-03 21:02:47',3,11,NULL),(126,'Sher- E- Bangla Nagar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(127,'Chowmuhani',NULL,NULL,'2018-03-03 21:02:47',2,49,NULL),(128,'Begam Rokeya Sarani ',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(129,'Shahjadpur',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(130,'Sugandha R/A',NULL,NULL,'2018-03-03 21:02:47',2,43,NULL),(131,'Satmasjid Road, Dhanmondi',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(132,'KDA Avenue',NULL,NULL,'2018-03-03 21:02:47',4,59,NULL),(133,'Farmgate',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(134,'Jahanabad, Bhatiari',NULL,NULL,'2018-03-03 21:02:47',2,43,NULL),(135,'Hospital Road',NULL,NULL,'2018-03-03 21:02:47',5,23,NULL),(136,'Hospital Road',NULL,NULL,'2018-03-03 21:02:47',3,6,NULL),(137,'East Sawrapara',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(138,' Nikunja',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(139,'Mugda',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(140,'Savar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(141,'Shahid Shahidullah Kaisar Road',NULL,NULL,'2018-03-03 21:02:47',2,46,NULL),(142,'Middle Badda',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(143,'Aftabnagar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(144,'Joydebpur',NULL,NULL,'2018-03-03 21:02:47',3,3,NULL),(145,'Mitford ',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(146,'Shahbagh',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(147,'Secretariate Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(148,'Slyhet',NULL,NULL,'2018-03-03 21:02:47',7,54,NULL),(149,'Baptist Mission Road',NULL,NULL,'2018-03-03 21:02:47',1,35,NULL),(150,'Laxmipur',NULL,NULL,'2018-03-03 21:02:47',5,24,NULL),(151,'Rangpur',NULL,NULL,'2018-03-03 21:02:47',6,32,NULL),(152,'Matuail',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(153,'Faridpur Highway',NULL,NULL,'2018-03-03 21:02:47',3,2,NULL),(154,'Medical Road',NULL,NULL,'2018-03-03 21:02:47',3,10,NULL),(155,'Turag',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(156,'Bogra City Bypass',NULL,NULL,'2018-03-03 21:02:47',5,18,NULL),(157,'Dinajpur Dhaka Highway',NULL,NULL,'2018-03-03 21:02:47',6,26,NULL),(158,'Bhagalpur',NULL,NULL,'2018-03-03 21:02:47',3,6,NULL),(159,'Sirajgonj',NULL,NULL,'2018-03-03 21:02:47',5,25,NULL),(160,'Choto Boyra',NULL,NULL,'2018-03-03 21:02:47',4,59,NULL),(161,'Pathantola Road',NULL,NULL,'2018-03-03 21:02:47',7,54,NULL),(162,' Zakir Hossain Road',NULL,NULL,'2018-03-03 21:02:47',2,43,NULL),(163,'Band Road',NULL,NULL,'2018-03-03 21:02:47',1,35,NULL),(164,' Burichang',NULL,NULL,'2018-03-03 21:02:47',2,44,NULL),(165,'Chashara',NULL,NULL,'2018-03-03 21:02:47',3,11,NULL),(166,'President Road',NULL,NULL,'2018-03-03 21:02:47',3,11,NULL),(167,'kaptan Bazar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(168,'Magura',NULL,NULL,'2018-03-03 21:02:47',4,61,NULL),(169,'Rupnagar Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(170,'Shantinagar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(171,'Kachukhet ',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(172,'Darus Salam Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(173,'Doyaganj',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(174,'Fakirapool',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(175,'jatrabari',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(176,' Hajigonj',NULL,NULL,'2018-03-03 21:02:47',2,42,NULL),(177,'Pallabi',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(178,'Sonapotti Road 2 ',NULL,NULL,'2018-03-03 21:02:47',5,23,NULL),(179,'Shahid Taj Uddin Ahmed Sarani',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(180,' Kazi Allaudin Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(181,'Shazadpur',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(182,'Dendabor',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(183,'Shobujbag',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(184,'Armanitola Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(185,' Lalbagh',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(186,'Madaripur Sadar',NULL,NULL,'2018-03-03 21:02:47',3,7,NULL),(187,'Mymensingh Rd',NULL,NULL,'2018-03-03 21:02:47',3,6,NULL),(188,'Elephent Road',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(189,'Nardda',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(190,'Gendaria',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(191,'Comilla City',NULL,NULL,'2018-03-03 21:02:47',2,44,NULL),(192,'Kallyanpur',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(193,'Kamrangirchar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(194,'Munshiganj',NULL,NULL,'2018-03-03 21:02:47',3,9,NULL),(195,'Bogura',NULL,NULL,'2018-03-03 21:02:47',5,18,NULL),(196,'Sirajganj',NULL,NULL,'2018-03-03 21:02:47',5,25,NULL),(197,'Demra',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL),(198,'Shantinagar',NULL,NULL,'2018-03-03 21:02:47',3,1,NULL);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `birth_death_certificate`
--

DROP TABLE IF EXISTS `birth_death_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `birth_death_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cabin_no` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_birth_death` int(11) NOT NULL DEFAULT '0' COMMENT '1=birth 2= death',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `ref_doc_id` int(11) NOT NULL DEFAULT '0',
  `ref_doc_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_of_birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birth_death_certificate`
--

LOCK TABLES `birth_death_certificate` WRITE;
/*!40000 ALTER TABLE `birth_death_certificate` DISABLE KEYS */;
INSERT INTO `birth_death_certificate` VALUES (1,'000001','Mrs,Hasia','Mrs,Hasia','Md,Kamal','0181326598',NULL,'2022-09-10',NULL,'Female',1,'dinmohammadsheto86@gmail.com',1,1,'2022-09-11 00:00:00','2022-09-11 17:46:05','care',5,1,'Dr. Akter Jahan MBBS, BCS(Health), MS','1.8','2.1','2_jpg_17_jpg_1_jpg_1.jpg','Model Hospital');
/*!40000 ALTER TABLE `birth_death_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_group`
--

DROP TABLE IF EXISTS `blood_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_group_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_group`
--

LOCK TABLES `blood_group` WRITE;
/*!40000 ALTER TABLE `blood_group` DISABLE KEYS */;
INSERT INTO `blood_group` VALUES (1,'A+',1),(2,'B+',1),(3,'O+',1),(4,'AB+',1),(5,'A-',1),(6,'B-',1),(7,'O-',1),(8,'AB-',1);
/*!40000 ALTER TABLE `blood_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_code` varchar(255) NOT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `supp_id` int(11) NOT NULL,
  `credit` double NOT NULL,
  `unload_cost` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL,
  `cost_total` double NOT NULL DEFAULT '0',
  `is_return` int(11) NOT NULL DEFAULT '1' COMMENT '1=no ret 2 =ret',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'track who logged in system',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2 = delete',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (1,'pur-000001','01',1,2200,0,0,2200,1,5,1,'care',5,'2022-10-30 17:25:20','2022-10-30 11:25:20'),(2,'pur-000002','0225',1,200,0,0,200,1,5,1,'care',5,'2022-12-03 16:07:06','2022-12-03 10:07:06');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_details`
--

DROP TABLE IF EXISTS `buy_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy_details` (
  `buy_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `buy_price` double NOT NULL,
  `buy_qty` double NOT NULL,
  `current_stock` int(11) NOT NULL DEFAULT '0',
  `expire_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 0 = inactive',
  PRIMARY KEY (`buy_det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_details`
--

LOCK TABLES `buy_details` WRITE;
/*!40000 ALTER TABLE `buy_details` DISABLE KEYS */;
INSERT INTO `buy_details` VALUES (1,1,1,NULL,2,100,0,'2024-10-04','2022-10-30 17:25:20','2022-12-03 10:07:54',1),(2,1,2,NULL,10,100,59,'2023-10-25','2022-10-30 17:25:20','2023-02-24 11:21:12',1),(3,1,3,NULL,4,100,64,'2023-10-24','2022-10-30 17:25:20','2023-02-24 11:21:12',1),(4,1,4,NULL,6,100,73,'2023-10-31','2022-10-30 17:25:20','2023-02-04 17:17:43',1),(5,2,1,NULL,2,100,72,'2025-12-31','2022-12-03 16:07:06','2023-02-24 11:21:12',1);
/*!40000 ALTER TABLE `buy_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabin_class`
--

DROP TABLE IF EXISTS `cabin_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabin_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cabin_class_title` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabin_class`
--

LOCK TABLES `cabin_class` WRITE;
/*!40000 ALTER TABLE `cabin_class` DISABLE KEYS */;
INSERT INTO `cabin_class` VALUES (1,'3th Floor',5,1,'2022-10-06 21:15:54','2022-10-06 15:15:54'),(2,'4 th Floor',5,1,'2022-10-06 21:34:34','2022-10-06 15:34:34'),(3,'5th Floor',5,1,'2022-10-06 21:50:59','2022-10-06 15:50:59');
/*!40000 ALTER TABLE `cabin_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabin_sub_class`
--

DROP TABLE IF EXISTS `cabin_sub_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabin_sub_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cabin_class_id` int(11) NOT NULL,
  `cabin_sub_class_title` varchar(255) NOT NULL,
  `hospital_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabin_sub_class`
--

LOCK TABLES `cabin_sub_class` WRITE;
/*!40000 ALTER TABLE `cabin_sub_class` DISABLE KEYS */;
INSERT INTO `cabin_sub_class` VALUES (1,1,'Dr: Chamber',5,1,'2022-10-06 21:16:23','2022-10-06 15:16:23'),(2,2,'VIP AC Cabin',5,1,'2022-10-06 21:35:24','2022-10-06 15:35:24'),(3,3,'General Cabin',5,1,'2022-10-06 21:51:45','2022-10-06 15:51:45');
/*!40000 ALTER TABLE `cabin_sub_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission_payment`
--

DROP TABLE IF EXISTS `commission_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commission_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` int(11) DEFAULT '0',
  `gross_com` double NOT NULL DEFAULT '0',
  `current_com` double NOT NULL DEFAULT '0',
  `old_com` double DEFAULT '0',
  `sub_com` double NOT NULL DEFAULT '0',
  `com_status` int(11) NOT NULL DEFAULT '0' COMMENT '1= paid, 0 =unpaid',
  `paid_com` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_id` int(150) DEFAULT NULL,
  `doc_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `doc_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=ref 2=quack 3=self',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2=delete',
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission_payment`
--

LOCK TABLES `commission_payment` WRITE;
/*!40000 ALTER TABLE `commission_payment` DISABLE KEYS */;
INSERT INTO `commission_payment` VALUES (1,1,1600,1400,1400,200,0,0,'2022-10-30 17:02:21','2022-11-28 07:39:06',1,'Dr.Mohammad Kamal DMA',2,2,1,'care',5),(2,2,700,700,700,0,0,0,'2022-10-30 17:39:28','2022-11-29 16:41:24',2,'Dr.Mohammad Kamal DMA',2,2,1,'care',5),(3,3,0,0,0,200,0,0,'2022-11-28 13:25:15','2022-11-28 07:25:15',3,'self',0,3,1,'care',0),(4,4,0,0,0,0,0,0,'2022-11-28 18:15:07','2023-02-20 02:34:57',4,'Dr.Younus Khan ',3,2,1,'moshiur',34),(5,5,200,200,0,0,0,0,'2022-11-28 18:20:35','2022-11-28 12:20:35',5,'self',0,3,1,'care',0),(6,6,0,0,0,0,0,0,'2022-11-28 18:23:19','2022-11-29 16:42:35',3,'self',0,3,1,'care',5),(7,7,200,200,200,0,0,0,'2022-11-28 18:26:32','2022-11-29 16:42:42',1,'self',0,3,1,'care',5),(8,8,0,0,0,0,0,0,'2022-11-28 18:44:25','2022-11-28 12:44:25',6,'self',0,3,1,'care',0),(9,9,0,0,0,0,0,0,'2022-11-28 18:46:31','2022-11-29 17:21:28',7,'self',0,3,1,'care',5),(10,10,200,200,0,0,0,0,'2022-11-28 18:49:46','2022-11-28 12:49:46',5,'self',0,3,1,'care',0),(11,11,0,0,0,200,0,0,'2022-11-29 23:29:17','2022-11-29 17:29:17',8,'Dr.Younus Khan ',3,2,1,'care',0),(12,12,0,0,0,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27',4,'Dr.Younus Khan ',3,2,1,'care',0),(13,13,0,0,0,0,0,0,'2022-11-29 23:33:48','2023-02-20 02:40:36',9,'Bangal Islami Life Insurence',5,2,1,'moshiur',34),(14,14,0,0,0,200,0,0,'2022-12-02 22:53:31','2022-12-02 16:53:31',10,'Dr.Younus Khan ',3,2,1,'care',0),(15,15,0,0,0,200,0,0,'2022-12-03 15:27:01','2022-12-03 09:27:01',10,'Dr.Younus Khan ',3,2,1,'care',0),(16,16,610,510,0,100,0,0,'2022-12-03 15:36:11','2022-12-03 09:36:11',11,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,'care',0),(17,16,610,0,510,100,1,510,'2022-12-03 15:37:26','2022-12-03 09:37:26',NULL,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,'care',0),(18,17,710,513,0,197,0,0,'2022-12-03 15:42:41','2022-12-03 09:42:41',12,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,'care',0),(19,18,0,0,0,0,0,0,'2022-12-03 16:15:43','2022-12-03 10:15:43',9,'Bangal Islami Life Insurence',5,2,1,'care',0),(20,19,0,0,0,0,0,0,'2022-12-11 23:59:53','2022-12-11 17:59:53',9,'Dr.Younus Khan ',3,2,1,'moshiur',0),(21,20,0,0,0,200,0,0,'2022-12-14 02:08:01','2022-12-13 20:08:01',9,'Bangal Islami Life Insurence',5,2,1,'care',0),(22,21,0,0,0,0,0,0,'2022-12-24 13:43:18','2022-12-24 07:43:18',10,'Dr.Younus Khan ',3,2,1,'care',0),(23,22,0,0,0,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46',13,'Dr.Shahida Sultana Nishe ',6,2,1,'Akter',0),(24,23,0,0,0,0,0,0,'2022-12-29 16:06:10','2023-02-20 02:33:55',14,'Dr.Younus Khan ',3,2,1,'moshiur',34),(25,24,0,-100,0,127,0,0,'2023-01-29 15:58:10','2023-02-20 02:33:35',15,'self',0,3,1,'moshiur',34),(26,25,0,0,0,0,0,0,'2023-02-04 10:50:56','2023-02-04 04:50:56',16,'Dr.Younus Khan MBBS, FCPS Medicine',3,2,1,'care',0),(27,26,0,0,0,0,0,0,'2023-02-04 10:55:45','2023-02-04 04:55:45',17,'Dr.Imran Khan ',26,2,1,'care',0),(28,17,710,513,513,197,0,0,'2023-02-19 01:37:57','2023-02-18 19:37:57',NULL,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,'moshiur',0),(29,17,710,0,513,197,1,513,'2023-02-23 00:56:15','2023-02-22 18:56:15',NULL,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,'moshiur',0),(30,27,590,490,0,200,0,0,'2023-02-24 15:59:56','2023-02-24 09:59:56',18,'Bangal Islami Life Insurence',5,2,2,'care',0),(31,27,590,0,490,100,1,490,'2023-02-24 16:02:06','2023-02-24 10:02:06',NULL,'Bangal Islami Life Insurence',5,2,2,'care',0),(32,28,0,0,0,0,0,0,'2023-02-24 16:05:40','2023-02-24 10:05:40',19,'Dr.Younus Khan MBBS, FCPS Medicine',3,2,1,'care',0),(33,27,200,200,490,490,0,0,'2023-02-24 16:08:35','2023-02-24 10:08:35',18,NULL,0,0,1,'care',5),(34,29,0,0,0,0,0,0,'2023-02-24 16:35:31','2023-02-24 23:08:53',17,'Dr.Imran Khan ',26,2,1,'care',5),(35,30,0,0,0,0,0,0,'2023-02-24 16:36:45','2023-02-24 23:08:39',17,'Dr.Imran Khan ',26,2,2,'care',5),(36,31,0,0,0,0,0,0,'2023-02-24 16:50:04','2023-02-24 23:08:21',17,'Dr.Imran Khan ',26,2,1,'care',5),(37,32,260,260,0,0,0,0,'2023-02-24 17:19:47','2023-02-24 11:19:47',20,'Bangal Islami Life Insurence',5,2,1,'care',0),(38,30,0,0,0,0,0,0,'2023-02-25 17:51:12','2023-02-25 11:51:12',17,NULL,0,0,1,'care',5);
/*!40000 ALTER TABLE `commission_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Square Pharmacitecals',1,NULL,'2022-10-06 15:32:23'),(2,'Beximco Pharmacetical',1,NULL,'2022-10-06 15:32:27');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nicename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numcode` int(5) DEFAULT NULL,
  `mobile_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AFGHANISTAN','AF','Afghanistan','AFG',4,'93','2018-08-07 15:18:59','2018-08-06 21:20:47'),(2,'ALBANIA','AL','Albania','ALB',8,'355','2018-08-07 15:18:59','2018-08-06 21:20:47'),(3,'ALGERIA','DZ','Algeria','DZA',12,'213','2018-08-07 15:18:59','2018-08-06 21:20:47'),(4,'AMERICAN SAMOA','AS','American Samoa','ASM',16,'1684','2018-08-07 15:18:59','2018-08-06 21:20:47'),(5,'ANDORRA','AD','Andorra','AND',20,'376','2018-08-07 15:18:59','2018-08-06 21:20:47'),(6,'ANGOLA','AO','Angola','AGO',24,'244','2018-08-07 15:18:59','2018-08-06 21:20:47'),(7,'ANGUILLA','AI','Anguilla','AIA',660,'1264','2018-08-07 15:18:59','2018-08-06 21:20:47'),(8,'ANTARCTICA','AQ','Antarctica','ANT',NULL,'0','2018-08-07 15:18:59','2018-09-02 18:48:35'),(9,'ANTIGUA AND BARBUDA','AG','Antigua and Barbuda','ATG',28,'1268','2018-08-07 15:18:59','2018-08-06 21:20:47'),(10,'ARGENTINA','AR','Argentina','ARG',32,'54','2018-08-07 15:18:59','2018-08-06 21:20:47'),(11,'ARMENIA','AM','Armenia','ARM',51,'374','2018-08-07 15:18:59','2018-08-06 21:20:47'),(12,'ARUBA','AW','Aruba','ABW',533,'297','2018-08-07 15:18:59','2018-08-06 21:20:47'),(13,'AUSTRALIA','AU','Australia','AUS',36,'61','2018-08-07 15:18:59','2018-08-06 21:20:47'),(14,'AUSTRIA','AT','Austria','AUT',40,'43','2018-08-07 15:18:59','2018-08-06 21:20:47'),(15,'AZERBAIJAN','AZ','Azerbaijan','AZE',31,'994','2018-08-07 15:18:59','2018-08-06 21:20:47'),(16,'BAHAMAS','BS','Bahamas','BHS',44,'1242','2018-08-07 15:18:59','2018-08-06 21:20:47'),(17,'BAHRAIN','BH','Bahrain','BHR',48,'973','2018-08-07 15:18:59','2018-08-06 21:20:47'),(18,'BANGLADESH','BD','Bangladesh','BGD',50,'880','2018-08-07 15:18:59','2018-08-06 21:20:47'),(19,'BARBADOS','BB','Barbados','BRB',52,'1246','2018-08-07 15:18:59','2018-08-06 21:20:47'),(20,'BELARUS','BY','Belarus','BLR',112,'375','2018-08-07 15:18:59','2018-08-06 21:20:47'),(21,'BELGIUM','BE','Belgium','BEL',56,'32','2018-08-07 15:18:59','2018-08-06 21:20:47'),(22,'BELIZE','BZ','Belize','BLZ',84,'501','2018-08-07 15:18:59','2018-08-06 21:20:47'),(23,'BENIN','BJ','Benin','BEN',204,'229','2018-08-07 15:18:59','2018-08-06 21:20:47'),(24,'BERMUDA','BM','Bermuda','BMU',60,'1441','2018-08-07 15:18:59','2018-08-06 21:20:47'),(25,'BHUTAN','BT','Bhutan','BTN',64,'975','2018-08-07 15:18:59','2018-08-06 21:20:47'),(26,'BOLIVIA','BO','Bolivia','BOL',68,'591','2018-08-07 15:18:59','2018-08-06 21:20:47'),(27,'BOSNIA AND HERZEGOVINA','BA','Bosnia and Herzegovina','BIH',70,'387','2018-08-07 15:18:59','2018-08-06 21:20:47'),(28,'BOTSWANA','BW','Botswana','BWA',72,'267','2018-08-07 15:18:59','2018-08-06 21:20:47'),(29,'BOUVET ISLAND','BV','Bouvet Island',NULL,NULL,'0','2018-08-07 15:18:59','2018-08-06 21:20:47'),(30,'BRAZIL','BR','Brazil','BRA',76,'55','2018-08-07 15:18:59','2018-08-06 21:20:47'),(31,'BRITISH INDIAN OCEAN TERRITORY','IO','British Indian Ocean Territory',NULL,NULL,'246','2018-08-07 15:18:59','2018-08-06 21:20:47'),(32,'BRUNEI DARUSSALAM','BN','Brunei Darussalam','BRN',96,'673','2018-08-07 15:18:59','2018-08-06 21:20:47'),(33,'BULGARIA','BG','Bulgaria','BGR',100,'359','2018-08-07 15:18:59','2018-08-06 21:20:47'),(34,'BURKINA FASO','BF','Burkina Faso','BFA',854,'226','2018-08-07 15:18:59','2018-08-06 21:20:47'),(35,'BURUNDI','BI','Burundi','BDI',108,'257','2018-08-07 15:18:59','2018-08-06 21:20:47'),(36,'CAMBODIA','KH','Cambodia','KHM',116,'855','2018-08-07 15:18:59','2018-08-06 21:20:47'),(37,'CAMEROON','CM','Cameroon','CMR',120,'237','2018-08-07 15:18:59','2018-08-06 21:20:47'),(38,'CANADA','CA','Canada','CAN',124,'1','2018-08-07 15:18:59','2018-08-06 21:20:47'),(39,'CAPE VERDE','CV','Cape Verde','CPV',132,'238','2018-08-07 15:18:59','2018-08-06 21:20:47'),(40,'CAYMAN ISLANDS','KY','Cayman Islands','CYM',136,'1345','2018-08-07 15:18:59','2018-08-06 21:20:47'),(41,'CENTRAL AFRICAN REPUBLIC','CF','Central African Republic','CAF',140,'236','2018-08-07 15:18:59','2018-08-06 21:20:47'),(42,'CHAD','TD','Chad','TCD',148,'235','2018-08-07 15:18:59','2018-08-06 21:20:47'),(43,'CHILE','CL','Chile','CHL',152,'56','2018-08-07 15:18:59','2018-08-06 21:20:47'),(44,'CHINA','CN','China','CHN',156,'86','2018-08-07 15:18:59','2018-08-06 21:20:47'),(45,'CHRISTMAS ISLAND','CX','Christmas Island',NULL,NULL,'61','2018-08-07 15:18:59','2018-08-06 21:20:47'),(46,'COCOS (KEELING) ISLANDS','CC','Cocos (Keeling) Islands',NULL,NULL,'672','2018-08-07 15:18:59','2018-08-06 21:20:47'),(47,'COLOMBIA','CO','Colombia','COL',170,'57','2018-08-07 15:18:59','2018-08-06 21:20:47'),(48,'COMOROS','KM','Comoros','COM',174,'269','2018-08-07 15:18:59','2018-08-06 21:20:47'),(49,'CONGO','CG','Congo','COG',178,'242','2018-08-07 15:18:59','2018-08-06 21:20:47'),(50,'CONGO, THE DEMOCRATIC REPUBLIC','CD','Congo, the Democratic Republic of the','COD',180,'242','2018-08-07 15:18:59','2018-08-06 21:20:47'),(51,'COOK ISLANDS','CK','Cook Islands','COK',184,'682','2018-08-07 15:18:59','2018-08-06 21:20:47'),(52,'COSTA RICA','CR','Costa Rica','CRI',188,'506','2018-08-07 15:18:59','2018-08-06 21:20:47'),(53,'COTE D\'IVOIRE','CI','Cote D\'Ivoire','CIV',384,'225','2018-08-07 15:18:59','2018-08-06 21:20:47'),(54,'CROATIA','HR','Croatia','HRV',191,'385','2018-08-07 15:18:59','2018-08-06 21:20:47'),(55,'CUBA','CU','Cuba','CUB',192,'53','2018-08-07 15:18:59','2018-08-06 21:20:47'),(56,'CYPRUS','CY','Cyprus','CYP',196,'357','2018-08-07 15:18:59','2018-08-06 21:20:47'),(57,'CZECH REPUBLIC','CZ','Czech Republic','CZE',203,'420','2018-08-07 15:18:59','2018-08-06 21:20:47'),(58,'DENMARK','DK','Denmark','DNK',208,'45','2018-08-07 15:18:59','2018-08-06 21:20:47'),(59,'DJIBOUTI','DJ','Djibouti','DJI',262,'253','2018-08-07 15:18:59','2018-08-06 21:20:47'),(60,'DOMINICA','DM','Dominica','DMA',212,'1767','2018-08-07 15:18:59','2018-08-06 21:20:47'),(61,'DOMINICAN REPUBLIC','DO','Dominican Republic','DOM',214,'1809','2018-08-07 15:18:59','2018-08-06 21:20:47'),(62,'ECUADOR','EC','Ecuador','ECU',218,'593','2018-08-07 15:18:59','2018-08-06 21:20:47'),(63,'EGYPT','EG','Egypt','EGY',818,'20','2018-08-07 15:18:59','2018-08-06 21:20:47'),(64,'EL SALVADOR','SV','El Salvador','SLV',222,'503','2018-08-07 15:18:59','2018-08-06 21:20:47'),(65,'EQUATORIAL GUINEA','GQ','Equatorial Guinea','GNQ',226,'240','2018-08-07 15:18:59','2018-08-06 21:20:47'),(66,'ERITREA','ER','Eritrea','ERI',232,'291','2018-08-07 15:18:59','2018-08-06 21:20:47'),(67,'ESTONIA','EE','Estonia','EST',233,'372','2018-08-07 15:18:59','2018-08-06 21:20:47'),(68,'ETHIOPIA','ET','Ethiopia','ETH',231,'251','2018-08-07 15:18:59','2018-08-06 21:20:47'),(69,'FALKLAND ISLANDS (MALVINAS)','FK','Falkland Islands (Malvinas)','FLK',238,'500','2018-08-07 15:18:59','2018-08-06 21:20:47'),(70,'FAROE ISLANDS','FO','Faroe Islands','FRO',234,'298','2018-08-07 15:18:59','2018-08-06 21:20:47'),(71,'FIJI','FJ','Fiji','FJI',242,'679','2018-08-07 15:18:59','2018-08-06 21:20:47'),(72,'FINLAND','FI','Finland','FIN',246,'358','2018-08-07 15:18:59','2018-08-06 21:20:47'),(73,'FRANCE','FR','France','FRA',250,'33','2018-08-07 15:18:59','2018-08-06 21:20:47'),(74,'FRENCH GUIANA','GF','French Guiana','GUF',254,'594','2018-08-07 15:18:59','2018-08-06 21:20:47'),(75,'FRENCH POLYNESIA','PF','French Polynesia','PYF',258,'689','2018-08-07 15:18:59','2018-08-06 21:20:47'),(76,'FRENCH SOUTHERN TERRITORIES','TF','French Southern Territories',NULL,NULL,'0','2018-08-07 15:18:59','2018-08-06 21:20:47'),(77,'GABON','GA','Gabon','GAB',266,'241','2018-08-07 15:18:59','2018-08-06 21:20:47'),(78,'GAMBIA','GM','Gambia','GMB',270,'220','2018-08-07 15:18:59','2018-08-06 21:20:47'),(79,'GEORGIA','GE','Georgia','GEO',268,'995','2018-08-07 15:18:59','2018-08-06 21:20:47'),(80,'GERMANY','DE','Germany','DEU',276,'49','2018-08-07 15:18:59','2018-08-06 21:20:47'),(81,'GHANA','GH','Ghana','GHA',288,'233','2018-08-07 15:18:59','2018-08-06 21:20:47'),(82,'GIBRALTAR','GI','Gibraltar','GIB',292,'350','2018-08-07 15:18:59','2018-08-06 21:20:47'),(83,'GREECE','GR','Greece','GRC',300,'30','2018-08-07 15:18:59','2018-08-06 21:20:47'),(84,'GREENLAND','GL','Greenland','GRL',304,'299','2018-08-07 15:18:59','2018-08-06 21:20:47'),(85,'GRENADA','GD','Grenada','GRD',308,'1473','2018-08-07 15:18:59','2018-08-06 21:20:47'),(86,'GUADELOUPE','GP','Guadeloupe','GLP',312,'590','2018-08-07 15:18:59','2018-08-06 21:20:47'),(87,'GUAM','GU','Guam','GUM',316,'1671','2018-08-07 15:18:59','2018-08-06 21:20:47'),(88,'GUATEMALA','GT','Guatemala','GTM',320,'502','2018-08-07 15:18:59','2018-08-06 21:20:47'),(89,'GUINEA','GN','Guinea','GIN',324,'224','2018-08-07 15:18:59','2018-08-06 21:20:47'),(90,'GUINEA-BISSAU','GW','Guinea-Bissau','GNB',624,'245','2018-08-07 15:18:59','2018-08-06 21:20:47'),(91,'GUYANA','GY','Guyana','GUY',328,'592','2018-08-07 15:18:59','2018-08-06 21:20:47'),(92,'HAITI','HT','Haiti','HTI',332,'509','2018-08-07 15:18:59','2018-08-06 21:20:47'),(93,'HEARD ISLAND AND MCDONALD ISLA','HM','Heard Island and Mcdonald Islands',NULL,NULL,'0','2018-08-07 15:18:59','2018-08-06 21:20:47'),(94,'HOLY SEE (VATICAN CITY STATE)','VA','Holy See (Vatican City State)','VAT',336,'39','2018-08-07 15:18:59','2018-08-06 21:20:47'),(95,'HONDURAS','HN','Honduras','HND',340,'504','2018-08-07 15:18:59','2018-08-06 21:20:47'),(96,'HONG KONG','HK','Hong Kong','HKG',344,'852','2018-08-07 15:18:59','2018-08-06 21:20:47'),(97,'HUNGARY','HU','Hungary','HUN',348,'36','2018-08-07 15:18:59','2018-08-06 21:20:47'),(98,'ICELAND','IS','Iceland','ISL',352,'354','2018-08-07 15:18:59','2018-08-06 21:20:47'),(99,'INDIA','IN','India','IND',356,'91','2018-08-07 15:18:59','2018-08-06 21:20:47'),(100,'INDONESIA','ID','Indonesia','IDN',360,'62','2018-08-07 15:18:59','2018-08-06 21:20:47'),(101,'IRAN, ISLAMIC REPUBLIC OF','IR','Iran, Islamic Republic of','IRN',364,'98','2018-08-07 15:18:59','2018-08-06 21:20:47'),(102,'IRAQ','IQ','Iraq','IRQ',368,'964','2018-08-07 15:18:59','2018-08-06 21:20:47'),(103,'IRELAND','IE','Ireland','IRL',372,'353','2018-08-07 15:18:59','2018-08-06 21:20:47'),(104,'ISRAEL','IL','Israel','ISR',376,'972','2018-08-07 15:18:59','2018-08-06 21:20:47'),(105,'ITALY','IT','Italy','ITA',380,'39','2018-08-07 15:18:59','2018-08-06 21:20:47'),(106,'JAMAICA','JM','Jamaica','JAM',388,'1876','2018-08-07 15:18:59','2018-08-06 21:20:47'),(107,'JAPAN','JP','Japan','JPN',392,'81','2018-08-07 15:18:59','2018-08-06 21:20:47'),(108,'JORDAN','JO','Jordan','JOR',400,'962','2018-08-07 15:18:59','2018-08-06 21:20:47'),(109,'KAZAKHSTAN','KZ','Kazakhstan','KAZ',398,'7','2018-08-07 15:18:59','2018-08-06 21:20:47'),(110,'KENYA','KE','Kenya','KEN',404,'254','2018-08-07 15:18:59','2018-08-06 21:20:47'),(111,'KIRIBATI','KI','Kiribati','KIR',296,'686','2018-08-07 15:18:59','2018-08-06 21:20:47'),(112,'KOREA, DEMOCRATIC PEOPLE\'S REP','KP','Korea, Democratic People\'s Republic of','PRK',408,'850','2018-08-07 15:18:59','2018-08-06 21:20:47'),(113,'KOREA, REPUBLIC OF','KR','Korea, Republic of','KOR',410,'82','2018-08-07 15:18:59','2018-08-06 21:20:47'),(114,'KUWAIT','KW','Kuwait','KWT',414,'965','2018-08-07 15:18:59','2018-08-06 21:20:47'),(115,'KYRGYZSTAN','KG','Kyrgyzstan','KGZ',417,'996','2018-08-07 15:18:59','2018-08-06 21:20:47'),(116,'LAO PEOPLE\'S DEMOCRATIC REPUBL','LA','Lao People\'s Democratic Republic','LAO',418,'856','2018-08-07 15:18:59','2018-08-06 21:20:47'),(117,'LATVIA','LV','Latvia','LVA',428,'371','2018-08-07 15:18:59','2018-08-06 21:20:47'),(118,'LEBANON','LB','Lebanon','LBN',422,'961','2018-08-07 15:18:59','2018-08-06 21:20:47'),(119,'LESOTHO','LS','Lesotho','LSO',426,'266','2018-08-07 15:18:59','2018-08-06 21:20:47'),(120,'LIBERIA','LR','Liberia','LBR',430,'231','2018-08-07 15:18:59','2018-08-06 21:20:47'),(121,'LIBYAN ARAB JAMAHIRIYA','LY','Libyan Arab Jamahiriya','LBY',434,'218','2018-08-07 15:18:59','2018-08-06 21:20:47'),(122,'LIECHTENSTEIN','LI','Liechtenstein','LIE',438,'423','2018-08-07 15:18:59','2018-08-06 21:20:47'),(123,'LITHUANIA','LT','Lithuania','LTU',440,'370','2018-08-07 15:18:59','2018-08-06 21:20:47'),(124,'LUXEMBOURG','LU','Luxembourg','LUX',442,'352','2018-08-07 15:18:59','2018-08-06 21:20:47'),(125,'MACAO','MO','Macao','MAC',446,'853','2018-08-07 15:18:59','2018-08-06 21:20:47'),(126,'MACEDONIA, THE FORMER YUGOSLAV','MK','Macedonia, the Former Yugoslav Republic of','MKD',807,'389','2018-08-07 15:18:59','2018-08-06 21:20:47'),(127,'MADAGASCAR','MG','Madagascar','MDG',450,'261','2018-08-07 15:18:59','2018-08-06 21:20:47'),(128,'MALAWI','MW','Malawi','MWI',454,'265','2018-08-07 15:18:59','2018-08-06 21:20:47'),(129,'MALAYSIA','MY','Malaysia','MYS',458,'60','2018-08-07 15:18:59','2018-08-06 21:20:47'),(130,'MALDIVES','MV','Maldives','MDV',462,'960','2018-08-07 15:18:59','2018-08-06 21:20:47'),(131,'MALI','ML','Mali','MLI',466,'223','2018-08-07 15:18:59','2018-08-06 21:20:47'),(132,'MALTA','MT','Malta','MLT',470,'356','2018-08-07 15:18:59','2018-08-06 21:20:47'),(133,'MARSHALL ISLANDS','MH','Marshall Islands','MHL',584,'692','2018-08-07 15:18:59','2018-08-06 21:20:47'),(134,'MARTINIQUE','MQ','Martinique','MTQ',474,'596','2018-08-07 15:18:59','2018-08-06 21:20:47'),(135,'MAURITANIA','MR','Mauritania','MRT',478,'222','2018-08-07 15:18:59','2018-08-06 21:20:47'),(136,'MAURITIUS','MU','Mauritius','MUS',480,'230','2018-08-07 15:18:59','2018-08-06 21:20:47'),(137,'MAYOTTE','YT','Mayotte',NULL,NULL,'269','2018-08-07 15:18:59','2018-08-06 21:20:47'),(138,'MEXICO','MX','Mexico','MEX',484,'52','2018-08-07 15:18:59','2018-08-06 21:20:47'),(139,'MICRONESIA, FEDERATED STATES O','FM','Micronesia, Federated States of','FSM',583,'691','2018-08-07 15:18:59','2018-08-06 21:20:47'),(140,'MOLDOVA, REPUBLIC OF','MD','Moldova, Republic of','MDA',498,'373','2018-08-07 15:18:59','2018-08-06 21:20:47'),(141,'MONACO','MC','Monaco','MCO',492,'377','2018-08-07 15:18:59','2018-08-06 21:20:47'),(142,'MONGOLIA','MN','Mongolia','MNG',496,'976','2018-08-07 15:18:59','2018-08-06 21:20:47'),(143,'MONTSERRAT','MS','Montserrat','MSR',500,'1664','2018-08-07 15:18:59','2018-08-06 21:20:47'),(144,'MOROCCO','MA','Morocco','MAR',504,'212','2018-08-07 15:18:59','2018-08-06 21:20:47'),(145,'MOZAMBIQUE','MZ','Mozambique','MOZ',508,'258','2018-08-07 15:18:59','2018-08-06 21:20:47'),(146,'MYANMAR','MM','Myanmar','MMR',104,'95','2018-08-07 15:18:59','2018-08-06 21:20:47'),(147,'NAMIBIA','NA','Namibia','NAM',516,'264','2018-08-07 15:18:59','2018-08-06 21:20:47'),(148,'NAURU','NR','Nauru','NRU',520,'674','2018-08-07 15:18:59','2018-08-06 21:20:47'),(149,'NEPAL','NP','Nepal','NPL',524,'977','2018-08-07 15:18:59','2018-08-06 21:20:47'),(150,'NETHERLANDS','NL','Netherlands','NLD',528,'31','2018-08-07 15:18:59','2018-08-06 21:20:47'),(151,'NETHERLANDS ANTILLES','AN','Netherlands Antilles','ANT',530,'599','2018-08-07 15:18:59','2018-08-06 21:20:47'),(152,'NEW CALEDONIA','NC','New Caledonia','NCL',540,'687','2018-08-07 15:18:59','2018-08-06 21:20:47'),(153,'NEW ZEALAND','NZ','New Zealand','NZL',554,'64','2018-08-07 15:18:59','2018-08-06 21:20:47'),(154,'NICARAGUA','NI','Nicaragua','NIC',558,'505','2018-08-07 15:18:59','2018-08-06 21:20:47'),(155,'NIGER','NE','Niger','NER',562,'227','2018-08-07 15:18:59','2018-08-06 21:20:47'),(156,'NIGERIA','NG','Nigeria','NGA',566,'234','2018-08-07 15:18:59','2018-08-06 21:20:47'),(157,'NIUE','NU','Niue','NIU',570,'683','2018-08-07 15:18:59','2018-08-06 21:20:47'),(158,'NORFOLK ISLAND','NF','Norfolk Island','NFK',574,'672','2018-08-07 15:18:59','2018-08-06 21:20:47'),(159,'NORTHERN MARIANA ISLANDS','MP','Northern Mariana Islands','MNP',580,'1670','2018-08-07 15:18:59','2018-08-06 21:20:47'),(160,'NORWAY','NO','Norway','NOR',578,'47','2018-08-07 15:18:59','2018-08-06 21:20:47'),(161,'OMAN','OM','Oman','OMN',512,'968','2018-08-07 15:18:59','2018-08-06 21:20:47'),(162,'PAKISTAN','PK','Pakistan','PAK',586,'92','2018-08-07 15:18:59','2018-08-06 21:20:47'),(163,'PALAU','PW','Palau','PLW',585,'680','2018-08-07 15:18:59','2018-08-06 21:20:47'),(164,'PALESTINIAN TERRITORY, OCCUPIE','PS','Palestinian Territory, Occupied',NULL,NULL,'970','2018-08-07 15:18:59','2018-08-06 21:20:47'),(165,'PANAMA','PA','Panama','PAN',591,'507','2018-08-07 15:18:59','2018-08-06 21:20:47'),(166,'PAPUA NEW GUINEA','PG','Papua New Guinea','PNG',598,'675','2018-08-07 15:18:59','2018-08-06 21:20:47'),(167,'PARAGUAY','PY','Paraguay','PRY',600,'595','2018-08-07 15:18:59','2018-08-06 21:20:47'),(168,'PERU','PE','Peru','PER',604,'51','2018-08-07 15:18:59','2018-08-06 21:20:47'),(169,'PHILIPPINES','PH','Philippines','PHL',608,'63','2018-08-07 15:18:59','2018-08-06 21:20:47'),(170,'PITCAIRN','PN','Pitcairn','PCN',612,'0','2018-08-07 15:18:59','2018-08-06 21:20:47'),(171,'POLAND','PL','Poland','POL',616,'48','2018-08-07 15:18:59','2018-08-06 21:20:47'),(172,'PORTUGAL','PT','Portugal','PRT',620,'351','2018-08-07 15:18:59','2018-08-06 21:20:47'),(173,'PUERTO RICO','PR','Puerto Rico','PRI',630,'1787','2018-08-07 15:18:59','2018-08-06 21:20:47'),(174,'QATAR','QA','Qatar','QAT',634,'974','2018-08-07 15:18:59','2018-08-06 21:20:47'),(175,'REUNION','RE','Reunion','REU',638,'262','2018-08-07 15:18:59','2018-08-06 21:20:47'),(176,'ROMANIA','RO','Romania','ROM',642,'40','2018-08-07 15:18:59','2018-08-06 21:20:47'),(177,'RUSSIAN FEDERATION','RU','Russian Federation','RUS',643,'70','2018-08-07 15:18:59','2018-08-06 21:20:47'),(178,'RWANDA','RW','Rwanda','RWA',646,'250','2018-08-07 15:18:59','2018-08-06 21:20:47'),(179,'SAINT HELENA','SH','Saint Helena','SHN',654,'290','2018-08-07 15:18:59','2018-08-06 21:20:47'),(180,'SAINT KITTS AND NEVIS','KN','Saint Kitts and Nevis','KNA',659,'1869','2018-08-07 15:18:59','2018-08-06 21:20:47'),(181,'SAINT LUCIA','LC','Saint Lucia','LCA',662,'1758','2018-08-07 15:18:59','2018-08-06 21:20:47'),(182,'SAINT PIERRE AND MIQUELON','PM','Saint Pierre and Miquelon','SPM',666,'508','2018-08-07 15:18:59','2018-08-06 21:20:47'),(183,'SAINT VINCENT AND THE GRENADIN','VC','Saint Vincent and the Grenadines','VCT',670,'1784','2018-08-07 15:18:59','2018-08-06 21:20:47'),(184,'SAMOA','WS','Samoa','WSM',882,'684','2018-08-07 15:18:59','2018-08-06 21:20:47'),(185,'SAN MARINO','SM','San Marino','SMR',674,'378','2018-08-07 15:18:59','2018-08-06 21:20:47'),(186,'SAO TOME AND PRINCIPE','ST','Sao Tome and Principe','STP',678,'239','2018-08-07 15:18:59','2018-08-06 21:20:47'),(187,'SAUDI ARABIA','SA','Saudi Arabia','SAU',682,'966','2018-08-07 15:18:59','2018-08-06 21:20:47'),(188,'SENEGAL','SN','Senegal','SEN',686,'221','2018-08-07 15:18:59','2018-08-06 21:20:47'),(189,'SERBIA AND MONTENEGRO','CS','Serbia and Montenegro',NULL,NULL,'381','2018-08-07 15:18:59','2018-08-06 21:20:47'),(190,'SEYCHELLES','SC','Seychelles','SYC',690,'248','2018-08-07 15:18:59','2018-08-06 21:20:47'),(191,'SIERRA LEONE','SL','Sierra Leone','SLE',694,'232','2018-08-07 15:18:59','2018-08-06 21:20:47'),(192,'SINGAPORE','SG','Singapore','SGP',702,'65','2018-08-07 15:18:59','2018-08-06 21:20:47'),(193,'SLOVAKIA','SK','Slovakia','SVK',703,'421','2018-08-07 15:18:59','2018-08-06 21:20:47'),(194,'SLOVENIA','SI','Slovenia','SVN',705,'386','2018-08-07 15:18:59','2018-08-06 21:20:47'),(195,'SOLOMON ISLANDS','SB','Solomon Islands','SLB',90,'677','2018-08-07 15:18:59','2018-08-06 21:20:47'),(196,'SOMALIA','SO','Somalia','SOM',706,'252','2018-08-07 15:18:59','2018-08-06 21:20:47'),(197,'SOUTH AFRICA','ZA','South Africa','ZAF',710,'27','2018-08-07 15:18:59','2018-08-06 21:20:47'),(198,'SOUTH GEORGIA AND THE SOUTH SA','GS','South Georgia and the South Sandwich Islands',NULL,NULL,'0','2018-08-07 15:18:59','2018-08-06 21:20:47'),(199,'SPAIN','ES','Spain','ESP',724,'34','2018-08-07 15:18:59','2018-08-06 21:20:47'),(200,'SRI LANKA','LK','Sri Lanka','LKA',144,'94','2018-08-07 15:18:59','2018-08-06 21:20:47'),(201,'SUDAN','SD','Sudan','SDN',736,'249','2018-08-07 15:18:59','2018-08-06 21:20:47'),(202,'SURINAME','SR','Suriname','SUR',740,'597','2018-08-07 15:18:59','2018-08-06 21:20:47'),(203,'SVALBARD AND JAN MAYEN','SJ','Svalbard and Jan Mayen','SJM',744,'47','2018-08-07 15:18:59','2018-08-06 21:20:47'),(204,'SWAZILAND','SZ','Swaziland','SWZ',748,'268','2018-08-07 15:18:59','2018-08-06 21:20:47'),(205,'SWEDEN','SE','Sweden','SWE',752,'46','2018-08-07 15:18:59','2018-08-06 21:20:47'),(206,'SWITZERLAND','CH','Switzerland','CHE',756,'41','2018-08-07 15:18:59','2018-08-06 21:20:47'),(207,'SYRIAN ARAB REPUBLIC','SY','Syrian Arab Republic','SYR',760,'963','2018-08-07 15:18:59','2018-08-06 21:20:47'),(208,'TAIWAN, PROVINCE OF CHINA','TW','Taiwan, Province of China','TWN',158,'886','2018-08-07 15:18:59','2018-08-06 21:20:47'),(209,'TAJIKISTAN','TJ','Tajikistan','TJK',762,'992','2018-08-07 15:18:59','2018-08-06 21:20:47'),(210,'TANZANIA, UNITED REPUBLIC OF','TZ','Tanzania, United Republic of','TZA',834,'255','2018-08-07 15:18:59','2018-08-06 21:20:47'),(211,'THAILAND','TH','Thailand','THA',764,'66','2018-08-07 15:18:59','2018-08-06 21:20:47'),(212,'TIMOR-LESTE','TL','Timor-Leste',NULL,NULL,'670','2018-08-07 15:18:59','2018-08-06 21:20:47'),(213,'TOGO','TG','Togo','TGO',768,'228','2018-08-07 15:18:59','2018-08-06 21:20:47'),(214,'TOKELAU','TK','Tokelau','TKL',772,'690','2018-08-07 15:18:59','2018-08-06 21:20:47'),(215,'TONGA','TO','Tonga','TON',776,'676','2018-08-07 15:18:59','2018-08-06 21:20:47'),(216,'TRINIDAD AND TOBAGO','TT','Trinidad and Tobago','TTO',780,'1868','2018-08-07 15:18:59','2018-08-06 21:20:47'),(217,'TUNISIA','TN','Tunisia','TUN',788,'216','2018-08-07 15:18:59','2018-08-06 21:20:47'),(218,'TURKEY','TR','Turkey','TUR',792,'90','2018-08-07 15:18:59','2018-08-06 21:20:47'),(219,'TURKMENISTAN','TM','Turkmenistan','TKM',795,'7370','2018-08-07 15:18:59','2018-08-06 21:20:47'),(220,'TURKS AND CAICOS ISLANDS','TC','Turks and Caicos Islands','TCA',796,'1649','2018-08-07 15:18:59','2018-08-06 21:20:47'),(221,'TUVALU','TV','Tuvalu','TUV',798,'688','2018-08-07 15:18:59','2018-08-06 21:20:47'),(222,'UGANDA','UG','Uganda','UGA',800,'256','2018-08-07 15:18:59','2018-08-06 21:20:47'),(223,'UKRAINE','UA','Ukraine','UKR',804,'380','2018-08-07 15:18:59','2018-08-06 21:20:47'),(224,'UNITED ARAB EMIRATES','AE','United Arab Emirates','ARE',784,'971','2018-08-07 15:18:59','2018-08-06 21:20:47'),(225,'UNITED KINGDOM','GB','United Kingdom','GBR',826,'44','2018-08-07 15:18:59','2018-08-06 21:20:47'),(226,'UNITED STATES','US','United States','USA',840,'1','2018-08-07 15:18:59','2018-08-06 21:20:47'),(227,'UNITED STATES MINOR OUTLYING I','UM','United States Minor Outlying Islands',NULL,NULL,'1','2018-08-07 15:18:59','2018-08-06 21:20:47'),(228,'URUGUAY','UY','Uruguay','URY',858,'598','2018-08-07 15:18:59','2018-08-06 21:20:47'),(229,'UZBEKISTAN','UZ','Uzbekistan','UZB',860,'998','2018-08-07 15:18:59','2018-08-06 21:20:47'),(230,'VANUATU','VU','Vanuatu','VUT',548,'678','2018-08-07 15:18:59','2018-08-06 21:20:47'),(231,'VENEZUELA','VE','Venezuela','VEN',862,'58','2018-08-07 15:18:59','2018-08-06 21:20:47'),(232,'VIET NAM','VN','Viet Nam','VNM',704,'84','2018-08-07 15:18:59','2018-08-06 21:20:47'),(233,'VIRGIN ISLANDS, BRITISH','VG','Virgin Islands, British','VGB',92,'1284','2018-08-07 15:18:59','2018-08-06 21:20:47'),(234,'VIRGIN ISLANDS, U.S.','VI','Virgin Islands, U.s.','VIR',850,'1340','2018-08-07 15:18:59','2018-08-06 21:20:47'),(235,'WALLIS AND FUTUNA','WF','Wallis and Futuna','WLF',876,'681','2018-08-07 15:18:59','2018-08-06 21:20:47'),(236,'WESTERN SAHARA','EH','Western Sahara','ESH',732,'212','2018-08-07 15:18:59','2018-08-06 21:20:47'),(237,'YEMEN','YE','Yemen','YEM',887,'967','2018-08-07 15:18:59','2018-08-06 21:20:47'),(238,'ZAMBIA','ZM','Zambia','ZMB',894,'260','2018-08-07 15:18:59','2018-08-06 21:20:47'),(239,'ZIMBABWE','ZW','Zimbabwe','ZWE',716,'263','2018-08-07 15:18:59','2018-08-06 21:20:47');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_gen_id` int(11) NOT NULL DEFAULT '0',
  `cust_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cust_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cust_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `ref_dir_id` int(11) NOT NULL DEFAULT '0',
  `ref_dir_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1=opd 2=ipd 3=others 4 = uhid',
  `type_in_word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'Mrs,Hasina Begum','0181326598','',1,0,NULL,1,'opd',1,'2022-10-30 17:25:44','2022-10-30 11:25:44'),(2,2,'Md.Lokman','','',0,0,'self',3,'others',1,'2022-11-04 20:58:10','2022-11-04 14:58:10'),(3,3,'Md.Nadim Patowary','01813322678','',3,0,NULL,1,'opd',1,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(4,4,'Mrs,Hasina Begum','01823236232','',3,0,NULL,2,'ipd',1,'2022-12-03 16:04:49','2022-12-03 22:07:54'),(5,5,'MD:ZAKIR HOSSAIN','01557051687','',6,0,NULL,2,'ipd',1,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(6,6,'Mrs:Hasina Khatun','0181326598','',7,0,NULL,2,'ipd',1,'2023-01-18 00:23:09','2023-01-18 06:23:41'),(7,7,'DIN MD (SHETO)','01624-79 49 10','',3,0,NULL,4,'uhid',1,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(8,8,'Mr:Salam Miah','123455533433','',10,0,NULL,2,'ipd',1,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(9,9,'Md.Kamal Hossain','01813322678','',4,0,NULL,1,'opd',1,'2023-02-24 17:21:12','2023-02-24 11:21:12');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic_test_group`
--

DROP TABLE IF EXISTS `diagnostic_test_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostic_test_group` (
  `test_id` int(150) NOT NULL AUTO_INCREMENT,
  `test_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_format` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_id` bigint(11) DEFAULT '0',
  `branch_id` bigint(20) DEFAULT '0',
  `speciman` varchar(250) COLLATE utf8_unicode_ci DEFAULT '0',
  `specimen_id` int(11) NOT NULL DEFAULT '0',
  `add_machine_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0-inactive 1-active 2-delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='0-> pending 1->active 2-> delete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic_test_group`
--

LOCK TABLES `diagnostic_test_group` WRITE;
/*!40000 ALTER TABLE `diagnostic_test_group` DISABLE KEYS */;
INSERT INTO `diagnostic_test_group` VALUES (1,'Serology',NULL,5,0,'Blood',1,'dfdsfdsfdsfewrewrew122555',1,'2018-10-29 21:02:32','2018-10-29 03:02:32'),(2,'Biochemistry',NULL,5,0,'Blood',1,'ghfhjghjgjghjgj',1,'2018-10-29 21:02:58','2018-10-29 03:02:58'),(3,'Hormone Test',NULL,5,0,'Blood',1,NULL,1,'2018-10-29 21:03:26','2018-10-29 03:03:26'),(4,'Haematology',NULL,5,0,'Blood',1,NULL,1,'2018-10-29 21:05:08','2018-10-29 03:05:08'),(5,'Ultrasund',NULL,5,0,'Imaging',2,NULL,1,'2018-10-29 21:05:41','2018-10-29 03:05:41'),(7,'Microbiology',NULL,5,0,'Microbiology',6,NULL,1,'2018-10-29 21:07:51','2018-10-29 03:07:51'),(8,'X-RAY',NULL,5,0,'Radiology',4,NULL,1,'2018-10-29 21:08:18','2018-10-29 03:08:18'),(9,'Urine',NULL,5,0,'Urine',3,NULL,1,'2020-09-04 15:55:35','2020-09-04 09:55:35'),(10,'Stool  ',NULL,5,0,'Stool',5,NULL,1,'2020-09-04 16:11:35','2020-09-04 10:11:35'),(11,'Echo',NULL,5,0,'Echocardiogram',17,NULL,1,'2020-09-01 00:12:33','2020-08-31 18:12:33'),(41,'ECG',NULL,5,0,'ECG Exam',12,NULL,1,'2021-03-11 23:37:51','2021-03-11 17:37:51');
/*!40000 ALTER TABLE `diagnostic_test_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic_test_subgroup`
--

DROP TABLE IF EXISTS `diagnostic_test_subgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostic_test_subgroup` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `mtest_id` int(150) NOT NULL DEFAULT '0',
  `sub_test_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `output_format` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_id` int(11) DEFAULT '0',
  `branch_id` bigint(20) DEFAULT '0',
  `doc_ref_com` double(10,2) NOT NULL,
  `quk_ref_com` double(10,2) NOT NULL,
  `ref_val` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `test_template` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_heading` int(11) NOT NULL DEFAULT '1' COMMENT '1=yes, 2=no',
  `group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1= main 2= additional',
  `reagent_p_id` int(11) NOT NULL DEFAULT '0',
  `reagent_qty` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic_test_subgroup`
--

LOCK TABLES `diagnostic_test_subgroup` WRITE;
/*!40000 ALTER TABLE `diagnostic_test_subgroup` DISABLE KEYS */;
INSERT INTO `diagnostic_test_subgroup` VALUES (218,4,'Prothombin Time',1000,NULL,5,0,0.00,0.00,'',NULL,1,'2020-09-04 22:59:09','2020-09-04 16:59:09','                          <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                           \r\n                      <div class=\"bio-chemestry\"><p class=\"MsoNormal\" align=\"center\" style=\"text-align: left; margin-left: 2in;\"><b><u><span style=\"font-size:13.0pt;\r\nmso-bidi-font-size:10.0pt\">PROTHROMBIN TIME<o:p></o:p></span></u></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-left:1.5in;text-indent:.5in\"><b><span style=\"font-size:11.0pt;mso-bidi-font-size:\r\n10.0pt\"><o:p>&nbsp;</o:p></span></b></p>\r\n\r\n<table class=\"MsoTableGrid\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin-left: 41.4pt;\">\r\n <tbody><tr>\r\n  <td width=\"360\" valign=\"top\" style=\"width:3.75in;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">Patient <o:p></o:p></span></b></p>\r\n  </td>\r\n  <td width=\"420\" valign=\"top\" style=\"width:315.0pt;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">:&nbsp;&nbsp; 14&nbsp;\r\n  Sec.</span></b></p>\r\n  </td>\r\n </tr>\r\n <tr>\r\n  <td width=\"360\" valign=\"top\" style=\"width:3.75in;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">Control<o:p></o:p></span></b></p>\r\n  </td>\r\n  <td width=\"420\" valign=\"top\" style=\"width:315.0pt;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">:&nbsp;&nbsp; 13 &nbsp;Sec.<o:p></o:p></span></b></p>\r\n  </td>\r\n </tr>\r\n <tr>\r\n  <td width=\"360\" valign=\"top\" style=\"width:3.75in;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">Ratio<o:p></o:p></span></b></p>\r\n  </td>\r\n  <td width=\"420\" valign=\"top\" style=\"width:315.0pt;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">:&nbsp;&nbsp; 1.08<o:p></o:p></span></b></p>\r\n  </td>\r\n </tr>\r\n <tr>\r\n  <td width=\"360\" valign=\"top\" style=\"width:3.75in;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">INR<o:p></o:p></span></b></p>\r\n  </td>\r\n  <td width=\"420\" valign=\"top\" style=\"width:315.0pt;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">:&nbsp;&nbsp; 1.10<o:p></o:p></span></b></p>\r\n  </td>\r\n </tr>\r\n <tr>\r\n  <td width=\"360\" valign=\"top\" style=\"width:3.75in;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">Prothrombin Index&nbsp;&nbsp; <o:p></o:p></span></b></p>\r\n  </td>\r\n  <td width=\"420\" valign=\"top\" style=\"width:315.0pt;padding:0in 5.4pt 0in 5.4pt\">\r\n  <p class=\"MsoNormal\"><b><span style=\"font-size:16.0pt;mso-bidi-font-size:14.0pt\">:&nbsp;&nbsp; 93 %<o:p></o:p></span></b></p>\r\n  </td>\r\n </tr>\r\n</tbody></table>  \r\n                      </div>\r\n\r\n                                        ',1,NULL,1,0,0),(219,38,'Echocardiogram',2200,NULL,5,0,0.00,0.00,'','',1,'2020-09-01 00:12:59','2020-08-31 18:12:59','',1,NULL,1,0,0),(222,1,'GCT',300,NULL,5,0,0.00,100.00,'',NULL,1,'2020-09-05 14:23:59','2020-09-05 08:23:59','                          <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                           \r\n                      <div class=\"bio-chemestry\">\r\n                        <table class=\"farhana-table-4\"> \r\n                          <tbody><tr>\r\n                            <th class=\"farhana-table-4-tr-1\" colspan=\"4\">\r\n                              Test name : GCT                            </th>\r\n                          </tr>\r\n\r\n                          <tr>\r\n                            <td>01Hrs. After 50gm Glucose <br></td>\r\n                            <td><b></b></td>\r\n                            <td>mmol/l</td>\r\n                            <td>\r\n\r\n                            3.6---7.8 mmol/l&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></td>\r\n                          </tr><tr><td>Corresponding Urine Sugar (CUS)<br></td><td>Nil <br></td><td><br></td><td><br></td></tr>\r\n                        </tbody></table>  \r\n                      </div>\r\n\r\n                                        ',1,NULL,1,0,0),(223,8,'X-Ray TM Joyent',700,NULL,5,0,0.00,0.00,'',NULL,1,'2020-09-07 13:56:47','2020-09-07 07:56:47','',1,NULL,1,0,0),(224,8,'X Ray Lt Foaram B/V',800,NULL,5,0,0.00,350.00,'',NULL,1,'2020-09-07 18:08:09','2020-09-07 12:08:09','',1,NULL,1,0,0),(225,8,'X Ray Rt Foaram B/V',800,NULL,5,0,0.00,350.00,'',NULL,1,'2020-09-07 18:08:45','2020-09-07 12:08:45','',1,NULL,1,0,0),(226,8,'X-Ray Mastoid Townes View',700,NULL,5,0,0.00,300.00,'',NULL,1,'2020-09-11 11:31:39','2020-09-11 05:31:39','',1,NULL,1,0,0),(227,8,'X-RAY  Rt Arm B/V',800,NULL,5,0,0.00,300.00,'',NULL,1,'2020-09-11 12:35:37','2020-09-11 06:35:37','',1,NULL,1,0,0),(228,8,'X-RAY  Lt Arm B/V',800,NULL,5,0,0.00,300.00,'',NULL,1,'2020-09-11 12:36:55','2020-09-11 06:36:55','',1,NULL,1,0,0),(229,0,'ESR Tube',100,NULL,0,0,0.00,0.00,NULL,NULL,2,NULL,'2021-02-23 16:46:01','',1,'4',2,0,0),(230,0,'Needle',20,NULL,0,0,0.00,0.00,NULL,NULL,2,NULL,'2021-02-23 16:46:29','',1,'1,2,3,4',2,0,0),(231,0,'EDTA K3 Tube',20,NULL,0,0,0.00,0.00,NULL,NULL,2,NULL,'2021-02-23 16:47:11','',1,'1,2,3,4',2,0,0),(232,0,'Collection Container',20,NULL,0,0,0.00,0.00,NULL,NULL,2,NULL,'2021-02-23 16:49:50','',1,'7,34,35',2,0,0),(233,39,'ECG',400,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-01 17:20:53','2021-03-01 11:20:53','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : ECG</th></tr><tr><td>ECG<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(234,1,'ASO Titer',500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-09 16:11:28','2021-03-09 10:11:28','\r\n\r\n                        <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : ASO Titer</th></tr><tr><td>ASO Titer<b></b></td><td>200</td><td>U/L</td><td>200</td></tr></tbody></table></div>                    ',1,NULL,1,0,0),(235,40,'ECG 12 Chennel',400,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:17:18','2021-03-11 17:17:18','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : ECG 12 Chennel</th></tr><tr><td>ECG 12 Chennel<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(236,9,'Urine RME',200,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:29:45','2021-03-11 17:29:45','\r\n\r\n                                                  <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                                              <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                                              <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                           \r\n                      <div class=\"bio-chemestry\"><p class=\"MsoNormal\" style=\"text-align: center;\" align=\"center\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 16.5pt; font-family: Arial; letter-spacing: 1.5pt;\">Urine Examination Report</span></span><span style=\"font-family: Arial; font-size: 16.5pt; letter-spacing: 1.5pt; font-weight: bolder;\"> </span></p><div style=\"letter-spacing: 0.2px;\" align=\"center\"><table class=\"MsoNormalTable\" style=\"width: 601pt; margin-left: 13.5pt;\" width=\"801\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\">Physical Examination</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\"><o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><br></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\">Casts/LPF</span></span><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: rgb(206, 198, 206);\"> </span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p> </o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Colour<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Straw<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">RBC          <o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Quantity<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">05</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"> ml<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">WBC         <o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">0 - 1/HPF</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Appearance<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Clear<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Epithelial <o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">0 - 1/HPF</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Sediment <o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Granular  <o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\">Chemical Examination</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\"><o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px; text-align: center;\" align=\"center\"><br></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px; text-align: center;\" align=\"center\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\">Crystales</span></span><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: rgb(206, 198, 206);\"> </span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">  <o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p> </o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Reaction<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Acidic<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Uric Acid<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Albumin<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Cal Oxalat <o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Sugar<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Amo.Phos<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Ex,Phosphate<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Urates<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Nil<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\">Microscope Examination</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\"><o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px; text-align: center;\" align=\"center\"><br></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt; background: lime;\">OnRequest</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"> <o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Pus Cells<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">1 - 2 /HPF</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Bile Salt<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Not done<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">RBC<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">0 - 0 /HPF</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">     <o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">BilePigment<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Not done<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Epithelial Cells<o:p></o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-weight: bolder;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">0 - 1 /HPF</span></span><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p></o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Ketones<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Not done<o:p></o:p></span></p></td></tr><tr><td style=\"width: 246pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"328\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p> </o:p></span></p></td><td style=\"width: 130.5pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"174\"><p class=\"MsoNormal\" style=\"line-height: 21px; text-align: center;\" align=\"center\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\"><o:p> </o:p></span></p></td><td style=\"padding: 1.5pt 1.5pt 1.5pt 5.25pt;\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">B.J Protein<o:p></o:p></span></p></td><td style=\"width: 144.25pt; padding: 1.5pt 1.5pt 1.5pt 5.25pt;\" width=\"192\"><p class=\"MsoNormal\" style=\"line-height: 21px;\"><span style=\"font-size: 13.5pt; line-height: 27px; letter-spacing: 0.15pt;\">Not done<o:p></o:p></span></p></td></tr></tbody></table></div>  \r\n                      </div>\r\n\r\n                                                                                                ',1,NULL,1,0,0),(237,9,'Urine Pregnancy Test',300,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:30:15','2021-03-11 17:30:15','\r\n\r\n                        <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Urine Pregnancy Test</th></tr><tr><td>Urine Pregnancy Test<b></b></td><td>Negative</td><td>(-ve)</td><td>Vegative</td></tr></tbody></table></div>                    ',1,NULL,1,0,0),(238,10,'Stool RME',300,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:34:00','2021-03-11 17:34:00','\r\n\r\n                                                  <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                                              <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                           \r\n                      <div class=\"bio-chemestry\"><table class=\"MsoNormalTable\" style=\"margin-left: 0.45in;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n <tbody><tr style=\"mso-yfti-irow:0;mso-yfti-firstrow:yes;height:13.3pt\">\r\n  <td colspan=\"2\" style=\"width:8.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"792\" valign=\"top\">\r\n  <p class=\"MsoNormal\" style=\"text-align:center\" align=\"center\"><b><i><u><span style=\"font-size:16.0pt\">Physical Examination<o:p></o:p></span></u></i></b></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:1;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Consistency<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Soft<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:2;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Color<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Brown.<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:3;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Blood<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Absent<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:4;height:13.9pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.9pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Mucus<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.9pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Present (+)<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:5;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Worm<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Not  Done<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:6;height:13.3pt\">\r\n  <td colspan=\"2\" style=\"width:8.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"792\" valign=\"top\">\r\n  <p class=\"MsoNormal\" style=\"text-align:center\" align=\"center\"><b><i><u><span style=\"font-size:16.0pt\">Chemical Examination</span></u></i></b><b><u><span style=\"font-size:16.0pt\"><o:p></o:p></span></u></b></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:7;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Reaction<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Alkaline<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:8;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Reducing Substance(R/S)<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:9;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Occult Blood Test (OBT)<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Negative. <o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:10;height:13.3pt\">\r\n  <td colspan=\"2\" style=\"width:8.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"792\" valign=\"top\">\r\n  <p class=\"MsoNormal\" style=\"text-align:center\" align=\"center\"><b><i><u><span style=\"font-size:16.0pt\">Microscopic Examination</span></u></i></b><b><u><span style=\"font-size:16.0pt\"><o:p></o:p></span></u></b></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:11;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Ova Of  A/L<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Not Found<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:12;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Ova  Of \r\n  T/T<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Not Found<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:13;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Ova  Of \r\n  A/D<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Not Found<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:14;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">E. Histolytic<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Not Found<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:15;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">E. Coli<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:16;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Larva Of<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:17;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">RBC<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:18;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Pus Cells<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     14—16 /H.P.F.<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:19;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Epithelial Cells<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     2---3 /H.P.F.<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:20;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Starch<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:21;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Muscle Fiber<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:22;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Fat Globules<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:23;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Vegetable Cells<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil <o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n <tr style=\"mso-yfti-irow:24;mso-yfti-lastrow:yes;height:13.3pt\">\r\n  <td style=\"width:3.0in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"288\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">Cysts Of<o:p></o:p></span></p>\r\n  </td>\r\n  <td style=\"width:5.25in;padding:0in 5.4pt 0in 5.4pt;\r\n  height:13.3pt\" width=\"504\" valign=\"top\">\r\n  <p class=\"MsoNormal\"><span style=\"font-size:16.0pt\">                     Nil<o:p></o:p></span></p>\r\n  </td>\r\n </tr>\r\n</tbody></table>  \r\n                      </div>\r\n\r\n                                                                              ',1,NULL,1,0,0),(239,10,'(OBT) Occult Blood Test',500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:34:42','2021-03-11 17:34:42','\r\n\r\n                        <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Stool For OBT</th></tr><tr><td>Stool For OBT<b></b></td><td>Negative</td><td>(-ve)</td><td>Negative</td></tr></tbody></table></div>                    ',1,NULL,1,0,0),(240,10,'Stool R/S',200,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:35:02','2021-03-11 17:35:02','\r\n\r\n                        <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Stool R/S</th></tr><tr><td>Stool R/S<b></b></td><td>Present</td><td></td><td>Nil</td></tr></tbody></table></div>                    ',1,NULL,1,0,0),(241,41,'ECG Exam ',500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:38:25','2021-03-11 17:38:25','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : ECG Exam </th></tr><tr><td>ECG Exam <b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(242,11,'Echocadiography (Color)',2500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-03-11 23:41:47','2021-03-11 17:41:47','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Echo-Cardiogram</th></tr><tr><td>Echo-Cardiogram<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(243,3,'Anti HBv DNA',8000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:23:56','2021-04-01 20:23:56','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti-n-DNA</th></tr><tr><td>Anti-n-DNA<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(244,1,'Febrile / Triple Antigen',1200,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:25:36','2021-04-01 20:25:36','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Febrile / Triple Antigen</th></tr><tr><td>Febrile / Triple Antigen<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(245,8,'X-Ray PNS ',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:28:40','2021-04-01 20:28:40','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : PNS B/V</th></tr><tr><td>PNS B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(246,8,'X-Ray Neck B/V',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:33:34','2021-04-01 20:33:34','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Neck B/V</th></tr><tr><td>X-Ray Neck B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(247,8,'X-Ray Neck L/T',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:35:39','2021-04-01 20:35:39','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Neck L/T</th></tr><tr><td>X-Ray Neck L/T<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(248,8,'X-Ray Maxilla Occlussal/View',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:37:14','2021-04-01 20:37:14','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Maxilla Occlussal/View</th></tr><tr><td>X-Ray Maxilla Occlussal/View<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(249,8,'X-Ray Mandible B/V',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:38:24','2021-04-01 20:38:24','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Mandible B/V</th></tr><tr><td>X-Ray Mandible B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(250,8,'X-Ray Ba-Enema for Large Gut',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:39:08','2021-04-01 20:39:08','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Ba-Enema for Large Gut</th></tr><tr><td>X-Ray Ba-Enema for Large Gut<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(251,8,'X-Ray Ba-Swallow for Oesophagus',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:39:45','2021-04-01 20:39:45','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Ba-Swallow for Oesophagus</th></tr><tr><td>X-Ray Ba-Swallow for Oesophagus<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(252,8,'X-Ray Ba-Meal for Stomach & Deudenum',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:40:20','2021-04-01 20:40:20','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Ba-Meal for Stomach & Deudenum</th></tr><tr><td>X-Ray Ba-Meal for Stomach & Deudenum<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(253,8,'X-Ray Ba-Meal+Ba-Follow Through',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:40:44','2021-04-01 20:40:44','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Ba-Meal+Ba-Follow Through</th></tr><tr><td>X-Ray Ba-Meal+Ba-Follow Through<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(254,8,'X-Ray Rt Arm B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:45:44','2021-04-01 20:45:44','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Arm B/V</th></tr><tr><td>X-Ray Rt Arm B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(255,8,'X-Ray Lt Arm B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:46:00','2021-04-01 20:46:00','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Arm B/V</th></tr><tr><td>X-Ray Lt Arm B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(256,8,'X-Ray Rt Femur B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:49:29','2021-04-01 20:49:29','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Femur B/V</th></tr><tr><td>X-Ray Rt Femur B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(257,8,'X-Ray Lt Femur B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:49:47','2021-04-01 20:49:47','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Femur B/V</th></tr><tr><td>X-Ray Lt Femur B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(258,8,'X-Ray Rt Leg B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:51:57','2021-04-01 20:51:57','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Leg B/V</th></tr><tr><td>X-Ray Rt Leg B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(259,8,'X-Ray Lt Leg B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:52:17','2021-04-01 20:52:17','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Leg B/V</th></tr><tr><td>X-Ray Lt Leg B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(260,8,'X-Ray Rt Hand including Wrist Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:54:11','2021-04-01 20:54:11','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Hand including Wrist Joint B/V</th></tr><tr><td>X-Ray Rt Hand including Wrist Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(261,8,'X-Ray Lt Hand including Wrist Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:54:39','2021-04-01 20:54:39','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Hand including Wrist Joint B/V</th></tr><tr><td>X-Ray Lt Hand including Wrist Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(262,8,'X-Ray Rt Forearm including Elbow Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:55:06','2021-04-01 20:55:06','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Forearm including Elbow Joint B/V</th></tr><tr><td>X-Ray Rt Forearm including Elbow Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(263,8,'X-Ray Lt Forearm including Elbow Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:55:23','2021-04-01 20:55:23','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Forearm including Elbow Joint B/V</th></tr><tr><td>X-Ray Lt Forearm including Elbow Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(264,8,'X-Ray Rt Forearm including Wrist Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:56:40','2021-04-01 20:56:40','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Forearm including Wrist Joint B/V</th></tr><tr><td>X-Ray Rt Forearm including Wrist Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(265,8,'X-Ray Lt Forearm including Wrist Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:56:57','2021-04-01 20:56:57','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Forearm including Wrist Joint B/V</th></tr><tr><td>X-Ray Lt Forearm including Wrist Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(266,8,'X-Ray Rt Shoulder Joint including Clavicle B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:57:28','2021-04-01 20:57:28','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Shoulder Joint including Clavicle B/V</th></tr><tr><td>X-Ray Rt Shoulder Joint including Clavicle B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(267,8,'X-Ray Lt Shoulder Joint including Clavicle B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 02:57:45','2021-04-01 20:57:45','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Shoulder Joint including Clavicle B/V</th></tr><tr><td>X-Ray Lt Shoulder Joint including Clavicle B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(268,8,'X-Ray Rt Foot including Ankle Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:00:57','2021-04-01 21:00:57','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Foot including Ankle Joint B/V</th></tr><tr><td>X-Ray Rt Foot including Ankle Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(269,8,'X-Ray Lt Foot including Ankle Joint B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:01:14','2021-04-01 21:01:14','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Foot including Ankle Joint B/V</th></tr><tr><td>X-Ray Lt Foot including Ankle Joint B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(270,8,'X-Ray Rt Hip Joint including Femur B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:01:46','2021-04-01 21:01:46','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Hip Joint including Femur B/V</th></tr><tr><td>X-Ray Rt Hip Joint including Femur B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(271,8,'X-Ray Lt Hip Joint including Femur B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:02:11','2021-04-01 21:02:11','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Hip Joint including Femur B/V</th></tr><tr><td>X-Ray Lt Hip Joint including Femur B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(272,8,'X-Ray Pelvis including Both Hip Joint A/P',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:02:39','2021-04-01 21:02:39','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Pelvis including Both Hip Joint A/P</th></tr><tr><td>X-Ray Pelvis including Both Hip Joint A/P<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(273,8,'X-Ray Lt Hand B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:03:52','2021-04-01 21:03:52','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Hand B/V</th></tr><tr><td>X-Ray Lt Hand B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(274,8,'X-ray Sacro-Coccygeal Region B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:04:20','2021-04-01 21:04:20','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-ray Sacro-Coccygeal Region B/V</th></tr><tr><td>X-ray Sacro-Coccygeal Region B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(275,9,'Cus',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:07:23','2021-04-01 21:07:23','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Cus</th></tr><tr><td>Cus<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(276,8,'X-ray Rt Hip Joint A/p View',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:09:27','2021-04-01 21:09:27','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-ray Rt Hip Joint A/p View</th></tr><tr><td>X-ray Rt Hip Joint A/p View<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(277,8,'X-ray Rt phalanges bone',700,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:09:44','2021-04-01 21:09:44','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-ray Rt phalanges bone</th></tr><tr><td>X-ray Rt phalanges bone<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(278,8,'X-Ray OPG (Dentel X-Ray)',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:10:30','2021-04-01 21:10:30','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray OPG (Dentel X-Ray)</th></tr><tr><td>X-Ray OPG (Dentel X-Ray)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(279,4,'PBF',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:14:18','2021-04-01 21:14:18','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : PBF</th></tr><tr><td>PBF<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(280,1,'ICT TB',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:15:55','2021-04-01 21:15:55','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : ICT TB</th></tr><tr><td>ICT TB<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(281,7,'Nebulization',150,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:24:43','2021-04-01 21:24:43','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Nebulization</th></tr><tr><td>Nebulization<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(282,8,'X-Ray Lt Heel B/V (X-Ray) & Report',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:29:01','2021-04-01 21:29:01','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Lt Heel B/V (X-Ray) & Report</th></tr><tr><td>X-Ray Lt Heel B/V (X-Ray) & Report<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(283,8,'X-Ray Rt Heel B/V (X-Ray) & Report',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:29:36','2021-04-01 21:29:36','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Rt Heel B/V (X-Ray) & Report</th></tr><tr><td>X-Ray Rt Heel B/V (X-Ray) & Report<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(284,1,'Tripple Antigen',1000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:32:04','2021-04-01 21:32:04','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Tripple Antigen</th></tr><tr><td>Tripple Antigen<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(285,8,'X-Ray Report',50,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:33:40','2021-04-01 21:33:40','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Report</th></tr><tr><td>X-Ray Report<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(286,8,'X-Ray Report (Double Snap)',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:33:57','2021-04-01 21:33:57','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Report (Double Snap)</th></tr><tr><td>X-Ray Report (Double Snap)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(287,1,'Anti CCP Antibody',2800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:34:24','2021-04-01 21:34:24','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti CCP Antibody</th></tr><tr><td>Anti CCP Antibody<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(288,8,'Thoraco Lumber Spine B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:35:23','2021-04-01 21:35:23','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Thoraco Lumber Spine B/V</th></tr><tr><td>Thoraco Lumber Spine B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(289,8,'X-Ray Thoracis Spine B/V',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:35:54','2021-04-01 21:35:54','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray Thoracis Spine B/V</th></tr><tr><td>X-Ray Thoracis Spine B/V<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(290,1,'AG  A Ratio',1000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:37:10','2021-04-01 21:37:10','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : A:G Ratio</th></tr><tr><td>A:G Ratio<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(291,4,'Hb Electroprocess',2500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:38:38','2021-04-01 21:38:38','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Hb Electroprocess</th></tr><tr><td>Hb Electroprocess<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(292,8,'X-Ray 2 Flim Report',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 03:39:19','2021-04-01 21:39:19','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : X-Ray 2 Flim Report</th></tr><tr><td>X-Ray 2 Flim Report<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(293,1,'Anti HBA',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:17:32','2021-04-02 10:17:32','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti HBA</th></tr><tr><td>Anti HBA<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(294,1,'PT INR',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:18:31','2021-04-02 10:18:31','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : PT INR</th></tr><tr><td>PT INR<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(295,1,'Anti HEV',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:19:13','2021-04-02 10:19:13','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti HEV</th></tr><tr><td>Anti HEV<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(296,1,'Anti HAV',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:19:38','2021-04-02 10:19:38','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti HAV</th></tr><tr><td>Anti HAV<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(297,1,'Febaril Antigen',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:20:06','2021-04-02 10:20:06','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Febaril Antigen</th></tr><tr><td>Febaril Antigen<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(298,3,'S.Vitamin D3',4000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:20:41','2021-04-02 10:20:41','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : S.Vitamin D3</th></tr><tr><td>S.Vitamin D3<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(299,4,'S. Laipes',1200,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:21:22','2021-04-02 10:21:22','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : S. Laipes</th></tr><tr><td>S. Laipes<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(300,3,'Vitamin -B12',2500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-02 16:23:42','2021-04-02 10:23:42','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Vitamin -B12</th></tr><tr><td>Vitamin -B12<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(301,42,'kata',345,NULL,5,0,0.00,0.00,NULL,NULL,1,'2021-04-03 23:45:24','2021-04-03 17:45:24','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : kata</th></tr><tr><td>kata<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,3,4),(302,0,'Needle',12,NULL,0,0,0.00,0.00,NULL,NULL,1,NULL,'2021-04-03 18:05:33','',1,'1,2,3,4',2,0,0),(303,0,'EDTA Tube',15,NULL,0,0,0.00,0.00,NULL,NULL,1,NULL,'2022-10-06 17:04:27','',1,'1,2,3,4',2,0,0),(304,0,'ESR Tube',20,NULL,0,0,0.00,0.00,NULL,NULL,1,NULL,'2022-10-06 17:05:26','',1,'4',2,0,0),(305,0,'Contener',5,NULL,0,0,0.00,0.00,NULL,NULL,1,NULL,'2022-10-06 17:06:41','',1,'7,9,10',2,0,0),(306,0,'X-Ray Report',50,NULL,0,0,0.00,0.00,NULL,NULL,1,NULL,'2022-10-06 17:07:09','',1,'8',2,0,0),(307,4,'CBC (TC,DC,HB%,ESR)',500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 12:48:34','2022-11-16 06:48:34','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : CBC (TC,DC,HB%,ESR)</th></tr><tr><td>CBC (TC,DC,HB%,ESR)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(308,2,'Lipid Profile (Random)',1200,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:09:11','2022-11-16 07:09:11','\r\n\r\n                        <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Lipid Profile (Random)</th></tr><tr><td>Lipid Profile (Random)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>                    ',1,NULL,1,0,0),(309,2,'Electrolytes  4P ',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:10:45','2022-11-16 07:10:45','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Electrolytes</th></tr><tr><td>Electrolytes<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(310,1,'Anti HCV (Con)',1200,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:15:40','2022-11-16 07:15:40','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti HCV (Con)</th></tr><tr><td>Anti HCV (Con)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(311,1,'R/W Test',600,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:17:49','2022-11-16 07:17:49','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : R/W Test</th></tr><tr><td>R/W Test<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(312,1,'HIV',2500,NULL,0,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:20:17','2022-11-16 07:20:17','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : HIV</th></tr><tr><td>HIV<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(313,3,'THROAT SWAB FOR R/E',600,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:23:02','2022-11-16 07:23:02','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : THROAT SWAB FOR R/E</th></tr><tr><td>THROAT SWAB FOR R/E<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(314,3,'THROAT SWAB FOR ALBURT STAINING',600,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 13:24:31','2022-11-16 07:24:31','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : THROAT SWAB FOR ALBURT STAINING</th></tr><tr><td>THROAT SWAB FOR ALBURT STAINING<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(315,1,'Prostatic Smer For G.C',1000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:18:02','2022-11-16 08:18:02','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Prostatic Smer For G.C</th></tr><tr><td>Prostatic Smer For G.C<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(316,1,'C.F.T For Filaria',800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:19:43','2022-11-16 08:19:43','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : C.F.T For Filaria</th></tr><tr><td>C.F.T For Filaria<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(317,1,'PAP Smear',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:20:57','2022-11-16 08:20:57','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : PAP Smear</th></tr><tr><td>PAP Smear<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(318,1,'Anti-HBs(Elisa)',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:24:02','2022-11-16 08:24:02','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti-HBs(Elisa)</th></tr><tr><td>Anti-HBs(Elisa)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(319,1,'Anti-HBe(Elisa)',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:24:27','2022-11-16 08:24:27','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti-HBe(Elisa)</th></tr><tr><td>Anti-HBe(Elisa)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(320,1,'Anti-HBc TOTAL (Elisa)',2500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:25:15','2022-11-16 08:25:15','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti-HBc TOTAL (Elisa)</th></tr><tr><td>Anti-HBc TOTAL (Elisa)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(321,1,'ANA',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:27:21','2022-11-16 08:27:21','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : ANA</th></tr><tr><td>ANA<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(322,1,'DNA-PCR',8000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:48:00','2022-11-16 08:48:00','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : DNA-PCR</th></tr><tr><td>DNA-PCR<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(323,3,'CA-19.9',1800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:49:38','2022-11-16 08:49:38','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : CA-19.9</th></tr><tr><td>CA-19.9<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(324,3,'CA-125',1800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:50:31','2022-11-16 08:50:31','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : CA-125</th></tr><tr><td>CA-125<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(325,3,'Anti Pro BNP',4000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:52:26','2022-11-16 08:52:26','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Anti Pro BNP</th></tr><tr><td>Anti Pro BNP<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(326,3,'D-Dimer',2500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:53:49','2022-11-16 08:53:49','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : D-Dimer</th></tr><tr><td>D-Dimer<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(327,3,'B-HCG',1500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:55:43','2022-11-16 08:55:43','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : B-HCG</th></tr><tr><td>B-HCG<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(328,3,'PSA',1000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:58:00','2022-11-16 08:58:00','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : PSA</th></tr><tr><td>PSA<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(329,3,'TIBC',1300,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 14:59:23','2022-11-16 08:59:23','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : TIBC</th></tr><tr><td>TIBC<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(330,9,'Urine Suger',150,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 15:05:05','2022-11-16 09:05:05','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Urine Suger</th></tr><tr><td>Urine Suger<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(331,10,'Stool OBT',500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 15:07:14','2022-11-16 09:07:14','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Stool OBT</th></tr><tr><td>Stool OBT<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(332,1,'Colltion fee',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-16 15:09:12','2022-11-16 09:09:12','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Colltion fee</th></tr><tr><td>Colltion fee<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(333,5,'USG Anomaly scan (4d Colour )',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:43:09','2022-11-20 07:43:09','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG Anomaly scan (4d Colour )</th></tr><tr><td>USG Anomaly scan (4d Colour )<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(334,5,'USG Of W/A & PVR (4D Colour)',1800,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:43:44','2022-11-20 07:43:44','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG Of W/A & PVR (4D Colour)</th></tr><tr><td>USG Of W/A & PVR (4D Colour)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(335,5,'USG Anomaly Scan & Fetal',3500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:44:20','2022-11-20 07:44:20','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG Anomaly Scan & Fetal</th></tr><tr><td>USG Anomaly Scan & Fetal<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(336,5,'USG Anomaly scan (4d Colour )Twin Pg',3000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:44:49','2022-11-20 07:44:49','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG Anomaly scan (4d Colour )Twin Pg</th></tr><tr><td>USG Anomaly scan (4d Colour )Twin Pg<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(337,5,'USG Doppler (4d Colour )',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:46:33','2022-11-20 07:46:33','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG Doppler (4d Colour )</th></tr><tr><td>USG Doppler (4d Colour )<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(338,5,'USG of Scrotum With Inguinal Regio',3500,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:47:26','2022-11-20 07:47:26','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG of Scrotum With Inguinal Regio</th></tr><tr><td>USG of Scrotum With Inguinal Regio<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(339,5,'USG Of TVS  Colour ',3000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:48:58','2022-11-20 07:48:58','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG Of TVS  Colour </th></tr><tr><td>USG Of TVS  Colour <b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(340,5,'USG of Thyroid Gland',2000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-20 13:49:36','2022-11-20 07:49:36','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : USG of Thyroid Gland</th></tr><tr><td>USG of Thyroid Gland<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(341,4,'CBC (Dengue)',400,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-22 12:42:57','2022-11-22 06:42:57','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : CBC (Dengue)</th></tr><tr><td>CBC (Dengue)<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(342,1,'Blood Collection Needle',50,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-27 16:36:49','2022-11-27 10:36:49','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Blood Collection Needle</th></tr><tr><td>Blood Collection Needle<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(343,1,'Blood Collection Needle',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-27 16:37:11','2022-11-27 10:37:11','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Blood Collection Needle</th></tr><tr><td>Blood Collection Needle<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(344,1,'Butterfly ',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-27 18:30:34','2022-11-27 12:30:34','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Butterfly </th></tr><tr><td>Butterfly <b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(345,1,'Butterfly ',100,NULL,5,0,0.00,0.00,NULL,NULL,1,'2022-11-27 18:31:13','2022-11-27 12:31:13','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : Butterfly </th></tr><tr><td>Butterfly <b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0),(346,2,'test',1000,NULL,5,0,0.00,0.00,NULL,NULL,1,'2023-02-24 16:30:42','2023-02-24 10:30:42','<div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><th class=\"farhana-table-4-tr-1\" colspan=\"5\">Test name : test</th></tr><tr><td>test<b></b></td><td></td><td></td><td><br></td></tr></tbody></table></div>',1,NULL,1,0,0);
/*!40000 ALTER TABLE `diagnostic_test_subgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1=active 2=delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Md,Nadim','Director (Patnar)',1,NULL,'2022-10-06 15:32:37');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_commission_type`
--

DROP TABLE IF EXISTS `discount_commission_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount_commission_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1= full discount retracts from Com\r\n2= half discount retracts from Com\r\n\r\n',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_commission_type`
--

LOCK TABLES `discount_commission_type` WRITE;
/*!40000 ALTER TABLE `discount_commission_type` DISABLE KEYS */;
INSERT INTO `discount_commission_type` VALUES (1,2,'2020-09-18 13:23:39','2020-09-29 07:23:50');
/*!40000 ALTER TABLE `discount_commission_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `division_id` int(2) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `bn_name` varchar(50) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,3,'Dhaka','ঢাকা',23.7115253,90.4111451,'www.dhaka.gov.bd'),(2,3,'Faridpur','ফরিদপুর',23.6070822,89.8429406,'www.faridpur.gov.bd'),(3,3,'Gazipur','গাজীপুর',24.0022858,90.4264283,'www.gazipur.gov.bd'),(4,3,'Gopalganj','গোপালগঞ্জ',23.0050857,89.8266059,'www.gopalganj.gov.bd'),(5,3,'Jamalpur','জামালপুর',24.937533,89.937775,'www.jamalpur.gov.bd'),(6,3,'Kishoreganj','কিশোরগঞ্জ',24.444937,90.776575,'www.kishoreganj.gov.bd'),(7,3,'Madaripur','মাদারীপুর',23.164102,90.1896805,'www.madaripur.gov.bd'),(8,3,'Manikganj','মানিকগঞ্জ',0,0,'www.manikganj.gov.bd'),(9,3,'Munshiganj','মুন্সিগঞ্জ',0,0,'www.munshiganj.gov.bd'),(10,3,'Mymensingh','ময়মনসিং',0,0,'www.mymensingh.gov.bd'),(11,3,'Narayanganj','নারায়াণগঞ্জ',23.63366,90.496482,'www.narayanganj.gov.bd'),(12,3,'Narsingdi','নরসিংদী',23.932233,90.71541,'www.narsingdi.gov.bd'),(13,3,'Netrokona','নেত্রকোনা',24.870955,90.727887,'www.netrokona.gov.bd'),(14,3,'Rajbari','রাজবাড়ি',23.7574305,89.6444665,'www.rajbari.gov.bd'),(15,3,'Shariatpur','শরীয়তপুর',0,0,'www.shariatpur.gov.bd'),(16,3,'Sherpur','শেরপুর',25.0204933,90.0152966,'www.sherpur.gov.bd'),(17,3,'Tangail','টাঙ্গাইল',0,0,'www.tangail.gov.bd'),(18,5,'Bogra','বগুড়া',24.8465228,89.377755,'www.bogra.gov.bd'),(19,5,'Joypurhat','জয়পুরহাট',0,0,'www.joypurhat.gov.bd'),(20,5,'Naogaon','নওগাঁ',0,0,'www.naogaon.gov.bd'),(21,5,'Natore','নাটোর',24.420556,89.000282,'www.natore.gov.bd'),(22,5,'Nawabganj','নবাবগঞ্জ',24.5965034,88.2775122,'www.chapainawabganj.gov.bd'),(23,5,'Pabna','পাবনা',23.998524,89.233645,'www.pabna.gov.bd'),(24,5,'Rajshahi','রাজশাহী',0,0,'www.rajshahi.gov.bd'),(25,5,'Sirajgonj','সিরাজগঞ্জ',24.4533978,89.7006815,'www.sirajganj.gov.bd'),(26,6,'Dinajpur','দিনাজপুর',25.6217061,88.6354504,'www.dinajpur.gov.bd'),(27,6,'Gaibandha','গাইবান্ধা',25.328751,89.528088,'www.gaibandha.gov.bd'),(28,6,'Kurigram','কুড়িগ্রাম',25.805445,89.636174,'www.kurigram.gov.bd'),(29,6,'Lalmonirhat','লালমনিরহাট',0,0,'www.lalmonirhat.gov.bd'),(30,6,'Nilphamari','নীলফামারী',25.931794,88.856006,'www.nilphamari.gov.bd'),(31,6,'Panchagarh','পঞ্চগড়',26.3411,88.5541606,'www.panchagarh.gov.bd'),(32,6,'Rangpur','রংপুর',25.7558096,89.244462,'www.rangpur.gov.bd'),(33,6,'Thakurgaon','ঠাকুরগাঁও',26.0336945,88.4616834,'www.thakurgaon.gov.bd'),(34,1,'Barguna','বরগুনা',0,0,'www.barguna.gov.bd'),(35,1,'Barisal','বরিশাল',0,0,'www.barisal.gov.bd'),(36,1,'Bhola','ভোলা',22.685923,90.648179,'www.bhola.gov.bd'),(37,1,'Jhalokati','ঝালকাঠি',0,0,'www.jhalakathi.gov.bd'),(38,1,'Patuakhali','পটুয়াখালী',22.3596316,90.3298712,'www.patuakhali.gov.bd'),(39,1,'Pirojpur','পিরোজপুর',0,0,'www.pirojpur.gov.bd'),(40,2,'Bandarban','বান্দরবান',22.1953275,92.2183773,'www.bandarban.gov.bd'),(41,2,'Brahmanbaria','ব্রাহ্মণবাড়িয়া',23.9570904,91.1119286,'www.brahmanbaria.gov.bd'),(42,2,'Chandpur','চাঁদপুর',23.2332585,90.6712912,'www.chandpur.gov.bd'),(43,2,'Chittagong','চট্টগ্রাম',22.335109,91.834073,'www.chittagong.gov.bd'),(44,2,'Comilla','কুমিল্লা',23.4682747,91.1788135,'www.comilla.gov.bd'),(45,2,'Cox\'s Bazar','কক্স বাজার',0,0,'www.coxsbazar.gov.bd'),(46,2,'Feni','ফেনী',23.023231,91.3840844,'www.feni.gov.bd'),(47,2,'Khagrachari','খাগড়াছড়ি',23.119285,91.984663,'www.khagrachhari.gov.bd'),(48,2,'Lakshmipur','লক্ষ্মীপুর',22.942477,90.841184,'www.lakshmipur.gov.bd'),(49,2,'Noakhali','নোয়াখালী',22.869563,91.099398,'www.noakhali.gov.bd'),(50,2,'Rangamati','রাঙ্গামাটি',0,0,'www.rangamati.gov.bd'),(51,7,'Habiganj','হবিগঞ্জ',24.374945,91.41553,'www.habiganj.gov.bd'),(52,7,'Maulvibazar','মৌলভীবাজার',24.482934,91.777417,'www.moulvibazar.gov.bd'),(53,7,'Sunamganj','সুনামগঞ্জ',25.0658042,91.3950115,'www.sunamganj.gov.bd'),(54,7,'Sylhet','সিলেট',24.8897956,91.8697894,'www.sylhet.gov.bd'),(55,4,'Bagerhat','বাগেরহাট',22.651568,89.785938,'www.bagerhat.gov.bd'),(56,4,'Chuadanga','চুয়াডাঙ্গা',23.6401961,88.841841,'www.chuadanga.gov.bd'),(57,4,'Jessore','যশোর',23.16643,89.2081126,'www.jessore.gov.bd'),(58,4,'Jhenaidah','ঝিনাইদহ',23.5448176,89.1539213,'www.jhenaidah.gov.bd'),(59,4,'Khulna','খুলনা',22.815774,89.568679,'www.khulna.gov.bd'),(60,4,'Kushtia','কুষ্টিয়া',23.901258,89.120482,'www.kushtia.gov.bd'),(61,4,'Magura','মাগুরা',23.487337,89.419956,'www.magura.gov.bd'),(62,4,'Meherpur','মেহেরপুর',23.762213,88.631821,'www.meherpur.gov.bd'),(63,4,'Narail','নড়াইল',23.172534,89.512672,'www.narail.gov.bd'),(64,4,'Satkhira','সাতক্ষীরা',0,0,'www.satkhira.gov.bd'),(65,5,'sdcscdscds','csdcsdc',0,0,'');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `bn_name` varchar(50) NOT NULL,
  `position` int(2) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Barisal','বরিশাল',6,18),(2,'Chittagong','চট্টগ্রাম',2,18),(3,'Dhaka','ঢাকা',1,18),(4,'Khulna','খুলনা',4,18),(5,'Rajshahi','রাজশাহী',3,18),(6,'Rangpur','রংপুর',7,18),(7,'Sylhet','সিলেট',5,18);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_appointment`
--

DROP TABLE IF EXISTS `doc_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uhid` int(11) NOT NULL DEFAULT '0',
  `appointment_gen_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appointed_p_id` int(11) NOT NULL DEFAULT '0',
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `doc_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_doc_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_doc_id` int(11) NOT NULL DEFAULT '0',
  `appointment_status` int(11) NOT NULL DEFAULT '1',
  `serial_no` int(11) NOT NULL DEFAULT '0',
  `schedule_id` int(11) NOT NULL DEFAULT '0',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `doc_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_doc_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4,
  `cc` text CHARACTER SET utf8mb4,
  `general_exam` text CHARACTER SET utf8mb4,
  `test_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advice` text CHARACTER SET utf8mb4,
  `weight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spo2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diagnosis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pulse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_appointment`
--

LOCK TABLES `doc_appointment` WRITE;
/*!40000 ALTER TABLE `doc_appointment` DISABLE KEYS */;
INSERT INTO `doc_appointment` VALUES (1,1,'000001',1,1,'Dr. Akter Jahan MBBS, BCS(Health), MS','2',0,1,1,1,'10:00:00','18:00:00','2022-11-06','10:01:00','2022-11-06 12:03:34','2022-11-05 15:59:51','care',5,'',NULL,'Rheumatic fever','Back Pain 10 Day , Head Pain 5Day',NULL,'RA/RF Titre ,TPHA,USG of W/A (4D Colour)  Male,X-Ray Chest P/A View','4,5,33,86','এক সপ্তাহ পরে দেখা করবেন','80kg','80/120','99','Rheumatic fever','78'),(2,0,'000002',3,1,'Dr.Mesbah Uddin Ahmed MBBS,MS','0',0,1,1,5,'10:00:00','18:00:00','2022-11-15','10:01:00','2022-11-15 22:31:44','2022-11-15 16:31:44','care',5,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,0,'000003',4,3,'Dr.Younus Khan ','0',0,1,1,11,'10:00:00','18:00:00','2022-11-28','10:40:00','2022-11-28 01:21:58','2022-11-28 07:19:32','care',5,'MBBS, FCPS Medicine',NULL,'','STD ',NULL,'TPHA,VDRL,HBsAg (Screening)','5,6,7','','80kg','80/120','99','','78'),(4,0,'000004',5,3,'Dr.Younus Khan ','Dr.Younus Khan ',3,1,1,12,'10:00:00','18:00:00','2022-11-29','10:40:00','2022-11-29 10:59:58','2022-11-29 16:55:54','care',5,'MBBS, FCPS Medicine','MBBS, FCPS Medicine','R/A: Negative\r\nVDRL : Non-Reactive\r\nUSG : Normal','Fever 10 day & Head Pain 10',NULL,'RA/RF Titre ,VDRL,USG of W/A (4D Colour)  Male,X-Ray PNS O/M View','4,6,33,62','10 Days Bed Rest','80kg','80/120','99','STD','78'),(5,0,'000005',6,3,'Dr.Younus Khan ','Bangal Islami Life Insurence',5,1,1,9,'10:00:00','18:00:00','2023-01-07','10:10:00','2023-01-13 09:09:06','2023-01-07 14:46:22','care',5,'MBBS, FCPS Medicine','','','দশদিন যাবত জ্বর মাথা ব্যথা পেট ব্যথা ',NULL,'TPHA,USG Of W/A & PVR (4D Colour)','5,334','','80kg','80/120','99','typhoid Jor Hepatitis B positive ','78'),(6,6,'000006',7,3,'Dr.Younus Khan ','3',0,1,1,15,'10:00:00','18:00:00','2023-01-13','10:58:00','2023-01-13 09:14:52','2023-01-13 15:13:53','care',5,'MBBS, FCPS Medicine',NULL,'','',NULL,'RA/RF Titre ,TPHA,HBsAg (Screening),CRP Test','4,5,7,8','','75','80/120','99','','78');
/*!40000 ALTER TABLE `doc_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_category`
--

DROP TABLE IF EXISTS `doc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_category`
--

LOCK TABLES `doc_category` WRITE;
/*!40000 ALTER TABLE `doc_category` DISABLE KEYS */;
INSERT INTO `doc_category` VALUES (1,'Medicine',1,'2022-10-06 00:00:00','2022-10-06 21:15:22','care',5),(2,'Q/C Dr',1,'2022-10-06 00:00:00','2022-10-06 21:15:26','care',5),(3,'ENT Consultant',1,'2022-11-15 00:00:00','2022-11-15 10:27:04','care',5),(4,'Gynecologist',1,'2022-11-15 00:00:00','2022-11-15 10:28:15','care',5),(5,'Chaild',1,'2022-11-15 00:00:00','2022-11-15 10:29:07','care',5),(6,'Surgery',1,'2022-11-22 00:00:00','2022-11-22 01:36:55','care',5);
/*!40000 ALTER TABLE `doc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_comission_distribution`
--

DROP TABLE IF EXISTS `doc_comission_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_comission_distribution` (
  `doc_com_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_by` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL COMMENT 'if testid=0,that means all test of this group is same amount of commission for the doctor',
  `price` int(11) DEFAULT NULL,
  `doc_comission` double(10,2) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  `add_date_time` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `com_type` int(11) DEFAULT NULL COMMENT '1=percantage,2=Fixed Commission , 3=Amount',
  `active_status` int(11) DEFAULT '1' COMMENT '1=active,0=not active',
  PRIMARY KEY (`doc_com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_comission_distribution`
--

LOCK TABLES `doc_comission_distribution` WRITE;
/*!40000 ALTER TABLE `doc_comission_distribution` DISABLE KEYS */;
INSERT INTO `doc_comission_distribution` VALUES (1,NULL,5,2,1,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(2,NULL,5,2,2,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(3,NULL,5,2,3,0,0,30.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(4,NULL,5,2,4,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(5,NULL,5,2,5,0,0,200.00,'2022-10-06','2022-10-06 21:19:10',NULL,2,1),(6,NULL,5,2,7,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(7,NULL,5,2,8,0,0,20.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(8,NULL,5,2,9,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(9,NULL,5,2,10,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(10,NULL,5,2,11,0,0,500.00,'2022-10-06','2022-10-06 21:19:10',NULL,2,1),(11,NULL,5,2,41,0,0,50.00,'2022-10-06','2022-10-06 21:19:10',NULL,1,1),(12,NULL,5,21,1,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(13,NULL,5,21,2,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(14,NULL,5,21,3,0,0,15.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(15,NULL,5,21,4,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(16,NULL,5,21,5,0,0,15.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(17,NULL,5,21,7,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(18,NULL,5,21,8,0,0,15.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(19,NULL,5,21,9,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(20,NULL,5,21,10,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(21,NULL,5,21,11,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(22,NULL,5,21,41,0,0,20.00,'2022-12-03','2022-12-03 15:32:15',NULL,1,1),(23,NULL,5,5,1,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(24,NULL,5,5,2,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(25,NULL,5,5,3,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(26,NULL,5,5,4,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(27,NULL,5,5,5,0,0,15.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(28,NULL,5,5,7,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(29,NULL,5,5,8,0,0,15.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(30,NULL,5,5,9,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(31,NULL,5,5,10,0,0,20.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(32,NULL,5,5,11,0,0,15.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1),(33,NULL,5,5,41,0,0,15.00,'2023-02-24','2023-02-24 15:54:38',NULL,1,1);
/*!40000 ALTER TABLE `doc_comission_distribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_comission_style_type`
--

DROP TABLE IF EXISTS `doc_comission_style_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_comission_style_type` (
  `doc_com_type_int` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT NULL,
  `comission_style` int(11) DEFAULT NULL COMMENT '1=Comission Will Give From Test,2=Comission Will Doctor Wise Separte For Separate Doctor',
  `add_date` date DEFAULT NULL,
  `add_datetime` datetime DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_com_type_int`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_comission_style_type`
--

LOCK TABLES `doc_comission_style_type` WRITE;
/*!40000 ALTER TABLE `doc_comission_style_type` DISABLE KEYS */;
INSERT INTO `doc_comission_style_type` VALUES (1,5,1,'2018-12-18','2018-12-18 00:00:00',1);
/*!40000 ALTER TABLE `doc_comission_style_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_commission`
--

DROP TABLE IF EXISTS `doc_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT '0',
  `total_commission` double NOT NULL DEFAULT '0',
  `total_gross_com` double NOT NULL DEFAULT '0',
  `total_test_amount` double NOT NULL DEFAULT '0',
  `total_test_discount` double NOT NULL DEFAULT '0',
  `total_vat` double NOT NULL DEFAULT '0',
  `com_status` int(11) NOT NULL DEFAULT '0' COMMENT '1= paid, 0 =unpaid',
  `paid_amount` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_id` int(150) DEFAULT NULL,
  `doc_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `doc_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=ref 2=quack 3=self',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2=delete',
  `discount_commission_type` int(11) NOT NULL DEFAULT '1' COMMENT '1= full discount retracts from Com\r\n2= half discount retracts from Com',
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_commission`
--

LOCK TABLES `doc_commission` WRITE;
/*!40000 ALTER TABLE `doc_commission` DISABLE KEYS */;
INSERT INTO `doc_commission` VALUES (1,1,1400,1600,3227,200,0,0,0,'2022-10-30 17:02:21','2022-11-28 07:39:06',1,'Dr.Mohammad Kamal DMA',2,2,1,1,'care',5),(2,2,700,700,1427,0,0,0,0,'2022-10-30 17:39:28','2022-11-29 16:41:24',2,'Dr.Mohammad Kamal DMA',2,2,1,1,'care',5),(3,3,0,0,1927,200,0,0,0,'2022-11-28 13:25:15','2022-11-28 07:25:15',3,'self',0,3,1,1,'care',5),(4,4,0,0,1500,0,0,0,0,'2022-11-28 18:15:07','2023-02-20 02:34:57',4,'Dr.Younus Khan ',3,2,1,1,'moshiur',5),(5,5,200,200,1500,0,0,0,0,'2022-11-28 18:20:35','2022-11-28 12:20:35',5,'self',0,3,1,1,'care',5),(6,6,0,0,1500,0,0,0,0,'2022-11-28 18:23:19','2022-11-29 16:42:35',3,'self',0,3,1,1,'care',5),(7,7,200,200,1500,0,0,0,0,'2022-11-28 18:26:32','2022-11-29 16:42:42',1,'self',0,3,1,1,'care',5),(8,8,0,0,1500,0,0,0,0,'2022-11-28 18:44:25','2022-11-28 12:44:25',6,'self',0,3,1,1,'care',5),(9,9,0,0,1500,0,0,0,0,'2022-11-28 18:46:31','2022-11-29 17:21:28',7,'self',0,3,1,1,'care',5),(10,10,200,200,1500,0,0,0,0,'2022-11-28 18:49:46','2022-11-28 12:49:46',5,'self',0,3,1,1,'care',5),(11,11,0,0,3127,200,0,0,0,'2022-11-29 23:29:17','2022-11-29 17:29:17',8,'Dr.Younus Khan ',3,2,1,1,'care',5),(12,12,0,0,3127,0,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27',4,'Dr.Younus Khan ',3,2,1,1,'care',5),(13,13,0,0,3127,0,0,0,0,'2022-11-29 23:33:48','2023-02-20 02:40:36',9,'Bangal Islami Life Insurence',5,2,1,1,'moshiur',5),(14,14,0,0,3127,200,0,0,0,'2022-12-02 22:53:31','2022-12-02 16:53:31',10,'Dr.Younus Khan ',3,2,1,1,'care',5),(15,15,0,0,2327,200,0,0,0,'2022-12-03 15:27:01','2022-12-03 09:27:01',10,'Dr.Younus Khan ',3,2,1,1,'care',5),(16,16,510,610,3702,100,0,1,510,'2022-12-03 15:36:11','2022-12-03 09:36:11',11,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,1,'care',5),(17,17,513,710,4197,197,0,1,513,'2022-12-03 15:42:41','2022-12-03 09:42:41',12,'Md.Tanvir Ahmed Mia (Arif) ',21,2,1,1,'care',5),(18,18,0,0,527,0,0,0,0,'2022-12-03 16:15:43','2022-12-03 10:15:43',9,'Bangal Islami Life Insurence',5,2,1,2,'care',5),(19,19,0,0,1727,0,0,0,0,'2022-12-11 23:59:53','2022-12-11 17:59:53',9,'Dr.Younus Khan ',3,2,1,2,'moshiur',34),(20,20,0,0,747,100,0,0,0,'2022-12-14 02:08:01','2022-12-13 20:08:01',9,'Bangal Islami Life Insurence',5,2,1,2,'care',5),(21,21,0,0,1327,0,0,0,0,'2022-12-24 13:43:18','2022-12-24 07:43:18',10,'Dr.Younus Khan ',3,2,1,2,'care',5),(22,22,0,0,3947,0,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46',13,'Dr.Shahida Sultana Nishe ',6,2,1,2,'Akter',32),(23,23,0,0,2827,0,0,0,0,'2022-12-29 16:06:10','2023-02-20 02:33:55',14,'Dr.Younus Khan ',3,2,1,2,'moshiur',5),(24,24,-100,0,1727,113.5,0,0,0,'2023-01-29 15:58:10','2023-02-20 02:33:35',15,'self',0,3,1,2,'moshiur',5),(25,25,0,0,2047,0,0,0,0,'2023-02-04 10:50:56','2023-02-04 04:50:56',16,'Dr.Younus Khan MBBS, FCPS Medicine',3,2,1,2,'care',5),(26,26,0,0,205,0,0,0,0,'2023-02-04 10:55:45','2023-02-04 04:55:45',17,'Dr.Imran Khan ',26,2,1,2,'care',5),(27,27,390,490,3077,100,0,1,490,'2023-02-24 15:59:56','2023-02-24 22:08:35',18,'Bangal Islami Life Insurence',5,2,1,2,'care',5),(28,28,0,0,1500,0,0,0,0,'2023-02-24 16:05:40','2023-02-24 10:05:40',19,'Dr.Younus Khan MBBS, FCPS Medicine',3,2,1,2,'care',5),(29,29,0,0,2927,0,0,0,0,'2023-02-24 16:35:31','2023-02-24 23:08:53',17,'Dr.Imran Khan ',26,2,1,2,'care',5),(30,30,0,0,3527,0,0,0,0,'2023-02-24 16:36:45','2023-02-25 23:51:12',17,'Dr.Imran Khan ',26,2,1,2,'care',5),(31,31,0,0,1327,0,0,0,0,'2023-02-24 16:50:04','2023-02-24 23:08:21',17,'Dr.Imran Khan ',26,2,1,2,'care',5),(32,32,260,260,1327,0,0,0,0,'2023-02-24 17:19:47','2023-02-24 11:19:47',20,'Bangal Islami Life Insurence',5,2,1,2,'care',5);
/*!40000 ALTER TABLE `doc_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_commission_details`
--

DROP TABLE IF EXISTS `doc_commission_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_commission_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `com_id` int(11) NOT NULL DEFAULT '0',
  `patient_type` int(11) NOT NULL DEFAULT '0',
  `doc_type` int(11) NOT NULL DEFAULT '0' COMMENT '1= ref  doc 2=quack doc 3=self',
  `doc_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=opd 2=ipd 3=ot',
  `service_id` int(11) NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  `gross_amount` double NOT NULL DEFAULT '0',
  `sub_amount` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_commission_details`
--

LOCK TABLES `doc_commission_details` WRITE;
/*!40000 ALTER TABLE `doc_commission_details` DISABLE KEYS */;
INSERT INTO `doc_commission_details` VALUES (1,1,1,1,2,'Dr.Mohammad Kamal DMA',1,4,160,200,40,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(2,1,1,1,2,'Dr.Mohammad Kamal DMA',1,5,460,500,40,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(3,1,1,1,2,'Dr.Mohammad Kamal DMA',1,6,160,200,40,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(4,1,1,1,2,'Dr.Mohammad Kamal DMA',1,7,160,200,40,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(5,1,1,1,2,'Dr.Mohammad Kamal DMA',1,8,460,500,40,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(6,2,2,1,2,'Dr.Mohammad Kamal DMA',1,4,200,200,0,'2022-10-30 17:39:28','2022-10-30 11:39:28'),(7,2,2,1,2,'Dr.Mohammad Kamal DMA',1,5,500,500,0,'2022-10-30 17:39:28','2022-10-30 11:39:28'),(8,3,3,1,3,'self',1,4,-66.67,0,66.67,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(9,3,3,1,3,'self',1,5,-66.67,0,66.67,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(10,3,3,1,3,'self',1,7,-66.67,0,66.67,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(11,4,4,1,2,'Dr.Younus Khan ',1,39,0,0,0,'2022-11-28 18:15:07','2022-11-28 12:15:07'),(12,5,5,1,3,'self',1,39,200,200,0,'2022-11-28 18:20:35','2022-11-28 12:20:35'),(13,3,6,1,3,'self',1,39,0,0,0,'2022-11-28 18:23:19','2022-11-28 12:23:19'),(14,1,7,1,3,'self',1,39,200,200,0,'2022-11-28 18:26:32','2022-11-28 12:26:32'),(15,6,8,1,3,'self',1,39,0,0,0,'2022-11-28 18:44:25','2022-11-28 12:44:25'),(16,7,9,1,3,'self',1,39,0,0,0,'2022-11-28 18:46:31','2022-11-28 12:46:31'),(17,5,10,1,3,'self',1,39,200,200,0,'2022-11-28 18:49:46','2022-11-28 12:49:46'),(18,8,11,1,2,'Dr.Younus Khan ',1,4,-33.33,0,33.33,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(19,8,11,1,2,'Dr.Younus Khan ',1,5,-33.33,0,33.33,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(20,8,11,1,2,'Dr.Younus Khan ',1,6,-33.33,0,33.33,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(21,8,11,1,2,'Dr.Younus Khan ',1,16,-33.33,0,33.33,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(22,8,11,1,2,'Dr.Younus Khan ',1,196,-33.33,0,33.33,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(23,8,11,1,2,'Dr.Younus Khan ',1,23,-33.33,0,33.33,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(24,4,12,1,2,'Dr.Younus Khan ',1,4,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(25,4,12,1,2,'Dr.Younus Khan ',1,5,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(26,4,12,1,2,'Dr.Younus Khan ',1,6,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(27,4,12,1,2,'Dr.Younus Khan ',1,16,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(28,4,12,1,2,'Dr.Younus Khan ',1,196,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(29,4,12,1,2,'Dr.Younus Khan ',1,23,0,0,0,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(30,9,13,1,2,'Bangal Islami Life Insurence',1,4,0,0,0,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(31,9,13,1,2,'Bangal Islami Life Insurence',1,5,0,0,0,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(32,9,13,1,2,'Bangal Islami Life Insurence',1,6,0,0,0,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(33,9,13,1,2,'Bangal Islami Life Insurence',1,7,0,0,0,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(34,9,13,1,2,'Bangal Islami Life Insurence',1,196,0,0,0,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(35,9,13,1,2,'Bangal Islami Life Insurence',1,23,0,0,0,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(36,10,14,1,2,'Dr.Younus Khan ',1,4,-33.33,0,33.33,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(37,10,14,1,2,'Dr.Younus Khan ',1,5,-33.33,0,33.33,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(38,10,14,1,2,'Dr.Younus Khan ',1,6,-33.33,0,33.33,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(39,10,14,1,2,'Dr.Younus Khan ',1,16,-33.33,0,33.33,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(40,10,14,1,2,'Dr.Younus Khan ',1,196,-33.33,0,33.33,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(41,10,14,1,2,'Dr.Younus Khan ',1,23,-33.33,0,33.33,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(42,10,15,1,2,'Dr.Younus Khan ',1,16,-66.67,0,66.67,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(43,10,15,1,2,'Dr.Younus Khan ',1,196,-66.67,0,66.67,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(44,10,15,1,2,'Dr.Younus Khan ',1,33,-66.67,0,66.67,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(45,11,16,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,27,120,140,20,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(46,11,16,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,7,80,100,20,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(47,11,16,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,33,205,225,20,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(48,11,16,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,86,85,105,20,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(49,11,16,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,236,20,40,20,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(50,12,17,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,27,90.75,140,49.25,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(51,12,17,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,111,190.75,240,49.25,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(52,12,17,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,86,55.75,105,49.25,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(53,12,17,1,2,'Md.Tanvir Ahmed Mia (Arif) ',1,33,175.75,225,49.25,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(54,9,18,1,2,'Bangal Islami Life Insurence',1,4,0,0,0,'2022-12-03 16:15:43','2022-12-03 10:15:43'),(55,9,19,1,2,'Dr.Younus Khan ',1,308,0,0,0,'2022-12-11 23:59:53','2022-12-11 17:59:53'),(56,9,19,1,2,'Dr.Younus Khan ',1,16,0,0,0,'2022-12-11 23:59:53','2022-12-11 17:59:53'),(57,9,20,1,2,'Bangal Islami Life Insurence',1,341,-50,0,50,'2022-12-14 02:08:01','2022-12-13 20:08:01'),(58,9,20,1,2,'Bangal Islami Life Insurence',1,196,-50,0,50,'2022-12-14 02:08:01','2022-12-13 20:08:01'),(59,10,21,1,2,'Dr.Younus Khan ',1,4,0,0,0,'2022-12-24 13:43:18','2022-12-24 07:43:18'),(60,10,21,1,2,'Dr.Younus Khan ',1,5,0,0,0,'2022-12-24 13:43:18','2022-12-24 07:43:18'),(61,13,22,1,2,'Dr.Shahida Sultana Nishe ',1,27,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(62,13,22,1,2,'Dr.Shahida Sultana Nishe ',1,16,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(63,13,22,1,2,'Dr.Shahida Sultana Nishe ',1,308,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(64,13,22,1,2,'Dr.Shahida Sultana Nishe ',1,18,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(65,13,22,1,2,'Dr.Shahida Sultana Nishe ',1,19,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(66,13,22,1,2,'Dr.Shahida Sultana Nishe ',1,21,0,0,0,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(67,14,23,1,2,'Dr.Younus Khan ',1,4,0,0,0,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(68,14,23,1,2,'Dr.Younus Khan ',1,5,0,0,0,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(69,14,23,1,2,'Dr.Younus Khan ',1,33,0,0,0,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(70,15,24,1,3,'self',1,4,-37.833333333333,0,37.833333333333,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(71,15,24,1,3,'self',1,5,-37.833333333333,0,37.833333333333,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(72,15,24,1,3,'self',1,6,-37.833333333333,0,37.833333333333,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(73,16,25,1,2,'Dr.Younus Khan MBBS, FCPS Medicine',1,27,0,0,0,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(74,16,25,1,2,'Dr.Younus Khan MBBS, FCPS Medicine',1,16,0,0,0,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(75,16,25,1,2,'Dr.Younus Khan MBBS, FCPS Medicine',1,196,0,0,0,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(76,16,25,1,2,'Dr.Younus Khan MBBS, FCPS Medicine',1,7,0,0,0,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(77,17,26,1,2,'Dr.Imran Khan ',1,236,0,0,0,'2023-02-04 10:55:45','2023-02-04 04:55:45'),(79,18,27,1,2,'Bangal Islami Life Insurence',1,5,135,160,25,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(80,18,27,1,2,'Bangal Islami Life Insurence',1,33,200,225,25,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(81,18,27,1,2,'Bangal Islami Life Insurence',1,86,80,105,25,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(82,19,28,1,2,'Dr.Younus Khan MBBS, FCPS Medicine',1,33,0,0,0,'2023-02-24 16:05:40','2023-02-24 10:05:40'),(83,17,29,1,2,'Dr.Imran Khan ',1,4,0,0,0,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(84,17,29,1,2,'Dr.Imran Khan ',1,5,0,0,0,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(85,17,29,1,2,'Dr.Imran Khan ',1,16,0,0,0,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(86,17,29,1,2,'Dr.Imran Khan ',1,111,0,0,0,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(87,17,30,1,2,'Dr.Imran Khan ',1,4,0,0,0,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(88,17,30,1,2,'Dr.Imran Khan ',1,5,0,0,0,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(90,17,30,1,2,'Dr.Imran Khan ',1,23,0,0,0,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(91,17,30,1,2,'Dr.Imran Khan ',1,24,0,0,0,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(92,17,30,1,2,'Dr.Imran Khan ',1,111,0,0,0,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(93,17,31,1,2,'Dr.Imran Khan ',1,4,0,0,0,'2023-02-24 16:50:04','2023-02-24 10:50:04'),(94,17,31,1,2,'Dr.Imran Khan ',1,5,0,0,0,'2023-02-24 16:50:04','2023-02-24 10:50:04'),(95,20,32,1,2,'Bangal Islami Life Insurence',1,4,100,100,0,'2023-02-24 17:19:47','2023-02-24 11:19:47'),(96,20,32,1,2,'Bangal Islami Life Insurence',1,5,160,160,0,'2023-02-24 17:19:47','2023-02-24 11:19:47');
/*!40000 ALTER TABLE `doc_commission_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_commission_details_history`
--

DROP TABLE IF EXISTS `doc_commission_details_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_commission_details_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `com_id` int(11) NOT NULL DEFAULT '0',
  `patient_type` int(11) NOT NULL DEFAULT '0',
  `doc_type` int(11) NOT NULL DEFAULT '0' COMMENT '1= quack doc 2= ref doc 3=self',
  `doc_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=opd 2=ipd 3=ot',
  `service_id` int(11) NOT NULL DEFAULT '0',
  `amount` double NOT NULL,
  `reason` int(11) NOT NULL DEFAULT '0' COMMENT '1=edit 2=delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_commission_details_history`
--

LOCK TABLES `doc_commission_details_history` WRITE;
/*!40000 ALTER TABLE `doc_commission_details_history` DISABLE KEYS */;
INSERT INTO `doc_commission_details_history` VALUES (1,1,1,1,2,'Dr.Mohammad Kamal DMA',1,4,160,0,'2022-10-30 17:02:21','2022-11-28 07:39:06'),(2,1,1,1,2,'Dr.Mohammad Kamal DMA',1,5,460,0,'2022-10-30 17:02:21','2022-11-28 07:39:06'),(3,1,1,1,2,'Dr.Mohammad Kamal DMA',1,6,160,0,'2022-10-30 17:02:21','2022-11-28 07:39:06'),(4,1,1,1,2,'Dr.Mohammad Kamal DMA',1,7,160,0,'2022-10-30 17:02:21','2022-11-28 07:39:06'),(5,1,1,1,2,'Dr.Mohammad Kamal DMA',1,8,460,0,'2022-10-30 17:02:21','2022-11-28 07:39:06'),(6,2,2,1,2,'Dr.Mohammad Kamal DMA',1,4,200,0,'2022-10-30 17:39:28','2022-11-29 16:41:24'),(7,2,2,1,2,'Dr.Mohammad Kamal DMA',1,5,500,0,'2022-10-30 17:39:28','2022-11-29 16:41:24'),(8,3,6,1,3,'self',1,39,0,0,'2022-11-28 18:23:19','2022-11-29 16:42:35'),(9,1,7,1,3,'self',1,39,200,0,'2022-11-28 18:26:32','2022-11-29 16:42:42'),(10,7,9,1,3,'self',1,39,0,0,'2022-11-28 18:46:31','2022-11-29 17:21:28'),(11,9,13,1,2,'Bangal Islami Life Insurence',1,4,0,0,'2022-11-29 23:33:48','2022-12-03 10:19:28'),(12,9,13,1,2,'Bangal Islami Life Insurence',1,5,0,0,'2022-11-29 23:33:48','2022-12-03 10:19:28'),(13,9,13,1,2,'Bangal Islami Life Insurence',1,6,0,0,'2022-11-29 23:33:48','2022-12-03 10:19:28'),(14,9,13,1,2,'Bangal Islami Life Insurence',1,7,0,0,'2022-11-29 23:33:48','2022-12-03 10:19:28'),(15,9,13,1,2,'Bangal Islami Life Insurence',1,196,0,0,'2022-11-29 23:33:48','2022-12-03 10:19:28'),(16,9,13,1,2,'Bangal Islami Life Insurence',1,23,0,0,'2022-11-29 23:33:48','2022-12-03 10:19:28'),(17,15,24,1,3,'self',1,4,-4.5,0,'2023-01-29 15:58:10','2023-02-19 14:33:17'),(18,15,24,1,3,'self',1,5,-4.5,0,'2023-01-29 15:58:10','2023-02-19 14:33:17'),(19,15,24,1,3,'self',1,6,-4.5,0,'2023-01-29 15:58:10','2023-02-19 14:33:17'),(20,15,24,1,3,'self',1,4,-4.5,0,'2023-01-29 15:58:10','2023-02-19 14:33:35'),(21,15,24,1,3,'self',1,5,-4.5,0,'2023-01-29 15:58:10','2023-02-19 14:33:35'),(22,15,24,1,3,'self',1,6,-4.5,0,'2023-01-29 15:58:10','2023-02-19 14:33:35'),(23,14,23,1,2,'Dr.Younus Khan ',1,4,0,0,'2022-12-29 16:06:10','2023-02-19 14:33:55'),(24,14,23,1,2,'Dr.Younus Khan ',1,5,0,0,'2022-12-29 16:06:10','2023-02-19 14:33:55'),(25,14,23,1,2,'Dr.Younus Khan ',1,33,0,0,'2022-12-29 16:06:10','2023-02-19 14:33:55'),(26,4,4,1,2,'Dr.Younus Khan ',1,39,0,0,'2022-11-28 18:15:07','2023-02-19 14:34:42'),(27,4,4,1,2,'Dr.Younus Khan ',1,39,0,0,'2022-11-28 18:15:07','2023-02-19 14:34:57'),(28,9,13,1,2,'Bangal Islami Life Insurence',1,4,0,0,'2022-11-29 23:33:48','2023-02-19 14:40:36'),(29,9,13,1,2,'Bangal Islami Life Insurence',1,5,0,0,'2022-11-29 23:33:48','2023-02-19 14:40:36'),(30,9,13,1,2,'Bangal Islami Life Insurence',1,6,0,0,'2022-11-29 23:33:48','2023-02-19 14:40:36'),(31,9,13,1,2,'Bangal Islami Life Insurence',1,7,0,0,'2022-11-29 23:33:48','2023-02-19 14:40:36'),(32,9,13,1,2,'Bangal Islami Life Insurence',1,196,0,0,'2022-11-29 23:33:48','2023-02-19 14:40:36'),(33,9,13,1,2,'Bangal Islami Life Insurence',1,23,0,0,'2022-11-29 23:33:48','2023-02-19 14:40:36'),(34,18,27,1,2,'Bangal Islami Life Insurence',1,4,75,1,'2023-02-24 15:59:56','2023-02-24 10:08:35'),(35,18,27,1,2,'Bangal Islami Life Insurence',1,5,135,1,'2023-02-24 15:59:56','2023-02-24 10:08:35'),(36,18,27,1,2,'Bangal Islami Life Insurence',1,33,200,1,'2023-02-24 15:59:56','2023-02-24 10:08:35'),(37,18,27,1,2,'Bangal Islami Life Insurence',1,86,80,1,'2023-02-24 15:59:56','2023-02-24 10:08:35'),(38,17,31,1,2,'Dr.Imran Khan ',1,4,0,0,'2023-02-24 16:50:04','2023-02-24 11:08:21'),(39,17,31,1,2,'Dr.Imran Khan ',1,5,0,0,'2023-02-24 16:50:04','2023-02-24 11:08:21'),(40,17,30,1,2,'Dr.Imran Khan ',1,4,0,0,'2023-02-24 16:36:45','2023-02-24 11:08:39'),(41,17,30,1,2,'Dr.Imran Khan ',1,5,0,0,'2023-02-24 16:36:45','2023-02-24 11:08:39'),(42,17,30,1,2,'Dr.Imran Khan ',1,16,0,0,'2023-02-24 16:36:45','2023-02-24 11:08:39'),(43,17,30,1,2,'Dr.Imran Khan ',1,23,0,0,'2023-02-24 16:36:45','2023-02-24 11:08:39'),(44,17,30,1,2,'Dr.Imran Khan ',1,24,0,0,'2023-02-24 16:36:45','2023-02-24 11:08:39'),(45,17,30,1,2,'Dr.Imran Khan ',1,111,0,0,'2023-02-24 16:36:45','2023-02-24 11:08:39'),(46,17,29,1,2,'Dr.Imran Khan ',1,4,0,0,'2023-02-24 16:35:31','2023-02-24 11:08:53'),(47,17,29,1,2,'Dr.Imran Khan ',1,5,0,0,'2023-02-24 16:35:31','2023-02-24 11:08:53'),(48,17,29,1,2,'Dr.Imran Khan ',1,16,0,0,'2023-02-24 16:35:31','2023-02-24 11:08:53'),(49,17,29,1,2,'Dr.Imran Khan ',1,111,0,0,'2023-02-24 16:35:31','2023-02-24 11:08:53'),(50,17,30,1,2,'Dr.Imran Khan ',1,4,0,1,'2023-02-24 16:36:45','2023-02-25 11:51:12'),(51,17,30,1,2,'Dr.Imran Khan ',1,5,0,1,'2023-02-24 16:36:45','2023-02-25 11:51:12'),(52,17,30,1,2,'Dr.Imran Khan ',1,16,0,1,'2023-02-24 16:36:45','2023-02-25 11:51:12'),(53,17,30,1,2,'Dr.Imran Khan ',1,23,0,1,'2023-02-24 16:36:45','2023-02-25 11:51:12'),(54,17,30,1,2,'Dr.Imran Khan ',1,24,0,1,'2023-02-24 16:36:45','2023-02-25 11:51:12'),(55,17,30,1,2,'Dr.Imran Khan ',1,111,0,1,'2023-02-24 16:36:45','2023-02-25 11:51:12');
/*!40000 ALTER TABLE `doc_commission_details_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_commission_history`
--

DROP TABLE IF EXISTS `doc_commission_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_commission_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uhid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `total_commission` double NOT NULL DEFAULT '0',
  `total_test_amount` double NOT NULL DEFAULT '0',
  `total_test_discount` double NOT NULL DEFAULT '0',
  `total_vat` double NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `paid_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `paid_amount` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_id` int(150) DEFAULT NULL,
  `doc_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `doc_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=ref 2=quack',
  `reason` int(11) NOT NULL DEFAULT '0' COMMENT '1=edit 2= delete',
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_commission_history`
--

LOCK TABLES `doc_commission_history` WRITE;
/*!40000 ALTER TABLE `doc_commission_history` DISABLE KEYS */;
INSERT INTO `doc_commission_history` VALUES (1,0,1,1400,3227,200,0,'unpaid','0',0,'2022-10-30 17:02:21','2022-11-28 07:39:06',1,'Dr.Mohammad Kamal DMA',2,2,0,'care',0),(2,0,2,700,1427,0,0,'unpaid','0',0,'2022-10-30 17:39:28','2022-11-29 16:41:24',2,'Dr.Mohammad Kamal DMA',2,2,0,'care',0),(3,0,6,0,1500,0,0,'unpaid','0',0,'2022-11-28 18:23:19','2022-11-29 16:42:35',3,'self',0,3,0,'care',0),(4,0,7,200,1500,0,0,'unpaid','0',0,'2022-11-28 18:26:32','2022-11-29 16:42:42',1,'self',0,3,0,'care',0),(5,0,9,0,1500,0,0,'unpaid','0',0,'2022-11-28 18:46:31','2022-11-29 17:21:28',7,'self',0,3,0,'care',0),(6,0,13,0,3127,0,0,'unpaid','0',0,'2022-11-29 23:33:48','2022-12-03 10:19:28',9,'Bangal Islami Life Insurence',5,2,0,'care',0),(7,0,24,0,1727,13.5,0,'unpaid','0',0,'2023-01-29 15:58:10','2023-02-19 14:33:17',15,'self',0,3,0,'care',0),(8,0,24,0,1727,13.5,0,'unpaid','0',0,'2023-01-29 15:58:10','2023-02-19 14:33:35',15,'self',0,3,0,'moshiur',0),(9,0,23,0,2827,0,0,'unpaid','0',0,'2022-12-29 16:06:10','2023-02-19 14:33:55',14,'Dr.Younus Khan ',3,2,0,'care',0),(10,0,4,0,1500,0,0,'unpaid','0',0,'2022-11-28 18:15:07','2023-02-19 14:34:42',4,'Dr.Younus Khan ',3,2,0,'care',0),(11,0,4,0,1500,0,0,'unpaid','0',0,'2022-11-28 18:15:07','2023-02-19 14:34:57',4,'Dr.Younus Khan ',3,2,0,'moshiur',0),(12,0,13,0,3127,0,0,'unpaid','0',0,'2022-11-29 23:33:48','2023-02-19 14:40:36',9,'Bangal Islami Life Insurence',5,2,0,'care',0),(13,0,27,490,3577,100,0,'unpaid','0',490,'2023-02-24 15:59:56','2023-02-24 10:08:35',18,'Bangal Islami Life Insurence',5,2,1,'care',0),(14,0,31,0,1327,0,0,'unpaid','0',0,'2023-02-24 16:50:04','2023-02-24 11:08:21',17,'Dr.Imran Khan ',26,2,0,'care',0),(15,0,30,0,3927,0,0,'unpaid','0',0,'2023-02-24 16:36:45','2023-02-24 11:08:39',17,'Dr.Imran Khan ',26,2,0,'care',0),(16,0,29,0,2927,0,0,'unpaid','0',0,'2023-02-24 16:35:31','2023-02-24 11:08:53',17,'Dr.Imran Khan ',26,2,0,'care',0),(17,0,30,0,3927,0,0,'unpaid','0',0,'2023-02-24 16:36:45','2023-02-25 11:51:12',17,'Dr.Imran Khan ',26,2,1,'care',0);
/*!40000 ALTER TABLE `doc_commission_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `doctor_id` int(150) NOT NULL AUTO_INCREMENT,
  `doctor_title` varchar(250) DEFAULT NULL,
  `doctor_education` varchar(250) DEFAULT NULL,
  `doctor_degree` text,
  `doc_cat_id` int(11) NOT NULL DEFAULT '0',
  `doc_cat` varchar(255) DEFAULT NULL,
  `gen_id` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `profile_img` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `doctor_type` int(150) DEFAULT NULL COMMENT '1= MBBS,2=Quack,3=BDS',
  `consult_fee` double(10,2) DEFAULT NULL COMMENT 'this fee for chamber charge',
  `emergency_fee` double(10,2) DEFAULT NULL COMMENT 'this fee for emergency call for patient at any tym',
  `icu_duty_fee` double(10,2) DEFAULT NULL COMMENT 'fee for icu duty',
  `board_duty_fee` double(10,2) DEFAULT NULL COMMENT 'fee for board meeting duty fee',
  `hospital_id` int(150) DEFAULT NULL,
  `doc_mobile_no` varchar(250) DEFAULT NULL,
  `marketing_officer_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 2 =delete',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr.Mesbah Uddin Ahmed MBBS,MS',NULL,'',1,'Medicine','D-1','','Mizan_jpeg_3_jpeg_1.jpeg',NULL,1,NULL,NULL,NULL,NULL,NULL,'',1,2,'care',5),(2,'Dr.Younus Khan (MBBS, FCPS Medicine)',NULL,'',1,'Medicine','D-2','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,2,'care',5),(3,'Dr.Younus Khan MBBS, FCPS Medicine',NULL,'',1,'Medicine','D-3','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(4,'Dr.Md.Golam Kawsar(Himel)',NULL,'MBBS,BCS,FCPS (FP),MD Nefrology(thisis),CCD(Birdem',1,'Medicine','D-4','sdfsdfsdf',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'34324',3,1,'care',5),(5,'Bangal Islami Life Insurence',NULL,'',2,'Q/C Dr','D-5','',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'',1,1,'care',5),(6,'Dr.Shahida Sultana Nishe ',NULL,'MBBS,DMU(USG',4,'Gynecologist','D-6','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(7,'Dr.Tabenda Akter',NULL,' MBBS,BCS(H),FCPS (G),MCPS(G) ',4,'Gynecologist','D-7','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(8,'Dr.Abdul Aziz Mia',NULL,'MBBS,DEH,FCPS(Child) ',5,'Chaild','D-8','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(9,'Dr.M.A Zaman ',NULL,'MBBS,BCS(Health)FCPS(ENT)ASST.PROF ',3,'ENT Consultant','D-9','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(10,'Dr. MD. Monirul Islam,',NULL,'MBBS,FCPS,(Surgery)BCS(Health)',6,'Surgery','D-10','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(11,'Dr.Fatema Begum ',NULL,'MBBS,DGO,MCPS(Gyanae-Obs',4,'Gynecologist','D-11','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(12,'Dr.A.K.M Mahbubul Alam',NULL,'MBBS,FCPS(Child)',5,'Chaild','D-12','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(13,'Dr.Sujit Kumar Das',NULL,'MBBS,MD(Child',5,'Chaild','D-13','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(14,'Dr. Sharmin siddiqui ',NULL,'MBBS,CMU (Ultrasonologey) DGO ',4,'Gynecologist','D-14','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(15,'Dr.Samsun Nahar Tania ',NULL,'MBBS,MCPS(DGO),GYNAE & OBS ',4,'Gynecologist','D-15','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(16,'Dr.Md.Ahsanullah ',NULL,'MBBS,MCPS,DLO(ENT',3,'ENT Consultant','D-16','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(17,'Prof.Dr.Md.A.K.M Shahadat Hossain, ',NULL,'MBBS,FCPS(Surgery),MS(Urology)',6,'Surgery','D-17','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(18,'Dr.Md.Mizanur Rahman Khan',NULL,'MBBS,BCS,Dip.in Asthma(UK)',1,'Medicine','D-18','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(19,'Dr.Latifa Nasrin ',NULL,'MBBS(CU) .PGT(Gynae),CMU(IMMT)EOC(Gynae&Obs)',4,'Gynecologist','D-19','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(20,'Dr.Md.Hasanur Rahman ',NULL,'MBBS,BCS(H),FCPS (Surgery),MS.',6,'Surgery','D-20','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(21,'Md.Tanvir Ahmed Mia (Arif) ',NULL,'D.P.T(B.M.C.H)B.P.T(S.I.M.T)',2,'Q/C Dr','D-21','',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(22,'Dr.Md.Towhidul Islam Khan ',NULL,'MBBS(Dhaka),BCS(Health),FCPS -ENT ',3,'ENT Consultant','D-22','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(23,'Dr.Rowshaba Nasrin (Rumu) ',NULL,'MBBS(Dhaka), PGT,EOC(CMCH',4,'Gynecologist','D-23','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(24,'Dr.A.H.M Ferdous Nur ',NULL,'MBBS,BCS(Health)FCPS',3,'ENT Consultant','D-24','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(25,'Dr. Oliur Rahman Mojumder ',NULL,'MBBS, BCS (Health), DCH, FRHS (Chaild',5,'Chaild','D-25','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(26,'Dr.Imran Khan ',NULL,'M.B.B.S(SOMC),BCS(H)CMU(Ultra',1,'Medicine','D-26','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(27,'Dr. Mahbubub Ali Khan ',NULL,'M.B.B.S, B.C.S, (Helth)Chaild ',5,'Chaild','D-27','',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'',3,1,'care',5),(28,'test',NULL,'test',1,'Medicine','D-28','test','alfa_php_28.php',NULL,1,NULL,NULL,NULL,NULL,NULL,'123456',1,1,'moshiur',34),(29,'test333',NULL,'test333',2,'Q/C Dr','D-29','sdfsdfsdf',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'123456',1,1,'moshiur',34);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_schedule`
--

DROP TABLE IF EXISTS `doctor_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `room_id` int(11) NOT NULL DEFAULT '0',
  `schedule_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc_fee_new` double NOT NULL DEFAULT '0',
  `doc_fee_old` double NOT NULL DEFAULT '0',
  `doc_fee_report` double NOT NULL DEFAULT '0',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `schedule_status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2= inactive',
  `cancellation_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_per_patient` int(11) NOT NULL DEFAULT '0',
  `operated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_schedule`
--

LOCK TABLES `doctor_schedule` WRITE;
/*!40000 ALTER TABLE `doctor_schedule` DISABLE KEYS */;
INSERT INTO `doctor_schedule` VALUES (1,1,1,'Sunday',700,500,400,'10:00:00','18:00:00',2,NULL,0,'care','2022-11-05 21:59:17','2022-11-05 15:59:17'),(2,1,1,'Saturday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(3,1,1,'Sunday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(4,1,1,'Monday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(5,1,1,'Tuesday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(6,1,1,'Wednesday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(7,1,1,'Thursday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(8,1,1,'Friday',1000,700,500,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-15 22:30:35','2022-11-15 16:30:35'),(9,3,1,'Saturday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(10,3,1,'Sunday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(11,3,1,'Monday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(12,3,1,'Tuesday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(13,3,1,'Wednesday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(14,3,1,'Thursday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(15,3,1,'Friday',500,400,300,'10:00:00','18:00:00',1,NULL,0,'care','2022-11-28 13:18:36','2022-11-28 07:18:36'),(16,12,1,'Saturday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08'),(17,12,1,'Sunday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08'),(18,12,1,'Monday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08'),(19,12,1,'Tuesday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08'),(20,12,1,'Wednesday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08'),(21,12,1,'Thursday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08'),(22,12,1,'Friday',800,500,300,'10:04:00','18:00:00',1,NULL,0,'care','2023-01-07 20:45:08','2023-01-07 14:45:08');
/*!40000 ALTER TABLE `doctor_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dose_schedule`
--

DROP TABLE IF EXISTS `dose_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dose_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dose_schedule`
--

LOCK TABLES `dose_schedule` WRITE;
/*!40000 ALTER TABLE `dose_schedule` DISABLE KEYS */;
INSERT INTO `dose_schedule` VALUES (1,'Morning',1),(2,'Noon',1),(3,'Evening',1),(4,'Night',1);
/*!40000 ALTER TABLE `dose_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_collection`
--

DROP TABLE IF EXISTS `due_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `patient_id` int(255) DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `discount` double(10,2) DEFAULT '0.00',
  `vat` double DEFAULT '0',
  `current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `paid_due` double(10,2) DEFAULT '0.00',
  `advance_payment` double NOT NULL DEFAULT '0',
  `admission_fee` double NOT NULL DEFAULT '0',
  `admission_fee_paid` double NOT NULL DEFAULT '0',
  `admission_fee_discount` double NOT NULL DEFAULT '0',
  `discount_ref` varchar(250) DEFAULT NULL,
  `due_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=opd, 2=ipd 3=ipd outdoor service',
  `old_due` double(10,2) DEFAULT '0.00',
  `status` int(11) DEFAULT '1' COMMENT '1=active 2=delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `is_due_collection` int(11) NOT NULL DEFAULT '0' COMMENT '0 = no 1= yes',
  `is_released` int(11) NOT NULL DEFAULT '0' COMMENT '0=no 1= yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_collection`
--

LOCK TABLES `due_collection` WRITE;
/*!40000 ALTER TABLE `due_collection` DISABLE KEYS */;
INSERT INTO `due_collection` VALUES (1,'000001_301022_1',1,3227,200.00,0,527.00,2500.00,0,0,0,0,'MDS',1,3227.00,1,'2022-10-30 17:02:21','2022-10-30 11:02:21','care',5,0,0),(2,'000002_301022_2',2,1427,0.00,0,1427.00,0.00,0,0,0,0,'',1,1427.00,1,'2022-10-30 17:39:28','2022-10-30 11:39:28','care',5,0,0),(3,'ipd-p-000001',1,300,0.00,0,0.00,2300.00,2000,300,300,0,NULL,2,300.00,1,'2022-11-01 13:35:23','2022-11-01 07:35:23','care',5,0,0),(4,'ipd-p-000002',2,300,0.00,0,0.00,2300.00,2000,300,300,0,NULL,2,300.00,1,'2022-11-06 00:36:01','2022-11-05 18:36:01','care',5,0,0),(5,'ipd-p-000002',2,14100,0.00,0,11800.00,0.00,0,300,0,0,NULL,2,14100.00,1,'2022-11-06 00:37:05','2022-11-05 18:37:05','care',5,0,1),(6,'ipd-p-000002',2,14100,800.00,0,1000.00,10000.00,0,300,0,0,'Din Md',2,11800.00,1,'2022-11-06 00:37:22','2022-11-05 18:37:22','care',5,0,0),(7,'ipd-p-000001',1,39650,0.00,0,37350.00,0.00,0,300,0,0,NULL,2,39650.00,1,'2022-11-15 23:01:12','2022-11-15 17:01:12','care',5,0,1),(8,'ipd-p-000002',2,14100,0.00,0,0.00,1000.00,0,300,0,0,'',2,1000.00,1,'2022-11-15 23:01:32','2022-11-15 17:01:32','care',5,1,0),(9,'ipd-p-000001',1,39650,7350.00,0,5000.00,25000.00,0,300,0,0,'Din Md',2,37350.00,1,'2022-11-15 23:02:07','2022-11-15 17:02:07','care',5,0,0),(10,'ipd-p-000003',3,500,0.00,0,0.00,4500.00,4000,500,500,0,NULL,2,500.00,1,'2022-11-28 12:58:00','2022-11-28 06:58:00','care',5,0,0),(11,'ipd-p-000004',4,500,0.00,0,0.00,4500.00,4000,500,500,0,NULL,2,500.00,1,'2022-11-28 13:09:22','2022-11-28 07:09:22','care',5,0,0),(12,'000003_281122_3',3,1927,200.00,0,0.00,1727.00,0,0,0,0,'Dr,Kamal',1,1927.00,1,'2022-11-28 13:25:15','2022-11-28 07:25:15','care',5,0,0),(13,'000001_301022_1',1,3227,0.00,0,0.00,527.00,0,0,0,0,'',1,527.00,1,'2022-11-28 13:39:06','2022-11-28 07:39:06','care',5,1,0),(14,'000004_281122_4',4,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:15:07','2022-11-28 12:15:07','care',5,0,0),(15,'000005_281122_5',5,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:20:35','2022-11-28 12:20:35','care',5,0,0),(16,'000006_281122_3',3,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:23:19','2022-11-28 12:23:19','care',5,0,0),(17,'000007_281122_1',1,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:26:32','2022-11-28 12:26:32','care',5,0,0),(18,'000008_281122_6',6,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:44:25','2022-11-28 12:44:25','care',5,0,0),(19,'000009_281122_7',7,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:46:31','2022-11-28 12:46:31','care',5,0,0),(20,'000010_281122_5',5,1500,0.00,0,1500.00,0.00,0,0,0,0,'',1,1500.00,1,'2022-11-28 18:49:46','2022-11-28 12:49:46','care',5,0,0),(21,'000002_301022_2',2,1427,0.00,0,0.00,0.00,0,0,0,0,'',1,1427.00,1,'2022-11-29 22:41:24','2022-11-29 16:41:24','care',5,1,0),(22,'000006_281122_3',3,1500,0.00,0,-1500.00,1500.00,0,0,0,0,'',1,1500.00,1,'2022-11-29 22:42:35','2022-11-29 16:42:35','care',5,1,0),(23,'000007_281122_1',1,1500,0.00,0,-1500.00,1500.00,0,0,0,0,'',1,1500.00,1,'2022-11-29 22:42:42','2022-11-29 16:42:42','care',5,1,0),(24,'ipd-p-000004',4,14950,0.00,0,10450.00,0.00,0,500,0,0,NULL,2,14950.00,1,'2022-11-29 22:43:46','2022-11-29 16:43:46','care',5,0,1),(25,'ipd-p-000004',4,14950,450.00,0,0.00,10000.00,0,500,0,0,'Md.Sir',2,10450.00,1,'2022-11-29 22:44:13','2022-11-29 16:44:13','care',5,0,0),(26,'000009_281122_7',7,1500,0.00,0,0.00,1500.00,0,0,0,0,'',1,1500.00,1,'2022-11-29 23:21:28','2022-11-29 17:21:28','care',5,1,0),(27,'000011_291122_8',8,3127,200.00,0,0.00,2927.00,0,0,0,0,'Dr,Kamal',1,3127.00,1,'2022-11-29 23:29:17','2022-11-29 17:29:17','care',5,0,0),(28,'000012_291122_4',4,3127,0.00,0,3127.00,0.00,0,0,0,0,'',1,3127.00,1,'2022-11-29 23:32:27','2022-11-29 17:32:27','care',5,0,0),(29,'000013_291122_9',9,3127,0.00,0,3127.00,0.00,0,0,0,0,'',1,3127.00,1,'2022-11-29 23:33:48','2022-11-29 17:33:48','care',5,0,0),(30,'000014_021222_10',10,3127,200.00,0,0.00,2927.00,0,0,0,0,'Dr,Kamal',1,3127.00,1,'2022-12-02 22:53:31','2022-12-02 16:53:31','care',5,0,0),(31,'000015_031222_10',10,2327,200.00,0,0.00,2127.00,0,0,0,0,'Md Sir',1,2327.00,1,'2022-12-03 15:27:01','2022-12-03 09:27:01','care',5,0,0),(32,'000016_031222_11',11,3702,100.00,0,0.00,3602.00,0,0,0,0,'Tanver',1,3702.00,1,'2022-12-03 15:36:11','2022-12-03 09:36:11','care',5,0,0),(33,'000017_031222_12',12,4197,197.00,0,0.00,4000.00,0,0,0,0,'Md Sir',1,4197.00,1,'2022-12-03 15:42:41','2022-12-03 09:42:41','care',5,0,0),(34,'ipd-p-000005',5,500,0.00,0,-400.00,900.00,400,500,500,0,NULL,2,500.00,1,'2022-12-03 16:10:35','2022-12-03 10:10:35','care',5,0,0),(35,'ipd-p-000005',5,13600,0.00,0,12700.00,0.00,0,500,0,0,NULL,2,13600.00,1,'2022-12-03 16:12:58','2022-12-03 10:12:58','care',5,0,0),(36,'ipd-p-000005',5,13600,700.00,0,2700.00,10000.00,0,500,0,0,'Md Sir',2,12700.00,1,'2022-12-03 16:13:43','2022-12-03 10:13:43','care',5,0,0),(37,'ipd-p-000005',5,13600,0.00,0,0.00,2000.00,0,500,0,0,'',2,2000.00,1,'2022-12-03 16:14:22','2022-12-03 10:14:22','care',5,0,0),(38,'000018_031222_9',9,527,0.00,0,527.00,0.00,0,0,0,0,'',1,527.00,1,'2022-12-03 16:15:43','2022-12-03 10:15:43','care',5,0,0),(39,'000013_291122_9',9,3127,0.00,0,0.00,3127.00,0,0,0,0,'',1,3127.00,1,'2022-12-03 16:19:28','2022-12-03 10:19:28','care',5,1,0),(40,'000019_111222_9',9,1727,0.00,0,1727.00,0.00,0,0,0,0,'',1,1727.00,1,'2022-12-11 23:59:53','2022-12-11 17:59:53','moshiur',34,0,0),(41,'000020_141222_9',9,747,200.00,0,0.00,547.00,0,0,0,0,'Sheto',1,747.00,1,'2022-12-14 02:08:01','2022-12-13 20:08:01','care',5,0,0),(42,'000021_241222_10',10,1327,0.00,0,1327.00,0.00,0,0,0,0,'',1,1327.00,1,'2022-12-24 13:43:18','2022-12-24 07:43:18','care',5,0,0),(43,'ipd-p-000006',5,300,0.00,0,-3000.00,3300.00,3000,300,300,0,NULL,2,300.00,1,'2022-12-24 13:44:50','2022-12-24 07:44:50','care',5,0,0),(44,'ipd-p-000003',3,65700,0.00,0,61200.00,0.00,0,500,0,0,NULL,2,65700.00,1,'2022-12-24 13:46:21','2022-12-24 07:46:21','care',5,0,0),(45,'ipd-p-000003',3,65700,10000.00,0,10000.00,51200.00,0,500,0,0,'Dr.Sumon',2,61200.00,1,'2022-12-24 13:47:14','2022-12-24 07:47:14','care',5,1,0),(46,'000022_281222_13',13,3947,0.00,0,3947.00,0.00,0,0,0,0,'',1,3947.00,1,'2022-12-28 16:28:46','2022-12-28 10:28:46','Akter',32,0,0),(47,'ipd-p-000006',6,500,0.00,0,-2000.00,2500.00,2000,500,500,0,NULL,2,500.00,1,'2022-12-29 16:04:47','2022-12-29 10:04:47','care',5,0,0),(48,'000023_291222_14',14,2827,0.00,0,2827.00,0.00,0,0,0,0,'',1,2827.00,1,'2022-12-29 16:06:10','2022-12-29 10:06:10','care',5,0,0),(49,'ipd-p-000007',7,500,0.00,0,-5000.00,5500.00,5000,500,500,0,NULL,2,500.00,1,'2023-01-03 21:27:01','2023-01-03 15:27:01','care',5,0,0),(50,'ipd-p-000006',6,21917,0.00,0,19417.00,0.00,0,500,0,0,NULL,2,21917.00,1,'2023-01-03 21:33:10','2023-01-03 15:33:10','care',5,0,0),(51,'ipd-p-000008',8,500,0.00,0,-5000.00,5500.00,5000,500,500,0,NULL,2,500.00,1,'2023-01-08 18:34:29','2023-01-08 12:34:29','care',5,0,0),(52,'ipd-p-000008',8,15650,0.00,0,10150.00,0.00,0,500,0,0,NULL,2,15650.00,1,'2023-01-11 16:08:35','2023-01-11 10:08:35','care',5,0,0),(53,'ipd-p-000008',8,15650,150.00,0,150.00,10000.00,0,500,0,0,'Md Sir',2,10150.00,1,'2023-01-11 16:09:36','2023-01-11 10:09:36','care',5,1,0),(54,'ipd-p-000007',7,49600,0.00,0,44100.00,0.00,0,500,0,0,NULL,2,49600.00,1,'2023-01-23 22:16:59','2023-01-23 16:16:59','care',5,0,0),(55,'ipd-p-000009',9,500,0.00,0,0.00,500.00,0,500,500,0,NULL,2,500.00,1,'2023-01-23 22:37:29','2023-01-23 16:37:29','care',5,0,0),(56,'ipd-p-000009',9,9600,0.00,0,9100.00,0.00,0,500,0,0,NULL,2,9600.00,1,'2023-01-23 22:38:13','2023-01-23 16:38:13','care',5,0,0),(57,'ipd-p-000010',10,200,0.00,0,-2000.00,2200.00,2000,200,200,0,NULL,2,200.00,1,'2023-01-26 19:41:18','2023-01-26 13:41:18','care',5,0,0),(58,'000024_290123_15',15,1727,27.00,0,700.00,1000.00,0,0,0,0,'DR',1,1727.00,1,'2023-01-29 15:58:10','2023-01-29 09:58:10','care',5,0,0),(59,'000025_040223_16',16,2047,0.00,0,0.00,2047.00,0,0,0,0,'',1,2047.00,1,'2023-02-04 10:50:56','2023-02-04 04:50:56','care',5,0,0),(60,'000026_040223_17',17,205,0.00,0,0.00,205.00,0,0,0,0,'',1,205.00,1,'2023-02-04 10:55:45','2023-02-04 04:55:45','care',5,0,0),(61,'000024_290123_15',15,1727,0.00,0,0.00,0.00,0,0,0,0,'',1,700.00,1,'2023-02-19 20:33:17','2023-02-19 14:33:17','moshiur',34,1,0),(62,'000024_290123_15',15,1727,100.00,0,0.00,600.00,0,0,0,0,'',1,700.00,1,'2023-02-19 20:33:35','2023-02-19 14:33:35','moshiur',34,1,0),(63,'000023_291222_14',14,2827,0.00,0,-2827.00,2827.00,0,0,0,0,'',1,2827.00,1,'2023-02-19 20:33:55','2023-02-19 14:33:55','moshiur',34,1,0),(64,'000004_281122_4',4,1500,0.00,0,0.00,0.00,0,0,0,0,'',1,3127.00,1,'2023-02-19 20:34:42','2023-02-19 14:34:42','moshiur',34,1,0),(65,'000004_281122_4',4,1500,0.00,0,-3127.00,3127.00,0,0,0,0,'',1,3127.00,1,'2023-02-19 20:34:57','2023-02-19 14:34:57','moshiur',34,1,0),(66,'000013_291122_9',9,3127,0.00,0,0.00,0.00,0,0,0,0,'',1,1727.00,1,'2023-02-19 20:40:36','2023-02-19 14:40:36','moshiur',34,1,0),(68,'000028_240223_19',19,1500,0.00,0,0.00,1500.00,0,0,0,0,'',1,1500.00,1,'2023-02-24 16:05:40','2023-02-24 10:05:40','care',5,0,0),(69,'000027_240223_18',18,3077,200.00,0,0.00,2877.00,0,0,0,0,NULL,1,3077.00,1,'2023-02-24 15:59:56','2023-02-24 10:08:35','care',5,0,0),(70,'000029_240223_17',17,2927,0.00,0,2927.00,0.00,0,0,0,0,'',1,2927.00,1,'2023-02-24 16:35:31','2023-02-24 10:35:31','care',5,0,0),(72,'000031_240223_17',17,1327,0.00,0,1327.00,0.00,0,0,0,0,'',1,1327.00,1,'2023-02-24 16:50:04','2023-02-24 10:50:04','care',5,0,0),(73,'ipd-p-000011',11,300,0.00,0,-2000.00,2300.00,2000,300,300,0,NULL,2,300.00,1,'2023-02-24 17:02:14','2023-02-24 11:02:14','care',5,0,0),(74,'ipd-p-000011',11,12500,0.00,0,10200.00,0.00,0,300,0,0,NULL,2,12500.00,1,'2023-02-24 17:05:12','2023-02-24 11:05:12','care',5,0,0),(75,'000031_240223_17',17,1327,0.00,0,0.00,1327.00,0,0,0,0,'',1,1327.00,1,'2023-02-24 17:08:21','2023-02-24 11:08:21','care',5,0,0),(77,'000029_240223_17',17,2927,0.00,0,0.00,2927.00,0,0,0,0,'',1,2927.00,1,'2023-02-24 17:08:53','2023-02-24 11:08:53','care',5,0,0),(78,'ipd-p-000010',10,69650,0.00,0,67450.00,0.00,0,200,0,0,NULL,2,69650.00,1,'2023-02-24 17:10:55','2023-02-24 11:10:55','care',5,0,0),(79,'ipd-p-000010',10,69650,7450.00,0,17450.00,50000.00,0,200,0,0,'MD Sir',2,67450.00,1,'2023-02-24 17:11:35','2023-02-24 11:11:35','care',5,1,0),(80,'000001',0,2300,300.00,0,-2000.00,2000.00,0,0,0,0,NULL,3,0.00,1,'2023-02-24 17:15:54','2023-02-24 11:15:54','care',5,0,0),(81,'000032_240223_20',20,1327,0.00,0,1327.00,0.00,0,0,0,0,'',1,1327.00,1,'2023-02-24 17:19:47','2023-02-24 11:19:47','care',5,0,0),(82,'000030_240223_17',17,3527,0.00,0,3527.00,0.00,0,0,0,0,NULL,1,3527.00,1,'2023-02-24 16:36:45','2023-02-25 11:51:12','care',5,0,0);
/*!40000 ALTER TABLE `due_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_collection_history`
--

DROP TABLE IF EXISTS `due_collection_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_collection_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `patient_id` int(255) DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `discount` double(10,2) DEFAULT '0.00',
  `vat` double DEFAULT '0',
  `current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `paid_due` double(10,2) DEFAULT '0.00',
  `advance_payment` double NOT NULL DEFAULT '0',
  `admission_fee` double NOT NULL DEFAULT '0',
  `admission_fee_paid` double NOT NULL DEFAULT '0',
  `admission_fee_discount` double NOT NULL DEFAULT '0',
  `discount_ref` varchar(250) DEFAULT NULL,
  `due_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=opd, 2=ipd 3=ipd outdoor service',
  `old_due` double(10,2) DEFAULT '0.00',
  `status` int(11) DEFAULT '1' COMMENT '1=active 2=delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `table_created_at` datetime DEFAULT NULL,
  `reason` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_collection_history`
--

LOCK TABLES `due_collection_history` WRITE;
/*!40000 ALTER TABLE `due_collection_history` DISABLE KEYS */;
INSERT INTO `due_collection_history` VALUES (1,'000027_240223_18',18,3577,200.00,0,0.00,3377.00,0,0,0,0,'MD Sir',0,3577.00,1,'2023-02-24 15:59:56','2023-02-24 10:08:35','care',5,'2023-02-24 04:08:35',1),(2,'000030_240223_17',17,3927,0.00,0,3927.00,0.00,0,0,0,0,'',0,3927.00,1,'2023-02-24 16:36:45','2023-02-25 11:51:12','care',5,'2023-02-25 05:51:12',1),(3,'000030_240223_17',17,3927,0.00,0,0.00,3927.00,0,0,0,0,'',0,3927.00,1,'2023-02-24 17:08:39','2023-02-25 11:51:12','care',5,'2023-02-25 05:51:12',1);
/*!40000 ALTER TABLE `due_collection_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expire_date`
--

DROP TABLE IF EXISTS `expire_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expire_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) NOT NULL,
  `msg_date_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `msg_date_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `msg_date_3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expire_date`
--

LOCK TABLES `expire_date` WRITE;
/*!40000 ALTER TABLE `expire_date` DISABLE KEYS */;
INSERT INTO `expire_date` VALUES (3,5,'aHZVTzd4dFpjampjM2hicWhScGpmZz09','RWdSTjl6V1lwcHNhOGl6TTZnZktyQT09','bkpvdHEybW55eTlDMjNIaFBpSG8yZz09','QmorMXY4c3BOV0dVK0VidkpWTlRKUT09');
/*!40000 ALTER TABLE `expire_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generic_info`
--

DROP TABLE IF EXISTS `generic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generic_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generic_info`
--

LOCK TABLES `generic_info` WRITE;
/*!40000 ALTER TABLE `generic_info` DISABLE KEYS */;
INSERT INTO `generic_info` VALUES (1,'cefixime',1,NULL,'2018-11-07 03:19:14'),(2,'azitrmycine',1,NULL,'2018-11-07 03:19:18'),(3,'fexofenadin',1,NULL,'2018-11-07 03:19:21'),(4,'ceftriaxone',1,NULL,'2018-11-07 16:37:30'),(5,'nalbuphine-hydrochloride inn',1,NULL,'2018-11-07 16:38:50'),(6,'metronidazole',1,NULL,'2018-11-07 16:39:20'),(7,'hydrocortisone',1,NULL,'2018-11-07 16:40:33'),(8,'diclofenac-sodium',1,NULL,'2018-11-07 16:48:49'),(9,'ketorolac tromethamine',1,NULL,'2018-11-07 23:31:11'),(10,'esomeprazol magnesium usp',1,NULL,'2018-11-07 23:32:50'),(11,'tiemoniummethylsulphate',1,NULL,'2018-11-08 15:41:35'),(12,'dexamethasone',1,NULL,'2018-11-08 15:52:42'),(13,'cefuroxime',1,NULL,'2018-11-08 15:54:32'),(14,'oxytocin',1,NULL,'2018-11-08 15:55:31'),(15,'ketorolac tromethamine',1,NULL,'2018-11-08 15:55:48'),(16,'ephedrine-hydrochloride',1,NULL,'2018-11-09 17:10:35'),(17,'ranitidine',1,NULL,'2018-11-09 18:05:13'),(18,'hydrocortisone',1,NULL,'2018-11-09 18:05:41'),(19,'omeprazol',1,NULL,'2018-11-09 18:06:12'),(20,'pantoprazol',1,NULL,'2018-11-09 18:07:01'),(21,'ketamine-hydrochloride',1,NULL,'2018-11-09 18:54:26'),(22,'neostigmine-methylsulfate',1,NULL,'2018-11-09 18:56:15'),(23,'palonosetron',1,NULL,'2018-11-10 21:09:23'),(24,'Fentanyl',1,NULL,'2018-11-17 19:56:22'),(25,'palonosetron',1,NULL,'2018-11-17 20:02:50'),(26,'amicacin',1,NULL,'2018-11-20 18:14:22'),(27,'flucloxacilling',1,NULL,'2018-11-20 18:51:56'),(28,'Diclofanac',1,NULL,'2022-10-06 15:33:29');
/*!40000 ALTER TABLE `generic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dashboard_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_head_report` text COLLATE utf8_unicode_ci,
  `hospital_head_money_receipt` text COLLATE utf8_unicode_ci,
  `director` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_id` int(11) DEFAULT '0',
  `district_id` int(11) DEFAULT '0',
  `division_id` int(11) DEFAULT '0',
  `branch_id` int(11) DEFAULT '0' COMMENT 'if 0 then main office,then other will come from same table primary id',
  `country_id` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hospital_title_eng_report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_title_ban_report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `others_report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (5,'Model Hospital','png-2_png_5_png_5_png_5_png_5.png','Hospital-Banner_png_5_png_5_png_5.png','<h1 style=\"text-align:center;font-size:26px;color:black;font-weight:bold;\">মডেল হসপিটাল এন্ড ডায়াগনস্টিক সেন্টার</h1>\r\n		<h1 style=\"text-align:center;font-size:20px;color:black;font-weight:bold;\">MODEL HOSPITAL & DIAGNOSTIC CENTER</h1>\r\n		<p style=\"text-align:center;font-size:18px;color:black;margin-top:-8px;\">বিজনেস পার্ক, ট্রেড সেন্টার, হাজিগঞ্জ চাঁদপুর । <br>যোগাযোগ: ০১৮১৩-৩২২৬৭৮, ০১৬২৪-৭৯৪৯১০\r\n		</p>','<p>ভাইটাল  হসপিটাল এন্ড ডায়াগনস্টিক সেন্টার <br><br>Vital Hospital & Diagnostic Centerwww.prothomsheba.com, fb:shebadc2001<br>adsffbkfsdjkf mobile: 0167343875, 01783435678</p>','','','carehospital8@gmail.com','বিজনেস পার্ক, ট্রেড সেন্টার, হাজিগঞ্জ চাঁদপুর । ','বিজনেস পার্ক, ট্রেড সেন্টার, হাজিগঞ্জ চাঁদপুর । ','','',1,42,3,0,18,1,'2022-12-01 16:16:52','2018-10-20 03:26:03','মডেল হসপিটাল এন্ড ডায়াগনস্টিক সেন্টার','MODEL HOSPITAL & DIAGNOSTIC CENTER','যোগাযোগ: ০১৮১৩-৩২২৬৭৮, ০১৬২৪-৭৯৪৯১০','বিজনেস পার্ক, ট্রেড সেন্টার, হাজিগঞ্জ চাঁদপুর । ',0);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipd_final_bill`
--

DROP TABLE IF EXISTS `ipd_final_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipd_final_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `uhid` int(11) NOT NULL DEFAULT '0',
  `invoice_order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admission_fee` double NOT NULL DEFAULT '0',
  `advance_payment` double DEFAULT '0',
  `admission_fee_paid` double NOT NULL DEFAULT '0',
  `admission_fee_discount` double NOT NULL DEFAULT '0',
  `total_vat` double NOT NULL DEFAULT '0',
  `total_discount` double NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `amount_cabin` double NOT NULL DEFAULT '0',
  `amount_service` double NOT NULL DEFAULT '0',
  `amount_test` double NOT NULL DEFAULT '0',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `total_paid` double NOT NULL DEFAULT '0',
  `discount_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `released_date` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0=delete 1=active',
  `type` int(11) NOT NULL COMMENT '1=registration 2=cabin trnasfer 3=release 4=operation	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipd_final_bill`
--

LOCK TABLES `ipd_final_bill` WRITE;
/*!40000 ALTER TABLE `ipd_final_bill` DISABLE KEYS */;
INSERT INTO `ipd_final_bill` VALUES (1,1,0,'ipd-000001',300,2000,300,0,0,7350,39650,28750,10600,0,'unpaid',27300,'Din Md','2022-11-01 13:35:23','2022-11-15 23:01:12','2022-11-15 06:00:00',1,0),(2,2,1,'ipd-000002',300,2000,300,0,0,800,14100,0,13800,0,'paid',13300,'Din Md, ','2022-11-06 00:36:01','2022-11-06 00:37:05','2022-11-15 06:00:00',1,0),(3,3,0,'ipd-000003',500,4000,500,0,0,10000,65700,52000,13200,0,'paid',55700,'Dr.Sumon','2022-11-28 12:58:00','2022-12-24 13:46:21','2022-12-24 06:00:00',1,0),(4,4,2,'ipd-000004',500,4000,500,0,0,450,14950,2750,11700,0,'paid',14500,'Md.Sir','2022-11-28 13:09:22','2022-11-29 22:43:46','2022-11-28 18:00:00',1,0),(5,5,4,'ipd-000005',500,400,500,0,0,700,13600,0,13100,0,'paid',12900,'Md Sir, ','2022-12-03 16:10:35','2022-12-03 16:12:58','2022-12-03 06:00:00',1,0),(6,5,4,'ipd-000006',300,3000,300,0,0,0,300,0,0,0,'unpaid',3300,NULL,'2022-12-24 13:44:50',NULL,'2022-12-24 07:44:50',1,0),(7,6,6,'ipd-000007',500,2000,500,0,0,0,21917,10417,11000,0,'unpaid',2500,NULL,'2022-12-29 16:04:47','2023-01-03 21:33:10','2023-01-04 03:33:10',1,0),(8,7,0,'ipd-000008',500,5000,500,0,0,0,49600,40000,9100,0,'unpaid',5500,NULL,'2023-01-03 21:27:01','2023-01-23 22:16:59','2023-01-24 04:16:59',1,0),(9,8,0,'ipd-000009',500,5000,500,0,0,150,15650,5750,9400,0,'paid',15500,'Md Sir','2023-01-08 18:34:29','2023-01-11 16:08:35','2023-01-11 06:00:00',1,0),(10,9,0,'ipd-000010',500,0,500,0,0,0,9600,0,9100,0,'unpaid',500,NULL,'2023-01-23 22:37:29','2023-01-23 22:38:13','2023-01-24 04:38:13',1,0),(11,10,0,'ipd-000011',200,2000,200,0,0,7450,69650,57750,11700,0,'unpaid',52200,'MD Sir','2023-01-26 19:41:18','2023-02-24 17:10:55','2023-02-24 06:00:00',1,0),(12,11,0,'ipd-000012',300,2000,300,0,0,0,12500,0,12200,0,'unpaid',2300,NULL,'2023-02-24 17:02:14','2023-02-24 17:05:12','2023-02-24 23:05:12',1,0);
/*!40000 ALTER TABLE `ipd_final_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipd_patient_due_history`
--

DROP TABLE IF EXISTS `ipd_patient_due_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipd_patient_due_history` (
  `due_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type` int(11) DEFAULT NULL COMMENT '1=Operation,2=Service',
  `service_id` int(11) DEFAULT NULL COMMENT 'This Refers to Service/Operation Table Primary Key ',
  `patient_id` int(11) DEFAULT NULL,
  `patient_info_id` varchar(255) DEFAULT NULL,
  `total_amnt` decimal(10,2) DEFAULT NULL,
  `total_due` decimal(10,2) DEFAULT NULL,
  `total_paid` decimal(10,2) DEFAULT NULL,
  `recv_by` varchar(255) DEFAULT NULL,
  `add_date` date DEFAULT NULL,
  PRIMARY KEY (`due_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipd_patient_due_history`
--

LOCK TABLES `ipd_patient_due_history` WRITE;
/*!40000 ALTER TABLE `ipd_patient_due_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipd_patient_due_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipd_patient_info`
--

DROP TABLE IF EXISTS `ipd_patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipd_patient_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uhid` int(11) NOT NULL DEFAULT '0',
  `patient_info_id` varchar(255) NOT NULL DEFAULT '0',
  `reg_id` int(11) DEFAULT '0',
  `patient_name` varchar(255) DEFAULT NULL,
  `patient_image` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `doc_name` varchar(250) DEFAULT NULL,
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `ref_doc_name` varchar(255) DEFAULT NULL,
  `ref_doc_id` int(11) NOT NULL DEFAULT '0',
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `cabin_no` int(11) NOT NULL,
  `type` int(11) DEFAULT '1' COMMENT '1=registration 2=cabin trnasfer 3=release 4=operation',
  `total_amount` double NOT NULL DEFAULT '0',
  `paid_amount` double NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '1' COMMENT '1=active',
  `total_discount` double(10,2) DEFAULT '0.00',
  `total_vat` double(10,2) DEFAULT '0.00',
  `hospital_id` int(150) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `parents_name` varchar(255) DEFAULT NULL,
  `gurdian_add` text,
  `parents_add` text,
  `gurdian_contact` varchar(255) DEFAULT NULL,
  `parents_contact` varchar(255) DEFAULT NULL,
  `parents_address` text,
  `disease_name` varchar(255) DEFAULT NULL,
  `admission_fee` double NOT NULL DEFAULT '0',
  `advance_payment` double NOT NULL DEFAULT '0',
  `admission_fee_paid` double NOT NULL DEFAULT '0',
  `blood_pressure` varchar(255) DEFAULT NULL,
  `pulse_rate` varchar(255) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT NULL,
  `released_date` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `village` varchar(255) DEFAULT NULL,
  `post_office` varchar(255) DEFAULT NULL,
  `police_station` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `is_edited` int(11) NOT NULL DEFAULT '1' COMMENT '1= not edited 2= edited',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_id` (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipd_patient_info`
--

LOCK TABLES `ipd_patient_info` WRITE;
/*!40000 ALTER TABLE `ipd_patient_info` DISABLE KEYS */;
INSERT INTO `ipd_patient_info` VALUES (1,0,'ipd-p-000001',1001,'ghgvhcv','default_patient.jpg','dinmohammadsheto86@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','9','Male',0,0,'Dr. Akter Jahan MBBS, BCS(Health), MS',1,'Dr. Akter Jahan MBBS, BCS(Health), MS',1,'2022-11-01',NULL,'08908908','8',5,3,0,0,1,0.00,0.00,5,'Dr.Liton',NULL,NULL,NULL,NULL,NULL,NULL,'Bac Pain',300,2000,300,NULL,NULL,'9','2022-11-01 13:35:23','2022-11-15 23:01:12','2022-11-01 07:35:23','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpir',1),(2,1,'ipd-p-000002',1002,'Mr,Kamal','default_patient.jpg','dinmohammadsheto86@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Male',0,0,'Dr. Akter Jahan MBBS, BCS(Health),FCPS (Medicine) MS )(Orthopadic)',1,'Dr.Mohammad Kamal DMA',2,'2022-11-06',NULL,'01813322678','8',7,3,0,0,1,0.00,0.00,5,'Dr.Liton',NULL,NULL,NULL,NULL,NULL,NULL,'Bac Pain',300,2000,300,NULL,NULL,'ju','2022-11-06 00:36:01','2022-11-06 00:37:05','2022-11-05 18:36:01','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpir',1),(3,0,'ipd-p-000003',1003,'Mrs,Hasina Begum','default_patient.jpg','dinmohammadsheto86@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','33','Female',0,0,'Dr.Md.Golam Kawsar(Himel)',4,'Bangal Islami Life Insurence',5,'2022-11-28',NULL,'01823236232','8',5,3,0,0,1,0.00,0.00,5,'Dr.Liton',NULL,NULL,NULL,NULL,NULL,NULL,'Bac Pain',500,4000,500,NULL,NULL,'No','2022-11-28 12:58:00','2022-12-24 13:46:21','2022-11-28 06:58:00','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpir',1),(4,2,'ipd-p-000004',1004,'Md.Kamal Hossain','default_patient.jpg','dinmohammadsheto86@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','44','Male',0,0,'Dr.Younus Khan ',3,'Dr.Younus Khan ',3,'2022-12-28',NULL,'01813322678','8',7,3,0,0,1,0.00,0.00,5,'Dr.Liton',NULL,NULL,NULL,NULL,NULL,NULL,'Bac Pain',500,4000,500,NULL,NULL,'N/A','2022-11-28 13:09:22','2022-11-29 22:43:46','2022-11-28 07:09:22','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpir',1),(5,4,'ipd-p-000005',1006,'DIN MD: SHETO','default_patient.jpg','fahim22@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Male',0,0,'Dr.Younus Khan ',3,'Dr.Sujit Kumar Das',13,'2022-12-24',NULL,'036666565','8',6,3,0,0,1,0.00,0.00,5,'Mr,Fahim',NULL,NULL,NULL,NULL,NULL,NULL,'LUC',300,3000,300,NULL,NULL,'h','2022-12-24 13:44:50','2022-12-03 16:12:58','2022-12-03 10:10:35','care',5,'Modaforgonj','Modaforgonj','Modaforgonj','Cumilla',1),(6,6,'ipd-p-000006',1007,'MD:ZAKIR HOSSAIN','default_patient.jpg','riyadtalukdar36@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Male',0,0,'Dr.Younus Khan ',3,'Dr.Younus Khan ',3,'2022-12-29',NULL,'01557051687','7',5,3,0,0,1,0.00,0.00,5,'Md.Jamal',NULL,NULL,NULL,NULL,NULL,NULL,'Back Pain',500,2000,500,NULL,NULL,'0','2022-12-29 16:04:47','2023-01-03 21:33:10','2022-12-29 10:04:47','care',5,'Hajigonj','Hajigonj','Hajigonj','Hajigonj',1),(7,0,'ipd-p-000007',1008,'Mrs:Hasina Khatun','default_patient.jpg','soft2033@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Male',0,0,'Dr.Younus Khan ',3,'Dr.Younus Khan ',3,'2023-01-03',NULL,'0181326598','8',7,3,0,0,1,0.00,0.00,5,'Mr:Kamrul Islam',NULL,NULL,NULL,NULL,NULL,NULL,'LUCS',500,5000,500,NULL,NULL,';','2023-01-03 21:27:01','2023-01-23 22:16:59','2023-01-03 15:27:01','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpur',1),(8,0,'ipd-p-000008',1009,'Mr;Jamal Hossain','default_patient.jpg','soft2033@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Male',0,0,'Dr.Younus Khan ',3,'Dr.M.A Zaman ',9,'2023-01-08',NULL,'0165987458','8',5,3,0,0,1,0.00,0.00,5,'Mr:Kamrul Islam',NULL,NULL,NULL,NULL,NULL,NULL,'LUCS',500,5000,500,NULL,NULL,'l','2023-01-08 18:34:29','2023-01-11 16:08:35','2023-01-08 12:34:29','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpur',1),(9,0,'ipd-p-000009',1010,'Mrs:Fatema Begum','default_patient.jpg','soft2033@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Female',0,0,'Dr.Younus Khan MBBS, FCPS Medicine',3,'Bangal Islami Life Insurence',5,'2023-01-23',NULL,'0181326598','8',5,3,0,0,1,0.00,0.00,5,'Mr:Kamrul Islam',NULL,NULL,NULL,NULL,NULL,NULL,'LUCS',500,0,500,NULL,NULL,'0','2023-01-23 22:37:29','2023-01-23 22:38:13','2023-01-23 16:37:29','care',5,'Kandirpar','Aliara Bazar','Kachua','Chandpur',1),(10,0,'ipd-p-000010',1011,'Mr:Salam Miah','default_patient.jpg','dinislam22@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','44','Male',0,0,'Dr.Younus Khan MBBS, FCPS Medicine',3,'Dr.Imran Khan ',26,'2023-01-26',NULL,'123455533433','5',5,3,0,0,1,0.00,0.00,5,'Mr:Liton Miah',NULL,NULL,NULL,NULL,NULL,NULL,'Fiver',200,2000,200,NULL,NULL,'g','2023-01-26 19:41:18','2023-02-24 17:10:55','2023-01-26 13:41:18','care',5,'Kandirpar','Aliala Bazar','Kachua','Chandpur',1),(11,0,'ipd-p-000011',1012,'Mrs:Hasina Begum','default_patient.jpg','mdbulu44@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','20','Female',0,0,'Dr.Younus Khan MBBS, FCPS Medicine',3,'Bangal Islami Life Insurence',5,'2023-02-24',NULL,'0181326598','7',7,3,0,0,1,0.00,0.00,5,'Mr:Lokman Hossain',NULL,NULL,NULL,NULL,NULL,NULL,'Back Pain',300,2000,300,NULL,NULL,'bfhhdhdgh','2023-02-24 17:02:14','2023-02-24 17:05:12','2023-02-24 11:02:14','care',5,'Kachua','Aliara Bazar','Kachua','Chandpur',1);
/*!40000 ALTER TABLE `ipd_patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipd_patient_order_info`
--

DROP TABLE IF EXISTS `ipd_patient_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipd_patient_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `invoice_order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `vat` double(10,2) NOT NULL DEFAULT '0.00',
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` double NOT NULL DEFAULT '0',
  `total_paid` double NOT NULL DEFAULT '0',
  `ref_doc_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipd_patient_order_info`
--

LOCK TABLES `ipd_patient_order_info` WRITE;
/*!40000 ALTER TABLE `ipd_patient_order_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipd_patient_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_patient_info`
--

DROP TABLE IF EXISTS `local_patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_patient_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uhid` int(11) NOT NULL DEFAULT '0',
  `patient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `patient_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `blood_group` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_patient_info`
--

LOCK TABLES `local_patient_info` WRITE;
/*!40000 ALTER TABLE `local_patient_info` DISABLE KEYS */;
INSERT INTO `local_patient_info` VALUES (1,1,'Mr,Kamal','default.png','01813322678','4  D  23  Y','Male','New','Q/C Tower,Hajigonj',NULL,'2022-11-05 00:00:00','2022-10-06 16:08:57',1,2),(2,0,'Mrs.Salma Begum','default.png','01953447641','44 Y','Male','New','Bolakhar Hajigonj,',NULL,'2022-10-24 00:00:00','2022-10-24 08:40:25',1,0),(3,0,'Mrs.Salma Begum','default.png','01953447641','20 Y','Female','New','Hajigonj,Mokimabad',NULL,'2022-11-15 00:00:00','2022-11-15 16:31:44',1,1),(4,0,'Md.Nadim Patowary','default.png','01813322678','22 Y','Male','New','hg',NULL,'2022-11-28 00:00:00','2022-11-28 07:19:32',1,0),(5,0,'Md.Harun','default.png','01953447641','30 Y','Male','New','',NULL,'2022-11-29 00:00:00','2022-11-29 16:55:54',1,1),(6,0,'Md.Nadim Patowary','default.png','01654464888','23 Y','Male','New','QC Tower',NULL,'2023-01-07 00:00:00','2023-01-07 14:46:22',1,2),(7,6,'MD:ZAKIR HOSSAIN','default.png','01557051687','28  D  4  M  45  Y','Male','New','Bakila Bazar',NULL,'2023-01-13 00:00:00','2023-01-13 15:13:53',1,2);
/*!40000 ALTER TABLE `local_patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hospital_id` bigint(20) DEFAULT '0' COMMENT 'It comes from hospital_table.For Software Super Admin it will be 0',
  `branch_id` int(11) DEFAULT '0' COMMENT 'Hospital Branch Bujhabe',
  `doc_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '1=Hospital Admin,2=Pharmacy Admin,3=Ipd Admin,4=Opd Admin,5=Lab Admin,6=Reception Admin,7=Accounts Admin',
  `role_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `referal_id` bigint(20) DEFAULT NULL,
  `discount_percent` double NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (5,'care','care_user@gmail.com','01673438978','OUNQdTFhQ1pkQjdJaGxKdFErd3Badz09',5,0,0,'1','hospital_admin',1,NULL,50,0,'2018-10-20 21:26:58','2023-01-25 16:22:53'),(14,'super_admin','care_user@gmail.com','01673438978','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09',10,0,0,'0',NULL,1,NULL,0,0,'2018-10-20 21:26:58','2020-12-28 06:34:16'),(32,'Akter','dinmohammadsheto86@gmail.com','','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09',5,0,1,'23','Dr. Akter Jahan MBBS, BCS',1,NULL,0,0,'2022-10-24 14:32:38','2022-10-24 08:32:38'),(33,'dms','','','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09',5,0,0,'24','dms',1,NULL,0,0,'2022-10-24 14:50:32','2022-10-24 08:50:32'),(34,'moshiur','moshiur@gmail.com','','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09',5,0,0,'25','moshiur',1,NULL,100,0,'2022-12-03 16:40:44','2022-12-03 10:40:44');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_log`
--

DROP TABLE IF EXISTS `login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_log` (
  `logid` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginid` bigint(20) NOT NULL DEFAULT '0',
  `loginip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginidbrowser` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_log`
--

LOCK TABLES `login_log` WRITE;
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `make_order_pharmacy`
--

DROP TABLE IF EXISTS `make_order_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `make_order_pharmacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `p_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `unit_id` int(11) NOT NULL DEFAULT '0',
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comp_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comp_id` int(11) NOT NULL DEFAULT '0',
  `supp_id` int(11) NOT NULL DEFAULT '0',
  `supp_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_order_conf` int(11) NOT NULL DEFAULT '0' COMMENT '1=yes, 2 =no',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 0= delete',
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `make_order_pharmacy`
--

LOCK TABLES `make_order_pharmacy` WRITE;
/*!40000 ALTER TABLE `make_order_pharmacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `make_order_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_officer`
--

DROP TABLE IF EXISTS `marketing_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_officer`
--

LOCK TABLES `marketing_officer` WRITE;
/*!40000 ALTER TABLE `marketing_officer` DISABLE KEYS */;
INSERT INTO `marketing_officer` VALUES (1,'Md.Shariful Islam ','Marketing Officer','','fch_logo_png_1.png','','',1,'care',5,'2022-11-22 13:04:16','2022-10-06 15:17:55'),(2,'Sujon Mondol','Marketing','','default.jpg','','',1,'care',5,'2022-11-22 13:05:06','2022-11-22 07:05:06'),(3,'Family Care Hospital','Self ','','default.jpg','','',1,'care',5,'2022-11-22 13:05:47','2022-11-22 07:05:47');
/*!40000 ALTER TABLE `marketing_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_info`
--

DROP TABLE IF EXISTS `medicine_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generic_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_info`
--

LOCK TABLES `medicine_info` WRITE;
/*!40000 ALTER TABLE `medicine_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_result`
--

DROP TABLE IF EXISTS `multi_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multi_result` (
  `multi_path_id` int(150) NOT NULL AUTO_INCREMENT,
  `patient_info_id` varchar(150) DEFAULT NULL,
  `itestid` int(150) DEFAULT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `mresult` longtext,
  `mresult_combine` text,
  `published_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2=delete',
  PRIMARY KEY (`multi_path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_result`
--

LOCK TABLES `multi_result` WRITE;
/*!40000 ALTER TABLE `multi_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `multi_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_result_combine`
--

DROP TABLE IF EXISTS `multi_result_combine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multi_result_combine` (
  `multi_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_info_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itestid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `mresult_combine` text COLLATE utf8_unicode_ci,
  `published_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2=delete	',
  PRIMARY KEY (`multi_path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_result_combine`
--

LOCK TABLES `multi_result_combine` WRITE;
/*!40000 ALTER TABLE `multi_result_combine` DISABLE KEYS */;
INSERT INTO `multi_result_combine` VALUES (1,'4',1,12,' <br><br><br><br><br><br> <div class=\"container-middle\"> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 15px 15px 0 0 !important; padding: 3px; border-bottom: none;\"> <tbody><tr> <td><b>Bill No: </b>000012_291122_4</td> <td><b>Date: </b>29.11.2022 12:00 am</td> <td><b>P_ID: </b>4</td> </tr> <tr><td><b>Name: </b>Md.Kamal Hossain</td> <td><b>Age: </b>27 D 28 Y</td> <td><b>Sex: </b> M </td> </tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px;padding: 3px; border-top: none;border-bottom: none;\"> <tbody><tr> <td><b>Dr: </b>self </td></tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 0 0 15px 15px !important; padding: 3px; border-top: none;\"> <tbody><tr> <td><b>Specimen: </b>Blood</td> </tr> </tbody></table> <br> <div class=\"bio-chemestry_without_border\"> <table class=\"farhana-table-4-1\"> <tbody><tr> <th> Investigation </th> <th> Result </th> <th> Unit </th> <th> Reference range </th> </tr> </tbody></table> </div> <div class=\"bio-chemestry-div\">Serology</div><div style=\"font-size:20px;color:red;text-align:center;\"><br></div><br> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>RA Test<b></b></td><td><b>Negative</b></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>TPHA<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>VDRL<b></b></td><td><b>Non-Reactive</b></td><td>:-</td><td>Non-Reactive</td></tr></tbody></table></div> <div class=\"bio-chemestry-div\">Biochemistry</div><div style=\"font-size:20px;color:red;text-align:center;\"><br></div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody><tr> <th class=\"farhana-table-4-tr-1\" colspan=\"4\"> Test name : S.Creatinine </th> </tr> <tr> <td><b> S.Creatinine </b></td> <td><b>1.0</b></td> <td>mg/dl</td> <td>F:0.6--1.2mg/dl,M:0.6--1.4mg/dl<br></td> </tr> </tbody></table> </div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody><tr> <th class=\"farhana-table-4-tr-1\" colspan=\"4\"> Test name : RBS </th> </tr> <tr> <td><b> Random Blood Sugar (RBS)</b></td> <td><b>4.5</b><br></td> <td>mmol/l</td> <td>Adult: 4.0 --- 7.8 mmol/l&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Newborn: 2.22--- 4.44 mmol/l&nbsp; &nbsp; Children: 3.33 --- 6.11 mmol/l&nbsp;</td> </tr> </tbody></table> </div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody><tr> <th class=\"farhana-table-4-tr-1\" colspan=\"4\"> Test name : SGPT </th> </tr> <tr> <td><b> SGPT(ALT)</b></td> <td><b>15</b></td> <td>u/l</td> <td>M: Upto 41u/l, F: Upto 31 u/l<br></td> </tr> </tbody></table> </div>',NULL,1),(2,'9',1,13,' <br><br><br><br><br><br> <div class=\"container-middle\"> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 15px 15px 0 0 !important; padding: 3px; border-bottom: none;\"> <tbody><tr> <td><b>Bill No: </b>000013_291122_9</td> <td><b>Date: </b>29.11.2022 12:00 am</td> <td><b>P_ID: </b>9</td> </tr> <tr><td><b>Name: </b>Mrs,Hasina Begum</td> <td><b>Age: </b>1 D</td> <td><b>Sex: </b> F </td> </tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px;padding: 3px; border-top: none;border-bottom: none;\"> <tbody><tr> <td><b>Dr: </b>Dr.Md.Golam Kawsar(Himel) (<span>MBBS,BCS,FCPS (FP),MD Nefrology(thisis),CCD(Birdem</span>)</td></tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 0 0 15px 15px !important; padding: 3px; border-top: none;\"> <tbody><tr> <td><b>Specimen: </b>Blood</td> <td><b>Ipd Id: </b>ipd-p-000003</td> <td><b>Cabin No: </b>VIP AC Room No: 401</td> </tr> </tbody></table> <br> <div class=\"bio-chemestry_without_border\"> <table class=\"farhana-table-4-1\"> <tbody><tr> <th> Investigation </th> <th> Result </th> <th> Unit </th> <th> Reference range </th> </tr> </tbody></table> </div> <div class=\"bio-chemestry-div\">Serology</div><div style=\"font-size:20px;color:red;text-align:center;\"><br></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>RA Test<b></b></td><td><b>Negative</b></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>TPHA<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>VDRL<b></b></td><td><b>Non-Reactive</b></td><td>:-</td><td>Non-Reactive</td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>HBsAg (Device)<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry-div\">Biochemistry</div><div style=\"font-size:20px;color:red;text-align:center;\"><br></div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody> <tr> <td><b> Random Blood Sugar (RBS)</b></td> <td><b>4.5</b><br></td> <td>mmol/l</td> <td>Adult: 4.0 --- 7.8 mmol/l&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Newborn: 2.22--- 4.44 mmol/l&nbsp; &nbsp; Children: 3.33 --- 6.11 mmol/l&nbsp;</td> </tr> </tbody></table> </div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody> <tr> <td><b> SGPT(ALT)</b></td> <td><b>15</b></td> <td>u/l</td> <td>M: Upto 41u/l, F: Upto 31 u/l<br></td> </tr> </tbody></table> </div>',NULL,1),(3,'1',1,1,' </br></br></br></br></br></br> <div class=\"container-middle\"> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 15px 15px 0 0 !important; padding: 3px; border-bottom: none;\"> <tr> <td><b>Bill No: </b>000001_301022_1</td> <td><b>Date: </b>30.10.2022 12:00 am</td> <td><b>P_ID: </b>1</td> </tr> <tr><td><b>Name: </b>Mrs,Hasina Begum</td> <td ><b>Age: </b> Year</td> <td><b>Sex: </b> M </td> </tr> </table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px;padding: 3px; border-top: none;border-bottom: none;\"> <tr> <td><b>Dr: </b>Dr. Akter Jahan MBBS, BCS(Health), MS (<span></span>)</td></tr> </table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 0 0 15px 15px !important; padding: 3px; border-top: none;\"> <tr> <td><b>Specimen: </b>Blood</td> </tr> </table> <br> <div class=\"bio-chemestry_without_border\"> <table class=\"farhana-table-4-1\"> <tr> <th> Investigation </th> <th > Result </th> <th > Unit </th> <th> Reference range </th> </tr> </table> </div><div class=\"bio-chemestry-div\">Serology</div><div style=\"font-size:20px;color:red;text-align:center;\">dfdsfdsfdsfewrewrew122555</div><br> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>RA Test<b></b></td><td><b>Negative</b></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>TPHA<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>VDRL<b></b></td><td><b>Non-Reactive</b></td><td>:-</td><td>Non-Reactive</td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>HBsAg (Device)<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody><tr> <th class=\"farhana-table-4-tr-1\" colspan=\"4\"> Test name : CRP Test </th> </tr> <tr> <td><b>C-Reactive Protein (CRP)</b><br></td> <td><b>< 6.0  </b></td> <td>mg/l</td> <td>< 6.0 mg/l</td> </tr> </tbody></table> </div> ',NULL,1),(4,'16',1,25,' <br><br><br><br><br><br> <div class=\"container-middle\"> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 15px 15px 0 0 !important; padding: 3px; border-bottom: none;\"> <tbody><tr> <td><b>Bill No: </b>000025_040223_16</td> <td><b>Date: </b>04.02.2023 12:00 am</td> <td><b>P_ID: </b>16</td> </tr> <tr><td><b>Name: </b>Mrs;Hasina Begum</td> <td><b>Age: </b>30 Y</td> <td><b>Sex: </b> F </td> </tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px;padding: 3px; border-top: none;border-bottom: none;\"> <tbody><tr> <td><b>Dr: </b>Dr.Younus Khan MBBS, FCPS Medicine (<span></span>)</td></tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 0 0 15px 15px !important; padding: 3px; border-top: none;\"> <tbody><tr> <td><b>Specimen: </b>Blood</td> </tr> </tbody></table> <br> <div class=\"bio-chemestry_without_border\"> <table class=\"farhana-table-4-1\"> <tbody><tr> <th> Investigation </th> <th> Result </th> <th> Unit </th> <th> Reference range </th> </tr> </tbody></table> </div> <div class=\"bio-chemestry-div\">Serology</div><div style=\"font-size:20px;color:red;text-align:center;\">dfdsfdsfdsfewrewrew122555</div><br> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>HBsAg (Device)<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry-div\">Biochemistry</div><div style=\"font-size:20px;color:red;text-align:center;\">ghfhjghjgjghjgj</div><br> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody><tr> <th class=\"farhana-table-4-tr-1\" colspan=\"4\"> Test name : S.Creatinine </th> </tr> <tr> <td><b> S.Creatinine </b></td> <td><b>1.1</b></td> <td>mg/dl</td> <td>F:0.6--1.2mg/dl,M:0.6--1.4mg/dl<br></td> </tr> </tbody></table> </div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody><tr> <th class=\"farhana-table-4-tr-1\" colspan=\"4\"> Test name : RBS </th> </tr> <tr> <td><b> Random Blood Sugar (RBS)</b></td> <td><b>5.5</b><br></td> <td>mmol/l</td> <td>Adult: 4.0 --- 7.8 mmol/l&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Newborn: 2.22--- 4.44 mmol/l&nbsp; &nbsp; Children: 3.33 --- 6.11 mmol/l&nbsp;</td> </tr> </tbody></table> </div>',NULL,1),(5,'17',1,30,' <br><br><br><br><br><br> <div class=\"container-middle\"> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 15px 15px 0 0 !important; padding: 3px; border-bottom: none;\"> <tbody><tr> <td><b>Bill No: </b>000030_240223_17</td> <td><b>Date: </b>24.02.2023 12:00 am</td> <td><b>P_ID: </b>17</td> </tr> <tr><td><b>Name: </b>Mr:Salam Miah</td> <td><b>Age: </b>9 D</td> <td><b>Sex: </b> M </td> </tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px;padding: 3px; border-top: none;border-bottom: none;\"> <tbody><tr> <td><b>Dr: </b>Dr.Younus Khan MBBS, FCPS Medicine (<span></span>)</td></tr> </tbody></table> <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 0 0 15px 15px !important; padding: 3px; border-top: none;\"> <tbody><tr> <td><b>Specimen: </b>Blood</td> <td><b>Ipd Id: </b>ipd-p-000010</td> <td><b>Cabin No: </b>VIP AC Room No: 401</td> </tr> </tbody></table> <br> <div class=\"bio-chemestry_without_border\"> <table class=\"farhana-table-4-1\"> <tbody><tr> <th> Investigation </th> <th> Result </th> <th> Unit </th> <th> Reference range </th> </tr> </tbody></table> </div> <div class=\"bio-chemestry-div\">Serology</div><div style=\"font-size:20px;color:red;text-align:center;\">dfdsfdsfdsfewrewrew122555</div><br> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>RA Test<b></b></td><td><b>Negative</b></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>TPHA<b></b></td><td><span style=\"letter-spacing: 0.2px;\"><b>Negative</b></span></td><td>(-ve)</td><td><span style=\"letter-spacing: 0.2px; text-align: center;\">Negative</span><br></td></tr></tbody></table></div> <div class=\"bio-chemestry-div\">Biochemistry</div><div style=\"font-size:20px;color:red;text-align:center;\">ghfhjghjgjghjgj</div><br> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody> <tr> <td><b> S.Creatinine </b></td> <td><b>1.0</b></td> <td>mg/dl</td> <td>F:0.6--1.2mg/dl,M:0.6--1.4mg/dl<br></td> </tr> </tbody></table> </div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody> <tr> <td><b> SGPT(ALT)</b></td> <td><b>15</b></td> <td>u/l</td> <td>M: Upto 41u/l, F: Upto 31 u/l<br></td> </tr> </tbody></table> </div> <div class=\"bio-chemestry\"><table class=\"farhana-table-4\"><tbody><tr><td>SGOT(ALT)<b></b></td><td><b>20</b></td><td>u/l</td><td><span style=\"letter-spacing: 0.2px;\">Upto 40 u/l</span><br></td></tr></tbody></table></div> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 80px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 80px; } .farhana-table-3 tr td:last-child{ width: 80px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 130px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 150px; } .farhana-table-3 tr td:last-child{ width: 200px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 130px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 150px; } .farhana-table-3 tr td:last-child{ width: 200px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <style type=\"text/css\" media=\"screen\"> .farhana-table-1-col-1{ vertical-align: top; } .first-h1{ font-size:22px; color:#111111; text-align: left; font-weight: 600; } .first-p{ font-size:20px; color:#111111; text-align: left; margin-top: -13px; } .first-p-1{ font-size:20px; color:#111111!important; text-align: left; margin-top: -10px; font-family: \'BenchNine\', sans-serif; } .farhana-table-2{ width: 100%; } .bio-chemestry-1{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 7px auto; padding-bottom: 0px; height: auto; } .bio-chemestry{ border: 1px solid #111111; border-radius: 8px; width: 90%; margin: 15px auto; padding-bottom: 0px; height: auto; } .table-1-col-1{ width: 33%; text-align: center; } .table-1-col-1 p{ font-weight: bold; text-align: center; font-size: 20px; text-decoration: underline; } .farhana-table-3 { margin:0 auto; width: 90%; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .farhana-table-3 tr td{ font-size: 20px; width: 130px; } .bio-chemestry-div{ text-align: center; font-size: 22px; font-weight: 600; letter-spacing: 2px; margin-top: 10px; } .farhana-table-3 tr td:first-child{ width: 80px; text-align: right; } .farhana-table-3 tr td:nth-child(2){ width: 150px; } .farhana-table-3 tr td:last-child{ width: 200px; } .table-3-text-right{ text-align: right!important; } .farhana-table-5 { margin:0 auto; width: 90%!important; margin-top: 10px; border: 1px solid #111111; border-radius: 8px; } .doctor-name{ font-size: 20px; } .text-right{ text-align: right; } .text-center{ text-align: center; } .farhana-table-4 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 { width: 100%; margin: 0 auto; border-collapse: collapse; font-size: 18px; border-radius: 8px !important; } .farhana-table-4-1 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; border-bottom: 0px solid #111111; text-transform: uppercase; } .farhana-table-4-1 tr th:first-child{ text-align: left; width: 40%; border-left: none !important; border-bottom-left-radius: 8px; border-top-left-radius: 8px; } .farhana-table-4-1 tr th:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4-1 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; border-bottom-right-radius: 8px; border-top-right-radius: 8px; } .farhana-table-4-tr{ border-top-left-radius: 8px; } .farhana-table-4 tr th{ border: 1px solid #111111; border-top: 0px solid #ffffff!important; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; background: #c6b5b5; word-spacing: 2px; text-transform: uppercase; border-top-left-radius: 8px; border-top-right-radius: 8px } .farhana-table-4 tr th:first-child{ text-align: left; width: 45%; border-left:none!important; } .farhana-table-4 tr th:nth-child(2) { text-align: center; width: 20%; } .farhana-table-4 tr th:last-child{ text-align: left; width: 30%; border-right:none!important; } .farhana-table-4 tr td:nth-child(3){ text-align: center; } .farhana-table-4 tr td:first-child{ text-align: left; border-left:none!important; width: 40%; } .farhana-table-4 tr td:nth-child(2){ text-align: center; width: 20%; } .farhana-table-4 tr td:last-child{ text-align: left; border-right:none!important; width: 30%; } .farhana-table-4 tr td{ border: 1px solid #111111; border-collapse: collapse!important; text-align: center; padding: 2px; padding-left: 7px; border-bottom: 0px solid #fff; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 3px; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 3px; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; padding-left: 7px; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; padding-right: 7px; } .farhana-table-6{ margin-top: 10px; width: 95%; margin:0 auto; } .farhana-table-5 tr th:first-child{ width: 50%; font-size: 20px; text-align: left; text-decoration: underline; } .farhana-table-5 tr th:last-child{ width: 50%; font-size: 20px; text-align: right; text-decoration: underline; } .farhana-table-5 tr td:first-child{ width: 50%; font-size: 20px; text-align: left; } .farhana-table-5 tr td:last-child{ width: 50%; font-size: 20px; text-align: right; } .tranform-text{ font-size: 22px!important; font-weight: bold; transform: rotate(-30deg); text-align: center; vertical-align: middle; width: 57%; } .unit-class{ font-size:20px; padding: 30px 0px; } .delivery{ font-size:10px; } .last-p{ padding: 4px; font-size: 20px; border:1px solid #111111; border-radius: 13px; width: 163px; margin:10px 0px; } .print{ font-size: 20px; } .authorize{ font-size:20px; text-decoration: overline; text-align: right; } .blank{ height: 10px!important; } </style> <div class=\"bio-chemestry\"> <table class=\"farhana-table-4\"> <tbody> <tr> <td><b>S. Cholesterol&nbsp;</b><br></td> <td><b>150</b></td> <td>mg/dl</td> <td>Upto 220 mg/dl </td> </tr><tr><td><b>S. Triglycerides</b><br></td><td><b>120</b></td><td>mg/dl<br></td><td>Upto 150 mg/dl<br></td></tr><tr><td><b>HDL - Cholesterol&nbsp;</b><br></td><td><b>40</b></td><td>mg/dl<br></td><td>F. 35-55, M. 45-65 mg/dl</td></tr><tr><td><b>LDL - Cholesterol&nbsp;</b><br></td><td><b>126</b></td><td>mg/dl<br></td><td>Upto 150 mg/dl<br></td></tr> </tbody></table> </div>',NULL,1);
/*!40000 ALTER TABLE `multi_result_combine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_info`
--

DROP TABLE IF EXISTS `opd_patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_info_id` int(11) NOT NULL DEFAULT '0',
  `patient_name` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `ref_doctor_id` int(11) NOT NULL DEFAULT '0',
  `ref_doctor_name` varchar(255) DEFAULT NULL,
  `quack_doc_id` int(11) NOT NULL DEFAULT '0',
  `quack_doc_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `blood_group` int(11) NOT NULL DEFAULT '0',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `total_bill` double NOT NULL DEFAULT '0',
  `total_paid` double NOT NULL DEFAULT '0',
  `profile_img` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `reason` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hospital_id` int(150) DEFAULT NULL,
  `total_discount_p` double(10,2) DEFAULT '0.00',
  `total_vat_p` double(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_info`
--

LOCK TABLES `opd_patient_info` WRITE;
/*!40000 ALTER TABLE `opd_patient_info` DISABLE KEYS */;
INSERT INTO `opd_patient_info` VALUES (1,1,'Mrs,Hasina Begum',' Year','Male',0,0,1,'Dr. Akter Jahan MBBS, BCS(Health), MS',2,'Dr.Mohammad Kamal DMA','2022-10-30','','0181326598',1,NULL,5,4727,4527,NULL,1,NULL,'2022-10-30 17:28:44','2022-10-30 11:02:21',NULL,200.00,0.00),(2,2,'Mr.Jamal','22 Y','Male',0,0,1,'Dr. Akter Jahan MBBS, BCS(Health), MS',2,'Dr.Mohammad Kamal DMA','0000-00-00',NULL,'0181326598',0,'care',5,1427,0,NULL,1,NULL,'2022-10-30 17:39:28','2022-10-30 11:39:28',5,0.00,0.00),(3,3,'Md.Nadim Patowary','22  Y','Male',0,0,3,'Dr.Younus Khan ',0,'self','0000-00-00',NULL,'01813322678',0,'care',5,3427,3227,NULL,1,NULL,'2022-11-28 13:25:15','2022-11-28 07:25:15',5,200.00,0.00),(4,4,'Md.Kamal Hossain','27  D  28  Y','Male',0,0,0,'self',3,'Dr.Younus Khan ','0000-00-00',NULL,'01813322678',0,'care',5,4627,3127,NULL,1,NULL,'2022-11-28 18:15:07','2022-11-28 12:15:07',5,0.00,0.00),(5,5,'Mr,Kamal','4  D  23  Y','Male',0,0,0,'self',0,'self','0000-00-00',NULL,'01813322678',0,'care',5,3000,0,NULL,1,NULL,'2022-11-28 18:20:35','2022-11-28 12:20:35',5,0.00,0.00),(6,6,'Md.Nadim Patowary','22  Y','Male',0,0,3,'Dr.Younus Khan ',0,'self','0000-00-00',NULL,'01813322678',0,'care',5,1500,0,NULL,1,NULL,'2022-11-28 18:44:25','2022-11-28 12:44:25',5,0.00,0.00),(7,7,'Mrs.Salma Begum','20  Y','Female',0,0,0,'self',0,'self','0000-00-00',NULL,'01953447641',0,'care',5,1500,1500,NULL,1,NULL,'2022-11-28 18:46:31','2022-11-28 12:46:31',5,0.00,0.00),(8,8,'Md.Harun','30  Y','Male',0,0,3,'Dr.Younus Khan ',3,'Dr.Younus Khan ','0000-00-00',NULL,'01953447641',0,'care',5,3127,2927,NULL,1,NULL,'2022-11-29 23:29:17','2022-11-29 17:29:17',5,200.00,0.00),(9,9,'Mrs,Hasina Begum','1 D','Female',0,0,4,'Dr.Md.Golam Kawsar(Himel)',5,'Bangal Islami Life Insurence','2022-11-28',NULL,'01823236232',0,'care',5,6128,3674,NULL,1,NULL,'2022-11-29 23:33:48','2022-11-29 17:33:48',5,200.00,0.00),(10,10,'DIN MD: SHETO','12  D  7  M  37  Y','Male',0,0,4,'Dr.Md.Golam Kawsar(Himel)',3,'Dr.Younus Khan ','0000-00-00',NULL,'01624-79 49 10',0,'care',5,6781,5054,NULL,1,NULL,'2022-12-02 22:53:31','2022-12-02 16:53:31',5,400.00,0.00),(11,11,'Mr,Kamal','30 Y','Male',0,0,3,'Dr.Younus Khan ',21,'Md.Tanvir Ahmed Mia (Arif) ','0000-00-00',NULL,'0181326598',0,'care',5,3702,3602,NULL,1,NULL,'2022-12-03 15:36:11','2022-12-03 09:36:11',5,100.00,0.00),(12,12,'Mr,Salam','26 Y','Male',0,0,4,'Dr.Md.Golam Kawsar(Himel)',21,'Md.Tanvir Ahmed Mia (Arif) ','2022-12-03',NULL,'0181326598',0,'care',5,4197,4000,NULL,1,NULL,'2022-12-03 15:42:41','2022-12-03 09:42:41',5,197.00,0.00),(13,13,'DIN MD (SHETO)','12  D  7  M  37  Y','Male',0,0,0,'self',6,'Dr.Shahida Sultana Nishe ','0000-00-00',NULL,'01624-79 49 10',0,'Akter',32,3947,0,NULL,1,NULL,'2022-12-28 16:28:46','2022-12-28 10:28:46',5,0.00,0.00),(14,14,'MD:ZAKIR HOSSAIN','20 Y','Male',0,0,3,'Dr.Younus Khan ',3,'Dr.Younus Khan ','2022-12-29',NULL,'01557051687',0,'care',5,2827,2827,NULL,1,NULL,'2022-12-29 16:06:10','2022-12-29 10:06:10',5,0.00,0.00),(15,15,'Mr:Hasan','','Male',0,0,0,'self',0,'self','2023-01-30',NULL,'0181326598',0,'care',5,1727,1600,NULL,1,NULL,'2023-01-29 15:58:10','2023-01-29 09:58:10',5,127.00,0.00),(16,16,'Mrs;Hasina Begum','30 Y','Female',0,0,3,'Dr.Younus Khan MBBS, FCPS Medicine',3,'Dr.Younus Khan MBBS, FCPS Medicine','0000-00-00',NULL,'0181326598',0,'care',5,2047,2047,NULL,1,NULL,'2023-02-04 10:50:56','2023-02-04 04:50:56',5,0.00,0.00),(17,17,'Mr:Salam Miah','9 D','Male',0,0,3,'Dr.Younus Khan MBBS, FCPS Medicine',26,'Dr.Imran Khan ','2023-01-26',NULL,'123455533433',0,'care',5,7986,4459,NULL,1,NULL,'2023-02-04 10:55:45','2023-02-04 04:55:45',5,0.00,0.00),(18,18,'Mr:Jamal','20 Y','Male',0,0,4,'Dr.Md.Golam Kawsar(Himel)',5,'Bangal Islami Life Insurence','0000-00-00',NULL,'0181326598',0,'care',5,3077,2877,NULL,1,NULL,'2023-02-24 15:59:56','2023-02-24 09:59:56',5,200.00,0.00),(19,19,'MR SALAM','16  D  15  Y','Male',0,0,0,'self',3,'Dr.Younus Khan MBBS, FCPS Medicine','0000-00-00',NULL,'01917536789',0,'care',5,1500,1500,NULL,1,NULL,'2023-02-24 16:05:40','2023-02-24 10:05:40',5,0.00,0.00),(20,20,'Md.Nadim Patowary','23  Y','Male',0,0,3,'Dr.Younus Khan MBBS, FCPS Medicine',5,'Bangal Islami Life Insurence','0000-00-00',NULL,'01654464888',0,'care',5,1327,0,NULL,1,NULL,'2023-02-24 17:19:47','2023-02-24 11:19:47',5,0.00,0.00);
/*!40000 ALTER TABLE `opd_patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_test_details_info`
--

DROP TABLE IF EXISTS `opd_patient_test_details_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_test_details_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_test_order_id` int(11) NOT NULL DEFAULT '0',
  `patient_sub_test_id` int(11) NOT NULL DEFAULT '0',
  `sub_test_price` double DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1=main 2=additional',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_test_details_info`
--

LOCK TABLES `opd_patient_test_details_info` WRITE;
/*!40000 ALTER TABLE `opd_patient_test_details_info` DISABLE KEYS */;
INSERT INTO `opd_patient_test_details_info` VALUES (1,1,4,400,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,1),(2,1,5,1000,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,1),(3,1,6,400,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,1),(4,1,7,400,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,1),(5,1,8,1000,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,1),(6,1,302,12,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,2),(7,1,303,15,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21',0,2),(8,2,4,400,0,1,'2022-10-30 17:39:28','2022-10-30 11:39:28',0,1),(9,2,5,1000,0,1,'2022-10-30 17:39:28','2022-10-30 11:39:28',0,1),(10,2,302,12,0,1,'2022-10-30 17:39:28','2022-10-30 11:39:28',0,2),(11,2,303,15,0,1,'2022-10-30 17:39:28','2022-10-30 11:39:28',0,2),(12,3,4,600,0,1,'2022-11-28 13:25:15','2022-11-28 07:25:15',0,1),(13,3,5,800,0,1,'2022-11-28 13:25:15','2022-11-28 07:25:15',0,1),(14,3,7,500,0,1,'2022-11-28 13:25:15','2022-11-28 07:25:15',0,1),(15,3,302,12,0,1,'2022-11-28 13:25:15','2022-11-28 07:25:15',0,2),(16,3,303,15,0,1,'2022-11-28 13:25:15','2022-11-28 07:25:15',0,2),(17,4,39,1500,0,1,'2022-11-28 18:15:07','2022-11-28 12:15:07',0,1),(18,5,39,1500,0,1,'2022-11-28 18:20:35','2022-11-28 12:20:35',0,1),(19,6,39,1500,0,1,'2022-11-28 18:23:19','2022-11-28 12:23:19',0,1),(20,7,39,1500,0,1,'2022-11-28 18:26:32','2022-11-28 12:26:32',0,1),(21,8,39,1500,0,1,'2022-11-28 18:44:25','2022-11-28 12:44:25',0,1),(22,9,39,1500,0,1,'2022-11-28 18:46:31','2022-11-28 12:46:31',0,1),(23,10,39,1500,0,1,'2022-11-28 18:49:46','2022-11-28 12:49:46',0,1),(24,11,4,600,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,1),(25,11,5,800,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,1),(26,11,6,400,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,1),(27,11,16,500,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,1),(28,11,196,300,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,1),(29,11,23,500,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,1),(30,11,302,12,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,2),(31,11,303,15,0,1,'2022-11-29 23:29:17','2022-11-29 17:29:17',0,2),(32,12,4,600,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,1),(33,12,5,800,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,1),(34,12,6,400,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,1),(35,12,16,500,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,1),(36,12,196,300,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,1),(37,12,23,500,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,1),(38,12,302,12,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,2),(39,12,303,15,0,1,'2022-11-29 23:32:27','2022-11-29 17:32:27',0,2),(40,13,4,600,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,1),(41,13,5,800,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,1),(42,13,6,400,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,1),(43,13,7,500,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,1),(44,13,196,300,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,1),(45,13,23,500,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,1),(46,13,302,12,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,2),(47,13,303,15,0,1,'2022-11-29 23:33:48','2022-11-29 17:33:48',0,2),(48,14,4,600,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,1),(49,14,5,800,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,1),(50,14,6,400,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,1),(51,14,16,500,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,1),(52,14,196,300,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,1),(53,14,23,500,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,1),(54,14,302,12,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,2),(55,14,303,15,0,1,'2022-12-02 22:53:31','2022-12-02 16:53:31',0,2),(56,15,16,500,0,1,'2022-12-03 15:27:01','2022-12-03 09:27:01',0,1),(57,15,196,300,0,1,'2022-12-03 15:27:01','2022-12-03 09:27:01',0,1),(58,15,33,1500,0,1,'2022-12-03 15:27:01','2022-12-03 09:27:01',0,1),(59,15,302,12,0,1,'2022-12-03 15:27:01','2022-12-03 09:27:01',0,2),(60,15,303,15,0,1,'2022-12-03 15:27:01','2022-12-03 09:27:01',0,2),(61,16,27,700,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,1),(62,16,7,500,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,1),(63,16,33,1500,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,1),(64,16,86,700,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,1),(65,16,236,200,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,1),(66,16,302,12,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,2),(67,16,303,15,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,2),(68,16,304,20,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,2),(69,16,306,50,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,2),(70,16,305,5,0,1,'2022-12-03 15:36:11','2022-12-03 09:36:11',0,2),(71,17,27,700,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,1),(72,17,111,1200,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,1),(73,17,86,700,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,1),(74,17,33,1500,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,1),(75,17,302,12,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,2),(76,17,303,15,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,2),(77,17,304,20,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,2),(78,17,306,50,0,1,'2022-12-03 15:42:41','2022-12-03 09:42:41',0,2),(79,18,4,500,0,1,'2022-12-03 16:15:43','2022-12-03 10:15:43',0,1),(80,18,302,12,0,1,'2022-12-03 16:15:43','2022-12-03 10:15:43',0,2),(81,18,303,15,0,1,'2022-12-03 16:15:43','2022-12-03 10:15:43',0,2),(82,19,308,1200,0,1,'2022-12-11 23:59:53','2022-12-11 17:59:53',0,1),(83,19,16,500,0,1,'2022-12-11 23:59:53','2022-12-11 17:59:53',0,1),(84,19,302,12,0,1,'2022-12-11 23:59:53','2022-12-11 17:59:53',0,2),(85,19,303,15,0,1,'2022-12-11 23:59:53','2022-12-11 17:59:53',0,2),(86,20,341,400,0,1,'2022-12-14 02:08:01','2022-12-13 20:08:01',0,1),(87,20,196,300,0,1,'2022-12-14 02:08:01','2022-12-13 20:08:01',0,1),(88,20,302,12,0,1,'2022-12-14 02:08:01','2022-12-13 20:08:01',0,2),(89,20,303,15,0,1,'2022-12-14 02:08:01','2022-12-13 20:08:01',0,2),(90,20,304,20,0,1,'2022-12-14 02:08:01','2022-12-13 20:08:01',0,2),(91,21,4,500,0,1,'2022-12-24 13:43:18','2022-12-24 07:43:18',0,1),(92,21,5,800,0,1,'2022-12-24 13:43:18','2022-12-24 07:43:18',0,1),(93,21,302,12,0,1,'2022-12-24 13:43:18','2022-12-24 07:43:18',0,2),(94,21,303,15,0,1,'2022-12-24 13:43:18','2022-12-24 07:43:18',0,2),(95,22,27,700,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,1),(96,22,16,500,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,1),(97,22,308,1200,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,1),(98,22,18,500,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,1),(99,22,19,500,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,1),(100,22,21,500,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,1),(101,22,302,12,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,2),(102,22,303,15,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,2),(103,22,304,20,0,1,'2022-12-28 16:28:46','2022-12-28 10:28:46',0,2),(104,23,4,500,0,1,'2022-12-29 16:06:10','2022-12-29 10:06:10',0,1),(105,23,5,800,0,1,'2022-12-29 16:06:10','2022-12-29 10:06:10',0,1),(106,23,33,1500,0,1,'2022-12-29 16:06:10','2022-12-29 10:06:10',0,1),(107,23,302,12,0,1,'2022-12-29 16:06:10','2022-12-29 10:06:10',0,2),(108,23,303,15,0,1,'2022-12-29 16:06:10','2022-12-29 10:06:10',0,2),(109,24,4,500,0,1,'2023-01-29 15:58:10','2023-01-29 09:58:10',0,1),(110,24,5,800,0,1,'2023-01-29 15:58:10','2023-01-29 09:58:10',0,1),(111,24,6,400,0,1,'2023-01-29 15:58:10','2023-01-29 09:58:10',0,1),(112,24,302,12,0,1,'2023-01-29 15:58:10','2023-01-29 09:58:10',0,2),(113,24,303,15,0,1,'2023-01-29 15:58:10','2023-01-29 09:58:10',0,2),(114,25,27,700,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,1),(115,25,16,500,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,1),(116,25,196,300,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,1),(117,25,7,500,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,1),(118,25,302,12,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,2),(119,25,303,15,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,2),(120,25,304,20,0,1,'2023-02-04 10:50:56','2023-02-04 04:50:56',0,2),(121,26,236,200,0,1,'2023-02-04 10:55:45','2023-02-04 04:55:45',0,1),(122,26,305,5,0,1,'2023-02-04 10:55:45','2023-02-04 04:55:45',0,2),(124,27,5,800,0,1,'2023-02-24 15:59:56','2023-02-24 09:59:56',0,1),(125,27,33,1500,0,1,'2023-02-24 15:59:56','2023-02-24 09:59:56',0,1),(126,27,86,700,0,1,'2023-02-24 15:59:56','2023-02-24 09:59:56',0,1),(127,27,302,12,0,1,'2023-02-24 15:59:56','2023-02-24 09:59:56',0,2),(128,27,303,15,0,1,'2023-02-24 15:59:56','2023-02-24 09:59:56',0,2),(129,27,306,50,0,1,'2023-02-24 15:59:56','2023-02-24 09:59:56',0,2),(130,28,33,1500,0,1,'2023-02-24 16:05:40','2023-02-24 10:05:40',0,1),(131,29,4,500,0,1,'2023-02-24 16:35:31','2023-02-24 10:35:31',0,1),(132,29,5,800,0,1,'2023-02-24 16:35:31','2023-02-24 10:35:31',0,1),(133,29,16,400,0,1,'2023-02-24 16:35:31','2023-02-24 10:35:31',0,1),(134,29,111,1200,0,1,'2023-02-24 16:35:31','2023-02-24 10:35:31',0,1),(135,29,302,12,0,1,'2023-02-24 16:35:31','2023-02-24 10:35:31',0,2),(136,29,303,15,0,1,'2023-02-24 16:35:31','2023-02-24 10:35:31',0,2),(137,30,4,500,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,1),(138,30,5,800,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,1),(140,30,23,500,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,1),(141,30,24,500,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,1),(142,30,111,1200,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,1),(143,30,302,12,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,2),(144,30,303,15,0,1,'2023-02-24 16:36:45','2023-02-24 10:36:45',0,2),(145,31,4,500,0,1,'2023-02-24 16:50:04','2023-02-24 10:50:04',0,1),(146,31,5,800,0,1,'2023-02-24 16:50:04','2023-02-24 10:50:04',0,1),(147,31,302,12,0,1,'2023-02-24 16:50:04','2023-02-24 10:50:04',0,2),(148,31,303,15,0,1,'2023-02-24 16:50:04','2023-02-24 10:50:04',0,2),(149,32,4,500,0,1,'2023-02-24 17:19:47','2023-02-24 11:19:47',0,1),(150,32,5,800,0,1,'2023-02-24 17:19:47','2023-02-24 11:19:47',0,1),(151,32,302,12,0,1,'2023-02-24 17:19:47','2023-02-24 11:19:47',0,2),(152,32,303,15,0,1,'2023-02-24 17:19:47','2023-02-24 11:19:47',0,2);
/*!40000 ALTER TABLE `opd_patient_test_details_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_test_details_info_history`
--

DROP TABLE IF EXISTS `opd_patient_test_details_info_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_test_details_info_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_test_order_id` int(11) NOT NULL DEFAULT '0',
  `patient_sub_test_id` int(11) NOT NULL DEFAULT '0',
  `sub_test_price` double DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `reason` int(11) NOT NULL DEFAULT '0' COMMENT '1=edit 2=delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_test_details_info_history`
--

LOCK TABLES `opd_patient_test_details_info_history` WRITE;
/*!40000 ALTER TABLE `opd_patient_test_details_info_history` DISABLE KEYS */;
INSERT INTO `opd_patient_test_details_info_history` VALUES (1,1,4,500,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(2,1,5,800,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(3,1,33,1500,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(4,1,86,700,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(5,1,302,12,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(6,1,303,15,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(7,1,306,50,0,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35'),(8,2,4,500,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(9,2,5,800,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(10,2,16,400,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(11,2,23,500,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(12,2,24,500,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(13,2,111,1200,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(14,2,302,12,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12'),(15,2,303,15,0,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12');
/*!40000 ALTER TABLE `opd_patient_test_details_info_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_test_order_info`
--

DROP TABLE IF EXISTS `opd_patient_test_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_test_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `test_order_id` varchar(255) DEFAULT NULL,
  `total_discount` double NOT NULL,
  `vat` double NOT NULL DEFAULT '0',
  `age` varchar(255) DEFAULT NULL,
  `ref_doc_id` int(11) NOT NULL DEFAULT '0',
  `quack_doc_id` int(11) NOT NULL DEFAULT '0',
  `ref_doc_name` varchar(255) DEFAULT NULL,
  `quack_doc_name` varchar(255) DEFAULT NULL,
  `total_amount` double NOT NULL DEFAULT '0',
  `paid_amount` double NOT NULL DEFAULT '0',
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entry_date` date DEFAULT NULL,
  `discount_ref` varchar(250) DEFAULT NULL,
  `total_gross_com` double NOT NULL DEFAULT '0',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `is_ipd_patient` int(11) NOT NULL DEFAULT '0' COMMENT '0=no 1=yes',
  `ipd_patient_id` int(11) NOT NULL DEFAULT '0',
  `uhid` int(11) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `delete_reason_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_test_order_info`
--

LOCK TABLES `opd_patient_test_order_info` WRITE;
/*!40000 ALTER TABLE `opd_patient_test_order_info` DISABLE KEYS */;
INSERT INTO `opd_patient_test_order_info` VALUES (1,1,'000001_301022_1',200,0,'',1,2,'Dr. Akter Jahan MBBS, BCS(Health), MS','Dr.Mohammad Kamal DMA',3227,3027,'paid',1,'2022-10-30 17:02:21','2022-10-30 11:02:21','2022-10-30','MDS',0,'care',5,0,0,0,NULL,NULL),(2,2,'000002_301022_2',0,0,'22 Y',1,2,'Dr. Akter Jahan MBBS, BCS(Health), MS','Dr.Mohammad Kamal DMA',1427,0,'unpaid',1,'2022-10-30 17:39:28','2022-10-30 11:39:28','2022-10-30','',0,'care',5,0,0,0,NULL,NULL),(3,3,'000003_281122_3',200,0,'22  Y',3,0,'Dr.Younus Khan ','self',1927,1727,'paid',1,'2022-11-28 13:25:15','2022-11-28 07:25:15','2022-11-28','Dr,Kamal',0,'care',5,0,0,0,NULL,NULL),(4,4,'000004_281122_4',0,0,'27  D  28  Y',0,3,'self','Dr.Younus Khan ',1500,3127,'paid',1,'2022-11-28 18:15:07','2022-11-28 12:15:07','2022-11-28','',0,'care',5,0,0,2,NULL,NULL),(5,5,'000005_281122_5',0,0,'4  D  23  Y',0,0,'self','self',1500,0,'unpaid',1,'2022-11-28 18:20:35','2022-11-28 12:20:35','2022-11-28','',0,'care',5,0,0,1,NULL,NULL),(6,3,'000006_281122_3',0,0,'29 D 11 M 122 Y',3,0,'Dr.Younus Khan ','self',1500,1500,'paid',1,'2022-11-28 18:23:19','2022-11-28 12:23:19','2022-11-28','',0,'care',5,0,0,0,NULL,NULL),(7,1,'000007_281122_1',0,0,'29 D',0,0,'self','self',1500,1500,'paid',1,'2022-11-28 18:26:32','2022-11-28 12:26:32','2022-11-28','',0,'care',5,0,0,0,NULL,NULL),(8,6,'000008_281122_6',0,0,'22  Y',3,0,'Dr.Younus Khan ','self',1500,0,'unpaid',1,'2022-11-28 18:44:25','2022-11-28 12:44:25','2022-11-28','',0,'care',5,0,0,0,NULL,NULL),(9,7,'000009_281122_7',0,0,'20  Y',0,0,'self','self',1500,1500,'paid',1,'2022-11-28 18:46:31','2022-11-28 12:46:31','2022-11-28','',0,'care',5,0,0,0,NULL,NULL),(10,5,'000010_281122_5',0,0,'4  D  23  Y',0,0,'self','self',1500,0,'unpaid',1,'2022-11-28 18:49:46','2022-11-28 12:49:46','2022-11-28','',0,'care',5,0,0,1,NULL,NULL),(11,8,'000011_291122_8',200,0,'30  Y',3,3,'Dr.Younus Khan ','Dr.Younus Khan ',3127,2927,'paid',1,'2022-11-29 23:29:17','2022-11-29 17:29:17','2022-11-29','Dr,Kamal',0,'care',5,0,0,0,NULL,NULL),(12,4,'000012_291122_4',0,0,'27  D  28  Y',0,3,'self','Dr.Younus Khan ',3127,0,'unpaid',1,'2022-11-29 23:32:27','2022-11-29 17:32:27','2022-11-29','',0,'care',5,0,0,2,NULL,NULL),(13,9,'000013_291122_9',0,0,'1 D',4,5,'Dr.Md.Golam Kawsar(Himel)','Bangal Islami Life Insurence',3127,3127,'paid',1,'2022-11-29 23:33:48','2022-11-29 17:33:48','2022-11-29','',0,'care',5,1,3,0,NULL,NULL),(14,10,'000014_021222_10',200,0,'12  D  7  M  37  Y',4,3,'Dr.Md.Golam Kawsar(Himel)','Dr.Younus Khan ',3127,2927,'paid',1,'2022-12-02 22:53:31','2022-12-02 16:53:31','2022-12-02','Dr,Kamal',0,'care',5,0,0,4,NULL,NULL),(15,10,'000015_031222_10',200,0,'12  D  7  M  37  Y',0,3,'self','Dr.Younus Khan ',2327,2127,'paid',1,'2022-12-03 15:27:01','2022-12-03 09:27:01','2022-12-03','Md Sir',0,'care',5,0,0,4,NULL,NULL),(16,11,'000016_031222_11',100,0,'30 Y',3,21,'Dr.Younus Khan ','Md.Tanvir Ahmed Mia (Arif) ',3702,3602,'paid',1,'2022-12-03 15:36:11','2022-12-03 09:36:11','2022-12-03','Tanver',0,'care',5,0,0,0,NULL,NULL),(17,12,'000017_031222_12',197,0,'26 Y',4,21,'Dr.Md.Golam Kawsar(Himel)','Md.Tanvir Ahmed Mia (Arif) ',4197,4000,'paid',1,'2022-12-03 15:42:41','2022-12-03 09:42:41','2022-12-03','Md Sir',0,'care',5,0,0,0,NULL,NULL),(18,9,'000018_031222_9',0,0,'6 D',4,5,'Dr.Md.Golam Kawsar(Himel)','Bangal Islami Life Insurence',527,0,'unpaid',1,'2022-12-03 16:15:43','2022-12-03 10:15:43','2022-12-03','',0,'care',5,1,3,0,NULL,NULL),(19,9,'000019_111222_9',0,0,'12  D  7  M  37  Y',0,3,'self','Dr.Younus Khan ',1727,0,'unpaid',1,'2022-12-11 23:59:53','2022-12-11 17:59:53','2022-12-11','',0,'moshiur',34,1,3,4,NULL,NULL),(20,9,'000020_141222_9',200,0,'17 D',4,5,'Dr.Md.Golam Kawsar(Himel)','Bangal Islami Life Insurence',747,547,'paid',1,'2022-12-14 02:08:01','2022-12-13 20:08:01','2022-12-14','Sheto',0,'care',5,1,3,0,NULL,NULL),(21,10,'000021_241222_10',0,0,'12  D  7  M  37  Y',0,3,'self','Dr.Younus Khan ',1327,0,'unpaid',1,'2022-12-24 13:43:18','2022-12-24 07:43:18','2022-12-24','',0,'care',5,0,0,4,NULL,NULL),(22,13,'000022_281222_13',0,0,'12  D  7  M  37  Y',0,6,'self','Dr.Shahida Sultana Nishe ',3947,0,'unpaid',1,'2022-12-28 16:28:46','2022-12-28 10:28:46','2022-12-28','',0,'Akter',32,0,0,3,NULL,NULL),(23,14,'000023_291222_14',0,0,'20 Y',3,3,'Dr.Younus Khan ','Dr.Younus Khan ',2827,2827,'paid',1,'2022-12-29 16:06:10','2022-12-29 10:06:10','2022-12-29','',0,'care',5,1,6,0,NULL,NULL),(24,15,'000024_290123_15',127,0,'',0,0,'self','self',1727,1600,'paid',1,'2023-01-29 15:58:10','2023-01-29 09:58:10','2023-01-29','DR',0,'care',5,0,0,0,NULL,NULL),(25,16,'000025_040223_16',0,0,'30 Y',3,3,'Dr.Younus Khan MBBS, FCPS Medicine','Dr.Younus Khan MBBS, FCPS Medicine',2047,2047,'paid',1,'2023-02-04 10:50:56','2023-02-04 04:50:56','2023-02-04','',0,'care',5,0,0,0,NULL,NULL),(26,17,'000026_040223_17',0,0,'9 D',3,26,'Dr.Younus Khan MBBS, FCPS Medicine','Dr.Imran Khan ',205,205,'paid',1,'2023-02-04 10:55:45','2023-02-04 04:55:45','2023-02-04','',0,'care',5,1,10,0,NULL,NULL),(27,18,'000027_240223_18',200,0,'20 Y',4,5,'Dr.Md.Golam Kawsar(Himel)','Bangal Islami Life Insurence',3077,2877,'paid',1,'2023-02-24 15:59:56','2023-02-24 22:08:35','2023-02-24',NULL,0,'care',5,0,0,0,NULL,NULL),(28,19,'000028_240223_19',0,0,'16  D  15  Y',0,3,'self','Dr.Younus Khan MBBS, FCPS Medicine',1500,1500,'paid',1,'2023-02-24 16:05:40','2023-02-24 10:05:40','2023-02-24','',0,'care',5,0,0,10,NULL,NULL),(29,17,'000029_240223_17',0,0,'29 D',3,26,'Dr.Younus Khan MBBS, FCPS Medicine','Dr.Imran Khan ',2927,2927,'paid',1,'2023-02-24 16:35:31','2023-02-24 10:35:31','2023-02-24','',0,'care',5,1,10,0,NULL,NULL),(30,17,'000030_240223_17',0,0,'29 D',3,26,'Dr.Younus Khan MBBS, FCPS Medicine','Dr.Imran Khan ',3527,0,'unpaid',1,'2023-02-24 16:36:45','2023-02-25 23:51:12','2023-02-24',NULL,0,'care',5,1,10,0,NULL,NULL),(31,17,'000031_240223_17',0,0,'29 D',3,26,'Dr.Younus Khan MBBS, FCPS Medicine','Dr.Imran Khan ',1327,1327,'paid',1,'2023-02-24 16:50:04','2023-02-24 10:50:04','2023-02-24','',0,'care',5,1,10,0,NULL,NULL),(32,20,'000032_240223_20',0,0,'23  Y',3,5,'Dr.Younus Khan MBBS, FCPS Medicine','Bangal Islami Life Insurence',1327,0,'unpaid',1,'2023-02-24 17:19:47','2023-02-24 11:19:47','2023-02-24','',0,'care',5,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `opd_patient_test_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_patient_test_order_info_history`
--

DROP TABLE IF EXISTS `opd_patient_test_order_info_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opd_patient_test_order_info_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `patient_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `parent_order_id` int(11) NOT NULL,
  `test_order_id` varchar(255) DEFAULT NULL,
  `total_discount` double NOT NULL,
  `vat` double NOT NULL DEFAULT '0',
  `ref_doc_id` int(11) NOT NULL DEFAULT '0',
  `quack_doc_id` int(11) NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `paid_amount` double NOT NULL DEFAULT '0',
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `entry_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `reason` int(11) NOT NULL DEFAULT '0' COMMENT '1=edit 2=delete',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `delete_reason_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_patient_test_order_info_history`
--

LOCK TABLES `opd_patient_test_order_info_history` WRITE;
/*!40000 ALTER TABLE `opd_patient_test_order_info_history` DISABLE KEYS */;
INSERT INTO `opd_patient_test_order_info_history` VALUES (1,18,'Mr:Jamal','0181326598',27,'000027_240223_18',200,0,4,5,3577,3377,'unpaid',NULL,1,1,'2023-02-24 16:08:35','2023-02-24 10:08:35',NULL,NULL),(2,17,'Mr:Salam Miah','123455533433',30,'000030_240223_17',0,0,3,26,3927,3927,'unpaid',NULL,1,1,'2023-02-25 17:51:12','2023-02-25 11:51:12',NULL,NULL);
/*!40000 ALTER TABLE `opd_patient_test_order_info_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_info`
--

DROP TABLE IF EXISTS `operation_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hospital_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operation_status` int(11) DEFAULT '1' COMMENT '1=active,2=delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_info`
--

LOCK TABLES `operation_info` WRITE;
/*!40000 ALTER TABLE `operation_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_patient_list`
--

DROP TABLE IF EXISTS `operation_patient_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_patient_list` (
  `opid` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `patient_info_id` varchar(255) DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `ref_doc_name` varchar(250) DEFAULT NULL,
  `ref_doc_name_q` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `parents_name` varchar(255) DEFAULT NULL,
  `parents_contact` varchar(255) DEFAULT NULL,
  `parents_address` varchar(255) DEFAULT NULL,
  `gurdian_name` varchar(255) DEFAULT NULL,
  `operation_cost` double(10,2) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `discount_ref` text,
  `total` double(10,2) DEFAULT NULL,
  `advance` double(10,2) DEFAULT NULL,
  `due` double(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `add_by` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `operation_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_patient_list`
--

LOCK TABLES `operation_patient_list` WRITE;
/*!40000 ALTER TABLE `operation_patient_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_patient_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outdoor_service_details`
--

DROP TABLE IF EXISTS `outdoor_service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outdoor_service_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ipd Diagnostic Service',
  `service_id` int(11) NOT NULL DEFAULT '0',
  `p_id` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `operated_id` int(11) DEFAULT NULL,
  `operated_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outdoor_service_details`
--

LOCK TABLES `outdoor_service_details` WRITE;
/*!40000 ALTER TABLE `outdoor_service_details` DISABLE KEYS */;
INSERT INTO `outdoor_service_details` VALUES (1,2,0,500,1,1,NULL,NULL,'2023-02-24 17:15:54','2023-02-24 11:15:54'),(2,5,0,200,2,1,NULL,NULL,'2023-02-24 17:15:54','2023-02-24 11:15:54'),(3,6,0,300,2,1,NULL,NULL,'2023-02-24 17:15:54','2023-02-24 11:15:54'),(4,7,0,300,1,1,NULL,NULL,'2023-02-24 17:15:54','2023-02-24 11:15:54'),(5,8,0,500,1,1,NULL,NULL,'2023-02-24 17:15:54','2023-02-24 11:15:54');
/*!40000 ALTER TABLE `outdoor_service_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outdoor_service_order_info`
--

DROP TABLE IF EXISTS `outdoor_service_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outdoor_service_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ipd Diagnostic Service',
  `patient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cabin_no` int(11) NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `total_paid` double NOT NULL DEFAULT '0',
  `reg_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_discount` double NOT NULL DEFAULT '0',
  `total_vat` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 0= inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outdoor_service_order_info`
--

LOCK TABLES `outdoor_service_order_info` WRITE;
/*!40000 ALTER TABLE `outdoor_service_order_info` DISABLE KEYS */;
INSERT INTO `outdoor_service_order_info` VALUES (1,'Mr;Kamal','034646464',0,2300,2000,'000001',300,0,2000,'2023-02-24 17:15:54','2023-02-24 11:15:54','care',5,1);
/*!40000 ALTER TABLE `outdoor_service_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pack_size_info`
--

DROP TABLE IF EXISTS `pack_size_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pack_size_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pack_size_info`
--

LOCK TABLES `pack_size_info` WRITE;
/*!40000 ALTER TABLE `pack_size_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pack_size_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pathologoy`
--

DROP TABLE IF EXISTS `pathologoy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pathologoy` (
  `pathologoy_id` int(150) NOT NULL AUTO_INCREMENT,
  `patient_id` int(150) DEFAULT NULL,
  `order_id` int(150) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `padate` datetime DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `test_id` int(150) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `speciman` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delievery_status` int(150) DEFAULT '1' COMMENT '1=Receive,2=Sent to lab,3=On Reception,4=Delivered',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2 =delete',
  `is_multi_print` int(11) NOT NULL DEFAULT '2' COMMENT '1=yes 2= no 3=combine',
  `combined_group_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pathologoy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pathologoy`
--

LOCK TABLES `pathologoy` WRITE;
/*!40000 ALTER TABLE `pathologoy` DISABLE KEYS */;
INSERT INTO `pathologoy` VALUES (1,1,1,'2022-10-30','2022-10-30 17:02:21',NULL,4,1,NULL,NULL,1,1,1,'1'),(2,1,1,'2022-10-30','2022-10-30 17:02:21',NULL,5,1,NULL,NULL,1,1,1,'1'),(3,1,1,'2022-10-30','2022-10-30 17:02:21',NULL,6,1,NULL,NULL,1,1,1,'1'),(4,1,1,'2022-10-30','2022-10-30 17:02:21',NULL,7,1,NULL,NULL,1,1,1,'1'),(5,1,1,'2022-10-30','2022-10-30 17:02:21',NULL,8,1,NULL,NULL,1,1,1,'1'),(6,2,2,'2022-10-30','2022-10-30 17:39:28',NULL,4,1,NULL,NULL,1,1,1,NULL),(7,2,2,'2022-10-30','2022-10-30 17:39:28',NULL,5,1,NULL,NULL,1,1,1,NULL),(8,3,3,'2022-11-28','2022-11-28 13:25:15',NULL,4,1,NULL,NULL,1,1,1,NULL),(9,3,3,'2022-11-28','2022-11-28 13:25:15',NULL,5,1,NULL,NULL,1,1,1,NULL),(10,3,3,'2022-11-28','2022-11-28 13:25:15',NULL,7,1,NULL,NULL,1,1,1,NULL),(11,4,4,'2022-11-28','2022-11-28 18:15:07',NULL,39,5,NULL,NULL,1,1,1,NULL),(12,5,5,'2022-11-28','2022-11-28 18:20:35',NULL,39,5,NULL,NULL,1,1,1,NULL),(13,3,6,'2022-11-28','2022-11-28 18:23:19',NULL,39,5,NULL,NULL,1,1,1,NULL),(14,1,7,'2022-11-28','2022-11-28 18:26:32','0000-00-00',39,0,'                    </br></br></br></br></br></br>  \r\n\r\n                    <div  class=\"container-middle\">\r\n                      <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 15px 15px 0 0 !important;padding: 3px; border-bottom: none;\">\r\n                        <tr>\r\n                          <td><b>Bill No: </b>000007_281122_1</td>\r\n\r\n                          <td><b>Date: </b>28.11.2022 12:00 am</td>\r\n\r\n                          <td><b>P_ID: </b>1</td>\r\n                        </tr>\r\n\r\n\r\n\r\n                        <tr><td><b>Name: </b>Mrs,Hasina Begum</td>\r\n\r\n                          <td ><b>Age: </b> Year</td>\r\n                          <td><b>Sex: </b>\r\n                           M                        </td>\r\n                      </tr>\r\n\r\n                    </table>\r\n\r\n                    <table style=\" border: 1px solid black; font-size:20px; margin-left: 46px; width: 839px; border-radius: 0 0 15px 15px !important;padding: 3px; border-top: none\">\r\n\r\n                      <tr><td><b>Dr: </b>self </td></tr>\r\n\r\n                      <tr>\r\n                        <td><b>Specimen: </b>Imaging</td>\r\n\r\n                      </tr>\r\n\r\n                    </table>\r\n\r\n\r\n\r\n\r\n\r\n                    <div class=\"bio-chemestry-div\">  \r\n                      Ultrasund                    </div>   \r\n                    \r\n\r\n                        \r\n\r\n                        \r\n\r\n                        \r\n\r\n                        \r\n\r\n                        \r\n\r\n                        \r\n\r\n                                                  <style type=\"text/css\" media=\"screen\">\r\n\r\n\r\n                          \r\n                          .farhana-table-1-col-1{\r\n                            vertical-align: top;\r\n                          }\r\n                          .first-h1{\r\n                            font-size:22px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            font-weight: 600;\r\n                          }\r\n                          .first-p{\r\n                            font-size:20px;  \r\n                            color:#111111; \r\n                            text-align: left; \r\n                            margin-top: -13px;\r\n\r\n                          }\r\n                          .first-p-1{\r\n                            font-size:20px;  \r\n                            color:#111111!important; \r\n                            text-align: left; \r\n                            margin-top: -10px;\r\n                            font-family: \'BenchNine\', sans-serif;\r\n\r\n                          }\r\n\r\n                          .farhana-table-2{\r\n                            width: 100%;\r\n\r\n                          }\r\n                          .bio-chemestry-1{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 7px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .bio-chemestry{\r\n                            border: 1px solid #111111;\r\n                            border-radius: 8px;\r\n                            width: 90%;\r\n                            margin: 15px auto;\r\n                            padding-bottom: 0px;\r\n                            height: auto;\r\n                          }\r\n                          .table-1-col-1{\r\n                           width: 33%;\r\n                           text-align: center;\r\n                         }\r\n                         .table-1-col-1 p{\r\n\r\n                          font-weight: bold;\r\n                          text-align: center;\r\n                          font-size: 20px;\r\n                          text-decoration: underline;\r\n                        }\r\n                        .farhana-table-3 {\r\n                          margin:0 auto;\r\n                          width: 90%;\r\n                          margin-top: 10px;\r\n                          border: 1px solid #111111;\r\n                          border-radius: 8px;\r\n                        }\r\n                        .farhana-table-3 tr td{\r\n                          font-size: 20px;\r\n                          width: 80px;\r\n\r\n\r\n                        }\r\n\r\n                        .bio-chemestry-div{\r\n                         text-align: center;\r\n                         font-size: 22px;\r\n                         font-weight: 600;\r\n                         letter-spacing: 2px;\r\n                         margin-top: 10px;\r\n                       }\r\n                       .farhana-table-3 tr td:first-child{\r\n                        width: 80px;\r\n                        text-align: right;\r\n\r\n                      }\r\n                      .farhana-table-3 tr td:nth-child(2){\r\n                        width: 80px;\r\n\r\n                      }\r\n\r\n\r\n                      .farhana-table-3 tr td:last-child{\r\n                        width: 80px;\r\n\r\n                      }\r\n                      .table-3-text-right{\r\n                        text-align: right!important;\r\n                      }\r\n\r\n\r\n                      .farhana-table-5 {\r\n                        margin:0 auto;\r\n                        width: 90%!important;\r\n                        margin-top: 10px;\r\n                        border: 1px solid #111111;\r\n                        border-radius: 8px;\r\n                      }\r\n                      .doctor-name{\r\n                        font-size: 20px;\r\n                      }\r\n                      .text-right{\r\n                        text-align: right;\r\n                      }\r\n                      .text-center{\r\n                        text-align: center;\r\n                      }\r\n                      .farhana-table-4 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 {\r\n\r\n                        width: 100%;\r\n                        margin: 0 auto;\r\n\r\n                        border-collapse: collapse;\r\n\r\n                        font-size: 18px;\r\n                        border-radius: 8px !important;\r\n                      }\r\n                      .farhana-table-4-1 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        border-bottom: 0px solid #111111;\r\n                        text-transform: uppercase;\r\n                      }\r\n\r\n                      .farhana-table-4-1 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 40%;\r\n                        border-left: none !important;\r\n\r\n                        border-bottom-left-radius: 8px;\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n                      .farhana-table-4-1 tr th:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4-1 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                        border-bottom-right-radius: 8px;\r\n                        border-top-right-radius: 8px;\r\n                      }\r\n\r\n                      .farhana-table-4-tr{\r\n                        border-top-left-radius: 8px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-4 tr th{\r\n                        border: 1px solid #111111;\r\n                        border-top: 0px solid #ffffff!important;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        background: #c6b5b5;\r\n                        word-spacing: 2px;\r\n                        text-transform: uppercase;\r\n                        border-top-left-radius: 8px;\r\n                        border-top-right-radius: 8px\r\n                      }\r\n                      .farhana-table-4 tr th:first-child{\r\n                        text-align: left;\r\n                        width: 45%;\r\n                        border-left:none!important;\r\n                      }\r\n                      .farhana-table-4 tr th:nth-child(2)\r\n                      {\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr th:last-child{\r\n                        text-align: left;\r\n                        width: 30%;\r\n                        border-right:none!important;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(3){\r\n                        text-align: center;\r\n\r\n                      }\r\n\r\n                      .farhana-table-4 tr td:first-child{\r\n                        text-align: left;\r\n                        border-left:none!important;\r\n                        width: 40%;\r\n                      }\r\n                      .farhana-table-4 tr td:nth-child(2){\r\n                        text-align: center;\r\n                        width: 20%;\r\n                      }\r\n                      .farhana-table-4 tr td:last-child{\r\n                        text-align: left;\r\n                        border-right:none!important;\r\n                        width: 30%;\r\n                      }\r\n                      .farhana-table-4 tr td{\r\n                        border: 1px solid #111111;\r\n                        border-collapse: collapse!important;\r\n                        text-align: center;\r\n                        padding: 2px;\r\n                        padding-left: 7px;\r\n                        border-bottom: 0px solid #fff;\r\n                      }\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 3px;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        padding-left: 7px;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        padding-right: 7px;\r\n                      }\r\n\r\n\r\n\r\n                      .farhana-table-6{\r\n                        margin-top: 10px;\r\n                        width: 95%;\r\n                        margin:0 auto;\r\n\r\n                      }\r\n\r\n                      .farhana-table-5 tr th:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr th:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n                        text-decoration: underline;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:first-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: left;\r\n\r\n                      }\r\n                      .farhana-table-5 tr td:last-child{\r\n                        width: 50%;\r\n                        font-size: 20px;\r\n                        text-align: right;\r\n\r\n                      }\r\n\r\n                      .tranform-text{\r\n                        font-size: 22px!important;\r\n                        font-weight: bold;\r\n                        transform: rotate(-30deg);\r\n                        text-align: center;\r\n                        vertical-align: middle;\r\n                        width: 57%;\r\n                      }\r\n                      .unit-class{\r\n                        font-size:20px;\r\n                        padding: 30px 0px;\r\n                      }\r\n                      .delivery{\r\n                        font-size:10px;\r\n                      }\r\n                      .last-p{\r\n                        padding: 4px;\r\n                        font-size: 20px;\r\n                        border:1px solid #111111;\r\n                        border-radius: 13px;\r\n                        width: 163px;\r\n                        margin:10px 0px;\r\n                      }\r\n                      .print{\r\n                        font-size: 20px;\r\n                      }\r\n                      .authorize{\r\n                        font-size:20px;\r\n                        text-decoration: overline;\r\n                        text-align: right;\r\n                      }\r\n                      .blank{\r\n                        height: 10px!important;\r\n                      }\r\n                    </style>\r\n\r\n                           \r\n                      <div class=\"bio-chemestry\"><div align=\"center\">\r\n\r\n</div><div align=\"center\"><br><p class=\"MsoNormal\" align=\"center\" style=\"margin-bottom: 0.0001pt;\"><b><u><span style=\"font-size:20.0pt;mso-bidi-font-size:11.0pt;line-height:115%\">USG OF\r\nWHOLE ABDOMEN (Female)</span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"margin-bottom: 0.0001pt;\"><b><u><span style=\"font-size:20.0pt;mso-bidi-font-size:11.0pt;line-height:115%\"><br></span></u></b></p>\r\n\r\n<h1 style=\"text-align: left; margin-bottom: 0.0001pt;\"></h1><h2 style=\"text-align: left; margin-bottom: 0.0001pt; line-height: normal;\"><p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Liver</span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">: Liver is normal in size with\r\nnormal  parenchymal  echogenisty.</span></b><span style=\"font-size:\r\n18.0pt;font-family:\"Corbel Light\",\"sans-serif\";mso-fareast-font-family:\"Times New Roman\";\r\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;color:black;\r\nletter-spacing:.1pt\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">IHD are not\r\ndilated.</span></b><span style=\"font-size:18.0pt;font-family:\"Corbel Light\",\"sans-serif\";\r\nmso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\r\nmso-bidi-theme-font:minor-latin;color:black;letter-spacing:.1pt\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom: 0.0001pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">GB</span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">: GB is well distended with normal wall\r\nthickness.No echogenic  structure is seen in the gall bladder .</span></b><span style=\"font-size:18.0pt;font-family:\"Corbel Light\",\"sans-serif\";mso-fareast-font-family:\r\n\"Times New Roman\";mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;\r\ncolor:black;letter-spacing:.1pt\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\nnormal\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Pancreas </span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">: Pancreas is normal size & shape. </span></b><span style=\"font-size:18.0pt;font-family:\"Corbel Light\",\"sans-serif\";mso-fareast-font-family:\r\n\"Times New Roman\";mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\nnormal\"><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">With\r\nnormal  parenchymal echotexture.</span></b><span style=\"font-size:18.0pt;\r\nfont-family:\"Corbel Light\",\"sans-serif\";mso-fareast-font-family:\"Times New Roman\";\r\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\nnormal\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Spleen</span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\"> :  Spleen is normal in size\r\nwith normal echogenisity.</span></b><b><span style=\"font-size:18.0pt;\r\nfont-family:\"Corbel Light\",\"sans-serif\";mso-fareast-font-family:\"Times New Roman\";\r\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n11.1pt\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Kidney</span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\"> : Both Kidney are normal in size\r\nand shape. CMD is well differentiated. PC System is not dilated.<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n11.1pt\"><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\"><u>Urinary\r\nBladder:</u> UB is well filled with normal  wall\r\nthickness. No intra vesicular lesion is seen.<u><o:p></o:p></u></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n11.1pt\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Uterus:</span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\"> Uterus is normal in\r\nsize& shape,anteverted in position. Endometrial cavity is empty.Myometrial\r\nechogenicity appears homogenous echo texture. Cervix is normal in size\r\n& shape.<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n11.1pt\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Adenexae –Both\r\novaries appear normal.<o:p></o:p></span></u></b></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n11.1pt\"><b><u><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">Cul-De-Sac</span></u></b><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\">: No fluid collection in \r\nCul-De-Sac.</span></b></p><p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;mso-line-height-alt:\r\n11.1pt\"><b><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\"><br></span></b></p><p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\nnormal\"><span style=\"font-size:18.0pt;font-family:\"Corbel Light\",\"sans-serif\";\r\nmso-fareast-font-family:\"Times New Roman\";mso-bidi-font-family:Calibri;\r\nmso-bidi-theme-font:minor-latin\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-bottom:0in;margin-bottom:.0001pt;line-height:\r\nnormal\"><span style=\"font-size: 18pt; font-family: \"Corbel Light\", \"sans-serif\"; letter-spacing: 0.1pt;\"><b>Comment:\r\nNormal Study. </b></span><b><span style=\"font-size:18.0pt;font-family:\r\n\"Corbel Light\",\"sans-serif\";mso-fareast-font-family:\"Times New Roman\";\r\nmso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin\"><o:p></o:p></span></b></p></h2>\r\n<!--[if !supportLineBreakNewLine]-->\r\n<!--[endif]--><span style=\"font-size:12.0pt;font-family:\" tempus=\"\" sans=\"\" itc\";=\"\" mso-fareast-font-family:\"times=\"\" new=\"\" roman\";mso-bidi-font-family:calibri;=\"\" mso-bidi-theme-font:minor-latin\"=\"\"><o:p></o:p></span><p></p><p class=\"MsoNormal\" style=\"text-align: left; margin-bottom: 0.0001pt; line-height: 200%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p></div>  \r\n                      </div>\r\n\r\n                                                                                                                                                                                    \r\n                   </div>\r\n\r\n                 ','Imaging',3,1,1,NULL),(15,6,8,'2022-11-28','2022-11-28 18:44:25',NULL,39,5,NULL,NULL,1,1,1,NULL),(16,7,9,'2022-11-28','2022-11-28 18:46:31',NULL,39,5,NULL,NULL,1,1,1,NULL),(17,5,10,'2022-11-28','2022-11-28 18:49:46',NULL,39,5,NULL,NULL,1,1,1,NULL),(18,8,11,'2022-11-29','2022-11-29 23:29:17',NULL,4,1,NULL,NULL,1,1,1,NULL),(19,8,11,'2022-11-29','2022-11-29 23:29:17',NULL,5,1,NULL,NULL,1,1,1,NULL),(20,8,11,'2022-11-29','2022-11-29 23:29:17',NULL,6,1,NULL,NULL,1,1,1,NULL),(21,8,11,'2022-11-29','2022-11-29 23:29:17',NULL,16,2,NULL,NULL,1,1,2,NULL),(22,8,11,'2022-11-29','2022-11-29 23:29:18',NULL,196,2,NULL,NULL,1,1,2,NULL),(23,8,11,'2022-11-29','2022-11-29 23:29:18',NULL,23,2,NULL,NULL,1,1,2,NULL),(24,4,12,'2022-11-29','2022-11-29 23:32:27',NULL,4,1,NULL,NULL,1,1,3,'1,2'),(25,4,12,'2022-11-29','2022-11-29 23:32:27',NULL,5,1,NULL,NULL,1,1,3,'1,2'),(26,4,12,'2022-11-29','2022-11-29 23:32:27',NULL,6,1,NULL,NULL,1,1,3,'1,2'),(27,4,12,'2022-11-29','2022-11-29 23:32:27',NULL,16,2,NULL,NULL,1,1,3,'1,2'),(28,4,12,'2022-11-29','2022-11-29 23:32:27',NULL,196,2,NULL,NULL,1,1,3,'1,2'),(29,4,12,'2022-11-29','2022-11-29 23:32:27',NULL,23,2,NULL,NULL,1,1,3,'1,2'),(30,9,13,'2022-11-29','2022-11-29 23:33:48',NULL,4,1,NULL,NULL,1,1,1,'1,2'),(31,9,13,'2022-11-29','2022-11-29 23:33:48',NULL,5,1,NULL,NULL,1,1,1,'1,2'),(32,9,13,'2022-11-29','2022-11-29 23:33:48',NULL,6,1,NULL,NULL,1,1,1,'1,2'),(33,9,13,'2022-11-29','2022-11-29 23:33:48',NULL,7,1,NULL,NULL,1,1,1,'1,2'),(34,9,13,'2022-11-29','2022-11-29 23:33:48',NULL,196,2,NULL,NULL,1,1,1,'1,2'),(35,9,13,'2022-11-29','2022-11-29 23:33:48',NULL,23,2,NULL,NULL,1,1,1,'1,2'),(36,10,14,'2022-12-02','2022-12-02 22:53:31',NULL,4,1,NULL,NULL,1,1,1,NULL),(37,10,14,'2022-12-02','2022-12-02 22:53:31',NULL,5,1,NULL,NULL,1,1,1,NULL),(38,10,14,'2022-12-02','2022-12-02 22:53:31',NULL,6,1,NULL,NULL,1,1,1,NULL),(39,10,14,'2022-12-02','2022-12-02 22:53:31',NULL,16,2,NULL,NULL,1,1,1,NULL),(40,10,14,'2022-12-02','2022-12-02 22:53:31',NULL,196,2,NULL,NULL,1,1,1,NULL),(41,10,14,'2022-12-02','2022-12-02 22:53:31',NULL,23,2,NULL,NULL,1,1,1,NULL),(42,10,15,'2022-12-03','2022-12-03 15:27:01',NULL,16,2,NULL,NULL,1,1,2,NULL),(43,10,15,'2022-12-03','2022-12-03 15:27:01',NULL,196,2,NULL,NULL,1,1,2,NULL),(44,10,15,'2022-12-03','2022-12-03 15:27:01',NULL,33,5,NULL,NULL,1,1,2,NULL),(45,11,16,'2022-12-03','2022-12-03 15:36:11',NULL,27,4,NULL,NULL,1,1,2,NULL),(46,11,16,'2022-12-03','2022-12-03 15:36:11',NULL,7,1,NULL,NULL,1,1,2,NULL),(47,11,16,'2022-12-03','2022-12-03 15:36:11',NULL,33,5,NULL,NULL,1,1,2,NULL),(48,11,16,'2022-12-03','2022-12-03 15:36:11',NULL,86,8,NULL,NULL,1,1,2,NULL),(49,11,16,'2022-12-03','2022-12-03 15:36:11',NULL,236,9,NULL,NULL,1,1,1,NULL),(50,12,17,'2022-12-03','2022-12-03 15:42:41',NULL,27,4,NULL,NULL,1,1,1,NULL),(51,12,17,'2022-12-03','2022-12-03 15:42:41',NULL,111,2,NULL,NULL,1,1,1,NULL),(52,12,17,'2022-12-03','2022-12-03 15:42:41',NULL,86,8,NULL,NULL,1,1,2,NULL),(53,12,17,'2022-12-03','2022-12-03 15:42:41',NULL,33,5,NULL,NULL,1,1,2,NULL),(54,9,18,'2022-12-03','2022-12-03 16:15:43',NULL,4,1,NULL,NULL,1,1,1,NULL),(55,9,19,'2022-12-11','2022-12-11 23:59:53',NULL,308,2,NULL,NULL,1,1,2,NULL),(56,9,19,'2022-12-11','2022-12-11 23:59:53',NULL,16,2,NULL,NULL,1,1,2,NULL),(57,9,20,'2022-12-14','2022-12-14 02:08:01',NULL,341,4,NULL,NULL,1,1,2,NULL),(58,9,20,'2022-12-14','2022-12-14 02:08:01',NULL,196,2,NULL,NULL,1,1,2,NULL),(59,10,21,'2022-12-24','2022-12-24 13:43:18',NULL,4,1,NULL,NULL,1,1,2,NULL),(60,10,21,'2022-12-24','2022-12-24 13:43:18',NULL,5,1,NULL,NULL,1,1,2,NULL),(61,13,22,'2022-12-28','2022-12-28 16:28:46',NULL,27,4,NULL,NULL,1,1,1,NULL),(62,13,22,'2022-12-28','2022-12-28 16:28:46',NULL,16,2,NULL,NULL,1,1,1,NULL),(63,13,22,'2022-12-28','2022-12-28 16:28:46',NULL,308,2,NULL,NULL,1,1,1,NULL),(64,13,22,'2022-12-28','2022-12-28 16:28:46',NULL,18,2,NULL,NULL,1,1,1,NULL),(65,13,22,'2022-12-28','2022-12-28 16:28:46',NULL,19,2,NULL,NULL,1,1,1,NULL),(66,13,22,'2022-12-28','2022-12-28 16:28:46',NULL,21,2,NULL,NULL,1,1,1,NULL),(67,14,23,'2022-12-29','2022-12-29 16:06:10',NULL,4,1,NULL,NULL,1,1,1,NULL),(68,14,23,'2022-12-29','2022-12-29 16:06:10',NULL,5,1,NULL,NULL,1,1,1,NULL),(69,14,23,'2022-12-29','2022-12-29 16:06:10',NULL,33,5,NULL,NULL,1,1,2,NULL),(70,15,24,'2023-01-29','2023-01-29 15:58:10',NULL,4,1,NULL,NULL,1,1,2,NULL),(71,15,24,'2023-01-29','2023-01-29 15:58:10',NULL,5,1,NULL,NULL,1,1,2,NULL),(72,15,24,'2023-01-29','2023-01-29 15:58:10',NULL,6,1,NULL,NULL,1,1,2,NULL),(73,16,25,'2023-02-04','2023-02-04 10:50:56',NULL,27,4,NULL,NULL,1,1,1,'1,2,'),(74,16,25,'2023-02-04','2023-02-04 10:50:56',NULL,16,2,NULL,NULL,1,1,3,'1,2,'),(75,16,25,'2023-02-04','2023-02-04 10:50:56',NULL,196,2,NULL,NULL,1,1,3,'1,2,'),(76,16,25,'2023-02-04','2023-02-04 10:50:56',NULL,7,1,NULL,NULL,1,1,3,'1,2,'),(77,17,26,'2023-02-04','2023-02-04 10:55:45',NULL,236,9,NULL,NULL,1,1,1,NULL),(79,18,27,'2023-02-24','2023-02-24 15:59:56',NULL,5,1,NULL,NULL,1,1,2,NULL),(80,18,27,'2023-02-24','2023-02-24 15:59:56',NULL,33,5,NULL,NULL,1,1,2,NULL),(81,18,27,'2023-02-24','2023-02-24 15:59:56',NULL,86,8,NULL,NULL,1,1,2,NULL),(82,19,28,'2023-02-24','2023-02-24 16:05:40',NULL,33,5,NULL,NULL,1,1,2,NULL),(83,17,29,'2023-02-24','2023-02-24 16:35:31',NULL,4,1,NULL,NULL,1,1,1,NULL),(84,17,29,'2023-02-24','2023-02-24 16:35:31',NULL,5,1,NULL,NULL,1,1,1,NULL),(85,17,29,'2023-02-24','2023-02-24 16:35:31',NULL,16,2,NULL,NULL,1,1,2,NULL),(86,17,29,'2023-02-24','2023-02-24 16:35:31',NULL,111,2,NULL,NULL,1,1,2,NULL),(87,17,30,'2023-02-24','2023-02-24 16:36:45',NULL,4,1,NULL,NULL,1,1,3,'1,2'),(88,17,30,'2023-02-24','2023-02-24 16:36:45',NULL,5,1,NULL,NULL,1,1,3,'1,2'),(90,17,30,'2023-02-24','2023-02-24 16:36:45',NULL,23,2,NULL,NULL,1,1,3,'1,2'),(91,17,30,'2023-02-24','2023-02-24 16:36:45',NULL,24,2,NULL,NULL,1,1,3,'1,2'),(92,17,30,'2023-02-24','2023-02-24 16:36:45',NULL,111,2,NULL,NULL,1,1,3,'1,2'),(93,17,31,'2023-02-24','2023-02-24 16:50:04',NULL,4,1,NULL,NULL,1,1,1,NULL),(94,17,31,'2023-02-24','2023-02-24 16:50:04',NULL,5,1,NULL,NULL,1,1,1,NULL),(95,20,32,'2023-02-24','2023-02-24 17:19:47',NULL,4,1,NULL,NULL,1,1,2,NULL),(96,20,32,'2023-02-24','2023-02-24 17:19:47',NULL,5,1,NULL,NULL,1,1,2,NULL);
/*!40000 ALTER TABLE `pathologoy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_timeline`
--

DROP TABLE IF EXISTS `patient_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '1 = registration 2=cabin transfer 3= release 4=operation',
  `cabin_no` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_timeline`
--

LOCK TABLES `patient_timeline` WRITE;
/*!40000 ALTER TABLE `patient_timeline` DISABLE KEYS */;
INSERT INTO `patient_timeline` VALUES (1,1,0,1,5,'2022-11-01 13:35:23','2022-11-01 07:35:23'),(2,2,0,1,7,'2022-11-06 00:36:01','2022-11-05 18:36:01'),(3,2,0,3,7,'2022-11-06 00:37:05','2022-11-05 18:37:05'),(4,1,0,3,5,'2022-11-15 23:01:12','2022-11-15 17:01:12'),(5,3,0,1,5,'2022-11-28 12:58:00','2022-11-28 06:58:00'),(6,4,0,1,7,'2022-11-28 13:09:22','2022-11-28 07:09:22'),(7,4,0,3,7,'2022-11-29 22:43:46','2022-11-29 16:43:46'),(8,5,0,1,7,'2022-12-03 16:10:35','2022-12-03 10:10:35'),(9,5,0,3,7,'2022-12-03 16:12:58','2022-12-03 10:12:58'),(10,5,0,1,6,'2022-12-24 13:44:50','2022-12-24 07:44:50'),(11,3,0,3,5,'2022-12-24 13:46:21','2022-12-24 07:46:21'),(12,6,0,1,5,'2022-12-29 16:04:47','2022-12-29 10:04:47'),(13,7,0,1,7,'2023-01-03 21:27:01','2023-01-03 15:27:01'),(14,6,0,3,5,'2023-01-03 21:33:10','2023-01-03 15:33:10'),(15,8,0,1,5,'2023-01-08 18:34:29','2023-01-08 12:34:29'),(16,8,0,3,5,'2023-01-11 16:08:35','2023-01-11 10:08:35'),(17,7,0,3,7,'2023-01-23 22:16:59','2023-01-23 16:16:59'),(18,9,0,1,5,'2023-01-23 22:37:29','2023-01-23 16:37:29'),(19,9,0,3,5,'2023-01-23 22:38:13','2023-01-23 16:38:13'),(20,10,0,1,5,'2023-01-26 19:41:18','2023-01-26 13:41:18'),(21,11,0,1,7,'2023-02-24 17:02:14','2023-02-24 11:02:14'),(22,11,0,3,7,'2023-02-24 17:05:12','2023-02-24 11:05:12'),(23,10,0,3,5,'2023-02-24 17:10:55','2023-02-24 11:10:55');
/*!40000 ALTER TABLE `patient_timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_transaction_info`
--

DROP TABLE IF EXISTS `patient_transaction_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_transaction_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_test_order_id` int(11) NOT NULL DEFAULT '0',
  `transaction_id` bigint(20) NOT NULL DEFAULT '0',
  `bank_tran_id` varchar(255) DEFAULT NULL,
  `amount_to_pay` double NOT NULL DEFAULT '0',
  `amount_paid` double NOT NULL DEFAULT '0',
  `card_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_no` bigint(20) NOT NULL DEFAULT '0',
  `card_type` int(11) NOT NULL DEFAULT '0',
  `card_issuer_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_transaction_info`
--

LOCK TABLES `patient_transaction_info` WRITE;
/*!40000 ALTER TABLE `patient_transaction_info` DISABLE KEYS */;
INSERT INTO `patient_transaction_info` VALUES (1,1,1,NULL,3227,2500,NULL,0,0,NULL,NULL,1,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(2,2,2,NULL,1427,0,NULL,0,0,NULL,NULL,1,'2022-10-30 17:39:28','2022-10-30 11:39:28'),(3,3,3,NULL,1927,1727,NULL,0,0,NULL,NULL,1,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(4,4,4,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:15:07','2022-11-28 12:15:07'),(5,5,5,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:20:35','2022-11-28 12:20:35'),(6,6,3,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:23:19','2022-11-28 12:23:19'),(7,7,1,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:26:32','2022-11-28 12:26:32'),(8,8,6,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:44:25','2022-11-28 12:44:25'),(9,9,7,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:46:31','2022-11-28 12:46:31'),(10,10,5,NULL,1500,0,NULL,0,0,NULL,NULL,1,'2022-11-28 18:49:46','2022-11-28 12:49:46'),(11,11,8,NULL,3127,2927,NULL,0,0,NULL,NULL,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(12,12,4,NULL,3127,0,NULL,0,0,NULL,NULL,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(13,13,9,NULL,3127,0,NULL,0,0,NULL,NULL,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(14,14,10,NULL,3127,2927,NULL,0,0,NULL,NULL,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(15,15,10,NULL,2327,2127,NULL,0,0,NULL,NULL,1,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(16,16,11,NULL,3702,3602,NULL,0,0,NULL,NULL,1,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(17,17,12,NULL,4197,4000,NULL,0,0,NULL,NULL,1,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(18,18,9,NULL,527,0,NULL,0,0,NULL,NULL,1,'2022-12-03 16:15:43','2022-12-03 10:15:43'),(19,19,9,NULL,1727,0,NULL,0,0,NULL,NULL,1,'2022-12-11 23:59:53','2022-12-11 17:59:53'),(20,20,9,NULL,747,547,NULL,0,0,NULL,NULL,1,'2022-12-14 02:08:01','2022-12-13 20:08:01'),(21,21,10,NULL,1327,0,NULL,0,0,NULL,NULL,1,'2022-12-24 13:43:18','2022-12-24 07:43:18'),(22,22,13,NULL,3947,0,NULL,0,0,NULL,NULL,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(23,23,14,NULL,2827,0,NULL,0,0,NULL,NULL,1,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(24,24,15,NULL,1727,1000,NULL,0,0,NULL,NULL,1,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(25,25,16,NULL,2047,2047,NULL,0,0,NULL,NULL,1,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(26,26,17,NULL,205,205,NULL,0,0,NULL,NULL,1,'2023-02-04 10:55:45','2023-02-04 04:55:45'),(27,27,18,NULL,3577,3377,NULL,0,0,NULL,NULL,1,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(28,28,19,NULL,1500,1500,NULL,0,0,NULL,NULL,1,'2023-02-24 16:05:40','2023-02-24 10:05:40'),(29,29,17,NULL,2927,0,NULL,0,0,NULL,NULL,1,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(30,30,17,NULL,3927,0,NULL,0,0,NULL,NULL,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(31,31,17,NULL,1327,0,NULL,0,0,NULL,NULL,1,'2023-02-24 16:50:04','2023-02-24 10:50:04'),(32,32,20,NULL,1327,0,NULL,0,0,NULL,NULL,1,'2023-02-24 17:19:47','2023-02-24 11:19:47');
/*!40000 ALTER TABLE `patient_transaction_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_buy_id` int(11) NOT NULL,
  `cust_supp_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payment_type` int(1) NOT NULL COMMENT '1=cash; 2=check',
  `type` int(1) NOT NULL COMMENT '1=buy; 2=sell; 3=due or advance',
  `cash_out` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=when cash is out from my side',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'track who logged in system',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (3,2,0,0,1,2,0,5,'2022-11-04 20:58:10','2022-11-04 14:58:10'),(4,3,0,100,1,2,0,5,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(5,4,0,170,1,2,0,5,'2022-12-03 16:04:49','2022-12-03 10:04:49'),(6,2,1,0,1,1,0,5,'2022-12-03 16:07:06','2022-12-03 10:07:06'),(7,4,0,0,1,2,0,5,'2022-12-03 16:07:54','2022-12-03 10:07:54'),(8,5,0,0,1,2,0,5,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(9,5,5,177,1,2,0,5,'2022-12-29 16:08:51','2022-12-29 10:08:51'),(10,6,1,1000,1,2,0,5,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(11,1,1,0,1,2,0,5,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(12,7,1,0,1,2,0,5,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(13,8,1,0,1,2,0,5,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(14,9,0,0,1,2,0,5,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(15,9,0,0,1,2,0,5,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(16,9,0,0,1,2,0,5,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(17,9,0,0,1,2,0,5,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(18,10,0,170,1,2,0,5,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(19,11,0,110,1,2,0,5,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(20,1,1,2000,1,3,0,5,'2023-02-24 16:20:12','2023-02-24 10:20:12'),(21,12,0,0,1,2,0,5,'2023-02-24 17:21:12','2023-02-24 11:21:12');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_history` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_buy_id` int(11) NOT NULL,
  `cust_supp_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payment_type` int(1) NOT NULL COMMENT '1=cash; 2=check',
  `type` int(1) NOT NULL COMMENT '1=buy; 2=sell; 3=due or advance',
  `cash_out` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=when cash is out from my side',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'track who logged in system',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,473),(2,474),(3,475),(3,518),(4,476),(5,477),(6,478),(7,479),(8,480),(9,3),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(9,35),(9,36),(9,37),(9,38),(9,39),(9,40),(9,43),(9,44),(9,453),(9,467),(9,468),(9,469),(9,470),(9,473),(9,474),(9,475),(9,476),(9,486),(9,489),(10,9),(10,10),(10,11),(10,12),(10,13),(10,15),(10,16),(10,17),(10,18),(10,19),(10,90),(10,91),(10,139),(10,142),(10,163),(10,450),(10,458),(10,459),(10,460),(10,461),(10,462),(10,490),(11,20),(11,21),(12,4),(12,20),(12,21),(13,20),(13,21),(13,486),(15,473),(15,474),(15,475),(15,476),(15,477),(15,478),(15,479),(15,480),(15,489),(15,490),(17,473),(17,474),(17,475),(17,476),(17,477),(17,478),(17,479),(17,480),(17,489),(17,490),(18,367),(18,368),(18,369),(18,371),(18,372),(18,373),(18,395),(18,396),(18,398),(18,401),(18,404),(18,407),(18,409),(18,410),(18,411),(18,412),(18,413),(18,414),(18,415),(18,416),(18,417),(18,473),(18,474),(18,475),(18,476),(18,477),(18,478),(18,479),(18,480),(18,489),(18,490),(19,23),(19,24),(19,439),(19,441),(20,5),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(20,13),(20,14),(20,15),(20,16),(20,17),(20,18),(20,19),(20,90),(20,91),(20,139),(20,142),(20,163),(20,450),(20,458),(20,459),(20,460),(20,461),(20,462),(20,484),(20,485),(20,486),(21,9),(21,10),(21,11),(21,12),(21,13),(21,14),(21,15),(21,16),(21,17),(21,18),(21,19),(21,83),(21,86),(21,88),(21,90),(21,91),(21,139),(21,142),(21,163),(21,450),(21,458),(21,459),(21,460),(21,461),(21,462),(21,464),(21,465),(21,466),(21,484),(21,485),(21,486),(22,5),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(22,13),(22,14),(22,15),(22,16),(22,17),(22,18),(22,19),(22,83),(22,86),(22,88),(22,90),(22,91),(22,139),(22,142),(22,163),(22,450),(22,458),(22,459),(22,460),(22,461),(22,462),(22,464),(22,465),(22,466),(22,484),(22,485),(23,1),(23,3),(23,4),(23,5),(23,7),(23,8),(23,9),(23,10),(23,11),(23,12),(23,13),(23,14),(23,15),(23,16),(23,17),(23,18),(23,19),(23,20),(23,21),(23,22),(23,23),(23,24),(23,27),(23,28),(23,29),(23,30),(23,31),(23,32),(23,33),(23,34),(23,35),(23,36),(23,37),(23,38),(23,39),(23,40),(23,43),(23,44),(23,46),(23,47),(23,48),(23,49),(23,51),(23,52),(23,53),(23,55),(23,56),(23,57),(23,58),(23,59),(23,61),(23,62),(23,63),(23,64),(23,65),(23,66),(23,67),(23,68),(23,69),(23,70),(23,71),(23,72),(23,83),(23,86),(23,88),(23,90),(23,91),(23,139),(23,142),(23,163),(23,254),(23,257),(23,266),(23,367),(23,368),(23,369),(23,371),(23,372),(23,373),(23,395),(23,396),(23,398),(23,401),(23,404),(23,407),(23,409),(23,410),(23,411),(23,412),(23,413),(23,414),(23,415),(23,416),(23,417),(23,439),(23,441),(23,450),(23,452),(23,453),(23,454),(23,455),(23,456),(23,457),(23,458),(23,459),(23,460),(23,461),(23,462),(23,464),(23,465),(23,466),(23,467),(23,468),(23,469),(23,470),(23,471),(23,472),(23,473),(23,474),(23,475),(23,476),(23,477),(23,478),(23,479),(23,480),(23,481),(23,482),(23,483),(23,484),(23,485),(23,486),(23,487),(23,488),(23,489),(23,490),(23,491),(23,492),(23,493),(23,494),(23,495),(23,496),(23,497),(23,498),(23,499),(23,500),(23,501),(23,502),(23,503),(23,504),(23,505),(23,506),(23,507),(23,508),(23,509),(23,510),(23,511),(23,512),(23,513),(23,514),(23,515),(23,516),(23,517),(23,518),(23,519),(23,529),(23,530),(23,531),(23,532),(23,533),(23,534),(23,535),(23,536),(23,537),(23,538),(23,539),(24,29),(24,30),(24,31),(24,32),(24,33),(24,34),(24,35),(24,36),(24,37),(24,38),(24,39),(24,40),(24,43),(24,44),(24,467),(24,468),(24,469),(24,470),(24,483),(24,486),(24,488),(24,491),(24,493),(24,494),(25,1),(25,3),(25,4),(25,5),(25,7),(25,8),(25,9),(25,10),(25,11),(25,12),(25,13),(25,14),(25,15),(25,16),(25,17),(25,18),(25,19),(25,20),(25,21),(25,22),(25,23),(25,24),(25,27),(25,28),(25,29),(25,30),(25,31),(25,32),(25,33),(25,34),(25,35),(25,36),(25,37),(25,38),(25,39),(25,40),(25,43),(25,44),(25,46),(25,47),(25,48),(25,49),(25,51),(25,52),(25,53),(25,55),(25,56),(25,57),(25,58),(25,59),(25,61),(25,62),(25,63),(25,64),(25,65),(25,66),(25,67),(25,68),(25,69),(25,70),(25,71),(25,72),(25,83),(25,86),(25,88),(25,90),(25,91),(25,139),(25,142),(25,163),(25,254),(25,257),(25,266),(25,367),(25,368),(25,369),(25,371),(25,372),(25,373),(25,395),(25,396),(25,398),(25,401),(25,404),(25,407),(25,409),(25,410),(25,411),(25,412),(25,413),(25,414),(25,415),(25,416),(25,417),(25,439),(25,441),(25,450),(25,452),(25,453),(25,454),(25,455),(25,456),(25,457),(25,458),(25,459),(25,460),(25,461),(25,462),(25,464),(25,465),(25,466),(25,467),(25,468),(25,469),(25,470),(25,471),(25,472),(25,473),(25,474),(25,475),(25,476),(25,477),(25,478),(25,479),(25,480),(25,481),(25,482),(25,483),(25,484),(25,485),(25,486),(25,487),(25,488),(25,489),(25,490),(25,491),(25,492),(25,493),(25,494),(25,495),(25,496),(25,497),(25,498),(25,499),(25,500),(25,501),(25,502),(25,503),(25,504),(25,505),(25,506),(25,507),(25,508),(25,509),(25,510),(25,511),(25,512),(25,513),(25,514),(25,515),(25,516),(25,517),(25,518),(25,519),(25,529),(25,530),(25,531),(25,532),(25,533),(25,534),(25,535),(25,536),(25,537),(25,538),(25,539);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1=active 2= inactive 3=display inactive but operation active',
  `display_status` int(11) NOT NULL DEFAULT '2' COMMENT '1=display active 2= display inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'test_group-admin','Test Lists',NULL,2,1,1,NULL,NULL,NULL),(3,'service_list-admin','Service Lists',NULL,2,1,1,NULL,NULL,NULL),(4,'add_specimen-admin','Add Specimen',NULL,2,1,1,NULL,NULL,NULL),(5,'add_doc-admin','Add Doctor',NULL,3,1,1,NULL,NULL,NULL),(7,'all_doc_list-admin','All Doctor List',NULL,3,1,1,NULL,NULL,NULL),(8,'assign_doc_comission_view_list-admin','View Commission List',NULL,3,1,1,NULL,NULL,NULL),(9,'show_all_opd_patient-admin','All Patient List',NULL,4,1,1,NULL,NULL,NULL),(10,'show_all_paid_opd_patient-admin','Paid Patient List',NULL,4,1,1,NULL,NULL,NULL),(11,'show_all_unpaid_opd_patient-admin','Due Patient List',NULL,4,1,1,NULL,NULL,NULL),(12,'opd_registration-admin','Outdoor Registration',NULL,4,1,1,NULL,NULL,NULL),(13,'opd_all_billing_info-admin','Outdoor Billing',NULL,4,1,1,NULL,NULL,NULL),(14,'edit_opd_invoice-admin','Edit OPD Receipt & Delete',NULL,4,1,1,NULL,NULL,NULL),(15,'opd_com_list-admin','Doctor Commission List',NULL,4,1,1,NULL,NULL,NULL),(16,'opd_today_com_list-admin','Datewise Doc Com. Details List',NULL,4,1,1,NULL,NULL,NULL),(17,'outdoor_due_collection-admin','Outdoor Due Collection',NULL,4,1,1,NULL,NULL,NULL),(18,'opd_com_list_report-admin','Doctor Com. Report (paid/unpaid)',NULL,4,1,1,NULL,NULL,NULL),(19,'cancel_invoice_list-admin','Cancel Invoice List',NULL,4,1,1,NULL,NULL,NULL),(20,'role_list-admin','Role List',NULL,1,1,1,NULL,NULL,NULL),(21,'add_user-admin','Add Hospital User',NULL,1,1,1,NULL,NULL,NULL),(22,'user_list-admin','Hospital User List',NULL,1,1,1,NULL,NULL,NULL),(23,'doc_schedule_list-admin','Doctor Schedule List',NULL,7,1,1,NULL,NULL,NULL),(24,'appointment_list-admin','Appointment List',NULL,7,1,1,NULL,NULL,NULL),(27,'cabin_class_room_list-admin','Cabin Class & Room List',NULL,8,1,1,NULL,NULL,NULL),(28,'indoor_cabin_summary-admin','Indoor Cabin Summary',NULL,8,1,1,NULL,NULL,NULL),(29,'ipd_registration-admin','Indoor Registration',NULL,9,1,1,NULL,NULL,NULL),(30,'ipd_all_patient_list-admin','Indoor All Patient List',NULL,9,1,1,NULL,NULL,NULL),(31,'ipd_patient_billing_list_all-admin','Indoor All Billing List',NULL,9,1,1,NULL,NULL,NULL),(32,'ipd_patient_billing_list_due-admin','Indoor Due Patient List',NULL,9,1,1,NULL,NULL,NULL),(33,'ipd_patient_billing_list_paid-admin','Indoor Paid Patient List',NULL,9,1,2,NULL,NULL,NULL),(34,'ipd_patient_release_list-admin','Indoor Release Patient List',NULL,9,1,1,NULL,NULL,NULL),(35,'ipd_patient_unrelease_list-admin','Indoor UnRelease Patient List',NULL,9,1,1,NULL,NULL,NULL),(36,'indoor_due_collection-admin','Indoor Due Collection',NULL,9,1,1,NULL,NULL,NULL),(37,'cabin_transfer-admin','Cabin Transfer',NULL,9,1,1,NULL,NULL,NULL),(38,'add_ipd_patient_service-admin','Indoor Service',NULL,9,1,1,NULL,NULL,NULL),(39,'outdoor_service_order_list-admin','Diagonostic Service Order List',NULL,9,1,1,NULL,NULL,NULL),(40,'ipd_summary_day_wise-admin','Indoor Day Wise Summary',NULL,10,1,2,NULL,NULL,NULL),(43,'date_wise_indoor_collection-admin','DateWise Indoor Collection',NULL,10,1,1,NULL,NULL,NULL),(44,'date_wise_balance_sheet_ipd-admin','Indoor Balance Sheet',NULL,10,1,1,NULL,NULL,NULL),(46,'technologist_list-admin','Technologist List',NULL,6,1,1,NULL,NULL,NULL),(47,'testlist-admin','Test List',NULL,6,1,1,NULL,NULL,NULL),(48,'pathology_list-admin','Pathology List',NULL,6,1,1,NULL,NULL,NULL),(49,'search_pathology-admin','Search Pathology Report',NULL,6,1,1,NULL,NULL,NULL),(51,'add_customer-admin','Add Customer',NULL,11,1,1,NULL,NULL,NULL),(52,'product_list-admin','Product List',NULL,11,1,1,NULL,NULL,NULL),(53,'sell_product_list-admin','Sell Product List',NULL,11,1,1,NULL,NULL,NULL),(55,'purchage_product_list-admin','Purchase Product List',NULL,11,1,1,NULL,NULL,NULL),(56,'outstanding_supplier-admin','Due Supplier',NULL,11,1,1,NULL,NULL,NULL),(57,'outstanding_customer-admin','Due Customer',NULL,11,1,1,NULL,NULL,NULL),(58,'full_paid_supp-admin','Full Paid Supplier',NULL,11,1,1,NULL,NULL,NULL),(59,'full_paid_cust-admin','Full Paid Customer',NULL,11,1,1,NULL,NULL,NULL),(61,'stock-admin','Stock Report',NULL,11,1,1,NULL,NULL,NULL),(62,'product_stock-admin','Product Wise Stock Report',NULL,11,1,1,NULL,NULL,NULL),(63,'company_stock-admin','Company Wise Stock Report',NULL,11,1,1,NULL,NULL,NULL),(64,'add_supplier-admin','Add Supplier',NULL,11,1,1,NULL,NULL,NULL),(65,'add_unit-admin','Add Unit',NULL,11,1,1,NULL,NULL,NULL),(66,'add_gen-admin','Add Generic Name',NULL,11,1,1,NULL,NULL,NULL),(67,'add_pro_cat-admin','Add Product Category',NULL,11,1,1,NULL,NULL,NULL),(68,'add_com-admin','Add Company Name',NULL,11,1,1,NULL,NULL,NULL),(69,'add_dir-admin','Add Director',NULL,11,1,1,NULL,NULL,NULL),(70,'dir_wise_collection-admin','Daywise Collection History By Dir./Dr.',NULL,12,1,1,NULL,NULL,NULL),(71,'day_wise_collection_pharmacy-admin','Daywise Collection By Pharmacy',NULL,12,1,1,NULL,NULL,NULL),(72,'transaction_summary-admin','transaction_summary',NULL,12,1,2,NULL,NULL,NULL),(83,'opd_today_collection-admin','Outdoor Today Collection',NULL,5,1,1,NULL,NULL,NULL),(86,'outdoor_due_collection_report-admin','Outdoor Due Collection Report',NULL,5,1,1,NULL,NULL,NULL),(88,'date_wise_balance_sheet_opd-admin','Opd Balance Sheet','1',5,1,1,NULL,NULL,NULL),(89,'opd_due_collection_by_operator-admin',' Opd Due By Operator ','1',5,3,2,NULL,NULL,NULL),(90,'add_test-admin','Add Test','1',4,1,2,NULL,NULL,NULL),(91,'add_sub_test-admin','Add Sub Test','1',4,1,2,NULL,NULL,NULL),(139,'opd_com_date_wise-admin','Opd Date WIse Commission','1',4,1,2,NULL,NULL,NULL),(140,'opd_com_date_wise_next-admin','','1',4,3,2,NULL,NULL,NULL),(142,'opd_com_list_date_wise-admin','Opd Date Wise Commission List','1',4,1,2,NULL,NULL,NULL),(163,'test_group_wise_collection-admin','Test Group Wise Collection','1',4,1,2,NULL,NULL,NULL),(254,'add_product-admin','Add Product','1',11,1,2,NULL,NULL,NULL),(257,'purchage_product-admin','Purchase Product','1',11,1,2,NULL,NULL,NULL),(266,'sell_product-admin','Sell Product','1',11,1,2,NULL,NULL,NULL),(367,'edit_acc_head-admin','Edit Head','1',14,1,2,NULL,NULL,NULL),(368,'delete_head-admin','Delete Head','1',14,1,2,NULL,NULL,NULL),(369,'edit_head_add_post-admin','Edit Head Update','1',14,1,2,NULL,NULL,NULL),(371,'add_income-admin','Add Income','1',14,1,2,NULL,NULL,NULL),(372,'add_expense-admin','Add Expense','1',14,1,2,NULL,NULL,NULL),(373,'add_asset-admin','Add Asset','1',14,1,2,NULL,NULL,NULL),(395,'date_wise_due_collection-admin','Date Wise Due Collection Report','1',14,1,2,NULL,NULL,NULL),(396,'date_wise_due_collection_report-admin','Date Wise Due Collection Report Admin','1',14,1,2,NULL,NULL,NULL),(398,'date_wise_balance_sheet_report-admin','Date Wise Balance Sheet Report Admin','1',14,1,2,NULL,NULL,NULL),(401,'other_asset_report_date_wise-admin','Asset Report Date Wise','1',14,1,2,NULL,NULL,NULL),(404,'other_expense_report_date_wise-admin','Expense Report Date Wise','1',14,1,2,NULL,NULL,NULL),(407,'other_income_report_date_wise-admin','Income Report Date Wise','1',14,1,2,NULL,NULL,NULL),(409,'edit_expense-admin','Edit Expense','1',14,1,2,NULL,NULL,NULL),(410,'update_expense-admin','Edit Expense Update','1',14,1,2,NULL,NULL,NULL),(411,'delete_expense-admin','Delete Expense','1',14,1,2,NULL,NULL,NULL),(412,'edit_income-admin','Edit Income','1',14,1,2,NULL,NULL,NULL),(413,'update_income-admin','Edit Income Update','1',14,1,2,NULL,NULL,NULL),(414,'delete_income-admin','Delete Income','1',14,1,2,NULL,NULL,NULL),(415,'edit_asset-admin','Edit Asset','1',14,1,2,NULL,NULL,NULL),(416,'update_asset-admin','Edit Asset Update','1',14,1,2,NULL,NULL,NULL),(417,'delete_asset-admin','Delete Asset','1',14,1,2,NULL,NULL,NULL),(433,'add_share_holder-admin','Add Shareholder','1',14,2,2,NULL,NULL,NULL),(434,'share_holder_type-admin','Share Holder Type','1',14,2,2,NULL,NULL,NULL),(439,'add_doc_schedule-admin','Add Doctor Schedule','1',7,1,1,NULL,NULL,NULL),(441,'add_appointment-admin','Add Appointment','1',7,1,1,NULL,NULL,NULL),(450,'discount_summary-admin','Discount Summary','discount summary',4,1,2,NULL,NULL,NULL),(452,'add_role-admin','Add Role',NULL,1,1,1,NULL,NULL,NULL),(453,'add_service-admin','Add Service',NULL,2,1,1,NULL,NULL,NULL),(454,'specimen_list-admin','Specimen Lists',NULL,2,1,1,NULL,NULL,NULL),(455,'edit_hospital_form-admin','Edit Hospital Form',NULL,2,1,1,NULL,NULL,NULL),(456,'marketing_officer_list-admin','Marketing Officer Lists',NULL,2,1,1,NULL,NULL,NULL),(457,'add_marketing_officer-admin','Add Marketing Officer',NULL,2,1,1,NULL,NULL,NULL),(458,'opd_col_from_doc-admin','Doctor Wise Collection (Group Wise)',NULL,4,1,1,NULL,NULL,NULL),(459,'opd_col_from_doc_with_com-admin','Doctor Commission Report (Dr. Com.)',NULL,4,1,1,NULL,NULL,NULL),(460,'opd_col_from_doc_with_com_details-admin','Doctor Commission Report Details(Dr. Com. Details)',NULL,4,1,1,NULL,NULL,NULL),(461,'date_wise_paid_invoice_list-admin','Date Wise Paid Invoice List',NULL,4,1,1,NULL,NULL,NULL),(462,'date_wise_due_invoice_list-admin','Date Wise Due Invoice List',NULL,4,1,1,NULL,NULL,NULL),(464,'opd_collection_by_operator-admin','Opd Collection by Operator',NULL,5,1,1,NULL,NULL,NULL),(465,'marketing_officer_wise_collection-admin','Marketing Officer Wise Collection',NULL,5,1,1,NULL,NULL,NULL),(466,'opd_datewise_collection_summary-admin','Opd Datewise Collection Summary ',NULL,5,1,1,NULL,NULL,NULL),(467,'prescription_list-admin','Prescription List ',NULL,9,1,1,NULL,NULL,NULL),(468,'add_prescription-admin','Add Prescription ',NULL,9,1,1,NULL,NULL,NULL),(469,'operation_cost-admin','Operation Cost ',NULL,9,1,1,NULL,NULL,NULL),(470,'ipd_collection_by_opd-admin','Ipd Collection by OPD',NULL,10,1,1,NULL,NULL,NULL),(471,'edit_product_invoice-admin','Edit Invoice ',NULL,11,1,1,NULL,NULL,NULL),(472,'date_wise_balance_sheet_phar-admin','Pharmacy Balance Sheet',NULL,12,1,1,NULL,NULL,NULL),(473,'head_list-admin','Account Head List',NULL,14,1,1,NULL,NULL,NULL),(474,'income_list-admin','Income List',NULL,14,1,1,NULL,NULL,NULL),(475,'expense_list-admin','Expense List',NULL,14,1,1,NULL,NULL,NULL),(476,'asset_list-admin','Asset List ',NULL,14,1,1,NULL,NULL,NULL),(477,'other_asset_report-admin','Other Asset Report',NULL,14,1,1,NULL,NULL,NULL),(478,'other_expense_report-admin','Other Expense Report',NULL,14,1,1,NULL,NULL,NULL),(479,'other_income_report-admin','Other Income Report',NULL,14,1,1,NULL,NULL,NULL),(480,'date_wise_balance_sheet_acc-admin','Account Balance Sheet',NULL,14,1,1,NULL,NULL,NULL),(481,'day_wise_sale-admin','Day Wise Sale Report ',NULL,11,1,1,NULL,NULL,NULL),(482,'day_wise_purchase-admin','Day Wise Purchase Report ',NULL,11,1,1,NULL,NULL,NULL),(483,'operation_cost_dr_wise-admin','Operation Cost Report (Dr Wise)',NULL,10,1,1,NULL,NULL,NULL),(484,'delete_reason_text-admin','Delete Bill',NULL,4,1,1,NULL,NULL,NULL),(485,'edit_opd_patient_info-admin','Edit Patient Info',NULL,4,1,1,NULL,NULL,NULL),(486,'index-admin','Dashboard',NULL,0,1,1,NULL,NULL,NULL),(487,'backup_db-admin','Database Backup',NULL,15,1,1,NULL,NULL,NULL),(488,'outdoor_service_ipd-admin','Take Diagnostic Service',NULL,9,1,1,NULL,NULL,NULL),(489,'date_wise_balance_sheet_others_expense-admin','Others Expense',NULL,14,1,1,NULL,NULL,NULL),(490,'date_wise_balance_sheet_others_income-admin','Others Income',NULL,14,1,1,NULL,NULL,NULL),(491,'edit_ipd_bill-admin','Edit IPD Receipt & Delete',NULL,9,1,1,NULL,NULL,NULL),(492,'add_rack-admin','Add Rack',NULL,11,1,1,NULL,NULL,NULL),(493,'edit_indoor_patient_bill-admin','Edit IPD Bill',NULL,9,1,1,NULL,NULL,NULL),(494,'ipd_adv_pay_daywise-admin','Operation Cost Report (Dr Wise)',NULL,10,1,1,NULL,NULL,NULL),(495,'search_pathology_custom-admin',' Search Pathology Report Custom ',NULL,6,1,1,NULL,NULL,NULL),(496,'pathology_report_lock_unlock-admin','Pathology Report Lock/Unlock ',NULL,6,1,1,NULL,NULL,NULL),(497,'lab_product_list-admin','Lab Product List ',NULL,20,1,1,NULL,NULL,NULL),(498,'lab_in_product_list-admin','Lab In Product List ',NULL,20,1,1,NULL,NULL,NULL),(499,'lab_outstanding_supplier-admin',' Due Supplier ',NULL,20,1,1,NULL,NULL,NULL),(500,'lab_full_paid_supp-admin','Full Paid Supplier',NULL,20,1,1,NULL,NULL,NULL),(501,'lab_in_return-admin','Lab In Return ',NULL,20,1,1,NULL,NULL,NULL),(502,'lab_stock-admin','Lab Stock Report ',NULL,20,1,1,NULL,NULL,NULL),(503,'lab_product_stock-admin','Product Wise Lab Stock ',NULL,20,1,1,NULL,NULL,NULL),(504,'add_staff_designation-admin','Add Designation ',NULL,16,1,1,NULL,NULL,NULL),(505,'add_staff_groups-admin','Designation List ',NULL,16,1,1,NULL,NULL,NULL),(506,'staff_registation-admin','Staff Registration ',NULL,16,1,1,NULL,NULL,NULL),(507,'all_staff_list-admin','Staff List ',NULL,16,1,1,NULL,NULL,NULL),(508,'staff_salary_generate-admin','Staff Salary Generate List ',NULL,16,1,1,NULL,NULL,NULL),(509,'all_staff_payment_list-admin','Staff Payment',NULL,16,1,1,NULL,NULL,NULL),(510,'all_staff_salary_payment_report-admin','Staff Salary Payment Report ',NULL,16,1,1,NULL,NULL,NULL),(511,'ambulance_receipt_registation-admin','Ambulance Receipt Create',NULL,17,1,1,NULL,NULL,NULL),(512,'ambulance_receipt_list-admin','Ambulance Reciept List ',NULL,17,1,1,NULL,NULL,NULL),(513,'ambulance_all_receipt_report-admin','Ambulance All Receipt Report ',NULL,17,1,1,NULL,NULL,NULL),(514,'emergency_receipt_registation-admin','Emergency Receipt Create',NULL,18,1,1,NULL,NULL,NULL),(515,'emergency_receipt_list-admin','Emergency Reciept List ',NULL,18,1,1,NULL,NULL,NULL),(516,'emergency_all_receipt_report-admin','Emergency All Receipt Report ',NULL,18,1,1,NULL,NULL,NULL),(517,'uhid_reg-admin',' UHID Registration',NULL,21,1,1,NULL,NULL,NULL),(518,'uhid_list-admin','UHID List',NULL,21,1,1,NULL,NULL,NULL),(519,'uhid_patient_all_info-admin',' All Exam Report(UHID)',NULL,21,1,1,NULL,NULL,NULL),(529,'add_birth_certificate-admin','add_birth_certificate',NULL,22,1,2,NULL,NULL,NULL),(530,'birth_certificate_list-admin','birth_certificate_list',NULL,22,1,2,NULL,NULL,NULL),(531,'add_death_certificate-admin','add_death_certificate',NULL,22,1,2,NULL,NULL,NULL),(532,'death_certificate_list-admin','death_certificate_list',NULL,22,1,2,NULL,NULL,NULL),(533,'staff_group_list-admin','staff_group_list',NULL,16,1,2,NULL,NULL,NULL),(534,'all_staff_designation_list-admin','all_staff_designation_list',NULL,16,1,2,NULL,NULL,NULL),(535,'add_ambulance-admin','add_ambulance',NULL,17,1,2,NULL,NULL,NULL),(536,'ambulance_list-admin','ambulance_list',NULL,17,1,2,NULL,NULL,NULL),(537,'opd_patient_data-admin','opd_patient_data',NULL,4,1,2,NULL,NULL,NULL),(538,'opd_file_tag_print_datewise-admin','opd_file_tag_print_datewise',NULL,4,1,2,NULL,NULL,NULL),(539,'opd_sample_tag_print_datewise-admin','opd_sample_tag_print_datewise',NULL,4,1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_group`
--

DROP TABLE IF EXISTS `permissions_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_group`
--

LOCK TABLES `permissions_group` WRITE;
/*!40000 ALTER TABLE `permissions_group` DISABLE KEYS */;
INSERT INTO `permissions_group` VALUES (1,'User & Role Management','manager_user_role',1),(2,'Test & Service Management','manager_test_service',1),(3,'Doctor Management','manage_doctor',1),(4,'outdoor','outdoor',1),(5,'Outdoor Accounts','outdoor_accounts',1),(6,'Pathology Report','pathology_report',1),(7,'Appointment Management','manage_appointment',1),(8,'Indoor Cabin Management','cabin_management',1),(9,'Indoor','indoor_maangement',1),(10,'Indoor Accounts','indoor_accounts_management',1),(11,'Pharmacy Management','pharmacy_management',1),(12,'Pharmacy Accounts','pharmacy_accounts_management',1),(13,'Shareholder','shareholder',2),(14,'Accounts Management','account_management\r\n',1),(15,'Database Backup','database_backup\r\n',1),(16,'HR Management','hr_management\r\n',1),(17,'Ambulance Management','ambulance_management\r\n',1),(18,'Emergency Management','emergency_management\r\n',1),(19,'Manage Share Holder','manage_share_holder\r\n',1),(20,'Lab Management','lab_management\r\n',1),(21,'Uhid management','uhid_management',1),(22,'Birth Certificate','Birth_Certificate',1);
/*!40000 ALTER TABLE `permissions_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_due_collection`
--

DROP TABLE IF EXISTS `pharmacy_due_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_due_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `supp_cust_id` int(11) DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `discount` double(10,2) DEFAULT '0.00',
  `vat` double DEFAULT '0',
  `current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `paid_due` double(10,2) DEFAULT '0.00',
  `unload_cost` double NOT NULL DEFAULT '0',
  `discount_ref` varchar(250) DEFAULT NULL,
  `due_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=supplier, 2=customer',
  `old_due` double(10,2) DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '1',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_due_collection` int(11) NOT NULL COMMENT '0 = no 1=yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_due_collection`
--

LOCK TABLES `pharmacy_due_collection` WRITE;
/*!40000 ALTER TABLE `pharmacy_due_collection` DISABLE KEYS */;
INSERT INTO `pharmacy_due_collection` VALUES (1,'pur-000001',1,2200,0.00,0,2200.00,0.00,0,NULL,1,2200.00,1,'care',5,'2022-10-30 17:25:20','2022-10-30 11:25:20',0),(2,'inv-000001',1,15,0.00,0,15.00,0.00,0,NULL,2,15.00,1,'care',5,'2022-10-30 17:25:44','2022-10-30 11:25:44',0),(3,'inv-000002',2,3,0.00,0,3.00,0.00,0,NULL,2,3.00,1,'care',5,'2022-11-04 20:58:10','2022-11-04 14:58:10',0),(4,'inv-000003',3,177,7.00,0,70.00,100.00,0,NULL,2,177.00,1,'care',5,'2022-11-28 13:27:05','2022-11-28 07:27:05',0),(5,'inv-000004',4,180,10.00,0,0.00,170.00,0,NULL,2,180.00,1,'care',5,'2022-12-03 16:04:49','2022-12-03 10:04:49',0),(6,'pur-000002',1,200,0.00,0,200.00,0.00,0,NULL,1,200.00,1,'care',5,'2022-12-03 16:07:06','2022-12-03 10:07:06',0),(7,'inv-000004',4,243,0.00,0,0.00,0.00,0,NULL,2,0.00,1,'care',5,'2022-12-03 16:07:54','2022-12-03 10:07:54',0),(8,'inv-000005',5,177,0.00,0,177.00,0.00,0,NULL,2,177.00,1,'care',5,'2022-12-29 16:07:29','2022-12-29 10:07:29',0),(9,'inv-000005',5,177,0.00,0,0.00,177.00,0,NULL,2,177.00,1,'care',5,'2022-12-29 16:08:51','2022-12-29 10:08:51',0),(11,'inv-000007',1,1110,0.00,0,1110.00,0.00,0,NULL,2,1110.00,1,'care',5,'2023-01-11 16:07:21','2023-01-11 10:07:21',0),(12,'inv-000007',1,66,0.00,0,66.00,0.00,0,NULL,2,66.00,1,'care',5,'2023-01-18 00:22:11','2023-01-17 18:22:11',0),(13,'inv-000008',1,45,0.00,0,45.00,0.00,0,NULL,2,45.00,1,'care',5,'2023-01-18 00:22:26','2023-01-17 18:22:26',0),(14,'inv-000009',6,45,0.00,0,45.00,0.00,0,NULL,2,45.00,1,'care',5,'2023-01-18 00:23:09','2023-01-17 18:23:09',0),(15,'inv-000009',6,45,0.00,0,45.00,0.00,0,NULL,2,45.00,1,'care',5,'2023-01-18 00:23:19','2023-01-17 18:23:19',0),(16,'inv-000009',6,45,0.00,0,90.00,0.00,0,NULL,2,90.00,1,'care',5,'2023-01-18 00:23:29','2023-01-17 18:23:29',0),(17,'inv-000009',6,45,0.00,0,135.00,0.00,0,NULL,2,135.00,1,'care',5,'2023-01-18 00:23:41','2023-01-17 18:23:41',0),(18,'inv-000010',7,171,1.00,0,0.00,170.00,0,NULL,2,171.00,1,'care',5,'2023-02-04 23:17:08','2023-02-04 17:17:08',0),(19,'inv-000011',8,112,2.00,0,0.00,110.00,0,NULL,2,112.00,1,'care',5,'2023-02-04 23:17:43','2023-02-04 17:17:43',0),(20,'lab-p-0000',1,2000,0.00,0,0.00,2000.00,0,NULL,3,2000.00,1,'care',5,NULL,'2023-02-24 10:20:12',0),(21,'inv-000012',9,75,0.00,0,75.00,0.00,0,NULL,2,75.00,1,'care',5,'2023-02-24 17:21:12','2023-02-24 11:21:12',0);
/*!40000 ALTER TABLE `pharmacy_due_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `doctor_id` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_details`
--

DROP TABLE IF EXISTS `prescription_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medicine_id` int(11) DEFAULT '0',
  `medicine_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `daily_dose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dose_qty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_details`
--

LOCK TABLES `prescription_details` WRITE;
/*!40000 ALTER TABLE `prescription_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `p_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_buy_price` double NOT NULL DEFAULT '0',
  `p_sell_price` double DEFAULT NULL,
  `p_unit_id` int(11) NOT NULL DEFAULT '0',
  `p_cat_id` int(11) NOT NULL DEFAULT '0',
  `p_sub_cat_id` int(11) NOT NULL DEFAULT '0',
  `p_generic_id` int(11) NOT NULL DEFAULT '0',
  `pack_size_id` int(11) DEFAULT '0',
  `p_opening_qty` int(11) NOT NULL DEFAULT '0',
  `p_reorder_qty` int(11) NOT NULL DEFAULT '0',
  `p_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_company_id` int(11) NOT NULL DEFAULT '0',
  `p_current_stock` int(11) NOT NULL DEFAULT '0',
  `rack_id` int(11) NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'000001','Tab:Napa 500mg',2,3,1,1,0,20,0,0,100,'default.jpg',1,0,2,0,0,1,'2022-09-11 16:45:45','2022-09-11 10:45:45'),(2,'000001','Tab:Ciprocin 500mg',10,15,1,1,0,2,0,0,50,'default.jpg',1,0,2,0,0,1,'2022-09-11 16:46:28','2022-09-11 10:46:28'),(3,'000001','Cap:Surgle 20mg',4,7,1,2,0,19,0,0,50,'default.jpg',2,0,2,0,0,1,'2022-09-11 16:47:13','2022-09-11 10:47:13'),(4,'000001','Cap:Fimoxyl 500mg',6,20,1,2,0,3,0,0,50,'default.jpg',2,0,3,0,0,1,'2022-09-11 16:47:59','2022-09-11 10:47:59');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Tablate',1,NULL,'2022-09-11 10:43:20'),(2,'Capsule',1,NULL,'2022-09-11 10:43:23'),(3,'Injection',1,NULL,'2022-09-11 10:43:26'),(4,'Syrup',1,NULL,'2022-09-11 10:43:30'),(5,'Drops',1,NULL,'2022-09-11 10:43:35'),(6,'Suppository',1,NULL,'2022-09-11 10:43:38');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rack_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1-active 0-delete',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack`
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
INSERT INTO `rack` VALUES (1,'Lt Site',0),(2,'Lt Site 101',1),(3,'Lt Site 102',1);
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '0',
  `user_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (5,23,'care','care_user@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','01673438978',NULL,NULL,NULL,'2022-10-06 21:20:18','2019-04-30 05:59:38'),(22,32,'Akter','dinmohammadsheto86@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','',NULL,NULL,NULL,'2022-10-24 14:32:38','2022-10-24 08:32:38'),(23,33,'dms','','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','',NULL,NULL,NULL,'2022-10-24 14:50:32','2022-10-24 08:50:32'),(24,34,'moshiur','moshiur@gmail.com','bVlYZE03YXZScnZaZnBhaDJPQml0Zz09','',NULL,NULL,NULL,'2022-12-03 16:40:44','2022-12-03 10:40:44');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_info`
--

DROP TABLE IF EXISTS `relation_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_info`
--

LOCK TABLES `relation_info` WRITE;
/*!40000 ALTER TABLE `relation_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `relation_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_lock`
--

DROP TABLE IF EXISTS `report_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT 'OPD\r\n0= unlock 1 = lock',
  `flag_ipd` int(11) NOT NULL DEFAULT '0' COMMENT 'ipd 0= unlock 1 = lock	',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_lock`
--

LOCK TABLES `report_lock` WRITE;
/*!40000 ALTER TABLE `report_lock` DISABLE KEYS */;
INSERT INTO `report_lock` VALUES (1,0,0);
/*!40000 ALTER TABLE `report_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_product`
--

DROP TABLE IF EXISTS `return_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_cust_id` int(11) NOT NULL DEFAULT '0',
  `buy_sell_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sell_buy_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1=purchase return 2=sales return',
  `charge` double NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` double NOT NULL DEFAULT '0',
  `total_paid` double NOT NULL DEFAULT '0',
  `total_vat` double NOT NULL DEFAULT '0',
  `total_discount` double NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 2= inactive',
  `current_total_amount` double NOT NULL DEFAULT '0',
  `current_total_charge` double NOT NULL DEFAULT '0',
  `current_total_vat` double NOT NULL DEFAULT '0',
  `current_total_discount` double NOT NULL DEFAULT '0',
  `current_total_paid` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_product`
--

LOCK TABLES `return_product` WRITE;
/*!40000 ALTER TABLE `return_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_product_det`
--

DROP TABLE IF EXISTS `return_product_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_product_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ret_id` int(11) NOT NULL DEFAULT '0',
  `issued_total_qty` int(11) NOT NULL DEFAULT '0',
  `total_qty` int(11) NOT NULL DEFAULT '0',
  `p_id` int(11) NOT NULL DEFAULT '0',
  `ret_qty` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_product_det`
--

LOCK TABLES `return_product_det` WRITE;
/*!40000 ALTER TABLE `return_product_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_product_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `display_name` varchar(30) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'hospital_admin','Hospital Admin',NULL,1,'2019-04-28',NULL,NULL),(23,'Dr. Akter Jahan MBBS, BCS',NULL,NULL,1,'2022-10-24',NULL,NULL),(24,'dms',NULL,NULL,1,'2022-10-24',NULL,NULL),(25,'moshiur',NULL,NULL,1,'2022-12-03',NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_id` int(11) DEFAULT '0',
  `cabin_class_id` int(11) NOT NULL DEFAULT '0',
  `cabin_sub_class_id` int(11) NOT NULL DEFAULT '0',
  `room_title` varchar(255) DEFAULT NULL,
  `room_price` double NOT NULL,
  `seat_capacity` bigint(20) NOT NULL DEFAULT '0',
  `is_busy` int(11) NOT NULL DEFAULT '0' COMMENT '1= busy 0= free',
  `p_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1 = normal 2= dr. room',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,5,1,1,'Dr Room 601',0,0,0,0,1,'2022-10-06 21:16:40','2022-10-06 15:16:40',2),(2,5,1,1,'Dr Room 602',0,0,0,0,1,'2022-10-06 21:17:00','2022-10-06 15:17:00',2),(3,5,1,1,'Dr Room 603',0,0,0,0,1,'2022-10-06 21:17:14','2022-10-06 15:17:14',2),(4,5,1,1,'Dr Room 604',0,0,0,0,1,'2022-10-06 21:17:26','2022-10-06 15:17:26',2),(5,5,2,2,'VIP AC Room No: 401',2000,2,0,10,1,'2022-10-06 21:35:49','2022-10-06 15:35:49',1),(6,5,2,2,'VIP AC Room No: 402',2000,2,1,0,1,'2022-10-06 21:36:31','2022-10-06 15:36:31',1),(7,5,2,2,'VIP AC Room No: 403',2000,2,0,11,1,'2022-10-06 21:36:47','2022-10-06 15:36:47',1),(8,5,2,2,'VIP AC Room No:404',2000,2,0,0,1,'2022-10-06 21:37:53','2022-10-06 15:37:53',1),(9,5,2,2,'VIP AC Room No:405',2000,2,0,0,1,'2022-10-06 21:38:08','2022-10-06 15:38:08',1),(10,5,2,2,'VIP AC Room No:406',2000,2,0,0,1,'2022-10-06 21:38:32','2022-10-06 15:38:32',1),(11,5,2,2,'VIP AC Room No:407',1500,2,0,0,1,'2022-10-06 21:40:54','2022-10-06 15:40:54',1),(12,5,2,2,'VIP AC Room No:408',1500,2,0,0,1,'2022-10-06 21:41:16','2022-10-06 15:41:16',1),(13,5,2,2,'VIP AC Room No:409',1500,2,0,0,1,'2022-10-06 21:41:37','2022-10-06 15:41:37',1),(14,5,2,2,'VIP AC Room No:410',1500,2,0,0,1,'2022-10-06 21:41:53','2022-10-06 15:41:53',1),(15,5,2,2,'VIP AC Room No:411',1500,2,0,0,1,'2022-10-06 21:42:10','2022-10-06 15:42:10',1),(16,5,2,2,'VIP AC Room No:412',1500,2,0,0,1,'2022-10-06 21:42:29','2022-10-06 15:42:29',1),(17,5,1,1,'Dr Room 605',0,0,0,0,1,'2022-10-06 21:49:14','2022-10-06 15:49:14',2),(18,5,1,1,'Dr Room 606',0,0,0,0,1,'2022-10-06 21:49:30','2022-10-06 15:49:30',2),(19,5,3,3,'G-Cabin No: 501',1000,2,0,1,1,'2022-10-06 21:52:47','2022-10-06 15:52:47',1),(20,5,3,3,'G-Cabin No: 502',1000,2,0,0,1,'2022-10-06 21:53:04','2022-10-06 15:53:04',1),(21,5,3,3,'G-Cabin No: 503',1000,2,0,0,1,'2022-10-06 21:53:19','2022-10-06 15:53:19',1),(22,5,3,3,'G-Cabin No: 504',1000,2,0,0,1,'2022-10-06 21:53:36','2022-10-06 15:53:36',1),(23,5,3,3,'G-Cabin No: 505',1000,2,0,0,1,'2022-10-06 21:53:55','2022-10-06 15:53:55',1),(24,5,3,3,'G-Cabin No: 506',1000,2,0,0,1,'2022-10-06 21:54:15','2022-10-06 15:54:15',1),(25,5,3,3,'G-Cabin No: 507',1000,2,0,0,1,'2022-10-06 21:54:31','2022-10-06 15:54:31',1),(26,5,3,3,'G-Cabin No: 508',1000,2,0,0,1,'2022-10-06 21:54:49','2022-10-06 15:54:49',1),(27,5,3,3,'G-Cabin No: 509',1000,2,0,0,1,'2022-10-06 21:55:07','2022-10-06 15:55:07',1),(28,5,3,3,'G-Cabin No: 510',1000,2,0,0,1,'2022-10-06 21:55:21','2022-10-06 15:55:21',1),(29,5,3,3,'G-Cabin No: 511',1000,2,0,0,1,'2022-10-06 21:55:37','2022-10-06 15:55:37',1),(30,5,3,3,'G-Cabin No: 512',1000,2,0,0,1,'2022-10-06 21:55:53','2022-10-06 15:55:53',1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell`
--

DROP TABLE IF EXISTS `sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_code` varchar(255) NOT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `export_no` varchar(50) DEFAULT NULL,
  `cust_id` int(11) NOT NULL DEFAULT '0',
  `patient_type` int(11) NOT NULL DEFAULT '0' COMMENT '1=opd_patient\r\n2=ipd_patient\r\n3= phar customer\r\n4= uhid customer',
  `ref_dir_id` int(11) NOT NULL DEFAULT '0',
  `ref_dir_name` varchar(255) DEFAULT NULL,
  `credit` double NOT NULL DEFAULT '0' COMMENT 'Total Amount',
  `discount` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0' COMMENT 'Total Paid',
  `net_total` double NOT NULL DEFAULT '0',
  `delivery_cost` double(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1= active 2= delete',
  `is_return` int(11) NOT NULL DEFAULT '1' COMMENT '1= no return 2 = return',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'track who logged in system',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sell_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell`
--

LOCK TABLES `sell` WRITE;
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
INSERT INTO `sell` VALUES (1,'inv-000001',NULL,NULL,1,3,1,'Md,Nadim',1110,0,0,0,1110,0.00,1,1,'care',5,5,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(2,'inv-000002',NULL,NULL,2,3,0,'self',3,0,0,0,3,0.00,1,1,'care',5,5,'2022-11-04 20:58:10','2022-11-04 14:58:10'),(3,'inv-000003',NULL,NULL,3,1,0,'self',177,7,0,100,170,0.00,1,1,'care',5,5,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(4,'inv-000004',NULL,NULL,4,2,0,'self',423,10,0,170,413,0.00,1,1,'care',5,5,'2022-12-03 16:04:49','2022-12-03 10:07:54'),(5,'inv-000005',NULL,NULL,5,2,0,'self',177,0,0,177,177,0.00,1,1,'care',5,5,'2022-12-29 16:07:29','2022-12-29 10:08:51'),(6,'inv-000006',NULL,NULL,1,3,1,'Md,Nadim',142,42,0,1000,100,0.00,1,1,'care',5,5,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(7,'inv-000007',NULL,NULL,1,3,1,'Md,Nadim',66,0,0,0,66,0.00,1,1,'care',5,5,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(8,'inv-000008',NULL,NULL,1,3,1,'Md,Nadim',45,0,0,0,45,0.00,1,1,'care',5,5,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(9,'inv-000009',NULL,NULL,6,2,0,'self',180,0,0,0,180,0.00,1,1,'care',5,5,'2023-01-18 00:23:09','2023-01-17 18:23:41'),(10,'inv-000010',NULL,NULL,7,4,0,'self',171,1,0,170,170,0.00,1,1,'care',5,5,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(11,'inv-000011',NULL,NULL,8,2,0,'self',112,2,0,110,110,0.00,1,1,'care',5,5,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(12,'inv-000012',NULL,NULL,9,1,0,'self',75,0,0,0,75,0.00,1,1,'care',5,5,'2023-02-24 17:21:12','2023-02-24 11:21:12');
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_details`
--

DROP TABLE IF EXISTS `sell_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_details` (
  `sell_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_id` int(11) NOT NULL,
  `sell_code` varchar(255) DEFAULT NULL,
  `p_id` int(11) NOT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `sell_price` double NOT NULL,
  `sell_qty` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sell_det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_details`
--

LOCK TABLES `sell_details` WRITE;
/*!40000 ALTER TABLE `sell_details` DISABLE KEYS */;
INSERT INTO `sell_details` VALUES (2,2,'inv-000002',1,NULL,'2024-10-04',3,1,'2022-11-04 20:58:10','2022-11-04 14:58:10'),(3,3,'inv-000003',1,NULL,'2024-10-04',3,3,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(4,3,'inv-000003',2,NULL,'2023-10-25',15,4,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(5,3,'inv-000003',3,NULL,'2023-10-24',7,4,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(6,3,'inv-000003',4,NULL,'2023-10-31',20,4,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(7,4,'inv-000004',1,NULL,'2024-10-04',3,10,'2022-12-03 16:04:49','2022-12-03 10:04:49'),(8,4,'inv-000004',2,NULL,'2023-10-25',15,10,'2022-12-03 16:04:49','2022-12-03 10:04:49'),(9,4,'inv-000004',1,NULL,'2024-10-04',3,81,'2022-12-03 16:07:54','2022-12-03 10:07:54'),(10,5,'inv-000005',1,NULL,'2025-12-31',3,3,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(11,5,'inv-000005',2,NULL,'2023-10-25',15,4,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(12,5,'inv-000005',3,NULL,'2023-10-24',7,4,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(13,5,'inv-000005',4,NULL,'2023-10-31',20,4,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(14,6,'inv-000006',1,NULL,'2025-12-31',3,3,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(15,6,'inv-000006',2,NULL,'2023-10-25',15,3,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(16,6,'inv-000006',3,NULL,'2023-10-24',7,4,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(17,6,'inv-000006',4,NULL,'2023-10-31',20,3,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(18,1,'inv-000007',1,NULL,'2025-12-31',70,3,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(19,1,'inv-000007',2,NULL,'2023-10-25',15,4,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(20,1,'inv-000007',3,NULL,'2023-10-24',70,8,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(21,1,'inv-000007',4,NULL,'2023-10-31',70,4,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(22,7,'inv-000007',1,NULL,'2025-12-31',3,3,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(23,7,'inv-000007',2,NULL,'2023-10-25',15,2,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(24,7,'inv-000007',3,NULL,'2023-10-24',7,1,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(25,7,'inv-000007',4,NULL,'2023-10-31',20,1,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(26,8,'inv-000008',1,NULL,'2025-12-31',3,1,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(27,8,'inv-000008',2,NULL,'2023-10-25',15,1,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(28,8,'inv-000008',3,NULL,'2023-10-24',7,1,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(29,8,'inv-000008',4,NULL,'2023-10-31',20,1,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(30,9,'inv-000009',1,NULL,'2025-12-31',3,1,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(31,9,'inv-000009',2,NULL,'2023-10-25',15,1,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(32,9,'inv-000009',3,NULL,'2023-10-24',7,1,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(33,9,'inv-000009',4,NULL,'2023-10-31',20,1,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(34,9,'inv-000009',1,NULL,'2025-12-31',3,1,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(35,9,'inv-000009',2,NULL,'2023-10-25',15,1,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(36,9,'inv-000009',3,NULL,'2023-10-24',7,1,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(37,9,'inv-000009',4,NULL,'2023-10-31',20,1,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(38,9,'inv-000009',1,NULL,'2025-12-31',3,1,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(39,9,'inv-000009',2,NULL,'2023-10-25',15,1,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(40,9,'inv-000009',3,NULL,'2023-10-24',7,1,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(41,9,'inv-000009',4,NULL,'2023-10-31',20,1,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(42,9,'inv-000009',1,NULL,'2025-12-31',3,1,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(43,9,'inv-000009',2,NULL,'2023-10-25',15,1,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(44,9,'inv-000009',3,NULL,'2023-10-24',7,1,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(45,9,'inv-000009',4,NULL,'2023-10-31',20,1,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(46,10,'inv-000010',1,NULL,'2025-12-31',3,6,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(47,10,'inv-000010',2,NULL,'2023-10-25',15,3,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(48,10,'inv-000010',3,NULL,'2023-10-24',7,4,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(49,10,'inv-000010',4,NULL,'2023-10-31',20,4,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(50,11,'inv-000011',1,NULL,'2025-12-31',3,2,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(51,11,'inv-000011',2,NULL,'2023-10-25',15,3,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(52,11,'inv-000011',3,NULL,'2023-10-24',7,3,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(53,11,'inv-000011',4,NULL,'2023-10-31',20,2,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(54,12,'inv-000012',1,NULL,'2025-12-31',3,3,'2023-02-24 17:21:12','2023-02-24 11:21:12'),(55,12,'inv-000012',2,NULL,'2023-10-25',15,3,'2023-02-24 17:21:12','2023-02-24 11:21:12'),(56,12,'inv-000012',3,NULL,'2023-10-24',7,3,'2023-02-24 17:21:12','2023-02-24 11:21:12');
/*!40000 ALTER TABLE `sell_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_details_history`
--

DROP TABLE IF EXISTS `sell_details_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_details_history` (
  `sell_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_det_table_id` int(11) NOT NULL DEFAULT '0',
  `sell_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `sell_price` double NOT NULL,
  `sell_qty` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sell_det_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_details_history`
--

LOCK TABLES `sell_details_history` WRITE;
/*!40000 ALTER TABLE `sell_details_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_details_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_history`
--

DROP TABLE IF EXISTS `sell_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sell_history` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_table_id` int(11) NOT NULL DEFAULT '0',
  `sell_code` varchar(10) NOT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `export_no` varchar(50) DEFAULT NULL,
  `cust_id` int(11) NOT NULL DEFAULT '0',
  `credit` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `vat` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `delivery_cost` double(10,2) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'track who logged in system',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_history`
--

LOCK TABLES `sell_history` WRITE;
/*!40000 ALTER TABLE `sell_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_details`
--

DROP TABLE IF EXISTS `service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `p_id` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `operated_id` int(11) DEFAULT NULL,
  `operated_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `cost_paid_by_id` int(11) NOT NULL DEFAULT '0',
  `cost_paid_by_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_paid` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `discount_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_details`
--

LOCK TABLES `service_details` WRITE;
/*!40000 ALTER TABLE `service_details` DISABLE KEYS */;
INSERT INTO `service_details` VALUES (1,1,0,2,300,5,3,'Dr.Mesbah Uddin Ahmed MBBS,MS','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(2,2,0,2,500,5,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(3,3,0,2,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(4,4,0,2,5000,1,1,'Dr. Akter Jahan MBBS, BCS(Health),FCPS (Medicine) MS )(Orthopadic)','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(5,5,0,2,200,4,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(6,6,0,2,300,4,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(7,7,0,2,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(8,8,0,2,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(9,1,0,1,300,1,1,'Dr.Mesbah Uddin Ahmed MBBS,MS','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(10,2,0,1,500,4,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(11,3,0,1,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(12,4,0,1,5000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(13,5,0,1,200,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(14,6,0,1,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(15,7,0,1,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(16,8,0,1,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(17,1,0,4,300,3,3,'Dr.Younus Khan ','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(18,2,0,4,500,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(19,3,0,4,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(20,4,0,4,5000,1,4,'Dr.Md.Golam Kawsar(Himel)','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(21,5,0,4,200,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(22,6,0,4,300,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(23,7,0,4,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(24,8,0,4,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(25,1,0,5,300,6,4,'Dr.Md.Golam Kawsar(Himel)','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(26,2,0,5,500,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(27,3,0,5,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(28,4,0,5,6000,1,5,'Bangal Islami Life Insurence','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(29,5,0,5,200,2,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(30,6,0,5,300,2,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(31,7,0,5,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(32,8,0,5,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(33,1,0,3,300,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(34,2,0,3,500,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(35,3,0,3,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(36,4,0,3,7000,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(37,5,0,3,200,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(38,6,0,3,300,3,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(39,7,0,3,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(40,1,0,6,300,3,3,'Dr.Younus Khan ','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(41,2,0,6,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(42,3,0,6,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(43,4,0,6,5000,1,5,'Bangal Islami Life Insurence','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(44,5,0,6,200,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(45,6,0,6,300,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(46,7,0,6,300,2,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(47,8,0,6,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(48,1,0,8,300,2,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(49,2,0,8,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(50,3,0,8,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(51,4,0,8,5000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(52,5,0,8,200,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(53,6,0,8,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(54,7,0,8,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(55,8,0,8,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(56,1,0,7,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(57,2,0,7,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(58,3,0,7,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(59,4,0,7,5000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(60,5,0,7,200,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(61,6,0,7,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(62,7,0,7,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(63,8,0,7,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(64,1,0,9,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(65,2,0,9,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(66,3,0,9,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(67,4,0,9,5000,1,3,'Dr.Younus Khan MBBS, FCPS Medicine','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(68,5,0,9,200,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(69,6,0,9,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(70,7,0,9,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(71,8,0,9,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(72,1,0,11,300,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(73,2,0,11,500,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(74,3,0,11,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(75,4,0,11,5000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(76,5,0,11,200,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(77,6,0,11,300,2,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(78,7,0,11,300,2,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(79,8,0,11,500,2,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(80,1,0,10,300,3,3,'Dr.Younus Khan MBBS, FCPS Medicine','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(81,2,0,10,500,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(82,3,0,10,2000,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(83,4,0,10,5000,1,4,'Dr.Md.Golam Kawsar(Himel)','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(84,5,0,10,200,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(85,6,0,10,300,3,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(86,7,0,10,300,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(87,8,0,10,500,1,0,'self','care',5,0,NULL,0,0,NULL,'2023-02-24 17:10:52','2023-02-24 11:10:52');
/*!40000 ALTER TABLE `service_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_info`
--

DROP TABLE IF EXISTS `service_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_code` varchar(255) DEFAULT NULL,
  `service_price` double(10,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service_type` int(11) DEFAULT NULL COMMENT '1=Daily Type,2=One Time',
  `service_status` int(11) DEFAULT '1' COMMENT '1=active,2=Delete',
  `user_id` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_info`
--

LOCK TABLES `service_info` WRITE;
/*!40000 ALTER TABLE `service_info` DISABLE KEYS */;
INSERT INTO `service_info` VALUES (1,'Duty Doctor Fee','ser-000001',300.00,'2022-09-11 16:40:24','2022-09-11 10:40:24',NULL,1,NULL,NULL),(2,'Service Charge','ser-000002',500.00,'2022-09-11 16:40:35','2022-09-11 10:40:35',NULL,1,NULL,NULL),(3,'OT Charge','ser-000003',2000.00,'2022-09-11 16:40:41','2022-09-11 10:40:41',NULL,1,NULL,NULL),(4,'Surgeon Fee','ser-000004',5000.00,'2022-09-11 16:40:51','2022-09-11 10:40:51',NULL,1,NULL,NULL),(5,'Oxygen Per Hours','ser-000005',200.00,'2022-09-11 16:41:00','2022-09-11 10:41:00',NULL,1,NULL,NULL),(6,'Nebulization Per Time','ser-000006',300.00,'2022-09-11 16:41:08','2022-09-11 10:41:08',NULL,1,NULL,NULL),(7,'Canulla Fixation Fee','ser-000007',300.00,'2022-09-11 16:41:16','2022-09-11 10:41:16',NULL,1,NULL,NULL),(8,'Catheter Fixation Fee','ser-000008',500.00,'2022-09-11 16:41:25','2022-09-11 10:41:25',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `service_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_order_info`
--

DROP TABLE IF EXISTS `service_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_order_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_order_info`
--

LOCK TABLES `service_order_info` WRITE;
/*!40000 ALTER TABLE `service_order_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_patient_list`
--

DROP TABLE IF EXISTS `service_patient_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_patient_list` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `patient_info_id` varchar(255) DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `ref_doc_name` varchar(250) DEFAULT NULL,
  `ref_doc_name_q` varchar(255) DEFAULT NULL,
  `patient_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `parents_name` varchar(255) DEFAULT NULL,
  `parents_contact` varchar(255) DEFAULT NULL,
  `parents_address` varchar(255) DEFAULT NULL,
  `gurdian_name` varchar(255) DEFAULT NULL,
  `Operation_cost` double(10,2) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `discount_ref` text,
  `total` double(10,2) DEFAULT NULL,
  `advance` double(10,2) DEFAULT NULL,
  `due` double(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `add_by` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `Operation_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_patient_list`
--

LOCK TABLES `service_patient_list` WRITE;
/*!40000 ALTER TABLE `service_patient_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_patient_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_payment_details`
--

DROP TABLE IF EXISTS `service_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_details_id` int(11) NOT NULL DEFAULT '0',
  `old_cost` double NOT NULL DEFAULT '0',
  `current_cost` double NOT NULL DEFAULT '0',
  `paid_cost` int(11) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `discount_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_payment_details`
--

LOCK TABLES `service_payment_details` WRITE;
/*!40000 ALTER TABLE `service_payment_details` DISABLE KEYS */;
INSERT INTO `service_payment_details` VALUES (1,1,300,300,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(2,2,500,500,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(3,3,2000,2000,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(4,4,5000,5000,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(5,5,200,200,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(6,6,300,300,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(7,7,300,300,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(8,8,500,500,0,0,NULL,'care',5,'2022-11-06 00:37:02','2022-11-05 18:37:02'),(9,9,300,300,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(10,10,500,500,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(11,11,2000,2000,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(12,12,5000,5000,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(13,13,200,200,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(14,14,300,300,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(15,15,300,300,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(16,16,500,500,0,0,NULL,'care',5,'2022-11-15 23:01:07','2022-11-15 17:01:07'),(17,17,300,300,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(18,18,500,500,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(19,19,2000,2000,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(20,20,5000,5000,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(21,21,200,200,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(22,22,300,300,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(23,23,300,300,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(24,24,500,500,0,0,NULL,'care',5,'2022-11-29 22:43:43','2022-11-29 16:43:43'),(25,25,300,300,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(26,26,500,500,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(27,27,2000,2000,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(28,28,6000,6000,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(29,29,200,200,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(30,30,300,300,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(31,31,300,300,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(32,32,500,500,0,0,NULL,'care',5,'2022-12-03 16:12:12','2022-12-03 10:12:12'),(33,33,300,300,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(34,34,500,500,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(35,35,2000,2000,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(36,36,7000,7000,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(37,37,200,200,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(38,38,300,300,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(39,39,300,300,0,0,NULL,'care',5,'2022-12-24 13:46:13','2022-12-24 07:46:13'),(40,40,300,300,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(41,41,500,500,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(42,42,2000,2000,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(43,43,5000,5000,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(44,44,200,200,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(45,45,300,300,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(46,46,300,300,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(47,47,500,500,0,0,NULL,'care',5,'2023-01-03 21:33:07','2023-01-03 15:33:07'),(48,48,300,300,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(49,49,500,500,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(50,50,2000,2000,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(51,51,5000,5000,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(52,52,200,200,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(53,53,300,300,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(54,54,300,300,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(55,55,500,500,0,0,NULL,'care',5,'2023-01-11 16:08:33','2023-01-11 10:08:33'),(56,56,300,300,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(57,57,500,500,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(58,58,2000,2000,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(59,59,5000,5000,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(60,60,200,200,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(61,61,300,300,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(62,62,300,300,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(63,63,500,500,0,0,NULL,'care',5,'2023-01-23 22:16:54','2023-01-23 16:16:54'),(64,64,300,300,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(65,65,500,500,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(66,66,2000,2000,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(67,67,5000,5000,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(68,68,200,200,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(69,69,300,300,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(70,70,300,300,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(71,71,500,500,0,0,NULL,'care',5,'2023-01-23 22:38:08','2023-01-23 16:38:08'),(72,72,300,300,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(73,73,500,500,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(74,74,2000,2000,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(75,75,5000,5000,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(76,76,200,200,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(77,77,300,300,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(78,78,300,300,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(79,79,500,500,0,0,NULL,'care',5,'2023-02-24 17:05:06','2023-02-24 11:05:06'),(80,80,300,300,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(81,81,500,500,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(82,82,2000,2000,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(83,83,5000,5000,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(84,84,200,200,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(85,85,300,300,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(86,86,300,300,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52'),(87,87,500,500,0,0,NULL,'care',5,'2023-02-24 17:10:52','2023-02-24 11:10:52');
/*!40000 ALTER TABLE `service_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_ambulance_reciept`
--

DROP TABLE IF EXISTS `sh_tbl_ambulance_reciept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_ambulance_reciept` (
  `amb_reciept_id` int(11) NOT NULL AUTO_INCREMENT,
  `other_dept_p_id` int(11) NOT NULL DEFAULT '0',
  `trip_no` int(21) NOT NULL,
  `date` date NOT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `patient_type` int(11) NOT NULL COMMENT '1= opd 2= ipd 3=other 4 = uhid',
  `patient_name` varchar(100) NOT NULL,
  `patient_mobile_no` varchar(100) DEFAULT NULL,
  `gardian_name` varchar(100) DEFAULT NULL,
  `ambulance_id` int(11) NOT NULL,
  `road_name` varchar(100) NOT NULL,
  `distance` varchar(100) NOT NULL,
  `total_recieve` double NOT NULL,
  `fuel_cost` double(10,2) NOT NULL,
  `road_cost` double(10,2) NOT NULL,
  `service_maintance_cost` double(10,2) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `driver_mobile_no` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `total_cost` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`amb_reciept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_ambulance_reciept`
--

LOCK TABLES `sh_tbl_ambulance_reciept` WRITE;
/*!40000 ALTER TABLE `sh_tbl_ambulance_reciept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_ambulance_reciept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_department`
--

DROP TABLE IF EXISTS `sh_tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_department`
--

LOCK TABLES `sh_tbl_department` WRITE;
/*!40000 ALTER TABLE `sh_tbl_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_designation`
--

DROP TABLE IF EXISTS `sh_tbl_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_designation`
--

LOCK TABLES `sh_tbl_designation` WRITE;
/*!40000 ALTER TABLE `sh_tbl_designation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_emergency_reciept`
--

DROP TABLE IF EXISTS `sh_tbl_emergency_reciept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_emergency_reciept` (
  `emergency_reciept_id` int(11) NOT NULL AUTO_INCREMENT,
  `emergency_no` int(21) NOT NULL,
  `date` date NOT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `patient_type` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `relation_patient` varchar(100) NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `service_doctor` int(11) NOT NULL,
  `gardian_name` varchar(100) DEFAULT NULL COMMENT 'Gardian Name',
  `doctor_fee` double(10,2) NOT NULL,
  `other_cost` varchar(100) NOT NULL COMMENT 'mobile no',
  `hospital_amount` double(10,2) NOT NULL COMMENT 'Service Fee',
  `discount_amount` double DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `refered_doctor` varchar(100) NOT NULL,
  `department` int(100) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`emergency_reciept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_emergency_reciept`
--

LOCK TABLES `sh_tbl_emergency_reciept` WRITE;
/*!40000 ALTER TABLE `sh_tbl_emergency_reciept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_emergency_reciept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_groups`
--

DROP TABLE IF EXISTS `sh_tbl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_groups`
--

LOCK TABLES `sh_tbl_groups` WRITE;
/*!40000 ALTER TABLE `sh_tbl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_lab_in_product`
--

DROP TABLE IF EXISTS `sh_tbl_lab_in_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_lab_in_product` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_code` varchar(10) NOT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `supp_id` int(11) NOT NULL,
  `credit` double NOT NULL,
  `unload_cost` double NOT NULL DEFAULT '0',
  `debit` double NOT NULL,
  `cost_total` double NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'track who logged in system',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1=active 2 = delete',
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_lab_in_product`
--

LOCK TABLES `sh_tbl_lab_in_product` WRITE;
/*!40000 ALTER TABLE `sh_tbl_lab_in_product` DISABLE KEYS */;
INSERT INTO `sh_tbl_lab_in_product` VALUES (1,'lab-p-0000','1001',1,2000,0,2000,2000,5,1,'care',5,'2023-02-24 15:47:00','2023-02-24 10:20:12'),(2,'lab-000001','1002',1,0,0,0,0,5,1,'care',5,'2023-02-25 18:10:33','2023-02-25 12:10:33'),(3,'lab-000002','1003',1,0,0,0,0,5,1,'care',5,'2023-02-25 18:11:06','2023-02-25 12:11:06');
/*!40000 ALTER TABLE `sh_tbl_lab_in_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_lab_in_product_details`
--

DROP TABLE IF EXISTS `sh_tbl_lab_in_product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_lab_in_product_details` (
  `buy_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `buy_price` double NOT NULL,
  `buy_qty` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`buy_det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_lab_in_product_details`
--

LOCK TABLES `sh_tbl_lab_in_product_details` WRITE;
/*!40000 ALTER TABLE `sh_tbl_lab_in_product_details` DISABLE KEYS */;
INSERT INTO `sh_tbl_lab_in_product_details` VALUES (1,1,2,20,100,'2023-02-24 15:47:00','2023-02-24 09:47:00'),(2,2,3,0,250,'2023-02-25 18:10:33','2023-02-25 12:10:33'),(3,3,3,0,100,'2023-02-25 18:11:06','2023-02-25 12:11:06');
/*!40000 ALTER TABLE `sh_tbl_lab_in_product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_lab_product`
--

DROP TABLE IF EXISTS `sh_tbl_lab_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_lab_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `p_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_buy_price` double NOT NULL DEFAULT '0',
  `p_sell_price` double DEFAULT NULL,
  `p_unit_id` int(11) NOT NULL DEFAULT '0',
  `p_cat_id` int(11) NOT NULL DEFAULT '0',
  `p_sub_cat_id` int(11) NOT NULL DEFAULT '0',
  `p_generic_id` int(11) NOT NULL DEFAULT '0',
  `pack_size_id` int(11) DEFAULT '0',
  `p_opening_qty` int(11) NOT NULL DEFAULT '0',
  `p_reorder_qty` int(11) NOT NULL DEFAULT '0',
  `p_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_company_id` int(11) NOT NULL DEFAULT '0',
  `p_current_stock` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_lab_product`
--

LOCK TABLES `sh_tbl_lab_product` WRITE;
/*!40000 ALTER TABLE `sh_tbl_lab_product` DISABLE KEYS */;
INSERT INTO `sh_tbl_lab_product` VALUES (1,'000001','S/Creatine',30,NULL,1,3,0,0,0,0,20,'default.jpg',0,0,1,'2023-02-24 15:45:21','2023-02-24 09:45:21'),(2,'000002\n','S/Creatinene',20,NULL,1,3,0,0,0,100,20,'default.jpg',1,98,1,'2023-02-24 15:46:06','2023-02-24 10:36:45'),(3,'000003\n','Creatinine Reagent',0,NULL,2,6,0,9,0,250,10,'default.jpg',2,350,1,'2023-02-25 18:10:06','2023-02-25 12:11:06');
/*!40000 ALTER TABLE `sh_tbl_lab_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_lab_return_product`
--

DROP TABLE IF EXISTS `sh_tbl_lab_return_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_lab_return_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_cust_id` int(11) NOT NULL DEFAULT '0',
  `buy_sell_bill_no` bigint(20) NOT NULL DEFAULT '0',
  `sell_buy_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1=purchase return 2=sales return',
  `charge` double NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_lab_return_product`
--

LOCK TABLES `sh_tbl_lab_return_product` WRITE;
/*!40000 ALTER TABLE `sh_tbl_lab_return_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_lab_return_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_lab_return_product_det`
--

DROP TABLE IF EXISTS `sh_tbl_lab_return_product_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_lab_return_product_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ret_id` int(11) NOT NULL DEFAULT '0',
  `issued_total_qty` int(11) NOT NULL DEFAULT '0',
  `total_qty` int(11) NOT NULL DEFAULT '0',
  `p_id` int(11) NOT NULL DEFAULT '0',
  `ret_qty` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_lab_return_product_det`
--

LOCK TABLES `sh_tbl_lab_return_product_det` WRITE;
/*!40000 ALTER TABLE `sh_tbl_lab_return_product_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_lab_return_product_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_staff`
--

DROP TABLE IF EXISTS `sh_tbl_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `rate_type` varchar(100) DEFAULT NULL,
  `permanent` text,
  `present` text,
  `profile_image` varchar(100) NOT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `nid_no` varchar(100) DEFAULT NULL,
  `total_salary` double(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `from_duty_time` time DEFAULT NULL,
  `to_duty_time` time DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_staff`
--

LOCK TABLES `sh_tbl_staff` WRITE;
/*!40000 ALTER TABLE `sh_tbl_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_staff_salary_genrate`
--

DROP TABLE IF EXISTS `sh_tbl_staff_salary_genrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_staff_salary_genrate` (
  `salary_gen_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `month_year` varchar(100) NOT NULL,
  `generated_date` date DEFAULT NULL,
  `payment_date` date NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `basic_salary` varchar(100) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `t_working_days` int(11) DEFAULT NULL,
  `t_presents` int(11) DEFAULT NULL,
  `t_absent` int(11) DEFAULT NULL,
  `t_late` int(11) DEFAULT NULL,
  `t_overtime` int(11) DEFAULT NULL,
  `t_absent_amount` varchar(255) DEFAULT NULL,
  `t_late_amount` varchar(255) DEFAULT NULL,
  `t_overtime_amount` varchar(255) DEFAULT NULL,
  `salary_type` varchar(255) DEFAULT NULL,
  `payment_type` varchar(100) DEFAULT NULL COMMENT '1=due,2=cash,3=check,4=bkash,5=nogod',
  `perdaysalary` varchar(255) DEFAULT NULL,
  `total_payble_salary` varchar(255) DEFAULT NULL,
  `payment_salary` varchar(100) DEFAULT NULL,
  `pay_status` varchar(100) DEFAULT 'Unpaid' COMMENT '1=unpaid,2=paid',
  `created_at` datetime NOT NULL,
  `operator_name` varchar(100) NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`salary_gen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_staff_salary_genrate`
--

LOCK TABLES `sh_tbl_staff_salary_genrate` WRITE;
/*!40000 ALTER TABLE `sh_tbl_staff_salary_genrate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sh_tbl_staff_salary_genrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_tbl_stock`
--

DROP TABLE IF EXISTS `sh_tbl_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sh_tbl_stock` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_buy_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `st_open` int(11) NOT NULL DEFAULT '0',
  `st_in` double NOT NULL,
  `st_out` double NOT NULL,
  `st_close` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL COMMENT '1=IN, 2=OUT,3=return	',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_tbl_stock`
--

LOCK TABLES `sh_tbl_stock` WRITE;
/*!40000 ALTER TABLE `sh_tbl_stock` DISABLE KEYS */;
INSERT INTO `sh_tbl_stock` VALUES (1,1,7,0,0,1,-1,1,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(2,1,0,0,0,0,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(3,1,0,0,0,0,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(4,1,0,0,0,0,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(5,1,0,0,0,0,0,1,'2022-10-30 17:02:21','2022-10-30 11:02:21'),(6,2,7,-1,0,1,-2,1,'2022-10-30 17:39:28','2022-10-30 11:39:28'),(7,2,0,0,0,0,0,1,'2022-10-30 17:39:28','2022-10-30 11:39:28'),(8,3,0,0,0,1,-1,1,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(9,3,0,-1,0,0,-1,1,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(10,3,0,-1,0,0,-1,1,'2022-11-28 13:25:15','2022-11-28 07:25:15'),(11,4,0,-1,0,0,-1,1,'2022-11-28 18:15:07','2022-11-28 12:15:07'),(12,5,0,-1,0,0,-1,1,'2022-11-28 18:20:35','2022-11-28 12:20:35'),(13,6,0,-1,0,0,-1,1,'2022-11-28 18:23:19','2022-11-28 12:23:19'),(14,7,0,-1,0,0,-1,1,'2022-11-28 18:26:32','2022-11-28 12:26:32'),(15,8,0,-1,0,0,-1,1,'2022-11-28 18:44:25','2022-11-28 12:44:25'),(16,9,0,-1,0,0,-1,1,'2022-11-28 18:46:31','2022-11-28 12:46:31'),(17,10,0,-1,0,0,-1,1,'2022-11-28 18:49:46','2022-11-28 12:49:46'),(18,11,0,-1,0,1,-2,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(19,11,0,-2,0,0,-2,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(20,11,0,-2,0,0,-2,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(21,11,0,-2,0,0,-2,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(22,11,0,-2,0,0,-2,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(23,11,0,-2,0,0,-2,1,'2022-11-29 23:29:17','2022-11-29 17:29:17'),(24,12,0,-2,0,1,-3,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(25,12,0,-3,0,0,-3,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(26,12,0,-3,0,0,-3,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(27,12,0,-3,0,0,-3,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(28,12,0,-3,0,0,-3,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(29,12,0,-3,0,0,-3,1,'2022-11-29 23:32:27','2022-11-29 17:32:27'),(30,13,0,-3,0,1,-4,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(31,13,0,-4,0,0,-4,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(32,13,0,-4,0,0,-4,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(33,13,0,-4,0,0,-4,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(34,13,0,-4,0,0,-4,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(35,13,0,-4,0,0,-4,1,'2022-11-29 23:33:48','2022-11-29 17:33:48'),(36,14,0,-4,0,1,-5,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(37,14,0,-5,0,0,-5,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(38,14,0,-5,0,0,-5,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(39,14,0,-5,0,0,-5,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(40,14,0,-5,0,0,-5,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(41,14,0,-5,0,0,-5,1,'2022-12-02 22:53:31','2022-12-02 16:53:31'),(42,15,0,-5,0,0,-5,1,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(43,15,0,-5,0,0,-5,1,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(44,15,0,-5,0,0,-5,1,'2022-12-03 15:27:01','2022-12-03 09:27:01'),(45,16,0,-5,0,0,-5,1,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(46,16,0,-5,0,0,-5,1,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(47,16,0,-5,0,0,-5,1,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(48,16,0,-5,0,0,-5,1,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(49,16,0,-5,0,0,-5,1,'2022-12-03 15:36:11','2022-12-03 09:36:11'),(50,17,0,-5,0,0,-5,1,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(51,17,0,-5,0,0,-5,1,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(52,17,0,-5,0,0,-5,1,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(53,17,0,-5,0,0,-5,1,'2022-12-03 15:42:41','2022-12-03 09:42:41'),(54,18,0,-5,0,1,-6,1,'2022-12-03 16:15:43','2022-12-03 10:15:43'),(55,19,0,-6,0,0,-6,1,'2022-12-11 23:59:53','2022-12-11 17:59:53'),(56,19,0,-6,0,0,-6,1,'2022-12-11 23:59:53','2022-12-11 17:59:53'),(57,20,0,-6,0,0,-6,1,'2022-12-14 02:08:01','2022-12-13 20:08:01'),(58,20,0,-6,0,0,-6,1,'2022-12-14 02:08:01','2022-12-13 20:08:01'),(59,21,0,-6,0,1,-7,1,'2022-12-24 13:43:18','2022-12-24 07:43:18'),(60,21,0,-7,0,0,-7,1,'2022-12-24 13:43:18','2022-12-24 07:43:18'),(61,22,0,-7,0,0,-7,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(62,22,0,-7,0,0,-7,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(63,22,0,-7,0,0,-7,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(64,22,0,-7,0,0,-7,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(65,22,0,-7,0,0,-7,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(66,22,0,-7,0,0,-7,1,'2022-12-28 16:28:46','2022-12-28 10:28:46'),(67,23,0,-7,0,1,-8,1,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(68,23,0,-8,0,0,-8,1,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(69,23,0,-8,0,0,-8,1,'2022-12-29 16:06:10','2022-12-29 10:06:10'),(70,24,0,-8,0,1,-9,1,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(71,24,0,-9,0,0,-9,1,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(72,24,0,-9,0,0,-9,1,'2023-01-29 15:58:10','2023-01-29 09:58:10'),(73,25,0,-9,0,0,-9,1,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(74,25,0,-9,0,0,-9,1,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(75,25,0,-9,0,0,-9,1,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(76,25,0,-9,0,0,-9,1,'2023-02-04 10:50:56','2023-02-04 04:50:56'),(77,26,0,-9,0,0,-9,1,'2023-02-04 10:55:45','2023-02-04 04:55:45'),(78,1,2,0,100,0,100,1,'2023-02-24 15:47:00','2023-02-24 09:47:00'),(79,27,0,-9,0,1,-10,1,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(80,27,0,-10,0,0,-10,1,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(81,27,0,-10,0,0,-10,1,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(82,27,0,-10,0,0,-10,1,'2023-02-24 15:59:56','2023-02-24 09:59:56'),(83,28,0,-10,0,0,-10,1,'2023-02-24 16:05:40','2023-02-24 10:05:40'),(84,29,0,-10,0,1,-11,1,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(85,29,0,-11,0,0,-11,1,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(86,29,2,100,0,1,99,1,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(87,29,0,-11,0,0,-11,1,'2023-02-24 16:35:31','2023-02-24 10:35:31'),(88,30,0,-11,0,1,-12,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(89,30,0,-12,0,0,-12,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(90,30,2,99,0,1,98,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(91,30,0,-12,0,0,-12,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(92,30,0,-12,0,0,-12,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(93,30,0,-12,0,0,-12,1,'2023-02-24 16:36:45','2023-02-24 10:36:45'),(94,31,0,-12,0,1,-13,1,'2023-02-24 16:50:04','2023-02-24 10:50:04'),(95,31,0,-13,0,0,-13,1,'2023-02-24 16:50:04','2023-02-24 10:50:04'),(96,32,0,-13,0,1,-14,1,'2023-02-24 17:19:47','2023-02-24 11:19:47'),(97,32,0,-14,0,0,-14,1,'2023-02-24 17:19:47','2023-02-24 11:19:47'),(98,2,3,0,250,0,250,1,'2023-02-25 18:10:33','2023-02-25 12:10:33'),(99,3,3,250,100,0,350,1,'2023-02-25 18:11:06','2023-02-25 12:11:06');
/*!40000 ALTER TABLE `sh_tbl_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_holder_member`
--

DROP TABLE IF EXISTS `share_holder_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_holder_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `share_holder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nominee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation_id` int(11) NOT NULL DEFAULT '0',
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `share_holder_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nid_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_installment` double NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_holder_member`
--

LOCK TABLES `share_holder_member` WRITE;
/*!40000 ALTER TABLE `share_holder_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_holder_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_holder_type`
--

DROP TABLE IF EXISTS `share_holder_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share_holder_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `return_amount` double NOT NULL DEFAULT '0',
  `gratuity_type` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_holder_type`
--

LOCK TABLES `share_holder_type` WRITE;
/*!40000 ALTER TABLE `share_holder_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `share_holder_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_buy_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `st_open` int(11) NOT NULL DEFAULT '0',
  `st_in` double NOT NULL,
  `st_out` double NOT NULL,
  `st_close` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL COMMENT '1=buy, 2=sell,3=return',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (6,2,1,NULL,'2024-10-04 00:00:00',95,0,1,94,2,'2022-11-04 20:58:10','2022-11-04 14:58:10'),(7,3,1,NULL,'2024-10-04 00:00:00',94,0,3,91,2,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(8,3,2,NULL,'2023-10-25 00:00:00',100,0,4,96,2,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(9,3,3,NULL,'2023-10-24 00:00:00',100,0,4,96,2,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(10,3,4,NULL,'2023-10-31 00:00:00',100,0,4,96,2,'2022-11-28 13:27:05','2022-11-28 07:27:05'),(11,4,1,NULL,'2024-10-04 00:00:00',91,0,10,81,2,'2022-12-03 16:04:49','2022-12-03 10:04:49'),(12,4,2,NULL,'2023-10-25 00:00:00',96,0,10,86,2,'2022-12-03 16:04:49','2022-12-03 10:04:49'),(13,2,1,NULL,'2025-12-31 00:00:00',0,100,0,100,1,'2022-12-03 16:07:06','2022-12-03 10:07:06'),(14,4,1,NULL,'2024-10-04 00:00:00',81,0,81,0,2,'2022-12-03 16:07:54','2022-12-03 10:07:54'),(15,5,1,NULL,'2025-12-31 00:00:00',0,0,3,-3,2,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(16,5,2,NULL,'2023-10-25 00:00:00',86,0,4,82,2,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(17,5,3,NULL,'2023-10-24 00:00:00',96,0,4,92,2,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(18,5,4,NULL,'2023-10-31 00:00:00',96,0,4,92,2,'2022-12-29 16:07:29','2022-12-29 10:07:29'),(19,6,1,NULL,'2025-12-31 00:00:00',-3,0,3,-6,2,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(20,6,2,NULL,'2023-10-25 00:00:00',82,0,3,79,2,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(21,6,3,NULL,'2023-10-24 00:00:00',92,0,4,88,2,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(22,6,4,NULL,'2023-10-31 00:00:00',92,0,3,89,2,'2023-01-11 15:40:56','2023-01-11 09:40:56'),(23,1,1,NULL,'2025-12-31 00:00:00',-6,0,3,-9,2,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(24,1,2,NULL,'2023-10-25 00:00:00',79,0,4,75,2,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(25,1,3,NULL,'2023-10-24 00:00:00',88,0,8,80,2,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(26,1,4,NULL,'2023-10-31 00:00:00',89,0,4,85,2,'2023-01-11 16:07:21','2023-01-11 10:07:21'),(27,7,1,NULL,'2025-12-31 00:00:00',-9,0,3,-12,2,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(28,7,2,NULL,'2023-10-25 00:00:00',75,0,2,73,2,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(29,7,3,NULL,'2023-10-24 00:00:00',80,0,1,79,2,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(30,7,4,NULL,'2023-10-31 00:00:00',85,0,1,84,2,'2023-01-18 00:22:11','2023-01-17 18:22:11'),(31,8,1,NULL,'2025-12-31 00:00:00',-12,0,1,-13,2,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(32,8,2,NULL,'2023-10-25 00:00:00',73,0,1,72,2,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(33,8,3,NULL,'2023-10-24 00:00:00',79,0,1,78,2,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(34,8,4,NULL,'2023-10-31 00:00:00',84,0,1,83,2,'2023-01-18 00:22:26','2023-01-17 18:22:26'),(35,9,1,NULL,'2025-12-31 00:00:00',-13,0,1,-14,2,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(36,9,2,NULL,'2023-10-25 00:00:00',72,0,1,71,2,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(37,9,3,NULL,'2023-10-24 00:00:00',78,0,1,77,2,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(38,9,4,NULL,'2023-10-31 00:00:00',83,0,1,82,2,'2023-01-18 00:23:09','2023-01-17 18:23:09'),(39,9,1,NULL,'2025-12-31 00:00:00',-14,0,1,-15,2,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(40,9,2,NULL,'2023-10-25 00:00:00',71,0,1,70,2,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(41,9,3,NULL,'2023-10-24 00:00:00',77,0,1,76,2,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(42,9,4,NULL,'2023-10-31 00:00:00',82,0,1,81,2,'2023-01-18 00:23:19','2023-01-17 18:23:19'),(43,9,1,NULL,'2025-12-31 00:00:00',-15,0,1,-16,2,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(44,9,2,NULL,'2023-10-25 00:00:00',70,0,1,69,2,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(45,9,3,NULL,'2023-10-24 00:00:00',76,0,1,75,2,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(46,9,4,NULL,'2023-10-31 00:00:00',81,0,1,80,2,'2023-01-18 00:23:29','2023-01-17 18:23:29'),(47,9,1,NULL,'2025-12-31 00:00:00',-16,0,1,-17,2,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(48,9,2,NULL,'2023-10-25 00:00:00',69,0,1,68,2,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(49,9,3,NULL,'2023-10-24 00:00:00',75,0,1,74,2,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(50,9,4,NULL,'2023-10-31 00:00:00',80,0,1,79,2,'2023-01-18 00:23:41','2023-01-17 18:23:41'),(51,10,1,NULL,'2025-12-31 00:00:00',-17,0,6,-23,2,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(52,10,2,NULL,'2023-10-25 00:00:00',68,0,3,65,2,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(53,10,3,NULL,'2023-10-24 00:00:00',74,0,4,70,2,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(54,10,4,NULL,'2023-10-31 00:00:00',79,0,4,75,2,'2023-02-04 23:17:08','2023-02-04 17:17:08'),(55,11,1,NULL,'2025-12-31 00:00:00',-23,0,2,-25,2,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(56,11,2,NULL,'2023-10-25 00:00:00',65,0,3,62,2,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(57,11,3,NULL,'2023-10-24 00:00:00',70,0,3,67,2,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(58,11,4,NULL,'2023-10-31 00:00:00',75,0,2,73,2,'2023-02-04 23:17:43','2023-02-04 17:17:43'),(59,12,1,NULL,'2025-12-31 00:00:00',-25,0,3,-28,2,'2023-02-24 17:21:12','2023-02-24 11:21:12'),(60,12,2,NULL,'2023-10-25 00:00:00',62,0,3,59,2,'2023-02-24 17:21:12','2023-02-24 11:21:12'),(61,12,3,NULL,'2023-10-24 00:00:00',67,0,3,64,2,'2023-02-24 17:21:12','2023-02-24 11:21:12');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_history`
--

DROP TABLE IF EXISTS `stock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_history` (
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_table_id` int(11) NOT NULL DEFAULT '0',
  `sell_buy_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `st_open` int(11) NOT NULL DEFAULT '0',
  `st_in` double NOT NULL,
  `st_out` double NOT NULL,
  `st_close` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL COMMENT '1=buy, 2=sell,3=purchase_return,4=sale_return',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_history`
--

LOCK TABLES `stock_history` WRITE;
/*!40000 ALTER TABLE `stock_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supp_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supp_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Jamal Square','0191123222','Hajigonj',1,'2022-10-06 21:31:50','2022-10-06 15:31:50');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ambulance`
--

DROP TABLE IF EXISTS `tbl_ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ambulance` (
  `ambulance_id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_id` varchar(255) DEFAULT NULL,
  `ambulance_no` varchar(100) DEFAULT NULL,
  `ambulance_category` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `pby` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `operator_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ambulance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ambulance`
--

LOCK TABLES `tbl_ambulance` WRITE;
/*!40000 ALTER TABLE `tbl_ambulance` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ambulance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uhid`
--

DROP TABLE IF EXISTS `uhid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uhid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gen_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uhid` int(11) NOT NULL DEFAULT '0',
  `patient_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `ref_doc_id` int(11) NOT NULL DEFAULT '0',
  `ref_doc_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blood_group` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `patient_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uhid`
--

LOCK TABLES `uhid` WRITE;
/*!40000 ALTER TABLE `uhid` DISABLE KEYS */;
INSERT INTO `uhid` VALUES (3,'000003',0,'DIN MD (SHETO)','01624-79 49 10','12 D 7 M 37 Y','1985-04-20',6,'Dr.Shahida Sultana Nishe ','Male',4,'dinmohammadsheto86@gmail.com','','',1,'2022-12-01 00:00:00','2022-12-01 10:41:36','care',5),(4,'000004',0,'DIN MD: SHETO','01624-79 49 10','12 D 7 M 37 Y','1985-04-20',3,'Dr.Younus Khan ','Male',4,'dinmohammadsheto86@gmail.com','','WhatsApp_Image_2022-12-01_at_4_46_41_PM_jpeg_4.jpeg',1,'2022-12-01 00:00:00','2022-12-01 10:50:57','care',5),(5,'000005',0,'Md:Kamrul Islam','01813322678','17 D 7 M 37 Y','1985-04-20',3,'Dr.Younus Khan ','Male',4,'','','638f07fba0bfe.png',1,'2022-12-06 00:00:00','2022-12-06 09:14:35','care',5),(6,'000006',0,'MD:ZAKIR HOSSAIN','01557051687','28 D 4 M 45 Y','1977-08-01',3,'Dr.Younus Khan ','Male',2,'','','20221229_155134_jpg_6.jpg',1,'2022-12-29 00:00:00','2022-12-29 09:53:16','care',5),(7,'000007',0,'MD:SOJIB','01813322678','28 D 3 M 37 Y','1985-09-01',3,'Dr.Younus Khan ','Male',2,'shcomputers11@gmail.com','','63ad6e31cd1ef.png',1,'2022-12-29 00:00:00','2022-12-29 10:38:41','care',5),(8,'000008',0,'Mr:Kawsan','01811322678','16 D 3 M 29 Y','1993-10-01',3,'Dr.Younus Khan ','Male',2,'','','63c698b40bc32.png',1,'2023-01-17 00:00:00','2023-01-17 12:46:44','care',5),(9,'000009',0,'DM DMS','01813322678','11 D 44 Y','1979-01-06',3,'Dr.Younus Khan ','Male',4,'','','63c69dab7ba5b.png',1,'2023-01-17 00:00:00','2023-01-17 13:07:55','care',5),(10,'000010',0,'MR SALAM','01917536789','16 D 15 Y','2008-01-01',3,'Dr.Younus Khan ','Male',1,'','','63c69e1716a4c.png',1,'2023-01-17 00:00:00','2023-01-17 13:09:43','care',5),(11,'000011',0,'Mr: Abul Hossain','0164985265','16 D 18 Y','2005-01-01',3,'Dr.Younus Khan ','Male',3,'','','63c69e9645d7f.png',1,'2023-01-17 00:00:00','2023-01-17 13:11:50','care',5),(12,'000012',0,'Md:Golam Sistia','01735-701167','17 D 37 Y','1986-01-01',3,'Dr.Younus Khan ','Male',2,'','','20230117_192254_jpg_12.jpg',1,'2023-01-18 00:00:00','2023-01-18 04:02:17','care',5);
/*!40000 ALTER TABLE `uhid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_info`
--

DROP TABLE IF EXISTS `unit_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_info`
--

LOCK TABLES `unit_info` WRITE;
/*!40000 ALTER TABLE `unit_info` DISABLE KEYS */;
INSERT INTO `unit_info` VALUES (1,'pcs',1,NULL,'2022-09-11 10:42:22'),(2,'m/l',1,NULL,'2019-05-16 10:25:52');
/*!40000 ALTER TABLE `unit_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vat`
--

DROP TABLE IF EXISTS `vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_for` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vat`
--

LOCK TABLES `vat` WRITE;
/*!40000 ALTER TABLE `vat` DISABLE KEYS */;
/*!40000 ALTER TABLE `vat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-28  2:09:48