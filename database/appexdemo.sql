-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: appexdemo
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `kontakt`
--

DROP TABLE IF EXISTS `kontakt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kontakt` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Rel_Leverandor` int unsigned NOT NULL,
  `Fornavn` varchar(45) DEFAULT NULL,
  `Etternavn` varchar(45) DEFAULT NULL,
  `Epost` varchar(100) DEFAULT NULL,
  `Telefon` varchar(14) DEFAULT NULL,
  `Stilling_Rel` int DEFAULT NULL,
  `Roller_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_Kontakt_Leverandor_idx` (`Rel_Leverandor`),
  KEY `fk_Kontakt_Roller1_idx` (`Roller_ID`),
  CONSTRAINT `fk_Kontakt_Leverandor` FOREIGN KEY (`Rel_Leverandor`) REFERENCES `leverandor` (`ID`),
  CONSTRAINT `fk_Kontakt_Roller1` FOREIGN KEY (`Roller_ID`) REFERENCES `roller` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakt`
--

LOCK TABLES `kontakt` WRITE;
/*!40000 ALTER TABLE `kontakt` DISABLE KEYS */;
/*!40000 ALTER TABLE `kontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leverandor`
--

DROP TABLE IF EXISTS `leverandor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverandor` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Navn` varchar(45) NOT NULL,
  `OrgNr` varchar(15) DEFAULT NULL,
  `Hjemmeside` varchar(100) DEFAULT NULL,
  `TlfSentralbord` varchar(14) DEFAULT NULL,
  `Epost` varchar(45) DEFAULT NULL,
  `Rabatt` decimal(2,2) DEFAULT NULL,
  `Addresse1` varchar(45) DEFAULT NULL,
  `Adresse2` varchar(45) DEFAULT NULL,
  `PostNr` varchar(4) DEFAULT NULL,
  `PostSted` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverandor`
--

LOCK TABLES `leverandor` WRITE;
/*!40000 ALTER TABLE `leverandor` DISABLE KEYS */;
/*!40000 ALTER TABLE `leverandor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller`
--

DROP TABLE IF EXISTS `roller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roller` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Rolle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller`
--

LOCK TABLES `roller` WRITE;
/*!40000 ALTER TABLE `roller` DISABLE KEYS */;
INSERT INTO `roller` VALUES (1,'CEO'),(2,'Junior systemutvikler'),(3,'Teamleder'),(4,'Fagleder multimedia'),(5,'Fagleder grafisk design'),(6,'Fagleder expo'),(7,'Seniorrådgiver'),(8,'Seniorrådgiver');
/*!40000 ALTER TABLE `roller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-27  9:37:06
