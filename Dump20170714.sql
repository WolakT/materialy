-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: travelagencydb
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `clerks`
--

DROP TABLE IF EXISTS `clerks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clerks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `job_title` text NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clerks`
--

LOCK TABLES `clerks` WRITE;
/*!40000 ALTER TABLE `clerks` DISABLE KEYS */;
INSERT INTO `clerks` VALUES (1,'Józef Oleksy','Customer service specialist','2010-01-01'),(2,'Angelika Anielska','Manager','2001-12-01');
/*!40000 ALTER TABLE `clerks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `phone_no` int(11) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Jan Nowak',783382923,'krakow'),(2,'Franciszek Nowak',783445923,'Warszawa'),(3,'Hilary Nowak',565900223,'krakow'),(4,'Zenon Ignaciak',782352923,'krakow'),(5,'Kazimierz Maksymiuk',645234232,'Sandomierz'),(6,'Jan Janik',853234422,'Pabianice'),(7,'Anna Adamska',243465232,'krakow');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` text NOT NULL,
  `city` text NOT NULL,
  `hotel` text NOT NULL,
  `hotel_stars` int(1) NOT NULL,
  `price_night` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Greece','Athen','Pinokio',4,115),(2,'Greece','Athen','Panathinaikos',4,115),(3,'Greece','Zakynthos','Turtle',5,115),(4,'Greece','Zakynthos','Amber',3,89),(5,'Greece','Zakynthos','Wreck',2,89),(6,'Spain','Canarian Islands','Ara',5,89),(7,'Greece','Kreta','Essos',4,89),(8,'Austria','Vienna','Oberst',5,89),(9,'Switzerland','Zurich','Cross',5,89),(10,'France','Paris','Tower',4,89),(11,'Italy','Rome','Pasta',5,89),(12,'Spain','Canarian Islands','Ara',5,89),(13,'Greece','Kreta','Essos',4,89);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_in_offer`
--

DROP TABLE IF EXISTS `hotels_in_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels_in_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_offer` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `number_days` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_offer` (`id_offer`),
  KEY `id_hotel` (`id_hotel`),
  CONSTRAINT `hotels_in_offer_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hotels_in_offer_ibfk_2` FOREIGN KEY (`id_hotel`) REFERENCES `hotels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_in_offer`
--

LOCK TABLES `hotels_in_offer` WRITE;
/*!40000 ALTER TABLE `hotels_in_offer` DISABLE KEYS */;
INSERT INTO `hotels_in_offer` VALUES (1,1,1,2),(2,1,1,2),(3,1,3,2),(4,1,4,1),(5,2,3,7),(6,3,2,7),(7,5,4,0),(8,8,9,14);
/*!40000 ALTER TABLE `hotels_in_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hotels` int(11) NOT NULL,
  `number_people` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trip` (`id_hotels`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`id_hotels`) REFERENCES `hotels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,1),(5,1,2),(6,1,3),(7,2,1),(8,2,2),(9,2,3),(10,3,1),(11,3,2),(12,3,3),(13,8,1),(14,5,2),(15,9,3),(16,6,1),(17,7,2),(18,9,3),(19,8,1),(20,10,2),(21,9,3),(22,6,1),(23,7,2),(24,9,3),(25,8,1),(26,10,2),(27,11,3),(28,13,1),(29,7,2),(30,9,3);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `price_with_hotels_people`
--

DROP TABLE IF EXISTS `price_with_hotels_people`;
/*!50001 DROP VIEW IF EXISTS `price_with_hotels_people`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `price_with_hotels_people` AS SELECT 
 1 AS `id`,
 1 AS `offer`,
 1 AS `name`,
 1 AS `start_date`,
 1 AS `country`,
 1 AS `number_days`,
 1 AS `number_people`,
 1 AS `id_hotel`,
 1 AS `price_night`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `price_without_trips`
--

DROP TABLE IF EXISTS `price_without_trips`;
/*!50001 DROP VIEW IF EXISTS `price_without_trips`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `price_without_trips` AS SELECT 
 1 AS `id`,
 1 AS `offer`,
 1 AS `name`,
 1 AS `start_date`,
 1 AS `country`,
 1 AS `number_days`,
 1 AS `id_hotel`,
 1 AS `price_night`,
 1 AS `total_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sold_trips`
--

DROP TABLE IF EXISTS `sold_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_offer` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `id_clerk` int(11) NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_offer` (`id_offer`),
  KEY `id_customer` (`id_customer`),
  KEY `id_clerk` (`id_clerk`),
  CONSTRAINT `sold_trips_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id`),
  CONSTRAINT `sold_trips_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  CONSTRAINT `sold_trips_ibfk_3` FOREIGN KEY (`id_clerk`) REFERENCES `clerks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_trips`
--

LOCK TABLES `sold_trips` WRITE;
/*!40000 ALTER TABLE `sold_trips` DISABLE KEYS */;
INSERT INTO `sold_trips` VALUES (9,1,2,15,1,'2017-08-01'),(10,4,1,5,1,'2017-08-14'),(11,2,3,10,1,'2017-08-01'),(12,1,2,5,2,'2017-08-15'),(13,5,4,15,2,'2017-08-01'),(14,1,1,25,2,'2017-09-15'),(15,6,2,35,1,'2017-07-21'),(16,3,5,15,1,'2017-08-01'),(17,10,5,0,2,'2017-08-01'),(18,11,4,10,1,'2017-10-01');
/*!40000 ALTER TABLE `sold_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` int(11) DEFAULT NULL,
  `question1` text NOT NULL,
  `question2` text NOT NULL,
  `question3` text NOT NULL,
  KEY `id` (`id`),
  CONSTRAINT `surveys_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (4,'yes','yes','yes'),(1,'yes','yes','yes');
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` text NOT NULL,
  `price_person` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'Athen',25),(2,'Rome',34),(3,'Olimp',24);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips_in_offer`
--

DROP TABLE IF EXISTS `trips_in_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips_in_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_offer` int(11) NOT NULL,
  `id_trip` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trip` (`id_trip`),
  KEY `id_offer` (`id_offer`),
  CONSTRAINT `trips_in_offer_ibfk_1` FOREIGN KEY (`id_trip`) REFERENCES `trips` (`id`) ON DELETE CASCADE,
  CONSTRAINT `trips_in_offer_ibfk_2` FOREIGN KEY (`id_offer`) REFERENCES `offers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips_in_offer`
--

LOCK TABLES `trips_in_offer` WRITE;
/*!40000 ALTER TABLE `trips_in_offer` DISABLE KEYS */;
INSERT INTO `trips_in_offer` VALUES (7,1,1),(8,2,1),(9,1,3),(10,3,2),(11,9,1),(12,3,1);
/*!40000 ALTER TABLE `trips_in_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `price_with_hotels_people`
--

/*!50001 DROP VIEW IF EXISTS `price_with_hotels_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`travelAgent`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `price_with_hotels_people` AS select `sold_trips`.`id` AS `id`,`offers`.`id` AS `offer`,`customers`.`name` AS `name`,`sold_trips`.`start_date` AS `start_date`,`hotels`.`country` AS `country`,sum(`hotels_in_offer`.`number_days`) AS `number_days`,`offers`.`number_people` AS `number_people`,`hotels_in_offer`.`id_hotel` AS `id_hotel`,`hotels`.`price_night` AS `price_night`,sum(((`hotels_in_offer`.`number_days` * `hotels`.`price_night`) * `offers`.`number_people`)) AS `total_price` from ((((`sold_trips` join `hotels_in_offer`) join `offers`) join `hotels`) join `customers`) where ((`sold_trips`.`id_offer` = `offers`.`id`) and (`offers`.`id_hotels` = `hotels_in_offer`.`id_offer`) and (`customers`.`id` = `sold_trips`.`id_customer`) and (`hotels_in_offer`.`id_hotel` = `hotels`.`id`)) group by `sold_trips`.`id` order by `sold_trips`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `price_without_trips`
--

/*!50001 DROP VIEW IF EXISTS `price_without_trips`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`travelAgent`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `price_without_trips` AS select `sold_trips`.`id` AS `id`,`offers`.`id` AS `offer`,`customers`.`name` AS `name`,`sold_trips`.`start_date` AS `start_date`,`hotels`.`country` AS `country`,sum(`hotels_in_offer`.`number_days`) AS `number_days`,`hotels_in_offer`.`id_hotel` AS `id_hotel`,`hotels`.`price_night` AS `price_night`,sum((`hotels_in_offer`.`number_days` * `hotels`.`price_night`)) AS `total_price` from ((((`sold_trips` join `hotels_in_offer`) join `offers`) join `hotels`) join `customers`) where ((`sold_trips`.`id_offer` = `offers`.`id`) and (`offers`.`id_hotels` = `hotels_in_offer`.`id_offer`) and (`customers`.`id` = `sold_trips`.`id_customer`) and (`hotels_in_offer`.`id_hotel` = `hotels`.`id`)) group by `sold_trips`.`id` order by `sold_trips`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-14 20:38:33
