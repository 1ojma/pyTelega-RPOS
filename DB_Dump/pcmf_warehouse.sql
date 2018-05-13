-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: pcmf
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `warehouse` (
  `idDevice` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `idType` smallint(1) unsigned NOT NULL,
  `idCompany` smallint(1) unsigned NOT NULL,
  `idPC` smallint(1) unsigned NOT NULL,
  `DevName` varchar(45) NOT NULL,
  `Count` int(11) DEFAULT '0',
  PRIMARY KEY (`idDevice`,`idType`,`idCompany`,`idPC`),
  KEY `fk_Warehouse_DetailTypes1_idx` (`idType`),
  KEY `fk_Warehouse_CompanyName1_idx` (`idCompany`),
  KEY `fk_Warehouse_Manufacture1_idx` (`idPC`),
  CONSTRAINT `fk_Warehouse_CompanyName1` FOREIGN KEY (`idCompany`) REFERENCES `company` (`idcompany`),
  CONSTRAINT `fk_Warehouse_DetailTypes1` FOREIGN KEY (`idType`) REFERENCES `detailtypes` (`idtype`),
  CONSTRAINT `fk_Warehouse_Manufacture1` FOREIGN KEY (`idPC`) REFERENCES `manufacture` (`idpc`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,1,1,1,'Core i7-8700K',15),(2,2,6,1,'GeForce GTX 1080 Ti',13),(3,3,7,1,'Fury Storm DDR4-32GB',10),(4,4,8,1,'Black 2TB',9),(5,5,3,1,'Z370 AORUS ULTRA GAMING',7),(6,6,5,1,'ZM1200-EBT',13),(7,7,4,1,'Dukase V2',9),(8,1,2,2,'AMD A4-4020',16),(9,1,1,3,'Core i3-7100',7),(10,1,1,4,'Xeon E5-2620 V3',5),(11,2,6,3,'GeForce GTX 1050 Ti',9),(12,3,9,2,'DDR3-4GB',19),(13,3,7,3,'Fury Storm 8GB',7),(14,3,9,4,'DDR4-16GB',25),(15,4,8,2,'Green 320 GB',21),(16,4,8,3,'Blue 1TB',15),(17,4,8,4,'Red 1TB',18),(18,5,3,2,'GA-F2A88XM-DS2',5),(19,5,3,3,'GA-H110-D3A ',6),(20,5,3,4,'GA-X99-UD4 ',8),(21,6,10,2,'AP-450',17),(22,6,5,3,'ZM450-LX',12),(23,6,5,4,'ZM1000-EBT',16),(24,7,10,2,'Ecom 3925',13),(25,7,5,3,'ZM-T1',6),(26,7,11,4,'Z640',13);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-13 19:29:20
