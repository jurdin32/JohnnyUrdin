-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: trabajo
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Table structure for table `Sociedad_pais`
--

DROP TABLE IF EXISTS `Sociedad_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sociedad_pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sociedad_pais`
--

LOCK TABLES `Sociedad_pais` WRITE;
/*!40000 ALTER TABLE `Sociedad_pais` DISABLE KEYS */;
INSERT INTO `Sociedad_pais` (`id`, `nombre`) VALUES (1,'Ecuador'),(2,'Perú'),(3,'Chile'),(4,'Colombia');
/*!40000 ALTER TABLE `Sociedad_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sociedad_persona`
--

DROP TABLE IF EXISTS `Sociedad_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sociedad_persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` date NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `cedula` varchar(30) NOT NULL,
  `profesion` varchar(60) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sociedad_persona`
--

LOCK TABLES `Sociedad_persona` WRITE;
/*!40000 ALTER TABLE `Sociedad_persona` DISABLE KEYS */;
INSERT INTO `Sociedad_persona` (`id`, `fecha_ingreso`, `nombre`, `cedula`, `profesion`, `edad`, `direccion`, `telefono`) VALUES (1,'2020-11-14','Johnny Urdin','0703886697','Ingeniero de Sistemas',NULL,'calle 50 e sur 7215','3024634847'),(2,'2020-11-14','Luis Contreras','12222','Ingeniero de Sistemas',NULL,'Panamericana y Carchi','0992470121');
/*!40000 ALTER TABLE `Sociedad_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sociedad_proyectos`
--

DROP TABLE IF EXISTS `Sociedad_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sociedad_proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `objetivo` longtext NOT NULL,
  `otros_proyectos_id` int DEFAULT NULL,
  `pais_id` int NOT NULL,
  `sociedad_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sociedad_proyectos_otros_proyectos_id_ddcd04c5_fk_Sociedad_` (`otros_proyectos_id`),
  KEY `Sociedad_proyectos_pais_id_329226ed_fk_Sociedad_pais_id` (`pais_id`),
  KEY `Sociedad_proyectos_sociedad_id_c2950eb7_fk_Sociedad_` (`sociedad_id`),
  CONSTRAINT `Sociedad_proyectos_otros_proyectos_id_ddcd04c5_fk_Sociedad_` FOREIGN KEY (`otros_proyectos_id`) REFERENCES `Sociedad_proyectos` (`id`),
  CONSTRAINT `Sociedad_proyectos_pais_id_329226ed_fk_Sociedad_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `Sociedad_pais` (`id`),
  CONSTRAINT `Sociedad_proyectos_sociedad_id_c2950eb7_fk_Sociedad_` FOREIGN KEY (`sociedad_id`) REFERENCES `Sociedad_sociedades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sociedad_proyectos`
--

LOCK TABLES `Sociedad_proyectos` WRITE;
/*!40000 ALTER TABLE `Sociedad_proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sociedad_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sociedad_sociedades`
--

DROP TABLE IF EXISTS `Sociedad_sociedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sociedad_sociedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `direccion` longtext NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sociedad_sociedades`
--

LOCK TABLES `Sociedad_sociedades` WRITE;
/*!40000 ALTER TABLE `Sociedad_sociedades` DISABLE KEYS */;
INSERT INTO `Sociedad_sociedades` (`id`, `nombre`, `tipo`, `nit`, `direccion`, `telefono`) VALUES (1,'Sociedad 1','Algo','11111111444','asdfasdf','3024634847'),(2,'Sociedad 2','Algo','11111111444','asdfasfd','0992470121');
/*!40000 ALTER TABLE `Sociedad_sociedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sociedad_socios`
--

DROP TABLE IF EXISTS `Sociedad_socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sociedad_socios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `persona_id` int DEFAULT NULL,
  `sociedad_id` int NOT NULL,
  `aportacion` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sociedad_socios_persona_id_30c0a871_fk_Sociedad_persona_id` (`persona_id`),
  KEY `Sociedad_socios_sociedad_id_9b0997b4_fk_Sociedad_sociedades_id` (`sociedad_id`),
  CONSTRAINT `Sociedad_socios_persona_id_30c0a871_fk_Sociedad_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `Sociedad_persona` (`id`),
  CONSTRAINT `Sociedad_socios_sociedad_id_9b0997b4_fk_Sociedad_sociedades_id` FOREIGN KEY (`sociedad_id`) REFERENCES `Sociedad_sociedades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sociedad_socios`
--

LOCK TABLES `Sociedad_socios` WRITE;
/*!40000 ALTER TABLE `Sociedad_socios` DISABLE KEYS */;
INSERT INTO `Sociedad_socios` (`id`, `persona_id`, `sociedad_id`, `aportacion`) VALUES (1,1,1,678988.00),(2,1,2,35555.00),(3,2,2,45555.00);
/*!40000 ALTER TABLE `Sociedad_socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sociedad_tipo`
--

DROP TABLE IF EXISTS `Sociedad_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sociedad_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `horas_aportadas` time(6) DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  `salario` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Sociedad_tipo_persona_id_27e172a2_fk_Sociedad_persona_id` (`persona_id`),
  CONSTRAINT `Sociedad_tipo_persona_id_27e172a2_fk_Sociedad_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `Sociedad_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sociedad_tipo`
--

LOCK TABLES `Sociedad_tipo` WRITE;
/*!40000 ALTER TABLE `Sociedad_tipo` DISABLE KEYS */;
INSERT INTO `Sociedad_tipo` (`id`, `nombre`, `horas_aportadas`, `persona_id`, `salario`) VALUES (1,'Voluntario','04:00:00.000000',2,NULL),(2,'Trabajador',NULL,1,3455555.00);
/*!40000 ALTER TABLE `Sociedad_tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-14 14:23:19
