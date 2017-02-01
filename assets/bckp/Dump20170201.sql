CREATE DATABASE  IF NOT EXISTS `crud` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `crud`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: crud
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `comprador`
--

DROP TABLE IF EXISTS `comprador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprador` (
  `idcomprador` int(11) NOT NULL,
  `nombreComprador` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcomprador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprador`
--

LOCK TABLES `comprador` WRITE;
/*!40000 ALTER TABLE `comprador` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `CreatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` tinyint(1) DEFAULT '1',
  `Balance` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aroque','cf0d5c2f6a77db2c990181c0675b3edeeea4c204','Armando Roque',NULL,1,0.00),(2,'mello','30C533A5187B2C596FEF0733D094F7C5AB3B9D71','Marsh Mello',NULL,1,0.00),(3,'zlarson','17D8B52943A80CF61D324F72D761FA8074BCC237','Zara Larson',NULL,1,0.00),(4,'chain','2CF64E447B84B497B2491B7AF072A229EEFE2651','Chain Smokers',NULL,1,0.00),(5,'jroque','D992672F639B41C9372558C0D54EBA8A2653ABFE','Javier Roque',NULL,1,0.00),(6,'atorres','745D1B8F076C90C97F961893B57D85D101FDE67D','Allan Torres',NULL,1,0.00),(7,'test','oijosidjaosisdjd','oijoiajsdas','2017-01-30 17:03:56',1,0.00),(8,'jsmith','A9A653D4151FA2C081BA1FFC2C2726F3B80B7D7D','Jhone Smith','2017-01-31 23:45:11',1,0.00),(9,'musicon','8A4A58676BB123E99B0E451588BEEBB8ED49FB2C','musicon.me','2017-02-01 00:25:16',1,0.00);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `totalVendido` int(11) DEFAULT NULL,
  `fechaVenta` datetime DEFAULT NULL,
  PRIMARY KEY (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_comprador_vendedor`
--

DROP TABLE IF EXISTS `ventas_comprador_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas_comprador_vendedor` (
  `idventa` int(11) DEFAULT NULL,
  `idcomprador` int(11) DEFAULT NULL,
  `idvendedor` int(11) DEFAULT NULL,
  KEY `venta_key_idx` (`idventa`),
  KEY `comprador_key_idx` (`idcomprador`),
  KEY `vendedor_fkey_idx` (`idvendedor`),
  CONSTRAINT `vendedor_fkey` FOREIGN KEY (`idvendedor`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comprador_key` FOREIGN KEY (`idcomprador`) REFERENCES `comprador` (`idcomprador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `venta_key` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_comprador_vendedor`
--

LOCK TABLES `ventas_comprador_vendedor` WRITE;
/*!40000 ALTER TABLE `ventas_comprador_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_comprador_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01  0:13:57
