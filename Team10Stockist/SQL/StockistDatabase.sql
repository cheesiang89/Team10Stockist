CREATE DATABASE  IF NOT EXISTS `stockist` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stockist`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: stockist
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_number` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,98765412,'swam','swam@yahoo.com'),(2,12345678,'summer','summer@gmail.com'),(3,87654321,'samantha','sam@hotmail.com'),(4,43215678,'sida','sida@e.nus.edu'),(5,56781234,'purva','purva@gmail.com'),(6,43218765,'raymond','raymond@e.ntu.edu'),(7,86754132,'cheesiang','css@hotmail.com'),(8,14587632,'zhihao','zh@gmail.com'),(9,43215876,'xupan','xp@hotmail.com'),(10,90876543,'suria','suria@e.iss.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `part_number` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `color` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dimension` varchar(255) NOT NULL,
  `shelf_location` varchar(255) NOT NULL,
  `unit_price` double NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `minimum_inventory_quantity` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `minimum_reorder_quantity` int(11) NOT NULL,
  PRIMARY KEY (`part_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Right Headlight','Blue','Good','12x12','level1',1.9,'Toyota',11,12,3),(2,'Left Headlight','Yellow','New','22x22','level1',2.3,'Toyota',20,20,14),(34,'Right Fender','White','Good','33x33','level1',31.1,'Honda',20,34,5),(56,'Side Mirrors Left','Red','Good','44x44','level4',11.1,'Honda',30,18,16),(78,'Rear Left Door','Blue','Good','55x43','level3',22.3,'Honda',40,40,27),(90,'Right Side Mirror','Yellow','Good','67x12','level3',22.2,'Nissan',50,43,18),(100,'A/C Control Panel','White','New','11x34','level1',12,'Nissan',60,55,19),(134,'Rear Bumper','White','New','10x31','level2',32.1,'Toyota',55,50,10),(178,'Left Tail Light','Blue','New','11x31','level2',22.5,'Toyota',43,40,12),(234,'Right Tail Light','Yellow','New','21x11','level1',44.2,'Mitsubishi',22,20,14),(345,'A/C Compressor','Yellow','New','22x22','level1',32.7,'Mitsubishi',34,36,15),(567,'Left Tail Light','Yellow','New','33x33','level1',12.9,'Mitsubishi',45,38,16),(789,'Front Right Door','White','New','33x33','level3',0.99,'Subaru',32,30,17),(800,'Interior Parts','White','New','22x22','level3',1.44,'Nissan',44,20,18),(900,'Regulators','Blue','New','22x22','level2',2.67,'Mitsubishi',67,48,29),(1111,'Front Bumper','Yellow','New','33x33','level2',5.11,'Mitsubishi',22,19,20);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `contact_number` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'s1',86423988),(2,'s2',86421345),(3,'s3',87543120),(4,'s4',84321569);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_catalog`
--

DROP TABLE IF EXISTS `supplier_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_catalog` (
  `supplier_id` int(11) NOT NULL,
  `part_number` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`,`part_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_catalog`
--

LOCK TABLES `supplier_catalog` WRITE;
/*!40000 ALTER TABLE `supplier_catalog` DISABLE KEYS */;
INSERT INTO `supplier_catalog` VALUES (1,1),(1,2),(1,34),(1,56),(2,78),(2,90),(2,100),(2,134),(3,178),(3,234),(3,345),(3,567),(4,789),(4,800),(4,900),(4,1111);
/*!40000 ALTER TABLE `supplier_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `tra_cus_idx` (`customer_id`),
  KEY `tra_use_idx` (`user_id`),
  CONSTRAINT `trans_cid` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trans_uid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,9,3,'2017-01-03 00:00:00'),(2,10,4,'2017-01-13 00:00:00'),(3,3,4,'2017-01-23 00:00:00'),(4,1,4,'2017-01-24 00:00:00'),(5,1,3,'2017-02-01 00:00:00'),(6,3,3,'2017-03-03 00:00:00'),(7,2,3,'2017-04-06 00:00:00'),(8,4,3,'2017-04-07 00:00:00'),(9,7,4,'2017-04-08 00:00:00'),(10,9,4,'2017-06-09 00:00:00'),(11,7,4,'2017-08-01 00:00:00'),(12,8,3,'2017-09-19 00:00:00');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_details` (
  `trans_id` int(11) NOT NULL,
  `part_number` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`trans_id`,`part_number`),
  KEY `tde_pro_idx` (`part_number`),
  KEY `tde_tra_idx` (`trans_id`),
  CONSTRAINT `tde_pro` FOREIGN KEY (`part_number`) REFERENCES `product` (`part_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tde_tra` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES (1,1,2),(2,34,5),(3,78,3),(4,900,7),(5,800,8),(6,178,4),(7,134,3),(8,800,7),(9,345,9),(10,900,8),(11,1111,12),(12,56,5);
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `contact_number` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'alice','admin123','admin',65781234,'alice@stockist.com'),(2,'tom','admin456','admin',65784321,'tom@stockist.com'),(3,'john','mech123','mechanic',67851234,'john@stockist.com'),(4,'snow','mech456','mechanic',67851111,'snow@stockist.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08 16:43:04
