CREATE DATABASE  IF NOT EXISTS `BIBLIOTECA_GECOM` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `BIBLIOTECA_GECOM`;
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: BIBLIOTECA_GECOM
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `ACESSOS`
--

DROP TABLE IF EXISTS `ACESSOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACESSOS` (
  `ID_ACESSO` int(11) NOT NULL,
  `DT_INICIO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DT_FIM` datetime DEFAULT NULL,
  `COD_BIBLIOTECA` int(11) NOT NULL,
  `COD_PESSOA` int(11) NOT NULL,
  PRIMARY KEY (`ID_ACESSO`),
  KEY `fk_ACESSOS_PESSOA_idx` (`COD_PESSOA`),
  KEY `fk_ACESSOS_BIBLIOTECA_idx` (`COD_BIBLIOTECA`),
  CONSTRAINT `fk_ACESSOS_BIBLIOTECA` FOREIGN KEY (`COD_BIBLIOTECA`) REFERENCES `BIBLIOTECAS` (`ID_BIBLIOTECA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ACESSOS_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `PESSOAS` (`ID_PESSOA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AREA`
--

DROP TABLE IF EXISTS `AREA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AREA` (
  `ID_AREA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_AREA` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_AREA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AVALIACOES`
--

DROP TABLE IF EXISTS `AVALIACOES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AVALIACOES` (
  `ID_AVALIACAO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_OBRA` int(11) NOT NULL,
  `COD_SESSAO` int(11) NOT NULL,
  `COMENTARIO` varchar(2000) NOT NULL,
  `DATA_CADASTRAMENTO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DATA_FIM` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_AVALIACAO`),
  KEY `fk_AVALIACOES_OBRA_idx` (`COD_OBRA`),
  KEY `fk_AVALIACOES_SESSAO_idx` (`COD_SESSAO`),
  CONSTRAINT `fk_AVALIACOES_OBRA` FOREIGN KEY (`COD_OBRA`) REFERENCES `OBRAS` (`ID_OBRA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AVALIACOES_SESSAO` FOREIGN KEY (`COD_SESSAO`) REFERENCES `SESSOES` (`ID_SESSAO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BIBLIOTECAS`
--

DROP TABLE IF EXISTS `BIBLIOTECAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BIBLIOTECAS` (
  `ID_BIBLIOTECA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_BIBLIOTECA` varchar(255) NOT NULL,
  `CHV_BIBLIOTECA` int(11) DEFAULT NULL,
  `COD_TB` int(11) NOT NULL,
  PRIMARY KEY (`ID_BIBLIOTECA`),
  KEY `fk_new_table_1_idx` (`COD_TB`),
  CONSTRAINT `fk_BIBLIOTECA_TB` FOREIGN KEY (`COD_TB`) REFERENCES `TIPOS_BIBLIOTECA` (`ID_TB`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONTATO`
--

DROP TABLE IF EXISTS `CONTATO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTATO` (
  `ID_CONTATO` int(11) NOT NULL AUTO_INCREMENT,
  `VAL_CONTATO` varchar(255) NOT NULL,
  `COD_BIBLIOTECA` int(11) NOT NULL,
  `COD_TC` int(11) NOT NULL,
  PRIMARY KEY (`ID_CONTATO`),
  KEY `fk_CONTATO_BIBLIOTECAS_idx` (`COD_BIBLIOTECA`),
  KEY `fk_CONTATO_TC_idx` (`COD_TC`),
  CONSTRAINT `fk_CONTATO_BIBLIOTECAS` FOREIGN KEY (`COD_BIBLIOTECA`) REFERENCES `BIBLIOTECAS` (`ID_BIBLIOTECA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONTATO_TC` FOREIGN KEY (`COD_TC`) REFERENCES `TIPOS_CONTATO` (`ID_TC`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPRESTIMOS`
--

DROP TABLE IF EXISTS `EMPRESTIMOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPRESTIMOS` (
  `ID_EMPRESTIMO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_LIVRO` int(11) NOT NULL,
  `COD_SESSAO` int(11) NOT NULL,
  `DATA_EMPRESTIMO` datetime NOT NULL,
  `NUM_EMPRESTIMO` int(11) DEFAULT NULL,
  `SIT_EMPRESTIMO` varchar(45) DEFAULT NULL,
  `DATA_DEVOLUCAO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRESTIMO`),
  KEY `fk_EMPRESTIMOS_SESSAO_idx` (`COD_SESSAO`),
  CONSTRAINT `fk_EMPRESTIMOS_SESSAO` FOREIGN KEY (`COD_SESSAO`) REFERENCES `SESSOES` (`ID_SESSAO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIVROS`
--

DROP TABLE IF EXISTS `LIVROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIVROS` (
  `ID_LIVRO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_OBRA` int(11) NOT NULL,
  `COD_BIBLIOTECA` int(11) NOT NULL,
  PRIMARY KEY (`ID_LIVRO`),
  KEY `fk_LIVROS_OBRA_idx` (`COD_OBRA`),
  KEY `fk_LIVROS_BIBLIOTECA_idx` (`COD_BIBLIOTECA`),
  CONSTRAINT `fk_LIVROS_BIBLIOTECA` FOREIGN KEY (`COD_BIBLIOTECA`) REFERENCES `BIBLIOTECAS` (`ID_BIBLIOTECA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LIVROS_OBRA` FOREIGN KEY (`COD_OBRA`) REFERENCES `OBRAS` (`ID_OBRA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OBRAS`
--

DROP TABLE IF EXISTS `OBRAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OBRAS` (
  `ID_OBRA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_OBRA` varchar(255) NOT NULL,
  `DES_OBRA` varchar(255) DEFAULT NULL,
  `NOM_AUTOR` varchar(255) DEFAULT NULL,
  `NOM_EDITORA` varchar(255) DEFAULT NULL,
  `COD_AREA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_OBRA`),
  KEY `fk_OBRAS_AREA_idx` (`COD_AREA`),
  CONSTRAINT `fk_OBRAS_AREA` FOREIGN KEY (`COD_AREA`) REFERENCES `AREA` (`ID_AREA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PESSOAS`
--

DROP TABLE IF EXISTS `PESSOAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PESSOAS` (
  `ID_PESSOA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_PESSOA` varchar(255) DEFAULT NULL,
  `TEL_PESSOA` varchar(20) DEFAULT NULL,
  `COD_PESSOA_TELEGRAM` int(11) NOT NULL,
  `USR_PESSOA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SESSOES`
--

DROP TABLE IF EXISTS `SESSOES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SESSOES` (
  `ID_SESSAO` int(11) NOT NULL AUTO_INCREMENT,
  `DT_INICIO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TD_FIM` datetime DEFAULT NULL,
  `COD_ACESSO` int(11) NOT NULL,
  PRIMARY KEY (`ID_SESSAO`),
  KEY `fk_SESSOES_ACESSO_idx` (`COD_ACESSO`),
  CONSTRAINT `fk_SESSOES_ACESSO` FOREIGN KEY (`COD_ACESSO`) REFERENCES `ACESSOS` (`ID_ACESSO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TIPOS_BIBLIOTECA`
--

DROP TABLE IF EXISTS `TIPOS_BIBLIOTECA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_BIBLIOTECA` (
  `ID_TB` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_TB` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_TB`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TIPOS_CONTATO`
--

DROP TABLE IF EXISTS `TIPOS_CONTATO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIPOS_CONTATO` (
  `ID_TC` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_TC` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_TC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'BIBLIOTECA_GECOM'
--

--
-- Dumping routines for database 'BIBLIOTECA_GECOM'
--
/*!50003 DROP FUNCTION IF EXISTS `FNC_EXISTE_PESSOA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FNC_EXISTE_PESSOA`(	CPT INT
) RETURNS int(11)
BEGIN
RETURN (SELECT COUNT(ID_PESSOA) FROM PESSOAS WHERE CODIGO_PESSOA_TELEGRAM = CPT);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 23:00:09