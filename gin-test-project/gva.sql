-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: gva
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu2

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
-- Table structure for table `LORA`
--

DROP TABLE IF EXISTS `LORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LORA` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `dev_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lora_uid` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `r_f_i_d` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_LORA_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LORA`
--

LOCK TABLES `LORA` WRITE;
/*!40000 ALTER TABLE `LORA` DISABLE KEYS */;
INSERT INTO `LORA` VALUES (1,'2023-02-02 16:54:16.088','2023-02-02 16:54:16.088',NULL,'123','2.1','123','123','123');
/*!40000 ALTER TABLE `LORA` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES (265,'p','6','/base/login','POST','','','','',''),(264,'p','6','/jwt/jsonInBlacklist','POST','','','','',''),(263,'p','6','/menu/getMenu','POST','','','','',''),(266,'p','6','/user/admin_register','POST','','','','',''),(267,'p','6','/user/changePassword','POST','','','','',''),(270,'p','6','/user/getUserInfo','GET','','','','',''),(268,'p','6','/user/setUserAuthority','POST','','','','',''),(269,'p','6','/user/setUserInfo','PUT','','','','',''),(377,'p','888','/api/createApi','POST','','','','',''),(378,'p','888','/api/deleteApi','POST','','','','',''),(383,'p','888','/api/deleteApisByIds','DELETE','','','','',''),(381,'p','888','/api/getAllApis','POST','','','','',''),(382,'p','888','/api/getApiById','POST','','','','',''),(380,'p','888','/api/getApiList','POST','','','','',''),(379,'p','888','/api/updateApi','POST','','','','',''),(384,'p','888','/authority/copyAuthority','POST','','','','',''),(385,'p','888','/authority/createAuthority','POST','','','','',''),(386,'p','888','/authority/deleteAuthority','POST','','','','',''),(388,'p','888','/authority/getAuthorityList','POST','','','','',''),(389,'p','888','/authority/setDataAuthority','POST','','','','',''),(387,'p','888','/authority/updateAuthority','PUT','','','','',''),(452,'p','888','/authorityBtn/canRemoveAuthorityBtn','POST','','','','',''),(451,'p','888','/authorityBtn/getAuthorityBtn','POST','','','','',''),(450,'p','888','/authorityBtn/setAuthorityBtn','POST','','','','',''),(424,'p','888','/autoCode/createPackage','POST','','','','',''),(422,'p','888','/autoCode/createPlug','POST','','','','',''),(419,'p','888','/autoCode/createTemp','POST','','','','',''),(426,'p','888','/autoCode/delPackage','POST','','','','',''),(430,'p','888','/autoCode/delSysHistory','POST','','','','',''),(421,'p','888','/autoCode/getColumn','GET','','','','',''),(417,'p','888','/autoCode/getDB','GET','','','','',''),(427,'p','888','/autoCode/getMeta','POST','','','','',''),(425,'p','888','/autoCode/getPackage','POST','','','','',''),(429,'p','888','/autoCode/getSysHistory','POST','','','','',''),(418,'p','888','/autoCode/getTables','GET','','','','',''),(423,'p','888','/autoCode/installPlugin','POST','','','','',''),(420,'p','888','/autoCode/preview','POST','','','','',''),(428,'p','888','/autoCode/rollback','POST','','','','',''),(365,'p','888','/base/login','POST','','','','',''),(391,'p','888','/casbin/getPolicyPathByAuthorityId','POST','','','','',''),(390,'p','888','/casbin/updateCasbin','POST','','','','',''),(414,'p','888','/customer/customer','DELETE','','','','',''),(415,'p','888','/customer/customer','GET','','','','',''),(413,'p','888','/customer/customer','POST','','','','',''),(412,'p','888','/customer/customer','PUT','','','','',''),(416,'p','888','/customer/customerList','GET','','','','',''),(449,'p','888','/email/emailTest','POST','','','','',''),(402,'p','888','/fileUploadAndDownload/breakpointContinue','POST','','','','',''),(403,'p','888','/fileUploadAndDownload/breakpointContinueFinish','POST','','','','',''),(406,'p','888','/fileUploadAndDownload/deleteFile','POST','','','','',''),(407,'p','888','/fileUploadAndDownload/editFileName','POST','','','','',''),(401,'p','888','/fileUploadAndDownload/findFile','GET','','','','',''),(408,'p','888','/fileUploadAndDownload/getFileList','POST','','','','',''),(404,'p','888','/fileUploadAndDownload/removeChunk','POST','','','','',''),(405,'p','888','/fileUploadAndDownload/upload','POST','','','','',''),(366,'p','888','/jwt/jsonInBlacklist','POST','','','','',''),(453,'p','888','/LORA/createLORAConfig','POST','','','','',''),(454,'p','888','/LORA/deleteLORAConfig','DELETE','','','','',''),(455,'p','888','/LORA/deleteLORAConfigByIds','DELETE','','','','',''),(457,'p','888','/LORA/findLORAConfig','GET','','','','',''),(458,'p','888','/LORA/getLORAConfigList','GET','','','','',''),(456,'p','888','/LORA/updateLORAConfig','PUT','','','','',''),(459,'p','888','/loraStruct/createLoraStruct','POST','','','','',''),(460,'p','888','/loraStruct/deleteLoraStruct','DELETE','','','','',''),(461,'p','888','/loraStruct/deleteLoraStructByIds','DELETE','','','','',''),(463,'p','888','/loraStruct/findLoraStruct','GET','','','','',''),(464,'p','888','/loraStruct/getLoraStructList','GET','','','','',''),(462,'p','888','/loraStruct/updateLoraStruct','PUT','','','','',''),(392,'p','888','/menu/addBaseMenu','POST','','','','',''),(400,'p','888','/menu/addMenuAuthority','POST','','','','',''),(394,'p','888','/menu/deleteBaseMenu','POST','','','','',''),(396,'p','888','/menu/getBaseMenuById','POST','','','','',''),(398,'p','888','/menu/getBaseMenuTree','POST','','','','',''),(393,'p','888','/menu/getMenu','POST','','','','',''),(399,'p','888','/menu/getMenuAuthority','POST','','','','',''),(397,'p','888','/menu/getMenuList','POST','','','','',''),(395,'p','888','/menu/updateBaseMenu','POST','','','','',''),(447,'p','888','/simpleUploader/checkFileMd5','GET','','','','',''),(448,'p','888','/simpleUploader/mergeFileMd5','GET','','','','',''),(446,'p','888','/simpleUploader/upload','POST','','','','',''),(436,'p','888','/sysDictionary/createSysDictionary','POST','','','','',''),(437,'p','888','/sysDictionary/deleteSysDictionary','DELETE','','','','',''),(439,'p','888','/sysDictionary/findSysDictionary','GET','','','','',''),(440,'p','888','/sysDictionary/getSysDictionaryList','GET','','','','',''),(438,'p','888','/sysDictionary/updateSysDictionary','PUT','','','','',''),(432,'p','888','/sysDictionaryDetail/createSysDictionaryDetail','POST','','','','',''),(433,'p','888','/sysDictionaryDetail/deleteSysDictionaryDetail','DELETE','','','','',''),(434,'p','888','/sysDictionaryDetail/findSysDictionaryDetail','GET','','','','',''),(435,'p','888','/sysDictionaryDetail/getSysDictionaryDetailList','GET','','','','',''),(431,'p','888','/sysDictionaryDetail/updateSysDictionaryDetail','PUT','','','','',''),(441,'p','888','/sysOperationRecord/createSysOperationRecord','POST','','','','',''),(444,'p','888','/sysOperationRecord/deleteSysOperationRecord','DELETE','','','','',''),(445,'p','888','/sysOperationRecord/deleteSysOperationRecordByIds','DELETE','','','','',''),(442,'p','888','/sysOperationRecord/findSysOperationRecord','GET','','','','',''),(443,'p','888','/sysOperationRecord/getSysOperationRecordList','GET','','','','',''),(409,'p','888','/system/getServerInfo','POST','','','','',''),(410,'p','888','/system/getSystemConfig','POST','','','','',''),(411,'p','888','/system/setSystemConfig','POST','','','','',''),(368,'p','888','/user/admin_register','POST','','','','',''),(374,'p','888','/user/changePassword','POST','','','','',''),(367,'p','888','/user/deleteUser','DELETE','','','','',''),(372,'p','888','/user/getUserInfo','GET','','','','',''),(369,'p','888','/user/getUserList','POST','','','','',''),(376,'p','888','/user/resetPassword','POST','','','','',''),(371,'p','888','/user/setSelfInfo','PUT','','','','',''),(373,'p','888','/user/setUserAuthorities','POST','','','','',''),(375,'p','888','/user/setUserAuthority','POST','','','','',''),(370,'p','888','/user/setUserInfo','PUT','','','','',''),(92,'p','8881','/api/createApi','POST','','','','',''),(95,'p','8881','/api/deleteApi','POST','','','','',''),(97,'p','8881','/api/getAllApis','POST','','','','',''),(94,'p','8881','/api/getApiById','POST','','','','',''),(93,'p','8881','/api/getApiList','POST','','','','',''),(96,'p','8881','/api/updateApi','POST','','','','',''),(98,'p','8881','/authority/createAuthority','POST','','','','',''),(99,'p','8881','/authority/deleteAuthority','POST','','','','',''),(100,'p','8881','/authority/getAuthorityList','POST','','','','',''),(101,'p','8881','/authority/setDataAuthority','POST','','','','',''),(90,'p','8881','/base/login','POST','','','','',''),(119,'p','8881','/casbin/getPolicyPathByAuthorityId','POST','','','','',''),(118,'p','8881','/casbin/updateCasbin','POST','','','','',''),(125,'p','8881','/customer/customer','DELETE','','','','',''),(126,'p','8881','/customer/customer','GET','','','','',''),(123,'p','8881','/customer/customer','POST','','','','',''),(124,'p','8881','/customer/customer','PUT','','','','',''),(127,'p','8881','/customer/customerList','GET','','','','',''),(116,'p','8881','/fileUploadAndDownload/deleteFile','POST','','','','',''),(117,'p','8881','/fileUploadAndDownload/editFileName','POST','','','','',''),(115,'p','8881','/fileUploadAndDownload/getFileList','POST','','','','',''),(114,'p','8881','/fileUploadAndDownload/upload','POST','','','','',''),(120,'p','8881','/jwt/jsonInBlacklist','POST','','','','',''),(104,'p','8881','/menu/addBaseMenu','POST','','','','',''),(106,'p','8881','/menu/addMenuAuthority','POST','','','','',''),(108,'p','8881','/menu/deleteBaseMenu','POST','','','','',''),(110,'p','8881','/menu/getBaseMenuById','POST','','','','',''),(105,'p','8881','/menu/getBaseMenuTree','POST','','','','',''),(102,'p','8881','/menu/getMenu','POST','','','','',''),(107,'p','8881','/menu/getMenuAuthority','POST','','','','',''),(103,'p','8881','/menu/getMenuList','POST','','','','',''),(109,'p','8881','/menu/updateBaseMenu','POST','','','','',''),(121,'p','8881','/system/getSystemConfig','POST','','','','',''),(122,'p','8881','/system/setSystemConfig','POST','','','','',''),(91,'p','8881','/user/admin_register','POST','','','','',''),(111,'p','8881','/user/changePassword','POST','','','','',''),(128,'p','8881','/user/getUserInfo','GET','','','','',''),(112,'p','8881','/user/getUserList','POST','','','','',''),(113,'p','8881','/user/setUserAuthority','POST','','','','',''),(131,'p','9528','/api/createApi','POST','','','','',''),(134,'p','9528','/api/deleteApi','POST','','','','',''),(136,'p','9528','/api/getAllApis','POST','','','','',''),(133,'p','9528','/api/getApiById','POST','','','','',''),(132,'p','9528','/api/getApiList','POST','','','','',''),(135,'p','9528','/api/updateApi','POST','','','','',''),(137,'p','9528','/authority/createAuthority','POST','','','','',''),(138,'p','9528','/authority/deleteAuthority','POST','','','','',''),(139,'p','9528','/authority/getAuthorityList','POST','','','','',''),(140,'p','9528','/authority/setDataAuthority','POST','','','','',''),(167,'p','9528','/autoCode/createTemp','POST','','','','',''),(129,'p','9528','/base/login','POST','','','','',''),(158,'p','9528','/casbin/getPolicyPathByAuthorityId','POST','','','','',''),(157,'p','9528','/casbin/updateCasbin','POST','','','','',''),(165,'p','9528','/customer/customer','DELETE','','','','',''),(163,'p','9528','/customer/customer','GET','','','','',''),(164,'p','9528','/customer/customer','POST','','','','',''),(162,'p','9528','/customer/customer','PUT','','','','',''),(166,'p','9528','/customer/customerList','GET','','','','',''),(155,'p','9528','/fileUploadAndDownload/deleteFile','POST','','','','',''),(156,'p','9528','/fileUploadAndDownload/editFileName','POST','','','','',''),(154,'p','9528','/fileUploadAndDownload/getFileList','POST','','','','',''),(153,'p','9528','/fileUploadAndDownload/upload','POST','','','','',''),(159,'p','9528','/jwt/jsonInBlacklist','POST','','','','',''),(143,'p','9528','/menu/addBaseMenu','POST','','','','',''),(145,'p','9528','/menu/addMenuAuthority','POST','','','','',''),(147,'p','9528','/menu/deleteBaseMenu','POST','','','','',''),(149,'p','9528','/menu/getBaseMenuById','POST','','','','',''),(144,'p','9528','/menu/getBaseMenuTree','POST','','','','',''),(141,'p','9528','/menu/getMenu','POST','','','','',''),(146,'p','9528','/menu/getMenuAuthority','POST','','','','',''),(142,'p','9528','/menu/getMenuList','POST','','','','',''),(148,'p','9528','/menu/updateBaseMenu','POST','','','','',''),(160,'p','9528','/system/getSystemConfig','POST','','','','',''),(161,'p','9528','/system/setSystemConfig','POST','','','','',''),(130,'p','9528','/user/admin_register','POST','','','','',''),(150,'p','9528','/user/changePassword','POST','','','','',''),(168,'p','9528','/user/getUserInfo','GET','','','','',''),(151,'p','9528','/user/getUserList','POST','','','','',''),(152,'p','9528','/user/setUserAuthority','POST','','','','','');
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
  `customer_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户名',
  `customer_phone_data` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户手机号',
  `sys_user_id` bigint unsigned DEFAULT NULL COMMENT '管理ID',
  `sys_user_authority_id` bigint unsigned DEFAULT NULL COMMENT '管理角色ID',
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
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件地址',
  `tag` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件标签',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`),
  KEY `idx_exa_file_upload_and_downloads_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_file_upload_and_downloads`
--

LOCK TABLES `exa_file_upload_and_downloads` WRITE;
/*!40000 ALTER TABLE `exa_file_upload_and_downloads` DISABLE KEYS */;
INSERT INTO `exa_file_upload_and_downloads` VALUES (1,'2023-02-02 16:44:08.350','2023-02-02 16:44:08.350',NULL,'10.png','https://qmplusimg.henrongyi.top/gvalogo.png','png','158787308910.png'),(2,'2023-02-02 16:44:08.350','2023-02-02 16:44:08.350',NULL,'logo.png','https://qmplusimg.henrongyi.top/1576554439myAvatar.png','png','1587973709logo.png'),(3,'2023-02-02 16:55:10.913','2023-02-02 16:55:10.913',NULL,'IMG_20230202_111244.jpg','uploads/file/34f0b608fbd596ba499b44ace91eb1d1_20230202165510.jpg','jpg','34f0b608fbd596ba499b44ace91eb1d1_20230202165510.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_blacklists`
--

LOCK TABLES `jwt_blacklists` WRITE;
/*!40000 ALTER TABLE `jwt_blacklists` DISABLE KEYS */;
INSERT INTO `jwt_blacklists` VALUES (1,'2023-02-02 17:08:22.559','2023-02-02 17:08:22.559',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiM2Q2ZWE4MDgtMjk1NS00MzE4LThkMGUtZGNmYzYwMzg5MmYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NzU5MzM2NTksImlzcyI6InFtUGx1cyIsIm5iZiI6MTY3NTMyNzg1OX0.0iKzRAdjRQ6JbAkivrq0TikKqU8muCr1EEN0FGyYVzs'),(2,'2023-02-02 17:08:46.587','2023-02-02 17:08:46.587',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiMGY1NTY3YjAtNzgwMy00MTMzLThiNDAtYjczMDkwMTFhZDcwIiwiSUQiOjMsIlVzZXJuYW1lIjoidGVzdHVzZXIiLCJOaWNrTmFtZSI6InRlc3R1c2VyIiwiQXV0aG9yaXR5SWQiOjYsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NzU5MzM3MTcsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY3NTMyNzkxN30.sLvTqCzifvdjry6XTpikN78sx1gTPu5-W3xb9tnMAIY'),(3,'2023-02-03 09:51:17.115','2023-02-03 09:51:17.115',NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVVUlEIjoiM2Q2ZWE4MDgtMjk1NS00MzE4LThkMGUtZGNmYzYwMzg5MmYzIiwiSUQiOjEsIlVzZXJuYW1lIjoiYWRtaW4iLCJOaWNrTmFtZSI6Ik1yLuWlh-a3vCIsIkF1dGhvcml0eUlkIjo4ODgsIkJ1ZmZlclRpbWUiOjg2NDAwLCJleHAiOjE2NzU5OTM4MzQsImlzcyI6InFtUGx1cyIsIm5iZiI6MTY3NTM4ODAzNH0.hzsPeS1G56JF6euiuMk72y_litPur_RB8tNJKrc8b6o');
/*!40000 ALTER TABLE `jwt_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lora_config`
--

DROP TABLE IF EXISTS `lora_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lora_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `dev_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mqtt_ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lora_uid` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `r_f_i_d` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lora_config_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lora_config`
--

LOCK TABLES `lora_config` WRITE;
/*!40000 ALTER TABLE `lora_config` DISABLE KEYS */;
INSERT INTO `lora_config` VALUES (1,'2023-02-03 10:55:45.050','2023-02-03 10:55:45.050',NULL,'123','123','132','123','132');
/*!40000 ALTER TABLE `lora_config` ENABLE KEYS */;
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
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api路径',
  `description` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api中文描述',
  `api_group` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'api组',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'POST' COMMENT '方法',
  PRIMARY KEY (`id`),
  KEY `idx_sys_apis_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_apis`
--

LOCK TABLES `sys_apis` WRITE;
/*!40000 ALTER TABLE `sys_apis` DISABLE KEYS */;
INSERT INTO `sys_apis` VALUES (1,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/base/login','用户登录(必选)','base','POST'),(2,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/jwt/jsonInBlacklist','jwt加入黑名单(退出，必选)','jwt','POST'),(3,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/deleteUser','删除用户','系统用户','DELETE'),(4,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/admin_register','用户注册','系统用户','POST'),(5,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/getUserList','获取用户列表','系统用户','POST'),(6,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/setUserInfo','设置用户信息','系统用户','PUT'),(7,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/setSelfInfo','设置自身信息(必选)','系统用户','PUT'),(8,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/getUserInfo','获取自身信息(必选)','系统用户','GET'),(9,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/setUserAuthorities','设置权限组','系统用户','POST'),(10,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/changePassword','修改密码（建议选择)','系统用户','POST'),(11,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/setUserAuthority','修改用户角色(必选)','系统用户','POST'),(12,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/user/resetPassword','重置用户密码','系统用户','POST'),(13,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/createApi','创建api','api','POST'),(14,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/deleteApi','删除Api','api','POST'),(15,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/updateApi','更新Api','api','POST'),(16,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/getApiList','获取api列表','api','POST'),(17,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/getAllApis','获取所有api','api','POST'),(18,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/getApiById','获取api详细信息','api','POST'),(19,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/api/deleteApisByIds','批量删除api','api','DELETE'),(20,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authority/copyAuthority','拷贝角色','角色','POST'),(21,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authority/createAuthority','创建角色','角色','POST'),(22,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authority/deleteAuthority','删除角色','角色','POST'),(23,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authority/updateAuthority','更新角色信息','角色','PUT'),(24,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authority/getAuthorityList','获取角色列表','角色','POST'),(25,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authority/setDataAuthority','设置角色资源权限','角色','POST'),(26,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/casbin/updateCasbin','更改角色api权限','casbin','POST'),(27,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/casbin/getPolicyPathByAuthorityId','获取权限列表','casbin','POST'),(28,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/addBaseMenu','新增菜单','菜单','POST'),(29,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/getMenu','获取菜单树(必选)','菜单','POST'),(30,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/deleteBaseMenu','删除菜单','菜单','POST'),(31,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/updateBaseMenu','更新菜单','菜单','POST'),(32,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/getBaseMenuById','根据id获取菜单','菜单','POST'),(33,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/getMenuList','分页获取基础menu列表','菜单','POST'),(34,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/getBaseMenuTree','获取用户动态路由','菜单','POST'),(35,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/getMenuAuthority','获取指定角色menu','菜单','POST'),(36,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/menu/addMenuAuthority','增加menu和角色关联关系','菜单','POST'),(37,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/findFile','寻找目标文件（秒传）','分片上传','GET'),(38,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/breakpointContinue','断点续传','分片上传','POST'),(39,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/breakpointContinueFinish','断点续传完成','分片上传','POST'),(40,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/removeChunk','上传完成移除文件','分片上传','POST'),(41,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/upload','文件上传示例','文件上传与下载','POST'),(42,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/deleteFile','删除文件','文件上传与下载','POST'),(43,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/editFileName','文件名或者备注编辑','文件上传与下载','POST'),(44,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/fileUploadAndDownload/getFileList','获取上传文件列表','文件上传与下载','POST'),(45,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/system/getServerInfo','获取服务器信息','系统服务','POST'),(46,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/system/getSystemConfig','获取配置文件内容','系统服务','POST'),(47,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/system/setSystemConfig','设置配置文件内容','系统服务','POST'),(48,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/customer/customer','更新客户','客户','PUT'),(49,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/customer/customer','创建客户','客户','POST'),(50,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/customer/customer','删除客户','客户','DELETE'),(51,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/customer/customer','获取单一客户','客户','GET'),(52,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/customer/customerList','获取客户列表','客户','GET'),(53,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/getDB','获取所有数据库','代码生成器','GET'),(54,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/getTables','获取数据库表','代码生成器','GET'),(55,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/createTemp','自动化代码','代码生成器','POST'),(56,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/preview','预览自动化代码','代码生成器','POST'),(57,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/getColumn','获取所选table的所有字段','代码生成器','GET'),(58,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/createPlug','自动创建插件包','代码生成器','POST'),(59,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/installPlugin','安装插件','代码生成器','POST'),(60,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/createPackage','生成包(package)','包（pkg）生成器','POST'),(61,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/getPackage','获取所有包(package)','包（pkg）生成器','POST'),(62,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/delPackage','删除包(package)','包（pkg）生成器','POST'),(63,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/getMeta','获取meta信息','代码生成器历史','POST'),(64,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/rollback','回滚自动生成代码','代码生成器历史','POST'),(65,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/getSysHistory','查询回滚记录','代码生成器历史','POST'),(66,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/autoCode/delSysHistory','删除回滚记录','代码生成器历史','POST'),(67,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionaryDetail/updateSysDictionaryDetail','更新字典内容','系统字典详情','PUT'),(68,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionaryDetail/createSysDictionaryDetail','新增字典内容','系统字典详情','POST'),(69,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionaryDetail/deleteSysDictionaryDetail','删除字典内容','系统字典详情','DELETE'),(70,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionaryDetail/findSysDictionaryDetail','根据ID获取字典内容','系统字典详情','GET'),(71,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionaryDetail/getSysDictionaryDetailList','获取字典内容列表','系统字典详情','GET'),(72,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionary/createSysDictionary','新增字典','系统字典','POST'),(73,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionary/deleteSysDictionary','删除字典','系统字典','DELETE'),(74,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionary/updateSysDictionary','更新字典','系统字典','PUT'),(75,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionary/findSysDictionary','根据ID获取字典','系统字典','GET'),(76,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysDictionary/getSysDictionaryList','获取字典列表','系统字典','GET'),(77,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysOperationRecord/createSysOperationRecord','新增操作记录','操作记录','POST'),(78,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysOperationRecord/findSysOperationRecord','根据ID获取操作记录','操作记录','GET'),(79,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysOperationRecord/getSysOperationRecordList','获取操作记录列表','操作记录','GET'),(80,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysOperationRecord/deleteSysOperationRecord','删除操作记录','操作记录','DELETE'),(81,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/sysOperationRecord/deleteSysOperationRecordByIds','批量删除操作历史','操作记录','DELETE'),(82,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/simpleUploader/upload','插件版分片上传','断点续传(插件版)','POST'),(83,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/simpleUploader/checkFileMd5','文件完整度验证','断点续传(插件版)','GET'),(84,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/simpleUploader/mergeFileMd5','上传完成合并文件','断点续传(插件版)','GET'),(85,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/email/emailTest','发送测试邮件','email','POST'),(86,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/email/emailSend','发送邮件示例','email','POST'),(87,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authorityBtn/setAuthorityBtn','设置按钮权限','按钮权限','POST'),(88,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authorityBtn/getAuthorityBtn','获取已有按钮权限','按钮权限','POST'),(89,'2023-02-02 16:44:08.099','2023-02-02 16:44:08.099',NULL,'/authorityBtn/canRemoveAuthorityBtn','删除按钮','按钮权限','POST'),(90,'2023-02-02 16:51:34.343','2023-02-02 16:51:34.343',NULL,'/LORA/createLORAConfig','新增LORA','LORA','POST'),(91,'2023-02-02 16:51:34.347','2023-02-02 16:51:34.347',NULL,'/LORA/deleteLORAConfig','删除LORA','LORA','DELETE'),(92,'2023-02-02 16:51:34.348','2023-02-02 16:51:34.348',NULL,'/LORA/deleteLORAConfigByIds','批量删除LORA','LORA','DELETE'),(93,'2023-02-02 16:51:34.350','2023-02-02 16:51:34.350',NULL,'/LORA/updateLORAConfig','更新LORA','LORA','PUT'),(94,'2023-02-02 16:51:34.351','2023-02-02 16:51:34.351',NULL,'/LORA/findLORAConfig','根据ID获取LORA','LORA','GET'),(95,'2023-02-02 16:51:34.352','2023-02-02 16:51:34.352',NULL,'/LORA/getLORAConfigList','获取LORA列表','LORA','GET'),(96,'2023-02-03 10:31:28.962','2023-02-03 10:51:44.468',NULL,'/loraStruct/createLoraStruct','lora配置','loraStruct','POST'),(97,'2023-02-03 10:51:35.803','2023-02-03 10:51:35.803',NULL,'/loraStruct/deleteLoraStruct','删除','loraStruct','DELETE'),(98,'2023-02-03 10:52:47.626','2023-02-03 10:52:47.626',NULL,'/loraStruct/deleteLoraStructByIds','批量删除','loraStruct','DELETE'),(99,'2023-02-03 10:53:26.813','2023-02-03 10:53:26.813',NULL,'/loraStruct/updateLoraStruct','更新','loraStruct','PUT'),(100,'2023-02-03 10:54:14.514','2023-02-03 10:54:14.514',NULL,'/loraStruct/findLoraStruct','查询','loraStruct','GET'),(101,'2023-02-03 10:54:48.010','2023-02-03 10:54:48.010',NULL,'/loraStruct/getLoraStructList','获取','loraStruct','GET');
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
  `authority_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `authority_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '父角色ID',
  `default_router` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dashboard' COMMENT '默认菜单',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `authority_id` (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authorities`
--

LOCK TABLES `sys_authorities` WRITE;
/*!40000 ALTER TABLE `sys_authorities` DISABLE KEYS */;
INSERT INTO `sys_authorities` VALUES ('2023-02-02 16:54:35.988','2023-02-02 16:54:35.992',NULL,6,'客户',0,'dashboard'),('2023-02-02 16:44:08.116','2023-02-02 16:53:14.987',NULL,888,'普通用户',0,'dashboard'),('2023-02-02 16:44:08.116','2023-02-02 16:44:08.344',NULL,8881,'普通用户子角色',888,'dashboard'),('2023-02-02 16:44:08.116','2023-02-02 16:44:08.334',NULL,9528,'测试角色',0,'dashboard');
/*!40000 ALTER TABLE `sys_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_authority_btns`
--

DROP TABLE IF EXISTS `sys_authority_btns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_authority_btns` (
  `authority_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `sys_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
  `sys_base_menu_btn_id` bigint unsigned DEFAULT NULL COMMENT '菜单按钮ID'
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
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_base_menu_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_authority_menus`
--

LOCK TABLES `sys_authority_menus` WRITE;
/*!40000 ALTER TABLE `sys_authority_menus` DISABLE KEYS */;
INSERT INTO `sys_authority_menus` VALUES (1,6),(1,888),(1,8881),(1,9528),(2,888),(2,8881),(2,9528),(3,888),(4,888),(4,8881),(5,888),(5,8881),(6,888),(6,8881),(7,888),(7,8881),(8,888),(8,8881),(8,9528),(9,888),(9,8881),(10,888),(10,8881),(11,888),(11,8881),(12,888),(13,888),(13,8881),(14,888),(14,8881),(15,888),(15,8881),(16,888),(16,8881),(17,888),(17,8881),(18,888),(19,888),(20,888),(21,888),(22,888),(23,888),(24,888),(25,888),(26,888),(27,888),(28,888),(29,888),(30,888),(31,888);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_code_histories`
--

LOCK TABLES `sys_auto_code_histories` WRITE;
/*!40000 ALTER TABLE `sys_auto_code_histories` DISABLE KEYS */;
INSERT INTO `sys_auto_code_histories` VALUES (1,'2023-02-02 16:51:34.433','2023-02-02 16:51:34.433',NULL,'add','','LORA','{\"structName\":\"LORAConfig\",\"tableName\":\"LORA\",\"packageName\":\"lora\",\"humpPackageName\":\"lora\",\"abbreviation\":\"LORA\",\"description\":\"LORA\",\"autoCreateApiToSql\":true,\"autoCreateResource\":false,\"autoMoveFile\":true,\"businessDB\":\"\",\"fields\":[{\"fieldName\":\"Dev_name\",\"fieldDesc\":\"设备名称\",\"fieldType\":\"string\",\"fieldJson\":\"dev_name\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"dev_name\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Version\",\"fieldDesc\":\"版本\",\"fieldType\":\"string\",\"fieldJson\":\"version\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"version\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"Ip\",\"fieldDesc\":\"ip地址\",\"fieldType\":\"string\",\"fieldJson\":\"ip\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"ip\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"LoraUid\",\"fieldDesc\":\"LoraUid\",\"fieldType\":\"string\",\"fieldJson\":\"loraUid\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"lora_uid\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false},{\"fieldName\":\"RFID\",\"fieldDesc\":\"RFID\",\"fieldType\":\"string\",\"fieldJson\":\"rFID\",\"dataTypeLong\":\"\",\"comment\":\"\",\"columnName\":\"r_f_i_d\",\"fieldSearchType\":\"\",\"dictType\":\"\",\"require\":false,\"errorText\":\"\",\"clearable\":true,\"sort\":false}],\"HasTimer\":false,\"package\":\"add\"}','/home/tiger/Desktop/code/web/gin-vue-admin/server/api/v1/add/lora.go;/home/tiger/Desktop/code/web/gin-vue-admin/server/model/add/lora.go;/home/tiger/Desktop/code/web/gin-vue-admin/server/model/add/request/lora.go;/home/tiger/Desktop/code/web/gin-vue-admin/server/router/add/lora.go;/home/tiger/Desktop/code/web/gin-vue-admin/server/service/add/lora.go;/home/tiger/Desktop/code/web/gin-vue-admin/web/src/api/lora.js;/home/tiger/Desktop/code/web/gin-vue-admin/web/src/view/lora/loraForm.vue;/home/tiger/Desktop/code/web/gin-vue-admin/web/src/view/lora/lora.vue;','/home/tiger/Desktop/code/web/gin-vue-admin/server/initialize/gorm.go@MysqlTables@add.LORAConfig{},;/home/tiger/Desktop/code/web/gin-vue-admin/server/initialize/router.go@Routers@addRouter.InitLORAConfigRouter(PrivateGroup);/home/tiger/Desktop/code/web/gin-vue-admin/server/api/v1/add/enter.go@ApiGroup@LORAConfigApi;/home/tiger/Desktop/code/web/gin-vue-admin/server/router/add/enter.go@RouterGroup@LORAConfigRouter;/home/tiger/Desktop/code/web/gin-vue-admin/server/service/add/enter.go@ServiceGroup@LORAConfigService;','LORAConfig','LORA','90;91;92;93;94;95;',0);
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
  `package_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包名',
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示名',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_sys_auto_codes_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auto_codes`
--

LOCK TABLES `sys_auto_codes` WRITE;
/*!40000 ALTER TABLE `sys_auto_codes` DISABLE KEYS */;
INSERT INTO `sys_auto_codes` VALUES (1,'2023-02-02 16:49:30.281','2023-02-02 16:49:30.281',NULL,'add','lora','');
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
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮关键key',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_base_menu_id` bigint unsigned DEFAULT NULL COMMENT '菜单ID',
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
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数为params还是query',
  `key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的key',
  `value` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址栏携带参数的值',
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
  `parent_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父菜单ID',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由path',
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由name',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否在列表隐藏',
  `component` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '对应前端文件路径',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `active_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `default_menu` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  `title` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `icon` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '附加属性',
  `close_tab` tinyint(1) DEFAULT NULL COMMENT '附加属性',
  PRIMARY KEY (`id`),
  KEY `idx_sys_base_menus_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_base_menus`
--

LOCK TABLES `sys_base_menus` WRITE;
/*!40000 ALTER TABLE `sys_base_menus` DISABLE KEYS */;
INSERT INTO `sys_base_menus` VALUES (1,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','dashboard','dashboard',0,'view/dashboard/index.vue',1,'',0,0,'仪表盘','odometer',0),(2,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','about','about',0,'view/about/index.vue',9,'',0,0,'关于我们','info-filled',0),(3,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','admin','superAdmin',0,'view/superAdmin/index.vue',3,'',0,0,'超级管理员','user',0),(4,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','authority','authority',0,'view/superAdmin/authority/authority.vue',1,'',0,0,'角色管理','avatar',0),(5,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','menu','menu',0,'view/superAdmin/menu/menu.vue',2,'',1,0,'菜单管理','tickets',0),(6,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','api','api',0,'view/superAdmin/api/api.vue',3,'',1,0,'api管理','platform',0),(7,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','user','user',0,'view/superAdmin/user/user.vue',4,'',0,0,'用户管理','coordinate',0),(8,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','dictionary','dictionary',0,'view/superAdmin/dictionary/sysDictionary.vue',5,'',0,0,'字典管理','notebook',0),(9,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','dictionaryDetail/:id','dictionaryDetail',1,'view/superAdmin/dictionary/sysDictionaryDetail.vue',1,'dictionary',0,0,'字典详情-${id}','list',0),(10,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'3','operation','operation',0,'view/superAdmin/operation/sysOperationRecord.vue',6,'',0,0,'操作历史','pie-chart',0),(11,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','person','person',1,'view/person/person.vue',4,'',0,0,'个人信息','message',0),(12,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','example','example',0,'view/example/index.vue',7,'',0,0,'示例文件','management',0),(13,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'12','upload','upload',0,'view/example/upload/upload.vue',5,'',0,0,'媒体库（上传下载）','upload',0),(14,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'12','breakpoint','breakpoint',0,'view/example/breakpoint/breakpoint.vue',6,'',0,0,'断点续传','upload-filled',0),(15,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'12','customer','customer',0,'view/example/customer/customer.vue',7,'',0,0,'客户列表（资源示例）','avatar',0),(16,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','systemTools','systemTools',0,'view/systemTools/index.vue',5,'',0,0,'系统工具','tools',0),(17,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'16','autoCode','autoCode',0,'view/systemTools/autoCode/index.vue',1,'',1,0,'代码生成器','cpu',0),(18,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'16','formCreate','formCreate',0,'view/systemTools/formCreate/index.vue',2,'',1,0,'表单生成器','magic-stick',0),(19,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'16','system','system',0,'view/systemTools/system/system.vue',3,'',0,0,'系统配置','operation',0),(20,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'16','autoCodeAdmin','autoCodeAdmin',0,'view/systemTools/autoCodeAdmin/index.vue',1,'',0,0,'自动化代码管理','magic-stick',0),(21,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'16','autoCodeEdit/:id','autoCodeEdit',1,'view/systemTools/autoCode/index.vue',0,'',0,0,'自动化代码-${id}','magic-stick',0),(22,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'16','autoPkg','autoPkg',0,'view/systemTools/autoPkg/autoPkg.vue',0,'',0,0,'自动化package','folder',0),(23,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','https://www.gin-vue-admin.com','https://www.gin-vue-admin.com',0,'/',0,'',0,0,'官方网站','home-filled',0),(24,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','state','state',0,'view/system/state.vue',8,'',0,0,'服务器状态','cloudy',0),(25,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'0','plugin','plugin',0,'view/routerHolder.vue',6,'',0,0,'插件系统','cherry',0),(26,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'25','https://plugin.gin-vue-admin.com/','https://plugin.gin-vue-admin.com/',0,'https://plugin.gin-vue-admin.com/',0,'',0,0,'插件市场','shop',0),(27,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'25','installPlugin','installPlugin',0,'view/systemTools/installPlugin/index.vue',1,'',0,0,'插件安装','box',0),(28,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'25','autoPlug','autoPlug',0,'view/systemTools/autoPlug/autoPlug.vue',2,'',0,0,'插件模板','folder',0),(29,'2023-02-02 16:44:08.162','2023-02-02 16:44:08.162',NULL,0,'25','plugin-email','plugin-email',0,'plugin/email/view/index.vue',3,'',0,0,'邮件插件','message',0),(30,'2023-02-02 16:46:54.474','2023-02-02 16:46:54.474',NULL,0,'0','config','config',0,'view/routerHolder.vue',0,'',0,0,'配置','aim',0),(31,'2023-02-02 16:53:05.401','2023-02-03 10:20:12.456',NULL,0,'30','lora_config','lora_config',0,'view/lora_test/lora_test.vue',0,'',0,0,'lora配置','aim',0);
/*!40000 ALTER TABLE `sys_base_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_data_authority_id`
--

DROP TABLE IF EXISTS `sys_data_authority_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_data_authority_id` (
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `data_authority_id_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
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
  `name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（中）',
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名（英）',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `desc` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionaries_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionaries`
--

LOCK TABLES `sys_dictionaries` WRITE;
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` VALUES (1,'2023-02-02 16:44:08.130','2023-02-02 16:44:08.134',NULL,'性别','gender',1,'性别字典'),(2,'2023-02-02 16:44:08.130','2023-02-02 16:44:08.139',NULL,'数据库int类型','int',1,'int类型对应的数据库类型'),(3,'2023-02-02 16:44:08.130','2023-02-02 16:44:08.144',NULL,'数据库时间日期类型','time.Time',1,'数据库时间日期类型'),(4,'2023-02-02 16:44:08.130','2023-02-02 16:44:08.148',NULL,'数据库浮点型','float64',1,'数据库浮点型'),(5,'2023-02-02 16:44:08.130','2023-02-02 16:44:08.152',NULL,'数据库字符串','string',1,'数据库字符串'),(6,'2023-02-02 16:44:08.130','2023-02-02 16:44:08.158',NULL,'数据库bool类型','bool',1,'数据库bool类型');
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
  `label` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '展示值',
  `value` bigint DEFAULT NULL COMMENT '字典值',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `sort` bigint DEFAULT NULL COMMENT '排序标记',
  `sys_dictionary_id` bigint unsigned DEFAULT NULL COMMENT '关联标记',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dictionary_details_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dictionary_details`
--

LOCK TABLES `sys_dictionary_details` WRITE;
/*!40000 ALTER TABLE `sys_dictionary_details` DISABLE KEYS */;
INSERT INTO `sys_dictionary_details` VALUES (1,'2023-02-02 16:44:08.135','2023-02-02 16:44:08.135',NULL,'男',1,1,1,1),(2,'2023-02-02 16:44:08.135','2023-02-02 16:44:08.135',NULL,'女',2,1,2,1),(3,'2023-02-02 16:44:08.140','2023-02-02 16:44:08.140',NULL,'smallint',1,1,1,2),(4,'2023-02-02 16:44:08.140','2023-02-02 16:44:08.140',NULL,'mediumint',2,1,2,2),(5,'2023-02-02 16:44:08.140','2023-02-02 16:44:08.140',NULL,'int',3,1,3,2),(6,'2023-02-02 16:44:08.140','2023-02-02 16:44:08.140',NULL,'bigint',4,1,4,2),(7,'2023-02-02 16:44:08.145','2023-02-02 16:44:08.145',NULL,'date',0,1,0,3),(8,'2023-02-02 16:44:08.145','2023-02-02 16:44:08.145',NULL,'time',1,1,1,3),(9,'2023-02-02 16:44:08.145','2023-02-02 16:44:08.145',NULL,'year',2,1,2,3),(10,'2023-02-02 16:44:08.145','2023-02-02 16:44:08.145',NULL,'datetime',3,1,3,3),(11,'2023-02-02 16:44:08.145','2023-02-02 16:44:08.145',NULL,'timestamp',5,1,5,3),(12,'2023-02-02 16:44:08.149','2023-02-02 16:44:08.149',NULL,'float',0,1,0,4),(13,'2023-02-02 16:44:08.149','2023-02-02 16:44:08.149',NULL,'double',1,1,1,4),(14,'2023-02-02 16:44:08.149','2023-02-02 16:44:08.149',NULL,'decimal',2,1,2,4),(15,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'char',0,1,0,5),(16,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'varchar',1,1,1,5),(17,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'tinyblob',2,1,2,5),(18,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'tinytext',3,1,3,5),(19,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'text',4,1,4,5),(20,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'blob',5,1,5,5),(21,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'mediumblob',6,1,6,5),(22,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'mediumtext',7,1,7,5),(23,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'longblob',8,1,8,5),(24,'2023-02-02 16:44:08.153','2023-02-02 16:44:08.153',NULL,'longtext',9,1,9,5),(25,'2023-02-02 16:44:08.158','2023-02-02 16:44:08.158',NULL,'tinyint',0,1,0,6);
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
  `ip` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求ip',
  `method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `path` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `status` bigint DEFAULT NULL COMMENT '请求状态',
  `latency` bigint DEFAULT NULL COMMENT '延迟',
  `agent` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '代理',
  `error_message` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '错误信息',
  `body` text COLLATE utf8mb4_general_ci COMMENT '请求Body',
  `resp` text COLLATE utf8mb4_general_ci COMMENT '响应Body',
  `user_id` bigint unsigned DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sys_operation_records_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_records`
--

LOCK TABLES `sys_operation_records` WRITE;
/*!40000 ALTER TABLE `sys_operation_records` DISABLE KEYS */;
INSERT INTO `sys_operation_records` VALUES (1,'2023-02-02 16:46:54.477','2023-02-02 16:46:54.477',NULL,'127.0.0.1','POST','/menu/addBaseMenu',200,4730045,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"ID\":0,\"path\":\"config\",\"name\":\"config\",\"hidden\":false,\"parentId\":\"0\",\"component\":\"view/routerHolder.vue\",\"meta\":{\"activeName\":\"\",\"title\":\"配置\",\"icon\":\"aim\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":false},\"parameters\":[],\"menuBtn\":[]}','{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}',1),(2,'2023-02-02 16:53:05.428','2023-02-02 16:53:05.428',NULL,'127.0.0.1','POST','/menu/addBaseMenu',200,135907131,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"ID\":0,\"path\":\"lora_config\",\"name\":\"lora_config\",\"hidden\":false,\"parentId\":\"30\",\"component\":\"view/lora/lora.vue\",\"meta\":{\"activeName\":\"\",\"title\":\"lora配置\",\"icon\":\"aim\",\"defaultMenu\":false,\"closeTab\":false,\"keepAlive\":false},\"parameters\":[],\"menuBtn\":[]}','{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}',1),(3,'2023-02-02 16:53:14.999','2023-02-02 16:53:14.999',NULL,'127.0.0.1','POST','/menu/addMenuAuthority',200,18310268,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"menus\":[{\"ID\":23,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"https://www.gin-vue-admin.com\",\"name\":\"https://www.gin-vue-admin.com\",\"hidden\":false,\"component\":\"/\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"官方网站\",\"icon\":\"home-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":30,\"CreatedAt\":\"2023-02-02T16:46:54.474+08:00\",\"UpdatedAt\":\"2023-02-02T16:46:54.474+08:00\",\"parentId\":\"0\",\"path\":\"config\",\"name\":\"config\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"配置\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":31,\"CreatedAt\":\"2023-02-02T16:53:05.401+08:00\",\"UpdatedAt\":\"2023-02-02T16:53:05.401+08:00\",\"parentId\":\"30\",\"path\":\"lora_config\",\"name\":\"lora_config\",\"hidden\":false,\"component\":\"view/lora/lora.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"lora配置\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":31,\"CreatedAt\":\"2023-02-02T16:53:05.401+08:00\",\"UpdatedAt\":\"2023-02-02T16:53:05.401+08:00\",\"parentId\":\"30\",\"path\":\"lora_config\",\"name\":\"lora_config\",\"hidden\":false,\"component\":\"view/lora/lora.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"lora配置\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":1,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"dashboard\",\"name\":\"dashboard\",\"hidden\":false,\"component\":\"view/dashboard/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"仪表盘\",\"icon\":\"odometer\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":3,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"admin\",\"name\":\"superAdmin\",\"hidden\":false,\"component\":\"view/superAdmin/index.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"超级管理员\",\"icon\":\"user\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":9,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"activeName\":\"dictionary\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"list\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":9,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"dictionaryDetail/:id\",\"name\":\"dictionaryDetail\",\"hidden\":true,\"component\":\"view/superAdmin/dictionary/sysDictionaryDetail.vue\",\"sort\":1,\"meta\":{\"activeName\":\"dictionary\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典详情-${id}\",\"icon\":\"list\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":4,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"authority\",\"name\":\"authority\",\"hidden\":false,\"component\":\"view/superAdmin/authority/authority.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"角色管理\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":5,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"menu\",\"name\":\"menu\",\"hidden\":false,\"component\":\"view/superAdmin/menu/menu.vue\",\"sort\":2,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"菜单管理\",\"icon\":\"tickets\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":6,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"api\",\"name\":\"api\",\"hidden\":false,\"component\":\"view/superAdmin/api/api.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"api管理\",\"icon\":\"platform\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":7,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"user\",\"name\":\"user\",\"hidden\":false,\"component\":\"view/superAdmin/user/user.vue\",\"sort\":4,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"用户管理\",\"icon\":\"coordinate\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":8,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"dictionary\",\"name\":\"dictionary\",\"hidden\":false,\"component\":\"view/superAdmin/dictionary/sysDictionary.vue\",\"sort\":5,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"字典管理\",\"icon\":\"notebook\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":10,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"3\",\"path\":\"operation\",\"name\":\"operation\",\"hidden\":false,\"component\":\"view/superAdmin/operation/sysOperationRecord.vue\",\"sort\":6,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"操作历史\",\"icon\":\"pie-chart\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":11,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"person\",\"name\":\"person\",\"hidden\":true,\"component\":\"view/person/person.vue\",\"sort\":4,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"个人信息\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":16,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"systemTools\",\"name\":\"systemTools\",\"hidden\":false,\"component\":\"view/systemTools/index.vue\",\"sort\":5,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统工具\",\"icon\":\"tools\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":22,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":22,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoPkg\",\"name\":\"autoPkg\",\"hidden\":false,\"component\":\"view/systemTools/autoPkg/autoPkg.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化package\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":21,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoCodeEdit/:id\",\"name\":\"autoCodeEdit\",\"hidden\":true,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码-${id}\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":17,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoCode\",\"name\":\"autoCode\",\"hidden\":false,\"component\":\"view/systemTools/autoCode/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"代码生成器\",\"icon\":\"cpu\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":20,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"autoCodeAdmin\",\"name\":\"autoCodeAdmin\",\"hidden\":false,\"component\":\"view/systemTools/autoCodeAdmin/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"自动化代码管理\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":18,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"formCreate\",\"name\":\"formCreate\",\"hidden\":false,\"component\":\"view/systemTools/formCreate/index.vue\",\"sort\":2,\"meta\":{\"activeName\":\"\",\"keepAlive\":true,\"defaultMenu\":false,\"title\":\"表单生成器\",\"icon\":\"magic-stick\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":19,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"16\",\"path\":\"system\",\"name\":\"system\",\"hidden\":false,\"component\":\"view/systemTools/system/system.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"系统配置\",\"icon\":\"operation\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":25,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"plugin\",\"name\":\"plugin\",\"hidden\":false,\"component\":\"view/routerHolder.vue\",\"sort\":6,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件系统\",\"icon\":\"cherry\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":26,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":26,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"https://plugin.gin-vue-admin.com/\",\"name\":\"https://plugin.gin-vue-admin.com/\",\"hidden\":false,\"component\":\"https://plugin.gin-vue-admin.com/\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件市场\",\"icon\":\"shop\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":27,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"installPlugin\",\"name\":\"installPlugin\",\"hidden\":false,\"component\":\"view/systemTools/installPlugin/index.vue\",\"sort\":1,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件安装\",\"icon\":\"box\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":28,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"autoPlug\",\"name\":\"autoPlug\",\"hidden\":false,\"component\":\"view/systemTools/autoPlug/autoPlug.vue\",\"sort\":2,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"插件模板\",\"icon\":\"folder\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":29,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"25\",\"path\":\"plugin-email\",\"name\":\"plugin-email\",\"hidden\":false,\"component\":\"plugin/email/view/index.vue\",\"sort\":3,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"邮件插件\",\"icon\":\"message\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":12,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"example\",\"name\":\"example\",\"hidden\":false,\"component\":\"view/example/index.vue\",\"sort\":7,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"示例文件\",\"icon\":\"management\",\"closeTab\":false},\"authoritys\":null,\"children\":[{\"ID\":13,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"12\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"12\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"12\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"parameters\":[],\"menuBtn\":[]},{\"ID\":13,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"12\",\"path\":\"upload\",\"name\":\"upload\",\"hidden\":false,\"component\":\"view/example/upload/upload.vue\",\"sort\":5,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"媒体库（上传下载）\",\"icon\":\"upload\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":14,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"12\",\"path\":\"breakpoint\",\"name\":\"breakpoint\",\"hidden\":false,\"component\":\"view/example/breakpoint/breakpoint.vue\",\"sort\":6,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"断点续传\",\"icon\":\"upload-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":15,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"12\",\"path\":\"customer\",\"name\":\"customer\",\"hidden\":false,\"component\":\"view/example/customer/customer.vue\",\"sort\":7,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"客户列表（资源示例）\",\"icon\":\"avatar\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":24,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"state\",\"name\":\"state\",\"hidden\":false,\"component\":\"view/system/state.vue\",\"sort\":8,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"服务器状态\",\"icon\":\"cloudy\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]},{\"ID\":2,\"CreatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:44:08.162+08:00\",\"parentId\":\"0\",\"path\":\"about\",\"name\":\"about\",\"hidden\":false,\"component\":\"view/about/index.vue\",\"sort\":9,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"关于我们\",\"icon\":\"info-filled\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}],\"authorityId\":888}','{\"code\":0,\"data\":{},\"msg\":\"添加成功\"}',1),(4,'2023-02-02 16:53:18.828','2023-02-02 16:53:18.828',NULL,'127.0.0.1','POST','/casbin/updateCasbin',200,37586816,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/LORA/createLORAConfig\",\"method\":\"POST\"},{\"path\":\"/LORA/deleteLORAConfig\",\"method\":\"DELETE\"},{\"path\":\"/LORA/deleteLORAConfigByIds\",\"method\":\"DELETE\"},{\"path\":\"/LORA/updateLORAConfig\",\"method\":\"PUT\"},{\"path\":\"/LORA/findLORAConfig\",\"method\":\"GET\"},{\"path\":\"/LORA/getLORAConfigList\",\"method\":\"GET\"}]}','{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}',1),(5,'2023-02-02 16:54:16.099','2023-02-02 16:54:16.099',NULL,'127.0.0.1','POST','/LORA/createLORAConfig',200,10653429,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"dev_name\":\"123\",\"version\":\"2.1\",\"ip\":\"123\",\"loraUid\":\"123\",\"rFID\":\"123\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(6,'2023-02-02 16:54:36.001','2023-02-02 16:54:36.001',NULL,'127.0.0.1','POST','/authority/createAuthority',200,14176022,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"authorityId\":6,\"authorityName\":\"客户\",\"parentId\":0}','{\"code\":0,\"data\":{\"authority\":{\"CreatedAt\":\"2023-02-02T16:54:35.988+08:00\",\"UpdatedAt\":\"2023-02-02T16:54:35.988+08:00\",\"DeletedAt\":null,\"authorityId\":6,\"authorityName\":\"客户\",\"parentId\":0,\"dataAuthorityId\":null,\"children\":null,\"menus\":null,\"defaultRouter\":\"dashboard\"}},\"msg\":\"创建成功\"}',1),(7,'2023-02-02 16:55:13.166','2023-02-02 16:55:13.166',NULL,'127.0.0.1','POST','/user/admin_register',200,76570940,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"username\":\"\",\"password\":\"123456\",\"nickName\":\"testuser\",\"headerImg\":\"uploads/file/34f0b608fbd596ba499b44ace91eb1d1_20230202165510.jpg\",\"authorityId\":6,\"authorityIds\":[6],\"enable\":1,\"userName\":\"testuser\"}','{\"code\":0,\"data\":{\"user\":{\"ID\":3,\"CreatedAt\":\"2023-02-02T16:55:13.16+08:00\",\"UpdatedAt\":\"2023-02-02T16:55:13.16+08:00\",\"uuid\":\"0f5567b0-7803-4133-8b40-b7309011ad70\",\"userName\":\"testuser\",\"nickName\":\"testuser\",\"sideMode\":\"dark\",\"headerImg\":\"uploads/file/34f0b608fbd596ba499b44ace91eb1d1_20230202165510.jpg\",\"baseColor\":\"#fff\",\"activeColor\":\"#1890ff\",\"authorityId\":6,\"authority\":{\"CreatedAt\":\"0001-01-01T00:00:00Z\",\"UpdatedAt\":\"0001-01-01T00:00:00Z\",\"DeletedAt\":null,\"authorityId\":0,\"authorityName\":\"\",\"parentId\":null,\"dataAuthorityId\":null,\"children\":null,\"menus\":null,\"defaultRouter\":\"\"},\"authorities\":[{\"CreatedAt\":\"2023-02-02T16:55:13.162+08:00\",\"UpdatedAt\":\"2023-02-02T16:55:13.162+08:00\",\"DeletedAt\":null,\"authorityId\":6,\"authorityName\":\"\",\"parentId\":null,\"dataAuthorityId\":null,\"children\":null,\"menus\":null,\"defaultRouter\":\"dashboard\"}],\"phone\":\"\",\"email\":\"\",\"enable\":1}},\"msg\":\"注册成功\"}',1),(8,'2023-02-03 09:51:01.270','2023-02-03 09:51:01.270',NULL,'127.0.0.1','POST','/casbin/updateCasbin',200,12370585,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/LORA/createLORAConfig\",\"method\":\"POST\"},{\"path\":\"/LORA/deleteLORAConfig\",\"method\":\"DELETE\"},{\"path\":\"/LORA/deleteLORAConfigByIds\",\"method\":\"DELETE\"},{\"path\":\"/LORA/updateLORAConfig\",\"method\":\"PUT\"},{\"path\":\"/LORA/findLORAConfig\",\"method\":\"GET\"},{\"path\":\"/LORA/getLORAConfigList\",\"method\":\"GET\"}]}','{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}',1),(9,'2023-02-03 10:20:12.470','2023-02-03 10:20:12.470',NULL,'127.0.0.1','POST','/menu/updateBaseMenu',200,57567484,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"ID\":31,\"CreatedAt\":\"2023-02-02T16:53:05.401+08:00\",\"UpdatedAt\":\"2023-02-02T16:53:05.401+08:00\",\"parentId\":\"30\",\"path\":\"lora_config\",\"name\":\"lora_config\",\"hidden\":false,\"component\":\"view/lora_test/lora_test.vue\",\"sort\":0,\"meta\":{\"activeName\":\"\",\"keepAlive\":false,\"defaultMenu\":false,\"title\":\"lora配置\",\"icon\":\"aim\",\"closeTab\":false},\"authoritys\":null,\"children\":null,\"parameters\":[],\"menuBtn\":[]}','{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}',1),(10,'2023-02-03 10:31:28.974','2023-02-03 10:31:28.974',NULL,'127.0.0.1','POST','/api/createApi',200,21121025,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"path\":\"test/lora_test_.go\",\"apiGroup\":\"test\",\"method\":\"POST\",\"description\":\"lora配置\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(11,'2023-02-03 10:42:58.814','2023-02-03 10:42:58.814',NULL,'127.0.0.1','POST','/api/getApiById',200,681312,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"id\":90}','{\"code\":0,\"data\":{\"api\":{\"ID\":90,\"CreatedAt\":\"2023-02-02T16:51:34.343+08:00\",\"UpdatedAt\":\"2023-02-02T16:51:34.343+08:00\",\"path\":\"/LORA/createLORAConfig\",\"description\":\"新增LORA\",\"apiGroup\":\"LORA\",\"method\":\"POST\"}},\"msg\":\"获取成功\"}',1),(12,'2023-02-03 10:49:27.182','2023-02-03 10:49:27.182',NULL,'127.0.0.1','POST','/api/getApiById',200,7701819,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"id\":96}','{\"code\":0,\"data\":{\"api\":{\"ID\":96,\"CreatedAt\":\"2023-02-03T10:31:28.962+08:00\",\"UpdatedAt\":\"2023-02-03T10:31:28.962+08:00\",\"path\":\"test/lora_test_.go\",\"description\":\"lora配置\",\"apiGroup\":\"test\",\"method\":\"POST\"}},\"msg\":\"获取成功\"}',1),(13,'2023-02-03 10:50:07.286','2023-02-03 10:50:07.286',NULL,'127.0.0.1','POST','/api/updateApi',200,10947737,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"ID\":96,\"CreatedAt\":\"2023-02-03T10:31:28.962+08:00\",\"UpdatedAt\":\"2023-02-03T10:31:28.962+08:00\",\"path\":\"loraStruct/createLoraStruct\",\"description\":\"lora配置\",\"apiGroup\":\"loraStruct\",\"method\":\"POST\"}','{\"code\":0,\"data\":{},\"msg\":\"修改成功\"}',1),(14,'2023-02-03 10:51:35.811','2023-02-03 10:51:35.811',NULL,'127.0.0.1','POST','/api/createApi',200,9122934,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"path\":\"/loraStruct/deleteLoraStruct\",\"apiGroup\":\"loraStruct\",\"method\":\"DELETE\",\"description\":\"删除\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(15,'2023-02-03 10:51:37.157','2023-02-03 10:51:37.157',NULL,'127.0.0.1','POST','/api/getApiById',200,591089,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"id\":96}','{\"code\":0,\"data\":{\"api\":{\"ID\":96,\"CreatedAt\":\"2023-02-03T10:31:28.962+08:00\",\"UpdatedAt\":\"2023-02-03T10:50:07.283+08:00\",\"path\":\"loraStruct/createLoraStruct\",\"description\":\"lora配置\",\"apiGroup\":\"loraStruct\",\"method\":\"POST\"}},\"msg\":\"获取成功\"}',1),(16,'2023-02-03 10:51:44.471','2023-02-03 10:51:44.471',NULL,'127.0.0.1','POST','/api/updateApi',200,4717781,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"ID\":96,\"CreatedAt\":\"2023-02-03T10:31:28.962+08:00\",\"UpdatedAt\":\"2023-02-03T10:50:07.283+08:00\",\"path\":\"/loraStruct/createLoraStruct\",\"description\":\"lora配置\",\"apiGroup\":\"loraStruct\",\"method\":\"POST\"}','{\"code\":0,\"data\":{},\"msg\":\"修改成功\"}',1),(17,'2023-02-03 10:52:47.629','2023-02-03 10:52:47.629',NULL,'127.0.0.1','POST','/api/createApi',200,3714750,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"path\":\"/loraStruct/deleteLoraStructByIds\",\"apiGroup\":\"loraStruct\",\"method\":\"DELETE\",\"description\":\"批量删除\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(18,'2023-02-03 10:53:26.816','2023-02-03 10:53:26.816',NULL,'127.0.0.1','POST','/api/createApi',200,4957551,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"path\":\"/loraStruct/updateLoraStruct\",\"apiGroup\":\"loraStruct\",\"method\":\"PUT\",\"description\":\"更新\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(19,'2023-02-03 10:54:14.517','2023-02-03 10:54:14.517',NULL,'127.0.0.1','POST','/api/createApi',200,3579963,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"path\":\"/loraStruct/findLoraStruct\",\"apiGroup\":\"loraStruct\",\"method\":\"GET\",\"description\":\"查询\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(20,'2023-02-03 10:54:48.012','2023-02-03 10:54:48.012',NULL,'127.0.0.1','POST','/api/createApi',200,3085897,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"path\":\"/loraStruct/getLoraStructList\",\"apiGroup\":\"loraStruct\",\"method\":\"GET\",\"description\":\"获取\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1),(21,'2023-02-03 10:55:23.387','2023-02-03 10:55:23.387',NULL,'127.0.0.1','POST','/casbin/updateCasbin',200,16867168,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"authorityId\":888,\"casbinInfos\":[{\"path\":\"/base/login\",\"method\":\"POST\"},{\"path\":\"/jwt/jsonInBlacklist\",\"method\":\"POST\"},{\"path\":\"/user/deleteUser\",\"method\":\"DELETE\"},{\"path\":\"/user/admin_register\",\"method\":\"POST\"},{\"path\":\"/user/getUserList\",\"method\":\"POST\"},{\"path\":\"/user/setUserInfo\",\"method\":\"PUT\"},{\"path\":\"/user/setSelfInfo\",\"method\":\"PUT\"},{\"path\":\"/user/getUserInfo\",\"method\":\"GET\"},{\"path\":\"/user/setUserAuthorities\",\"method\":\"POST\"},{\"path\":\"/user/changePassword\",\"method\":\"POST\"},{\"path\":\"/user/setUserAuthority\",\"method\":\"POST\"},{\"path\":\"/user/resetPassword\",\"method\":\"POST\"},{\"path\":\"/api/createApi\",\"method\":\"POST\"},{\"path\":\"/api/deleteApi\",\"method\":\"POST\"},{\"path\":\"/api/updateApi\",\"method\":\"POST\"},{\"path\":\"/api/getApiList\",\"method\":\"POST\"},{\"path\":\"/api/getAllApis\",\"method\":\"POST\"},{\"path\":\"/api/getApiById\",\"method\":\"POST\"},{\"path\":\"/api/deleteApisByIds\",\"method\":\"DELETE\"},{\"path\":\"/authority/copyAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/createAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/deleteAuthority\",\"method\":\"POST\"},{\"path\":\"/authority/updateAuthority\",\"method\":\"PUT\"},{\"path\":\"/authority/getAuthorityList\",\"method\":\"POST\"},{\"path\":\"/authority/setDataAuthority\",\"method\":\"POST\"},{\"path\":\"/casbin/updateCasbin\",\"method\":\"POST\"},{\"path\":\"/casbin/getPolicyPathByAuthorityId\",\"method\":\"POST\"},{\"path\":\"/menu/addBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getMenu\",\"method\":\"POST\"},{\"path\":\"/menu/deleteBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/updateBaseMenu\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuById\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuList\",\"method\":\"POST\"},{\"path\":\"/menu/getBaseMenuTree\",\"method\":\"POST\"},{\"path\":\"/menu/getMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/menu/addMenuAuthority\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/findFile\",\"method\":\"GET\"},{\"path\":\"/fileUploadAndDownload/breakpointContinue\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/breakpointContinueFinish\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/removeChunk\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/upload\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/deleteFile\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/editFileName\",\"method\":\"POST\"},{\"path\":\"/fileUploadAndDownload/getFileList\",\"method\":\"POST\"},{\"path\":\"/system/getServerInfo\",\"method\":\"POST\"},{\"path\":\"/system/getSystemConfig\",\"method\":\"POST\"},{\"path\":\"/system/setSystemConfig\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"PUT\"},{\"path\":\"/customer/customer\",\"method\":\"POST\"},{\"path\":\"/customer/customer\",\"method\":\"DELETE\"},{\"path\":\"/customer/customer\",\"method\":\"GET\"},{\"path\":\"/customer/customerList\",\"method\":\"GET\"},{\"path\":\"/autoCode/getDB\",\"method\":\"GET\"},{\"path\":\"/autoCode/getTables\",\"method\":\"GET\"},{\"path\":\"/autoCode/createTemp\",\"method\":\"POST\"},{\"path\":\"/autoCode/preview\",\"method\":\"POST\"},{\"path\":\"/autoCode/getColumn\",\"method\":\"GET\"},{\"path\":\"/autoCode/createPlug\",\"method\":\"POST\"},{\"path\":\"/autoCode/installPlugin\",\"method\":\"POST\"},{\"path\":\"/autoCode/createPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/delPackage\",\"method\":\"POST\"},{\"path\":\"/autoCode/getMeta\",\"method\":\"POST\"},{\"path\":\"/autoCode/rollback\",\"method\":\"POST\"},{\"path\":\"/autoCode/getSysHistory\",\"method\":\"POST\"},{\"path\":\"/autoCode/delSysHistory\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/updateSysDictionaryDetail\",\"method\":\"PUT\"},{\"path\":\"/sysDictionaryDetail/createSysDictionaryDetail\",\"method\":\"POST\"},{\"path\":\"/sysDictionaryDetail/deleteSysDictionaryDetail\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionaryDetail/findSysDictionaryDetail\",\"method\":\"GET\"},{\"path\":\"/sysDictionaryDetail/getSysDictionaryDetailList\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/createSysDictionary\",\"method\":\"POST\"},{\"path\":\"/sysDictionary/deleteSysDictionary\",\"method\":\"DELETE\"},{\"path\":\"/sysDictionary/updateSysDictionary\",\"method\":\"PUT\"},{\"path\":\"/sysDictionary/findSysDictionary\",\"method\":\"GET\"},{\"path\":\"/sysDictionary/getSysDictionaryList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/createSysOperationRecord\",\"method\":\"POST\"},{\"path\":\"/sysOperationRecord/findSysOperationRecord\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/getSysOperationRecordList\",\"method\":\"GET\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecord\",\"method\":\"DELETE\"},{\"path\":\"/sysOperationRecord/deleteSysOperationRecordByIds\",\"method\":\"DELETE\"},{\"path\":\"/simpleUploader/upload\",\"method\":\"POST\"},{\"path\":\"/simpleUploader/checkFileMd5\",\"method\":\"GET\"},{\"path\":\"/simpleUploader/mergeFileMd5\",\"method\":\"GET\"},{\"path\":\"/email/emailTest\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/setAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/getAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/authorityBtn/canRemoveAuthorityBtn\",\"method\":\"POST\"},{\"path\":\"/LORA/createLORAConfig\",\"method\":\"POST\"},{\"path\":\"/LORA/deleteLORAConfig\",\"method\":\"DELETE\"},{\"path\":\"/LORA/deleteLORAConfigByIds\",\"method\":\"DELETE\"},{\"path\":\"/LORA/updateLORAConfig\",\"method\":\"PUT\"},{\"path\":\"/LORA/findLORAConfig\",\"method\":\"GET\"},{\"path\":\"/LORA/getLORAConfigList\",\"method\":\"GET\"},{\"path\":\"/loraStruct/createLoraStruct\",\"method\":\"POST\"},{\"path\":\"/loraStruct/deleteLoraStruct\",\"method\":\"DELETE\"},{\"path\":\"/loraStruct/deleteLoraStructByIds\",\"method\":\"DELETE\"},{\"path\":\"/loraStruct/updateLoraStruct\",\"method\":\"PUT\"},{\"path\":\"/loraStruct/findLoraStruct\",\"method\":\"GET\"},{\"path\":\"/loraStruct/getLoraStructList\",\"method\":\"GET\"}]}','{\"code\":0,\"data\":{},\"msg\":\"更新成功\"}',1),(22,'2023-02-03 10:55:45.059','2023-02-03 10:55:45.059',NULL,'127.0.0.1','POST','/loraStruct/createLoraStruct',200,8834196,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.46','','{\"dev_name\":\"123\",\"mqtt_ip\":\"123\",\"version\":\"132\",\"loraUid\":\"123\",\"rFID\":\"132\"}','{\"code\":0,\"data\":{},\"msg\":\"创建成功\"}',1);
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
  `sys_authority_authority_id` bigint unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`sys_user_id`,`sys_authority_authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_authority`
--

LOCK TABLES `sys_user_authority` WRITE;
/*!40000 ALTER TABLE `sys_user_authority` DISABLE KEYS */;
INSERT INTO `sys_user_authority` VALUES (1,888),(1,8881),(1,9528),(2,888),(3,6);
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
  `uuid` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户UUID',
  `username` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录密码',
  `nick_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '系统用户' COMMENT '用户昵称',
  `side_mode` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'dark' COMMENT '用户侧边主题',
  `header_img` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'https://qmplusimg.henrongyi.top/gva_header.jpg' COMMENT '用户头像',
  `base_color` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '#fff' COMMENT '基础颜色',
  `active_color` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '#1890ff' COMMENT '活跃颜色',
  `authority_id` bigint unsigned DEFAULT '888' COMMENT '用户角色ID',
  `phone` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `enable` bigint DEFAULT '1' COMMENT '用户是否被冻结 1正常 2冻结',
  PRIMARY KEY (`id`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`),
  KEY `idx_sys_users_uuid` (`uuid`),
  KEY `idx_sys_users_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_users`
--

LOCK TABLES `sys_users` WRITE;
/*!40000 ALTER TABLE `sys_users` DISABLE KEYS */;
INSERT INTO `sys_users` VALUES (1,'2023-02-02 16:44:08.306','2023-02-02 16:44:08.309',NULL,'3d6ea808-2955-4318-8d0e-dcfc603892f3','admin','$2a$10$PGAxVc4wp9sHQ5LaAZrWcueLWE2oBfzbWQdbeQZIdUpeko2KnL50a','Mr.奇淼','dark','https://qmplusimg.henrongyi.top/gva_header.jpg','#fff','#1890ff',888,'17611111111','333333333@qq.com',1),(2,'2023-02-02 16:44:08.306','2023-02-02 16:44:08.313',NULL,'16d0c900-4d83-4175-8488-4f555b1244cb','a303176530','$2a$10$JnU8aGjrNlz9SEIgJp8TQ.pTNLsjnW5bLyg7YxySbkc7yDE4HgIJm','用户1','dark','https:///qmplusimg.henrongyi.top/1572075907logo.png','#fff','#1890ff',9528,'17611111111','333333333@qq.com',1),(3,'2023-02-02 16:55:13.160','2023-02-02 16:55:13.160',NULL,'0f5567b0-7803-4133-8b40-b7309011ad70','testuser','$2a$10$dRL9Wpdxjm4ntc/UBs615.XdJiGpSYJ0N2zzeXGxajbnf0Z8zlOoS','testuser','dark','uploads/file/34f0b608fbd596ba499b44ace91eb1d1_20230202165510.jpg','#fff','#1890ff',6,'','',1);
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

-- Dump completed on 2023-02-15  9:33:18
