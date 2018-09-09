-- MySQL dump 10.13  Distrib 5.7.21, for osx10.13 (x86_64)
--
-- Host: localhost    Database: bua_rsp
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `booking_man` varchar(30) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `start_time` varchar(30) DEFAULT NULL,
  `end_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (5,'chengkangjian',99,'2018-6-25 10:10:10','2018-6-29 11:22:22'),(6,'zhangsan',90,'2018-6-24 10:10:11','2018-7-1 11:11:12'),(7,'zhangsan',90,'2018-6-24 10:10:11','2018-7-1 11:11:12'),(8,'zhangsan',90,'2018-6-24 10:10:11','2018-7-1 11:11:12');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `original_price` varchar(25) DEFAULT NULL,
  `firm_model` text,
  `parameter` text,
  `functional_use` text,
  `desc` varchar(30) DEFAULT NULL,
  `contacts` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `img_url` text,
  `owner` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (93,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(95,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(96,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(98,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(99,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(100,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(101,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(102,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(103,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(104,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(105,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(106,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(107,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(108,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(109,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(110,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(111,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(112,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(113,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(114,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(115,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(116,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(117,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(118,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(119,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(120,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(121,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(122,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(123,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(124,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(125,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(126,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(127,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(128,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(129,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(130,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(131,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(132,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(133,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(134,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(135,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(136,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(137,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(138,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(139,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(140,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(141,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(142,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(143,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(144,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(145,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(146,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(148,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(149,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(150,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(151,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(152,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(153,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(154,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(155,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','disable'),(156,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi77','enable'),(157,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi777','disable'),(158,'全自动纤维分析仪','12.5万元','美国ANKOM','一次可以检测24个样品，测量范围0~100%，处理时间60-120分钟','检测ADF、NDF、ADL等含量','ADD90','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi','enable'),(159,'液相色谱质谱系统','306万元','LTQ Orbitrap Discovery','离子原 ESI','用于小分子代谢物、蛋 白、农药残留等的检测','测试','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi','enable'),(160,'核磁共振波谱仪','209.8万元','AVANCE III 400','⑴核磁操作频率(1H)：400 MHz ⑵磁场强度： 9.4 Tesla ','可用于多肽和蛋白质在溶液中高次构造的解析','测试','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi','enable'),(162,'dd','ff','gg','hh','jj','kk','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi','disable'),(163,'ss','dd','ff','gg','hh','jj','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi','disable'),(164,'ds','f','df','fg','g','h','王宗义','13651226099','Wangzongyi001@sina.com','empty url','Wangzongyi','disable');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-09 16:56:29
