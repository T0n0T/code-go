-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: gva
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v6` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v7` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`,`v6`,`v7`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES (3,'p','888','/api/createApi','POST','','','','',''),(6,'p','888','/api/deleteApi','POST','','','','',''),(9,'p','888','/api/deleteApisByIds','DELETE','','','','',''),(8,'p','888','/api/getAllApis','POST','','','','',''),(5,'p','888','/api/getApiById','POST','','','','',''),(4,'p','888','/api/getApiList','POST','','','','',''),(7,'p','888','/api/updateApi','POST','','','','',''),(10,'p','888','/authority/copyAuthority','POST','','','','',''),(12,'p','888','/authority/createAuthority','POST','','','','',''),(13,'p','888','/authority/deleteAuthority','POST','','','','',''),(14,'p','888','/authority/getAuthorityList','POST','','','','',''),(15,'p','888','/authority/setDataAuthority','POST','','','','',''),(11,'p','888','/authority/updateAuthority','PUT','','','','',''),(89,'p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','','','',''),(88,'p','888','/authorityBtn/getAuthorityBtn','POST','','','','',''),(87,'p','888','/authorityBtn/setAuthorityBtn','POST','','','','',''),(62,'p','888','/autoCode/createPackage','POST','','','','',''),(65,'p','888','/autoCode/createPlug','POST','','','','',''),(59,'p','888','/autoCode/createTemp','POST','','','','',''),(64,'p','888','/autoCode/delPackage','POST','','','','',''),(60,'p','888','/autoCode/delSysHistory','POST','','','','',''),(57,'p','888','/autoCode/getColumn','GET','','','','',''),(53,'p','888','/autoCode/getDB','GET','','','','',''),(54,'p','888','/autoCode/getMeta','POST','','','','',''),(63,'p','888','/autoCode/getPackage','POST','','','','',''),(61,'p','888','/autoCode/getSysHistory','POST','','','','',''),(56,'p','888','/autoCode/getTables','GET','','','','',''),(66,'p','888','/autoCode/installPlugin','POST','','','','',''),(55,'p','888','/autoCode/preview','POST','','','','',''),(58,'p','888','/autoCode/rollback','POST','','','','',''),(1,'p','888','/base/login','POST','','','','',''),(43,'p','888','/casbin/getPolicyPathByAuthorityId','POST','','','','',''),(42,'p','888','/casbin/updateCasbin','POST','','','','',''),(51,'p','888','/customer/customer','DELETE','','','','',''),(48,'p','888','/customer/customer','GET','','','','',''),(50,'p','888','/customer/customer','POST','','','','',''),(49,'p','888','/customer/customer','PUT','','','','',''),(52,'p','888','/customer/customerList','GET','','','','',''),(83,'p','888','/email/emailTest','POST','','','','',''),(36,'p','888','/fileUploadAndDownload/breakpointContinue','POST','','','','',''),(35,'p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','','','',''),(39,'p','888','/fileUploadAndDownload/deleteFile','POST','','','','',''),(40,'p','888','/fileUploadAndDownload/editFileName','POST','','','','',''),(34,'p','888','/fileUploadAndDownload/findFile','GET','','','','',''),(41,'p','888','/fileUploadAndDownload/getFileList','POST','','','','',''),(37,'p','888','/fileUploadAndDownload/removeChunk','POST','','','','',''),(38,'p','888','/fileUploadAndDownload/upload','POST','','','','',''),(44,'p','888','/jwt/jsonInBlacklist','POST','','','','',''),(18,'p','888','/menu/addBaseMenu','POST','','','','',''),(20,'p','888','/menu/addMenuAuthority','POST','','','','',''),(22,'p','888','/menu/deleteBaseMenu','POST','','','','',''),(24,'p','888','/menu/getBaseMenuById','POST','','','','',''),(19,'p','888','/menu/getBaseMenuTree','POST','','','','',''),(16,'p','888','/menu/getMenu','POST','','','','',''),(21,'p','888','/menu/getMenuAuthority','POST','','','','',''),(17,'p','888','/menu/getMenuList','POST','','','','',''),(23,'p','888','/menu/updateBaseMenu','POST','','','','',''),(85,'p','888','/simpleUploader/checkFileMd5','GET','','','','',''),(86,'p','888','/simpleUploader/mergeFileMd5','GET','','','','',''),(84,'p','888','/simpleUploader/upload','POST','','','','',''),(75,'p','888','/sysDictionary/createSysDictionary','POST','','','','',''),(76,'p','888','/sysDictionary/deleteSysDictionary','DELETE','','','','',''),(72,'p','888','/sysDictionary/findSysDictionary','GET','','','','',''),(74,'p','888','/sysDictionary/getSysDictionaryList','GET','','','','',''),(73,'p','888','/sysDictionary/updateSysDictionary','PUT','','','','',''),(69,'p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','','','',''),(71,'p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','','','',''),(67,'p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','','','',''),(70,'p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','','','',''),(68,'p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','','','',''),(79,'p','888','/sysOperationRecord/createSysOperationRecord','POST','','','','',''),(81,'p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','','','',''),(82,'p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','','','',''),(77,'p','888','/sysOperationRecord/findSysOperationRecord','GET','','','','',''),(80,'p','888','/sysOperationRecord/getSysOperationRecordList','GET','','','','',''),(78,'p','888','/sysOperationRecord/updateSysOperationRecord','PUT','','','','',''),(47,'p','888','/system/getServerInfo','POST','','','','',''),(45,'p','888','/system/getSystemConfig','POST','','','','',''),(46,'p','888','/system/setSystemConfig','POST','','','','',''),(2,'p','888','/user/admin_register','POST','','','','',''),(30,'p','888','/user/changePassword','POST','','','','',''),(29,'p','888','/user/deleteUser','DELETE','','','','',''),(25,'p','888','/user/getUserInfo','GET','','','','',''),(28,'p','888','/user/getUserList','POST','','','','',''),(33,'p','888','/user/resetPassword','POST','','','','',''),(27,'p','888','/user/setSelfInfo','PUT','','','','',''),(32,'p','888','/user/setUserAuthorities','POST','','','','',''),(31,'p','888','/user/setUserAuthority','POST','','','','',''),(26,'p','888','/user/setUserInfo','PUT','','','','',''),(92,'p','8881','/api/createApi','POST','','','','',''),(95,'p','8881','/api/deleteApi','POST','','','','',''),(97,'p','8881','/api/getAllApis','POST','','','','',''),(94,'p','8881','/api/getApiById','POST','','','','',''),(93,'p','8881','/api/getApiList','POST','','','','',''),(96,'p','8881','/api/updateApi','POST','','','','',''),(98,'p','8881','/authority/createAuthority','POST','','','','',''),(99,'p','8881','/authority/deleteAuthority','POST','','','','',''),(100,'p','8881','/authority/getAuthorityList','POST','','','','',''),(101,'p','8881','/authority/setDataAuthority','POST','','','','',''),(90,'p','8881','/base/login','POST','','','','',''),(119,'p','8881','/casbin/getPolicyPathByAuthorityId','POST','','','','',''),(118,'p','8881','/casbin/updateCasbin','POST','','','','',''),(125,'p','8881','/customer/customer','DELETE','','','','',''),(126,'p','8881','/customer/customer','GET','','','','',''),(123,'p','8881','/customer/customer','POST','','','','',''),(124,'p','8881','/customer/customer','PUT','','','','',''),(127,'p','8881','/customer/customerList','GET','','','','',''),(116,'p','8881','/fileUploadAndDownload/deleteFile','POST','','','','',''),(117,'p','8881','/fileUploadAndDownload/editFileName','POST','','','','',''),(115,'p','8881','/fileUploadAndDownload/getFileList','POST','','','','',''),(114,'p','8881','/fileUploadAndDownload/upload','POST','','','','',''),(120,'p','8881','/jwt/jsonInBlacklist','POST','','','','',''),(104,'p','8881','/menu/addBaseMenu','POST','','','','',''),(106,'p','8881','/menu/addMenuAuthority','POST','','','','',''),(108,'p','8881','/menu/deleteBaseMenu','POST','','','','',''),(110,'p','8881','/menu/getBaseMenuById','POST','','','','',''),(105,'p','8881','/menu/getBaseMenuTree','POST','','','','',''),(102,'p','8881','/menu/getMenu','POST','','','','',''),(107,'p','8881','/menu/getMenuAuthority','POST','','','','',''),(103,'p','8881','/menu/getMenuList','POST','','','','',''),(109,'p','8881','/menu/updateBaseMenu','POST','','','','',''),(121,'p','8881','/system/getSystemConfig','POST','','','','',''),(122,'p','8881','/system/setSystemConfig','POST','','','','',''),(91,'p','8881','/user/admin_register','POST','','','','',''),(111,'p','8881','/user/changePassword','POST','','','','',''),(128,'p','8881','/user/getUserInfo','GET','','','','',''),(112,'p','8881','/user/getUserList','POST','','','','',''),(113,'p','8881','/user/setUserAuthority','POST','','','','',''),(131,'p','9528','/api/createApi','POST','','','','',''),(134,'p','9528','/api/deleteApi','POST','','','','',''),(136,'p','9528','/api/getAllApis','POST','','','','',''),(133,'p','9528','/api/getApiById','POST','','','','',''),(132,'p','9528','/api/getApiList','POST','','','','',''),(135,'p','9528','/api/updateApi','POST','','','','',''),(137,'p','9528','/authority/createAuthority','POST','','','','',''),(138,'p','9528','/authority/deleteAuthority','POST','','','','',''),(139,'p','9528','/authority/getAuthorityList','POST','','','','',''),(140,'p','9528','/authority/setDataAuthority','POST','','','','',''),(167,'p','9528','/autoCode/createTemp','POST','','','','',''),(129,'p','9528','/base/login','POST','','','','',''),(158,'p','9528','/casbin/getPolicyPathByAuthorityId','POST','','','','',''),(157,'p','9528','/casbin/updateCasbin','POST','','','','',''),(165,'p','9528','/customer/customer','DELETE','','','','',''),(163,'p','9528','/customer/customer','GET','','','','',''),(164,'p','9528','/customer/customer','POST','','','','',''),(162,'p','9528','/customer/customer','PUT','','','','',''),(166,'p','9528','/customer/customerList','GET','','','','',''),(155,'p','9528','/fileUploadAndDownload/deleteFile','POST','','','','',''),(156,'p','9528','/fileUploadAndDownload/editFileName','POST','','','','',''),(154,'p','9528','/fileUploadAndDownload/getFileList','POST','','','','',''),(153,'p','9528','/fileUploadAndDownload/upload','POST','','','','',''),(159,'p','9528','/jwt/jsonInBlacklist','POST','','','','',''),(143,'p','9528','/menu/addBaseMenu','POST','','','','',''),(145,'p','9528','/menu/addMenuAuthority','POST','','','','',''),(147,'p','9528','/menu/deleteBaseMenu','POST','','','','',''),(149,'p','9528','/menu/getBaseMenuById','POST','','','','',''),(144,'p','9528','/menu/getBaseMenuTree','POST','','','','',''),(141,'p','9528','/menu/getMenu','POST','','','','',''),(146,'p','9528','/menu/getMenuAuthority','POST','','','','',''),(142,'p','9528','/menu/getMenuList','POST','','','','',''),(148,'p','9528','/menu/updateBaseMenu','POST','','','','',''),(160,'p','9528','/system/getSystemConfig','POST','','','','',''),(161,'p','9528','/system/setSystemConfig','POST','','','','',''),(130,'p','9528','/user/admin_register','POST','','','','',''),(150,'p','9528','/user/changePassword','POST','','','','',''),(168,'p','9528','/user/getUserInfo','GET','','','','',''),(151,'p','9528','/user/getUserList','POST','','','','',''),(152,'p','9528','/user/setUserAuthority','POST','','','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_customers`
--

DROP TABLE IF EXISTS `exa_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '瀹㈡埛鍚?,
  `customer_phone_data` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '瀹㈡埛鎵嬫満鍙?,
  `sys_user_id` bigint unsigned DEFAULT NULL COMMENT '绠＄悊ID',
  `sys_user_authority_id` bigint unsigned DEFAULT NULL COMMENT '绠＄悊瑙掕壊ID',
  PRIMARY KEY (`id`),
  KEY `idx_exa_customers_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_customers`
--

LOCK TABLES `exa_customers` WRITE;
/*!40000 ALTER TABLE `exa_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_chunks`
--

DROP TABLE IF EXISTS `exa_file_chunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_chunks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `exa_file_id` bigint unsigned DEFAULT NULL,
  `file_chunk_number` bigint DEFAULT NULL,
  `file_chunk_path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_chunks_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_chunks`
--

LOCK TABLES `exa_file_chunks` WRITE;
/*!40000 ALTER TABLE `exa_file_chunks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_file_chunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_file_upload_and_downloads`
--

DROP TABLE IF EXISTS `exa_file_upload_and_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_file_upload_and_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鏂囦欢鍚?,
  `url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鏂囦欢鍦板潃',
  `tag` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鏂囦欢鏍囩',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '缂栧彿',
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_upload_and_downloads`
--

LOCK TABLES `exa_file_upload_and_downloads` WRITE;
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` DISABLE KEYS */;
INSERT INTO `exa_file_upload_and_downloads` VALUES (1,'2023-01-20 03:20:51.562','2023-01-20 03:20:51.562',NULL,'10.png','https://qmplusimg.henrongyi.top/gvalogo.png','png','158787308910.png'),(2,'2023-01-20 03:20:51.562','2023-01-20 03:20:51.562',NULL,'logo.png','https://qmplusimg.henrongyi.top/1576554439myAvatar.png','png','1587973709logo.png');
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_files`
--

DROP TABLE IF EXISTS `exa_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exa_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_md5` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chunk_total` bigint DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exa_files_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_files`
--

LOCK TABLES `exa_files` WRITE;
/*!40000 ALTER TABLE `exa_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_blacklists`
--

DROP TABLE IF EXISTS `jwt_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_blacklists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `jwt` text COLLATE utf8mb4_general_ci COMMENT 'jwt',
  PRIMARY KEY (`id`),
  KEY `idx_jwt_blacklists_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_blacklists`
--

LOCK TABLES `jwt_blacklists` WRITE;
/*!40000 ALTER TABLE `jwt_blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `jwt_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_apis`
--

DROP TABLE IF EXISTS `sys_apis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_apis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api璺緞',
  `description` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api涓枃鎻忚堪',
  `api_group` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api缁?,
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '鏂规硶',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_apis`
--

LOCK TABLES `sys_apis` WRITE;
/*!40000 ALTER TABLE `sys_apis` DISABLE KEYS */;
INSERT INTO `sys_apis` VALUES (1,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/base/login','鐢ㄦ埛鐧诲綍(蹇呴€?','base','POST'),(2,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/jwt/jsonInBlacklist','jwt鍔犲叆榛戝悕鍗?閫€鍑猴紝蹇呴€?','jwt','POST'),(3,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/deleteUser','鍒犻櫎鐢ㄦ埛','绯荤粺鐢ㄦ埛','DELETE'),(4,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/admin_register','鐢ㄦ埛娉ㄥ唽','绯荤粺鐢ㄦ埛','POST'),(5,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/getUserList','鑾峰彇鐢ㄦ埛鍒楄〃','绯荤粺鐢ㄦ埛','POST'),(6,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/setUserInfo','璁剧疆鐢ㄦ埛淇℃伅','绯荤粺鐢ㄦ埛','PUT'),(7,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/setSelfInfo','璁剧疆鑷韩淇℃伅(蹇呴€?','绯荤粺鐢ㄦ埛','PUT'),(8,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/getUserInfo','鑾峰彇鑷韩淇℃伅(蹇呴€?','绯荤粺鐢ㄦ埛','GET'),(9,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/setUserAuthorities','璁剧疆鏉冮檺缁?,'绯荤粺鐢ㄦ埛','POST'),(10,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/changePassword','淇敼瀵嗙爜锛堝缓璁€夋嫨)','绯荤粺鐢ㄦ埛','POST'),(11,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/setUserAuthority','淇敼鐢ㄦ埛瑙掕壊(蹇呴€?','绯荤粺鐢ㄦ埛','POST'),(12,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/user/resetPassword','閲嶇疆鐢ㄦ埛瀵嗙爜','绯荤粺鐢ㄦ埛','POST'),(13,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/createApi','鍒涘缓api','api','POST'),(14,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/deleteApi','鍒犻櫎Api','api','POST'),(15,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/updateApi','鏇存柊Api','api','POST'),(16,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/getApiList','鑾峰彇api鍒楄〃','api','POST'),(17,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/getAllApis','鑾峰彇鎵€鏈塧pi','api','POST'),(18,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/getApiById','鑾峰彇api璇︾粏淇℃伅','api','POST'),(19,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/api/deleteApisByIds','鎵归噺鍒犻櫎api','api','DELETE'),(20,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authority/copyAuthority','鎷疯礉瑙掕壊','瑙掕壊','POST'),(21,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authority/createAuthority','鍒涘缓瑙掕壊','瑙掕壊','POST'),(22,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authority/deleteAuthority','鍒犻櫎瑙掕壊','瑙掕壊','POST'),(23,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authority/updateAuthority','鏇存柊瑙掕壊淇℃伅','瑙掕壊','PUT'),(24,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authority/getAuthorityList','鑾峰彇瑙掕壊鍒楄〃','瑙掕壊','POST'),(25,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authority/setDataAuthority','璁剧疆瑙掕壊璧勬簮鏉冮檺','瑙掕壊','POST'),(26,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/casbin/updateCasbin','鏇存敼瑙掕壊api鏉冮檺','casbin','POST'),(27,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/casbin/getPolicyPathByAuthorityId','鑾峰彇鏉冮檺鍒楄〃','casbin','POST'),(28,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/addBaseMenu','鏂板鑿滃崟','鑿滃崟','POST'),(29,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/getMenu','鑾峰彇鑿滃崟鏍?蹇呴€?','鑿滃崟','POST'),(30,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/deleteBaseMenu','鍒犻櫎鑿滃崟','鑿滃崟','POST'),(31,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/updateBaseMenu','鏇存柊鑿滃崟','鑿滃崟','POST'),(32,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/getBaseMenuById','鏍规嵁id鑾峰彇鑿滃崟','鑿滃崟','POST'),(33,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/getMenuList','鍒嗛〉鑾峰彇鍩虹menu鍒楄〃','鑿滃崟','POST'),(34,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/getBaseMenuTree','鑾峰彇鐢ㄦ埛鍔ㄦ€佽矾鐢?,'鑿滃崟','POST'),(35,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/getMenuAuthority','鑾峰彇鎸囧畾瑙掕壊menu','鑿滃崟','POST'),(36,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/menu/addMenuAuthority','澧炲姞menu鍜岃鑹插叧鑱斿叧绯?,'鑿滃崟','POST'),(37,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/findFile','瀵绘壘鐩爣鏂囦欢锛堢浼狅級','鍒嗙墖涓婁紶','GET'),(38,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/breakpointContinue','鏂偣缁紶','鍒嗙墖涓婁紶','POST'),(39,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/breakpointContinueFinish','鏂偣缁紶瀹屾垚','鍒嗙墖涓婁紶','POST'),(40,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/removeChunk','涓婁紶瀹屾垚绉婚櫎鏂囦欢','鍒嗙墖涓婁紶','POST'),(41,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/upload','鏂囦欢涓婁紶绀轰緥','鏂囦欢涓婁紶涓庝笅杞?,'POST'),(42,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/deleteFile','鍒犻櫎鏂囦欢','鏂囦欢涓婁紶涓庝笅杞?,'POST'),(43,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/editFileName','鏂囦欢鍚嶆垨鑰呭娉ㄧ紪杈?,'鏂囦欢涓婁紶涓庝笅杞?,'POST'),(44,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/fileUploadAndDownload/getFileList','鑾峰彇涓婁紶鏂囦欢鍒楄〃','鏂囦欢涓婁紶涓庝笅杞?,'POST'),(45,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/system/getServerInfo','鑾峰彇鏈嶅姟鍣ㄤ俊鎭?,'绯荤粺鏈嶅姟','POST'),(46,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/system/getSystemConfig','鑾峰彇閰嶇疆鏂囦欢鍐呭','绯荤粺鏈嶅姟','POST'),(47,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/system/setSystemConfig','璁剧疆閰嶇疆鏂囦欢鍐呭','绯荤粺鏈嶅姟','POST'),(48,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/customer/customer','鏇存柊瀹㈡埛','瀹㈡埛','PUT'),(49,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/customer/customer','鍒涘缓瀹㈡埛','瀹㈡埛','POST'),(50,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/customer/customer','鍒犻櫎瀹㈡埛','瀹㈡埛','DELETE'),(51,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/customer/customer','鑾峰彇鍗曚竴瀹㈡埛','瀹㈡埛','GET'),(52,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/customer/customerList','鑾峰彇瀹㈡埛鍒楄〃','瀹㈡埛','GET'),(53,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/getDB','鑾峰彇鎵€鏈夋暟鎹簱','浠ｇ爜鐢熸垚鍣?,'GET'),(54,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/getTables','鑾峰彇鏁版嵁搴撹〃','浠ｇ爜鐢熸垚鍣?,'GET'),(55,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/createTemp','鑷姩鍖栦唬鐮?,'浠ｇ爜鐢熸垚鍣?,'POST'),(56,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/preview','棰勮鑷姩鍖栦唬鐮?,'浠ｇ爜鐢熸垚鍣?,'POST'),(57,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/getColumn','鑾峰彇鎵€閫塼able鐨勬墍鏈夊瓧娈?,'浠ｇ爜鐢熸垚鍣?,'GET'),(58,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/createPlug','鑷姩鍒涘缓鎻掍欢鍖?,'浠ｇ爜鐢熸垚鍣?,'POST'),(59,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/installPlugin','瀹夎鎻掍欢','浠ｇ爜鐢熸垚鍣?,'POST'),(60,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/createPackage','鐢熸垚鍖?package)','鍖咃紙pkg锛夌敓鎴愬櫒','POST'),(61,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/getPackage','鑾峰彇鎵€鏈夊寘(package)','鍖咃紙pkg锛夌敓鎴愬櫒','POST'),(62,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/delPackage','鍒犻櫎鍖?package)','鍖咃紙pkg锛夌敓鎴愬櫒','POST'),(63,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/getMeta','鑾峰彇meta淇℃伅','浠ｇ爜鐢熸垚鍣ㄥ巻鍙?,'POST'),(64,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/rollback','鍥炴粴鑷姩鐢熸垚浠ｇ爜','浠ｇ爜鐢熸垚鍣ㄥ巻鍙?,'POST'),(65,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/getSysHistory','鏌ヨ鍥炴粴璁板綍','浠ｇ爜鐢熸垚鍣ㄥ巻鍙?,'POST'),(66,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/autoCode/delSysHistory','鍒犻櫎鍥炴粴璁板綍','浠ｇ爜鐢熸垚鍣ㄥ巻鍙?,'POST'),(67,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionaryDetail/updateSysDictionaryDetail','鏇存柊瀛楀吀鍐呭','绯荤粺瀛楀吀璇︽儏','PUT'),(68,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionaryDetail/createSysDictionaryDetail','鏂板瀛楀吀鍐呭','绯荤粺瀛楀吀璇︽儏','POST'),(69,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionaryDetail/deleteSysDictionaryDetail','鍒犻櫎瀛楀吀鍐呭','绯荤粺瀛楀吀璇︽儏','DELETE'),(70,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionaryDetail/findSysDictionaryDetail','鏍规嵁ID鑾峰彇瀛楀吀鍐呭','绯荤粺瀛楀吀璇︽儏','GET'),(71,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionaryDetail/getSysDictionaryDetailList','鑾峰彇瀛楀吀鍐呭鍒楄〃','绯荤粺瀛楀吀璇︽儏','GET'),(72,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionary/createSysDictionary','鏂板瀛楀吀','绯荤粺瀛楀吀','POST'),(73,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionary/deleteSysDictionary','鍒犻櫎瀛楀吀','绯荤粺瀛楀吀','DELETE'),(74,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionary/updateSysDictionary','鏇存柊瀛楀吀','绯荤粺瀛楀吀','PUT'),(75,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionary/findSysDictionary','鏍规嵁ID鑾峰彇瀛楀吀','绯荤粺瀛楀吀','GET'),(76,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysDictionary/getSysDictionaryList','鑾峰彇瀛楀吀鍒楄〃','绯荤粺瀛楀吀','GET'),(77,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysOperationRecord/createSysOperationRecord','鏂板鎿嶄綔璁板綍','鎿嶄綔璁板綍','POST'),(78,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysOperationRecord/findSysOperationRecord','鏍规嵁ID鑾峰彇鎿嶄綔璁板綍','鎿嶄綔璁板綍','GET'),(79,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysOperationRecord/getSysOperationRecordList','鑾峰彇鎿嶄綔璁板綍鍒楄〃','鎿嶄綔璁板綍','GET'),(80,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysOperationRecord/deleteSysOperationRecord','鍒犻櫎鎿嶄綔璁板綍','鎿嶄綔璁板綍','DELETE'),(81,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/sysOperationRecord/deleteSysOperationRecordByIds','鎵归噺鍒犻櫎鎿嶄綔鍘嗗彶','鎿嶄綔璁板綍','DELETE'),(82,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/simpleUploader/upload','鎻掍欢鐗堝垎鐗囦笂浼?,'鏂偣缁紶(鎻掍欢鐗?','POST'),(83,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/simpleUploader/checkFileMd5','鏂囦欢瀹屾暣搴﹂獙璇?,'鏂偣缁紶(鎻掍欢鐗?','GET'),(84,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/simpleUploader/mergeFileMd5','涓婁紶瀹屾垚鍚堝苟鏂囦欢','鏂偣缁紶(鎻掍欢鐗?','GET'),(85,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/email/emailTest','鍙戦€佹祴璇曢偖浠?,'email','POST'),(86,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/email/emailSend','鍙戦€侀偖浠剁ず渚?,'email','POST'),(87,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authorityBtn/setAuthorityBtn','璁剧疆鎸夐挳鏉冮檺','鎸夐挳鏉冮檺','POST'),(88,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authorityBtn/getAuthorityBtn','鑾峰彇宸叉湁鎸夐挳鏉冮檺','鎸夐挳鏉冮檺','POST'),(89,'2023-01-20 03:20:51.139','2023-01-20 03:20:51.139',NULL,'/authorityBtn/canRemoveAuthorityBtn','鍒犻櫎鎸夐挳','鎸夐挳鏉冮檺','POST');
/*!40000 ALTER TABLE `sys_apis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authorities`
--

DROP TABLE IF EXISTS `sys_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authorities` (
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `authority_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '瑙掕壊ID',
  `authority_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '瑙掕壊鍚?,
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '鐖惰鑹睮D',
  `default_router` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dashboard' COMMENT '榛樿鑿滃崟',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `authority_id` (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authorities`
--

LOCK TABLES `sys_authorities` WRITE;
/*!40000 ALTER TABLE `sys_authorities` DISABLE KEYS */;
INSERT INTO `sys_authorities` VALUES ('2023-01-20 03:20:51.161','2023-01-20 03:20:51.514',NULL,888,'鏅€氱敤鎴?,0,'dashboard'),('2023-01-20 03:20:51.161','2023-01-20 03:20:51.551',NULL,8881,'鏅€氱敤鎴峰瓙瑙掕壊',888,'dashboard'),('2023-01-20 03:20:51.161','2023-01-20 03:20:51.529',NULL,9528,'娴嬭瘯瑙掕壊',0,'dashboard');
/*!40000 ALTER TABLE `sys_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_btns`
--

DROP TABLE IF EXISTS `sys_authority_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_btns` (
  `authority_id` bigint unsigned DEFAULT NULL COMMENT '瑙掕壊ID',
  `sys_menu_id` bigint unsigned DEFAULT NULL COMMENT '鑿滃崟ID',
  `sys_base_menu_btn_id` bigint unsigned DEFAULT NULL COMMENT '鑿滃崟鎸夐挳ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_btns`
--

LOCK TABLES `sys_authority_btns` WRITE;
/*!40000 ALTER TABLE `sys_authority_btns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_authority_btns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_menus`
--

DROP TABLE IF EXISTS `sys_authority_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_menus` (
  `sys_base_menu_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '瑙掕壊ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_menus`
--

LOCK TABLES `sys_authority_menus` WRITE;
/*!40000 ALTER TABLE `sys_authority_menus` DISABLE KEYS */;
INSERT INTO `sys_authority_menus` VALUES (1,888),(1,8881),(1,9528),(2,888),(2,8881),(2,9528),(3,888),(4,888),(4,8881),(5,888),(5,8881),(6,888),(6,8881),(7,888),(7,8881),(8,888),(8,8881),(8,9528),(9,888),(9,8881),(10,888),(10,8881),(11,888),(11,8881),(12,888),(13,888),(13,8881),(14,888),(14,8881),(15,888),(15,8881),(16,888),(16,8881),(17,888),(17,8881),(18,888),(19,888),(20,888),(21,888),(22,888),(23,888),(24,888),(25,888),(26,888),(27,888),(28,888),(29,888);
/*!40000 ALTER TABLE `sys_authority_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_code_histories`
--

DROP TABLE IF EXISTS `sys_auto_code_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_code_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `package` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `business_db` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_meta` text COLLATE utf8mb4_general_ci,
  `auto_code_path` text COLLATE utf8mb4_general_ci,
  `injection_meta` text COLLATE utf8mb4_general_ci,
  `struct_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `struct_cn_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_ids` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `flag` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_code_histories_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_code_histories`
--

LOCK TABLES `sys_auto_code_histories` WRITE;
/*!40000 ALTER TABLE `sys_auto_code_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_auto_code_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auto_codes`
--

DROP TABLE IF EXISTS `sys_auto_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auto_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `package_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鍖呭悕',
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '灞曠ず鍚?,
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鎻忚堪',
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_codes_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_codes`
--

LOCK TABLES `sys_auto_codes` WRITE;
/*!40000 ALTER TABLE `sys_auto_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_auto_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_btns`
--

DROP TABLE IF EXISTS `sys_base_menu_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_btns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鎸夐挳鍏抽敭key',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL COMMENT '鑿滃崟ID',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_btns_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_btns`
--

LOCK TABLES `sys_base_menu_btns` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_btns` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_btns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menu_parameters`
--

DROP TABLE IF EXISTS `sys_base_menu_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menu_parameters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鍦板潃鏍忔惡甯﹀弬鏁颁负params杩樻槸query',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鍦板潃鏍忔惡甯﹀弬鏁扮殑key',
  `value` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鍦板潃鏍忔惡甯﹀弬鏁扮殑鍊?,
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menu_parameters_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menu_parameters`
--

LOCK TABLES `sys_base_menu_parameters` WRITE;
/*!40000 ALTER TABLE `sys_base_menu_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_base_menu_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_base_menus`
--

DROP TABLE IF EXISTS `sys_base_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_base_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `menu_level` bigint unsigned DEFAULT NULL,
  `parent_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鐖惰彍鍗旾D',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '璺敱path',
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '璺敱name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '鏄惁鍦ㄥ垪琛ㄩ殣钘?,
  `component` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '瀵瑰簲鍓嶇鏂囦欢璺緞',
  `sort` bigint DEFAULT NULL COMMENT '鎺掑簭鏍囪',
  `active_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '闄勫姞灞炴€?,
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '闄勫姞灞炴€?,
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '闄勫姞灞炴€?,
  `title` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '闄勫姞灞炴€?,
  `icon` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '闄勫姞灞炴€?,
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '闄勫姞灞炴€?,
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menus`
--

LOCK TABLES `sys_base_menus` WRITE;
/*!40000 ALTER TABLE `sys_base_menus` DISABLE KEYS */;
INSERT INTO `sys_base_menus` VALUES (1,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','dashboard','dashboard',0,'view/dashboard/index.vue',1,'',0,0,'浠〃鐩?,'odometer',0),(2,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','about','about',0,'view/about/index.vue',9,'',0,0,'鍏充簬鎴戜滑','info-filled',0),(3,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','admin','superAdmin',0,'view/superAdmin/index.vue',3,'',0,0,'瓒呯骇绠＄悊鍛?,'user',0),(4,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','authority','authority',0,'view/superAdmin/authority/authority.vue',1,'',0,0,'瑙掕壊绠＄悊','avatar',0),(5,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','menu','menu',0,'view/superAdmin/menu/menu.vue',2,'',1,0,'鑿滃崟绠＄悊','tickets',0),(6,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','api','api',0,'view/superAdmin/api/api.vue',3,'',1,0,'api绠＄悊','platform',0),(7,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','user','user',0,'view/superAdmin/user/user.vue',4,'',0,0,'鐢ㄦ埛绠＄悊','coordinate',0),(8,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','dictionary','dictionary',0,'view/superAdmin/dictionary/sysDictionary.vue',5,'',0,0,'瀛楀吀绠＄悊','notebook',0),(9,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','dictionaryDetail/:id','dictionaryDetail',1,'view/superAdmin/dictionary/sysDictionaryDetail.vue',1,'dictionary',0,0,'瀛楀吀璇︽儏-${id}','list',0),(10,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'3','operation','operation',0,'view/superAdmin/operation/sysOperationRecord.vue',6,'',0,0,'鎿嶄綔鍘嗗彶','pie-chart',0),(11,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','person','person',1,'view/person/person.vue',4,'',0,0,'涓汉淇℃伅','message',0),(12,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','example','example',0,'view/example/index.vue',7,'',0,0,'绀轰緥鏂囦欢','management',0),(13,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'12','upload','upload',0,'view/example/upload/upload.vue',5,'',0,0,'濯掍綋搴擄紙涓婁紶涓嬭浇锛?,'upload',0),(14,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'12','breakpoint','breakpoint',0,'view/example/breakpoint/breakpoint.vue',6,'',0,0,'鏂偣缁紶','upload-filled',0),(15,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'12','customer','customer',0,'view/example/customer/customer.vue',7,'',0,0,'瀹㈡埛鍒楄〃锛堣祫婧愮ず渚嬶級','avatar',0),(16,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','systemTools','systemTools',0,'view/systemTools/index.vue',5,'',0,0,'绯荤粺宸ュ叿','tools',0),(17,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'16','autoCode','autoCode',0,'view/systemTools/autoCode/index.vue',1,'',1,0,'浠ｇ爜鐢熸垚鍣?,'cpu',0),(18,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'16','formCreate','formCreate',0,'view/systemTools/formCreate/index.vue',2,'',1,0,'琛ㄥ崟鐢熸垚鍣?,'magic-stick',0),(19,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'16','system','system',0,'view/systemTools/system/system.vue',3,'',0,0,'绯荤粺閰嶇疆','operation',0),(20,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'16','autoCodeAdmin','autoCodeAdmin',0,'view/systemTools/autoCodeAdmin/index.vue',1,'',0,0,'鑷姩鍖栦唬鐮佺鐞?,'magic-stick',0),(21,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'16','autoCodeEdit/:id','autoCodeEdit',1,'view/systemTools/autoCode/index.vue',0,'',0,0,'鑷姩鍖栦唬鐮?${id}','magic-stick',0),(22,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'16','autoPkg','autoPkg',0,'view/systemTools/autoPkg/autoPkg.vue',0,'',0,0,'鑷姩鍖杙ackage','folder',0),(23,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','https://www.gin-vue-admin.com','https://www.gin-vue-admin.com',0,'/',0,'',0,0,'瀹樻柟缃戠珯','home-filled',0),(24,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','state','state',0,'view/system/state.vue',8,'',0,0,'鏈嶅姟鍣ㄧ姸鎬?,'cloudy',0),(25,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'0','plugin','plugin',0,'view/routerHolder.vue',6,'',0,0,'鎻掍欢绯荤粺','cherry',0),(26,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'25','https://plugin.gin-vue-admin.com/','https://plugin.gin-vue-admin.com/',0,'https://plugin.gin-vue-admin.com/',0,'',0,0,'鎻掍欢甯傚満','shop',0),(27,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'25','installPlugin','installPlugin',0,'view/systemTools/installPlugin/index.vue',1,'',0,0,'鎻掍欢瀹夎','box',0),(28,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'25','autoPlug','autoPlug',0,'view/systemTools/autoPlug/autoPlug.vue',2,'',0,0,'鎻掍欢妯℃澘','folder',0),(29,'2023-01-20 03:20:51.269','2023-01-20 03:20:51.269',NULL,0,'25','plugin-email','plugin-email',0,'plugin/email/view/index.vue',3,'',0,0,'閭欢鎻掍欢','message',0);
/*!40000 ALTER TABLE `sys_base_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_authority_id`
--

DROP TABLE IF EXISTS `sys_data_authority_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_authority_id` (
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '瑙掕壊ID',
  `data_authority_id_authority_id` bigint unsigned NOT NULL COMMENT '瑙掕壊ID',
  PRIMARY KEY (`sys_authority_authority_id`,`data_authority_id_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_data_authority_id`
--

LOCK TABLES `sys_data_authority_id` WRITE;
/*!40000 ALTER TABLE `sys_data_authority_id` DISABLE KEYS */;
INSERT INTO `sys_data_authority_id` VALUES (888,888),(888,8881),(888,9528),(9528,8881),(9528,9528);
/*!40000 ALTER TABLE `sys_data_authority_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionaries`
--

DROP TABLE IF EXISTS `sys_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '瀛楀吀鍚嶏紙涓級',
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '瀛楀吀鍚嶏紙鑻憋級',
  `status` tinyint(1) DEFAULT NULL COMMENT '鐘舵€?,
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鎻忚堪',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` VALUES (1,'2023-01-20 03:20:51.193','2023-01-20 03:20:51.201',NULL,'鎬у埆','gender',1,'鎬у埆瀛楀吀'),(2,'2023-01-20 03:20:51.193','2023-01-20 03:20:51.212',NULL,'鏁版嵁搴搃nt绫诲瀷','int',1,'int绫诲瀷瀵瑰簲鐨勬暟鎹簱绫诲瀷'),(3,'2023-01-20 03:20:51.193','2023-01-20 03:20:51.225',NULL,'鏁版嵁搴撴椂闂存棩鏈熺被鍨?,'time.Time',1,'鏁版嵁搴撴椂闂存棩鏈熺被鍨?),(4,'2023-01-20 03:20:51.193','2023-01-20 03:20:51.235',NULL,'鏁版嵁搴撴诞鐐瑰瀷','float64',1,'鏁版嵁搴撴诞鐐瑰瀷'),(5,'2023-01-20 03:20:51.193','2023-01-20 03:20:51.245',NULL,'鏁版嵁搴撳瓧绗︿覆','string',1,'鏁版嵁搴撳瓧绗︿覆'),(6,'2023-01-20 03:20:51.193','2023-01-20 03:20:51.257',NULL,'鏁版嵁搴揵ool绫诲瀷','bool',1,'鏁版嵁搴揵ool绫诲瀷');
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dictionary_details`
--

DROP TABLE IF EXISTS `sys_dictionary_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dictionary_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '灞曠ず鍊?,
  `value` bigint DEFAULT NULL COMMENT '瀛楀吀鍊?,
  `status` tinyint(1) DEFAULT NULL COMMENT '鍚敤鐘舵€?,
  `sort` bigint DEFAULT NULL COMMENT '鎺掑簭鏍囪',
  `sys_dictionary_id` bigint unsigned DEFAULT NULL COMMENT '鍏宠仈鏍囪',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary_details`
--

LOCK TABLES `sys_dictionary_details` WRITE;
/*!40000 ALTER TABLE `sys_dictionary_details` DISABLE KEYS */;
INSERT INTO `sys_dictionary_details` VALUES (1,'2023-01-20 03:20:51.203','2023-01-20 03:20:51.203',NULL,'鐢?,1,1,1,1),(2,'2023-01-20 03:20:51.203','2023-01-20 03:20:51.203',NULL,'濂?,2,1,2,1),(3,'2023-01-20 03:20:51.214','2023-01-20 03:20:51.214',NULL,'smallint',1,1,1,2),(4,'2023-01-20 03:20:51.214','2023-01-20 03:20:51.214',NULL,'mediumint',2,1,2,2),(5,'2023-01-20 03:20:51.214','2023-01-20 03:20:51.214',NULL,'int',3,1,3,2),(6,'2023-01-20 03:20:51.214','2023-01-20 03:20:51.214',NULL,'bigint',4,1,4,2),(7,'2023-01-20 03:20:51.226','2023-01-20 03:20:51.226',NULL,'date',0,1,0,3),(8,'2023-01-20 03:20:51.226','2023-01-20 03:20:51.226',NULL,'time',1,1,1,3),(9,'2023-01-20 03:20:51.226','2023-01-20 03:20:51.226',NULL,'year',2,1,2,3),(10,'2023-01-20 03:20:51.226','2023-01-20 03:20:51.226',NULL,'datetime',3,1,3,3),(11,'2023-01-20 03:20:51.226','2023-01-20 03:20:51.226',NULL,'timestamp',5,1,5,3),(12,'2023-01-20 03:20:51.238','2023-01-20 03:20:51.238',NULL,'float',0,1,0,4),(13,'2023-01-20 03:20:51.238','2023-01-20 03:20:51.238',NULL,'double',1,1,1,4),(14,'2023-01-20 03:20:51.238','2023-01-20 03:20:51.238',NULL,'decimal',2,1,2,4),(15,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'char',0,1,0,5),(16,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'varchar',1,1,1,5),(17,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'tinyblob',2,1,2,5),(18,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'tinytext',3,1,3,5),(19,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'text',4,1,4,5),(20,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'blob',5,1,5,5),(21,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'mediumblob',6,1,6,5),(22,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'mediumtext',7,1,7,5),(23,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'longblob',8,1,8,5),(24,'2023-01-20 03:20:51.247','2023-01-20 03:20:51.247',NULL,'longtext',9,1,9,5),(25,'2023-01-20 03:20:51.259','2023-01-20 03:20:51.259',NULL,'tinyint',0,1,0,6);
/*!40000 ALTER TABLE `sys_dictionary_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation_records`
--

DROP TABLE IF EXISTS `sys_operation_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operation_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '璇锋眰ip',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '璇锋眰鏂规硶',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '璇锋眰璺緞',
  `status` bigint DEFAULT NULL COMMENT '璇锋眰鐘舵€?,
  `latency` bigint DEFAULT NULL COMMENT '寤惰繜',
  `agent` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浠ｇ悊',
  `error_message` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '閿欒淇℃伅',
  `body` text COLLATE utf8mb4_general_ci COMMENT '璇锋眰Body',
  `resp` text COLLATE utf8mb4_general_ci COMMENT '鍝嶅簲Body',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '鐢ㄦ埛id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_records`
--

LOCK TABLES `sys_operation_records` WRITE;
/*!40000 ALTER TABLE `sys_operation_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_operation_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_authority`
--

DROP TABLE IF EXISTS `sys_user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_authority` (
  `sys_user_id` bigint unsigned NOT NULL,
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '瑙掕壊ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_authority`
--

LOCK TABLES `sys_user_authority` WRITE;
/*!40000 ALTER TABLE `sys_user_authority` DISABLE KEYS */;
INSERT INTO `sys_user_authority` VALUES (1,888),(1,8881),(1,9528),(2,888);
/*!40000 ALTER TABLE `sys_user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_users`
--

DROP TABLE IF EXISTS `sys_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鐢ㄦ埛UUID',
  `username` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鐢ㄦ埛鐧诲綍鍚?,
  `password` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鐢ㄦ埛鐧诲綍瀵嗙爜',
  `nick_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '绯荤粺鐢ㄦ埛' COMMENT '鐢ㄦ埛鏄电О',
  `side_mode` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dark' COMMENT '鐢ㄦ埛渚ц竟涓婚',
  `header_img` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '鐢ㄦ埛澶村儚',
  `base_color` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '#fff' COMMENT '鍩虹棰滆壊',
  `active_color` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '#1890ff' COMMENT '娲昏穬棰滆壊',
  `authority_id` bigint unsigned DEFAULT '888' COMMENT '鐢ㄦ埛瑙掕壊ID',
  `phone` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鐢ㄦ埛鎵嬫満鍙?,
  `email` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '鐢ㄦ埛閭',
  `enable` bigint DEFAULT '1' COMMENT '鐢ㄦ埛鏄惁琚喕缁?1姝ｅ父 2鍐荤粨',
  PRIMARY KEY (`id`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`),
  KEY `idx_sys_users_uuid` (`uuid`),
  KEY `idx_sys_users_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users`
--

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` VALUES (1,'2023-01-20 03:20:51.483','2023-01-20 03:20:51.488',NULL,'3628561d-6dbd-4a2a-b633-1888fbae2a09','admin','$2a$10$ilzPazBqIJjW1Cf/jwos1e/D9oWNJZtL.LUkFGe2FRsCDKS2TUMgW','Mr.濂囨芳','dark','https://qmplusimg.henrongyi.top/gva_header.jpg','#fff','#1890ff',888,'17611111111','333333333@qq.com',1),(2,'2023-01-20 03:20:51.483','2023-01-20 03:20:51.499',NULL,'91f0022d-57ab-41d2-9e38-2964fcf9b3aa','a303176530','$2a$10$ZjzRPaYrxJvORUsIhl1WROcLyNItKSowi.8qjoKWZ/2o0FHWTPPLq','鐢ㄦ埛1','dark','https:///qmplusimg.henrongyi.top/1572075907logo.png','#fff','#1890ff',9528,'17611111111','333333333@qq.com',1);
/*!40000 ALTER TABLE `sys_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-15  0:23:42
