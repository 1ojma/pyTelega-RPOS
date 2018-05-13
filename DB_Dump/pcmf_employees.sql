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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `idEmployee` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `Position` varchar(45) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `Birth_date` date DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `Sex` enum('male','female') NOT NULL,
  `Salary` int(11) NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Owner','Ilya','Divak','1997-11-02','+375291554536','ilya_divak@tut.by','male',3000),(2,'Director','Varvara','Soloveiko','1998-11-01','+375333815895','vs@list.ru','female',2800),(3,'Аccountant','Mikhail','Prohorov','1993-08-16','+375446495163','MiProh@gmail.com','male',2000),(4,'Manager','Elena','Kromkina','1995-05-25','+375295016321','Kromkina@hotmail.com','female',1750),(5,'Main worker','Andrei','Prihodkin','1990-01-12','+375339067312','APrih@icloud.com','male',1200),(6,'Worker','Alexander','Kupalov','1992-07-12','+375253039251','Kupala@tut.by','male',900),(7,'Worker','Svetlana','Rusakova','1985-03-03','+375445901245','SvetRus@mail.ru','female',900),(8,'Worker','Elisei','Muzyka','1987-12-14','+375292150264','EliseiMuz@gmail.com','male',900),(9,'Worker','Egor','Andronov','1989-09-15','+375446021621','Andron@tut.by','male',900),(10,'Tester','Tony','Stark','1965-04-04','+11010101','StarkInd@gmail.com','male',1500);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-13 19:29:21
