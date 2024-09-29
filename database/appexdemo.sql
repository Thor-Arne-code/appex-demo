CREATE DATABASE  IF NOT EXISTS `appexdemo` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `appexdemo`;
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
  `ID_Kontakt` int NOT NULL AUTO_INCREMENT,
  `Rel_Leverandor` int unsigned NOT NULL,
  `Rel_Roller` int NOT NULL DEFAULT '1',
  `Fornavn` varchar(45) DEFAULT NULL,
  `Etternavn` varchar(45) DEFAULT NULL,
  `Epost` varchar(100) DEFAULT NULL,
  `Telefon` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ID_Kontakt`),
  UNIQUE KEY `ID_UNIQUE` (`ID_Kontakt`),
  KEY `fk_Kontakt_Leverandor_idx` (`Rel_Leverandor`),
  KEY `fk_Kontakt_Roller1_idx` (`Rel_Roller`),
  CONSTRAINT `fk_Kontakt_Leverandor` FOREIGN KEY (`Rel_Leverandor`) REFERENCES `leverandor` (`ID_Leverandor`),
  CONSTRAINT `fk_Kontakt_Roller1` FOREIGN KEY (`Rel_Roller`) REFERENCES `roller` (`ID_Roller`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kontakt`
--

LOCK TABLES `kontakt` WRITE;
/*!40000 ALTER TABLE `kontakt` DISABLE KEYS */;
INSERT INTO `kontakt` VALUES (1,1,2,'Erik','Fremmersvik','tore.fremmersvik@appex.no','+47 982 17 647'),(2,1,9,'Jorunn B.','Ekerhovd','jorunn.ekerhovd@appex.no','+47 950 31 716'),(3,2,1,'Ola','Normann',NULL,NULL),(4,2,1,'Kari','Normann',NULL,NULL),(5,1,4,'Hein Tore','Tønnesen','hein.tore.tonnesen@appex.no','+47 977 33 822'),(6,1,4,'Anne Grete','Müller','anne.grete.muller@appex.no','+47 994 09 333'),(7,1,4,'Jon','Nielsen','jon.nielsen@appex.no','+47 977 76 061'),(8,1,5,'Eivinf J. W.','Fixsdal',NULL,'+47 975 70 102'),(9,1,6,'Nina Maria','Nordskog',NULL,'+47 930 88 087'),(10,1,7,'Øystein','Olsen',NULL,NULL),(11,1,8,'Pål','Osmundsen',NULL,'+47 416 07 871'),(12,1,10,'Andreas','Bro Motland',NULL,'+47 944 97 579'),(13,1,10,'Andrew','Hughes',NULL,NULL),(14,1,10,'Gry','Dahle Liw',NULL,'+47 909 15 834'),(15,1,10,'Heidi Elise','Alfsen',NULL,'+47 489 56 497'),(16,1,14,'Aase','Kjær',NULL,NULL),(17,1,11,'Jørgen','Freim',NULL,NULL),(18,1,12,'Hanna','Haug Flatebø',NULL,NULL),(19,1,13,'Morten A.','Lervik',NULL,NULL),(20,1,15,'Helene','Syre',NULL,NULL),(21,1,16,'Veronica','Hansen',NULL,NULL),(22,1,17,'Ine','Rossebø Lauvvik',NULL,NULL),(23,1,17,'Sirill','Klovning',NULL,NULL),(24,1,18,'Gunnar','Kvilhaug',NULL,NULL),(25,1,20,'Anders','Døsen',NULL,NULL),(26,1,21,'Asbjørn','Kallevik',NULL,NULL),(27,1,21,'Nhien','Phung',NULL,NULL),(28,1,22,'Bjørn Helge','Bådsvik',NULL,NULL),(29,1,22,'Ingve','Moss Liknes',NULL,NULL),(30,1,22,'Andreas','Ringdal',NULL,NULL),(31,1,22,'Ola','Alsaker',NULL,NULL),(32,1,23,'Ingebrigt','Stene Holstad',NULL,NULL),(33,1,3,'Henrik','Norheim Nysæther',NULL,NULL);
/*!40000 ALTER TABLE `kontakt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leverandor`
--

DROP TABLE IF EXISTS `leverandor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverandor` (
  `ID_Leverandor` int unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`ID_Leverandor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverandor`
--

LOCK TABLES `leverandor` WRITE;
/*!40000 ALTER TABLE `leverandor` DISABLE KEYS */;
INSERT INTO `leverandor` VALUES (1,'appex','995 412 020','appex.no','09567','hello@appex.no',0.00,'Longhammarvegen 28',NULL,'5536','HAUGESUND'),(2,'Fiktiv levrandor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5555','FØRDE I HORDALAND');
/*!40000 ALTER TABLE `leverandor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller`
--

DROP TABLE IF EXISTS `roller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roller` (
  `ID_Roller` int NOT NULL AUTO_INCREMENT,
  `Rolle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Roller`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller`
--

LOCK TABLES `roller` WRITE;
/*!40000 ALTER TABLE `roller` DISABLE KEYS */;
INSERT INTO `roller` VALUES (1,'(Udefinert)'),(2,'CEO'),(3,'Junior systemutvikler'),(4,'Teamleder'),(5,'Fagleder multimedia'),(6,'Fagleder grafisk design'),(7,'Fagleder expo'),(8,'Seniorrådgiver'),(9,'Administrasjonsansvarlig'),(10,'Prosjektleder'),(11,'Fotograf og designer'),(12,'UI/UX-Designer'),(13,'Grafisk designer'),(14,'Senior designer'),(15,'Junior designer'),(16,'Interiørarkitekt'),(17,'Digital innholdsprodusent'),(18,'Digital kreatør'),(19,'Senior digital markedsfører'),(20,'Senior webutvikler'),(21,'Webutvikler'),(22,'Senior systemutvikler'),(23,'Systemutvikler');
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

-- Dump completed on 2024-09-29 15:26:01
