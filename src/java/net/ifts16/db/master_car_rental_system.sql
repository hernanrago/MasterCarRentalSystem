-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: master_car_rental_system
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `automovil`
--

DROP TABLE IF EXISTS `automovil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automovil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patente` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `pasajeros` int(11) NOT NULL,
  `puertas` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `cambios` enum('AUTOMATICO','MANUAL') COLLATE utf8_spanish_ci NOT NULL,
  `reservado` tinyint(1) NOT NULL,
  `alquilado` tinyint(1) NOT NULL,
  `modelo_id` int(10) unsigned NOT NULL,
  `sede_radicacion_id` int(10) unsigned NOT NULL,
  `sede_ubicacion_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `automovil_id_IDX` (`id`) USING BTREE,
  KEY `automovil_modelo__FK` (`modelo_id`),
  KEY `automovil_sede_radicacion_FK` (`sede_radicacion_id`),
  KEY `automovil_sede_ubicacion_FK` (`sede_ubicacion_id`),
  CONSTRAINT `automovil_modelo__FK` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`),
  CONSTRAINT `automovil_sede_radicacion_FK` FOREIGN KEY (`sede_radicacion_id`) REFERENCES `sede` (`id`),
  CONSTRAINT `automovil_sede_ubicacion_FK` FOREIGN KEY (`sede_ubicacion_id`) REFERENCES `sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automovil`
--

LOCK TABLES `automovil` WRITE;
/*!40000 ALTER TABLE `automovil` DISABLE KEYS */;
INSERT INTO `automovil` VALUES (1,'AL845HI',5,5,1500,'MANUAL',1,0,1,1,1),(2,'AQ375IV',5,5,2000,'MANUAL',1,0,2,2,2),(3,'AB294OC',5,4,2000,'MANUAL',0,0,3,3,3);
/*!40000 ALTER TABLE `automovil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `marca` enum('FORD','FIAT',' VOLKSWAGEN','CHEVROLET') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modelo_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Focus II 1.6 Trend Sigma','FORD'),(2,'Argo 1.8 Precision Connect','FIAT'),(3,'Cruze II 1.4 Sedan Lt','CHEVROLET');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_reserva` date NOT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `automovil_id` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reserva_UN` (`id`),
  KEY `reserva_automovil_FK` (`automovil_id`),
  KEY `reserva_usuario_FK` (`usuario_id`),
  CONSTRAINT `reserva_automovil_FK` FOREIGN KEY (`automovil_id`) REFERENCES `automovil` (`id`),
  CONSTRAINT `reserva_usuario_FK` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (4,'2019-06-02',NULL,1,1),(5,'2019-06-02',NULL,1,1),(6,'2019-06-02',NULL,1,1),(7,'2019-06-02',NULL,1,1),(8,'2019-06-02',NULL,1,1),(9,'2019-06-02',NULL,1,1),(10,'2019-06-02',NULL,1,1),(11,'2019-06-02',NULL,1,1),(12,'2019-06-02',NULL,1,1),(13,'2019-06-02',NULL,1,1),(14,'2019-06-02',NULL,1,1),(15,'2019-06-02',NULL,1,1),(16,'2019-06-02',NULL,1,1),(17,'2019-06-02',NULL,1,1),(18,'2019-06-02',NULL,1,1),(19,'2019-06-02',NULL,1,1),(20,'2019-06-02',NULL,1,1),(21,'2019-06-02',NULL,1,1),(22,'2019-06-02',NULL,1,1),(23,'2019-06-02',NULL,1,1),(24,'2019-06-02',NULL,1,1),(25,'2019-06-02',NULL,1,1),(26,'2019-06-02',NULL,1,1),(27,'2019-06-02',NULL,1,1),(28,'2019-06-02',NULL,1,1),(29,'2019-06-02',NULL,1,1),(30,'2019-06-02',NULL,1,1),(31,'2019-06-03',NULL,1,1),(32,'2019-06-03',NULL,1,1),(33,'2019-06-03',NULL,1,1),(34,'2019-06-03',NULL,1,1),(35,'2019-06-03',NULL,1,1),(36,'2019-06-03',NULL,1,1),(37,'2019-06-03',NULL,1,1),(38,'2019-06-03',NULL,1,1),(39,'2019-06-03',NULL,1,1),(40,'2019-06-03',NULL,1,1),(41,'2019-06-03',NULL,1,1),(42,'2019-06-03',NULL,1,1),(43,'2019-06-03',NULL,1,1),(44,'2019-06-03',NULL,1,1),(45,'2019-06-03',NULL,1,1),(46,'2019-06-03',NULL,1,1),(47,'2019-06-03',NULL,1,1),(48,'2019-06-03',NULL,1,1),(49,'2019-06-03',NULL,1,1),(50,'2019-06-03',NULL,1,1),(51,'2019-06-03',NULL,1,1),(52,'2019-06-03',NULL,1,1),(53,'2019-06-03',NULL,1,1),(54,'2019-06-03',NULL,1,1),(55,'2019-06-03',NULL,1,1),(56,'2019-06-03',NULL,1,1),(57,'2019-06-03',NULL,1,1),(58,'2019-06-03',NULL,1,1),(59,'2019-06-03',NULL,1,1),(60,'2019-06-03',NULL,1,1),(61,'2019-06-03',NULL,1,1),(62,'2019-06-03',NULL,1,1),(63,'2019-06-03',NULL,1,1),(64,'2019-06-03',NULL,1,1),(65,'2019-06-03',NULL,1,1),(66,'2019-06-03',NULL,1,1),(67,'2019-06-03',NULL,1,1),(68,'2019-06-03',NULL,1,1),(69,'2019-06-03',NULL,1,1),(70,'2019-06-03',NULL,1,1),(71,'2019-06-03',NULL,1,1),(72,'2019-06-03',NULL,1,1),(73,'2019-06-03',NULL,1,1),(74,'2019-06-03',NULL,1,1),(75,'2019-06-03',NULL,1,1),(76,'2019-06-03',NULL,1,1),(77,'2019-06-03',NULL,1,1),(78,'2019-06-03',NULL,1,1),(79,'2019-06-03',NULL,1,1),(80,'2019-06-03',NULL,1,1),(81,'2019-06-03',NULL,1,1),(82,'2019-06-03',NULL,1,1),(83,'2019-06-03',NULL,1,1),(84,'2019-06-03',NULL,1,1),(85,'2019-06-03',NULL,1,1),(86,'2019-06-03',NULL,1,1),(87,'2019-06-03',NULL,1,1),(88,'2019-06-03',NULL,1,1),(89,'2019-06-03',NULL,1,1),(90,'2019-06-03',NULL,1,1),(91,'2019-06-03',NULL,1,1),(92,'2019-06-03',NULL,1,1),(93,'2019-06-03',NULL,1,1),(94,'2019-06-03',NULL,1,1),(95,'2019-06-03',NULL,1,1),(96,'2019-06-03',NULL,1,1),(97,'2019-06-03',NULL,1,1),(98,'2019-06-03',NULL,2,1),(99,'2019-06-03',NULL,3,1),(100,'2019-06-03',NULL,2,1),(101,'2019-06-03',NULL,1,1),(102,'2019-06-03',NULL,3,1),(103,'2019-06-03',NULL,2,1),(104,'2019-06-03',NULL,1,1),(105,'2019-06-03',NULL,2,1),(106,'2019-06-03',NULL,3,1),(107,'2019-06-03',NULL,1,1),(108,'2019-06-03',NULL,3,1),(109,'2019-06-03',NULL,2,1),(110,'2019-06-03',NULL,1,1),(111,'2019-06-03',NULL,2,1),(112,'2019-06-03',NULL,3,1),(113,'2019-06-03',NULL,1,1),(114,'2019-06-03',NULL,1,1),(115,'2019-06-03',NULL,3,1),(116,'2019-06-03',NULL,2,1),(117,'2019-06-03',NULL,3,1),(118,'2019-06-03',NULL,2,1),(119,'2019-06-03',NULL,1,1),(120,'2019-06-04',NULL,1,1),(121,'2019-06-04',NULL,1,1),(122,'2019-06-04',NULL,1,1),(123,'2019-06-04',NULL,1,1),(124,'2019-06-04',NULL,1,1),(125,'2019-06-04',NULL,2,1),(126,'2019-06-04',NULL,3,1),(127,'2019-06-04',NULL,1,1),(128,'2019-06-04',NULL,2,1);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domicilio` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_postal` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sede_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Lascano 4044','C1417GZJ','Ciudad AutÃ³noma de Buenos Aires','Buenos Aires'),(2,'Av. Federico Lacroze 3455','C1426CQH ','Ciudad AutÃ³noma de Buenos Aires','Buenos Aires'),(3,'Av. Mitre 2683','B1605','Buenos Aires','Buenos Aires');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_usuario` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rol` enum('ADMINISTRADOR','OPERADOR','CLIENTE') COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Dade','Murphy','zerocool','n?!\'?2-','ADMINISTRADOR'),(2,'RamÃ³n','Sanchez','thephantomphreak','.C? M\\=','OPERADOR'),(3,'Kate','Libby','acidburn','T@=nm<{','CLIENTE'),(7,'juan','perez','jperez','D\\Mi;','CLIENTE'),(8,'juan','perez','jperez','|Y?+fQi.d','CLIENTE'),(9,'juan','perez','jperez','){Y?d?!f','CLIENTE'),(10,'juan','perez','jperez','g\Z1-Q','CLIENTE'),(11,'juan','perez','jperez','M*Pe7#','CLIENTE'),(13,'juan','perez','jperez','>[]?','CLIENTE'),(14,'juan','perez','jperez','?','CLIENTE'),(16,'juan','perez','jperez','?M)p: ','CLIENTE'),(17,'juan','perez','jperez','?y!%C).-[q','CLIENTE'),(18,'ju','Argento','asdf','{+q5.J3oS8','CLIENTE'),(19,'asd','asd','asd','N? deU|n','CLIENTE'),(20,'321','321','321','Y1?R?','CLIENTE'),(21,'234','234','234','®vQz|y?','CLIENTE'),(22,'456','456','456','<__5t,d%+','CLIENTE'),(23,'567','678','456','#.(\Z6?X}P?','CLIENTE'),(24,'gffhfg','gfhf','fhfghf',':Z!9Kq','CLIENTE'),(25,'hhfgh','fhfghgf','g','29~my5','CLIENTE'),(26,'123','445','555','lRqFwe[7','CLIENTE'),(27,'bgf','fds','frrd','bDlj$5~7','CLIENTE'),(28,'bgf','fds','frrd','ly:o	?$IW','CLIENTE'),(29,'gggg','ggg','ggg','\Zy\'Y;¾et','CLIENTE'),(30,'gggg','ggg','ggg','ÈJ\n{E\r','CLIENTE'),(31,'Jesús','de Laferrere','jdelaferrere','\0Mm\\te','CLIENTE'),(32,'Violencia','Rivas','vrivas','&N+?	','CLIENTE'),(33,'Bombita','Rodríguez','brodriguez',';sD3=Am','ADMINISTRADOR'),(34,'Latino','Solanas','lsolanas','GBo:bYkhQG','OPERADOR'),(35,'áéíóú','áéíóú','áéíóú','tk^_H!8e6','ADMINISTRADOR');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'master_car_rental_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-15 14:36:07
