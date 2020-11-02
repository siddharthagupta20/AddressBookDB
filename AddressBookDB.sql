-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: address_book
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `ad_book`
--

DROP TABLE IF EXISTS `ad_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_book` (
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` bigint NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_book`
--

LOCK TABLES `ad_book` WRITE;
/*!40000 ALTER TABLE `ad_book` DISABLE KEYS */;
INSERT INTO `ad_book` VALUES ('Donald','Trump','2 don street','washington','us of a',222222,'22 2222222222','dont-67@gmail.com','AB1','friend'),('Yoshihide','Suga','skytree','tokyo','japan',333333,'33 3333333333','yoshibaba@gmail.com','AB1','family'),('Scott','Morrison','Questacon','Canberra','Australia',444444,'44 4444444444','scotty@gmail.com','AB1','professional'),('Ashraf','Ghani','gardens of babur','Kabul','Afghanistan',555555,'55 55555555','ashraf@gmail.com','AB1','professional'),('Vladimir','Putin','KGB HQ','Moscow','Russia',666666,'66 6666666666','legend@gmail.com','AB1','friend');
/*!40000 ALTER TABLE `ad_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `person_id` int unsigned NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` bigint NOT NULL,
  KEY `person_id` (`person_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person_contact` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2 don street','washington','us of a',222222),(2,'skytree','tokyo','japan',333333),(3,'gardens of babur','Kabul','Afghanistan',555555),(4,'Questacon','Canberra','Australia',444444),(5,'KGB HQ','Moscow','Russia',666666);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_books`
--

DROP TABLE IF EXISTS `address_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_books` (
  `ab_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ab_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ab_id`),
  UNIQUE KEY `ab_id` (`ab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_books`
--

LOCK TABLES `address_books` WRITE;
/*!40000 ALTER TABLE `address_books` DISABLE KEYS */;
INSERT INTO `address_books` VALUES (1,'AB1'),(2,'AB2');
/*!40000 ALTER TABLE `address_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_type`
--

DROP TABLE IF EXISTS `contact_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_type` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_type`
--

LOCK TABLES `contact_type` WRITE;
/*!40000 ALTER TABLE `contact_type` DISABLE KEYS */;
INSERT INTO `contact_type` VALUES (1,'Family'),(2,'Friend'),(3,'Professional');
/*!40000 ALTER TABLE `contact_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_contact`
--

DROP TABLE IF EXISTS `person_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_contact` (
  `person_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ab_id` int unsigned NOT NULL,
  `type_id` int unsigned NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_id` (`person_id`),
  KEY `ab_id` (`ab_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `person_contact_ibfk_1` FOREIGN KEY (`ab_id`) REFERENCES `address_books` (`ab_id`),
  CONSTRAINT `person_contact_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `contact_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_contact`
--

LOCK TABLES `person_contact` WRITE;
/*!40000 ALTER TABLE `person_contact` DISABLE KEYS */;
INSERT INTO `person_contact` VALUES (1,'Donald','Trump','dont-67@gmail.com',1,2),(2,'Yoshihide','Suga','yoshibaba@gmail.com',1,1),(3,'Ashraf','Ghani','ashraf@gmail.com',1,3),(4,'Scott','Morrison','scotty@gmail.com',1,3),(5,'Vladimir','Putin','legend@gmail.com',1,2);
/*!40000 ALTER TABLE `person_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_numbers` (
  `person_id` int unsigned NOT NULL,
  `ph_no` varchar(50) NOT NULL,
  UNIQUE KEY `ph_no` (`ph_no`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `phone_numbers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person_contact` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (1,'11 1111111111'),(2,'22 2222222222'),(3,'33 3333333333'),(4,'44 4444444444'),(5,'50 5050505050'),(5,'55 5555555555');
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 21:12:18
