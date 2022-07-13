-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ims
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customers',7,'add_customers'),(26,'Can change customers',7,'change_customers'),(27,'Can delete customers',7,'delete_customers'),(28,'Can view customers',7,'view_customers'),(29,'Can add suppliers',8,'add_suppliers'),(30,'Can change suppliers',8,'change_suppliers'),(31,'Can delete suppliers',8,'delete_suppliers'),(32,'Can view suppliers',8,'view_suppliers'),(33,'Can add invoices',9,'add_invoices'),(34,'Can change invoices',9,'change_invoices'),(35,'Can delete invoices',9,'delete_invoices'),(36,'Can view invoices',9,'view_invoices'),(37,'Can add invoice_details',10,'add_invoice_details'),(38,'Can change invoice_details',10,'change_invoice_details'),(39,'Can delete invoice_details',10,'delete_invoice_details'),(40,'Can view invoice_details',10,'view_invoice_details'),(41,'Can add products',11,'add_products'),(42,'Can change products',11,'change_products'),(43,'Can delete products',11,'delete_products'),(44,'Can view products',11,'view_products'),(45,'Can add purchases',12,'add_purchases'),(46,'Can change purchases',12,'change_purchases'),(47,'Can delete purchases',12,'delete_purchases'),(48,'Can view purchases',12,'view_purchases');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'IMS','customers'),(9,'IMS','invoices'),(10,'IMS','invoice_details'),(11,'IMS','products'),(12,'IMS','purchases'),(8,'IMS','suppliers'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'IMS','0001_initial','2022-06-23 17:50:53.764037'),(2,'contenttypes','0001_initial','2022-06-23 17:50:54.311635'),(3,'auth','0001_initial','2022-06-23 17:51:04.826922'),(4,'admin','0001_initial','2022-06-23 17:51:06.683628'),(5,'admin','0002_logentry_remove_auto_add','2022-06-23 17:51:06.764749'),(6,'admin','0003_logentry_add_action_flag_choices','2022-06-23 17:51:06.844325'),(7,'contenttypes','0002_remove_content_type_name','2022-06-23 17:51:07.303678'),(8,'auth','0002_alter_permission_name_max_length','2022-06-23 17:51:08.505500'),(9,'auth','0003_alter_user_email_max_length','2022-06-23 17:51:08.662957'),(10,'auth','0004_alter_user_username_opts','2022-06-23 17:51:08.689625'),(11,'auth','0005_alter_user_last_login_null','2022-06-23 17:51:09.002900'),(12,'auth','0006_require_contenttypes_0002','2022-06-23 17:51:09.019978'),(13,'auth','0007_alter_validators_add_error_messages','2022-06-23 17:51:09.045515'),(14,'auth','0008_alter_user_username_max_length','2022-06-23 17:51:09.436085'),(15,'auth','0009_alter_user_last_name_max_length','2022-06-23 17:51:10.240388'),(16,'auth','0010_alter_group_name_max_length','2022-06-23 17:51:10.454706'),(17,'auth','0011_update_proxy_permissions','2022-06-23 17:51:10.479204'),(18,'auth','0012_alter_user_first_name_max_length','2022-06-23 17:51:10.546744'),(19,'sessions','0001_initial','2022-06-23 17:51:10.806460'),(20,'IMS','0002_products_purchases_invoice_details','2022-06-23 17:52:17.096512');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_customers`
--

DROP TABLE IF EXISTS `ims_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `customer_number` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_customers`
--

LOCK TABLES `ims_customers` WRITE;
/*!40000 ALTER TABLE `ims_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_invoice_details`
--

DROP TABLE IF EXISTS `ims_invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_invoice_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordered_quantity` int(11) NOT NULL,
  `line_total` double NOT NULL,
  `invoice_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IMS_invoice_details_invoice_id_id_21f5e5c9_fk_IMS_invoices_id` (`invoice_id_id`),
  KEY `IMS_invoice_details_product_id_id_73fb92bd_fk_IMS_products_id` (`product_id_id`),
  CONSTRAINT `IMS_invoice_details_invoice_id_id_21f5e5c9_fk_IMS_invoices_id` FOREIGN KEY (`invoice_id_id`) REFERENCES `ims_invoices` (`id`),
  CONSTRAINT `IMS_invoice_details_product_id_id_73fb92bd_fk_IMS_products_id` FOREIGN KEY (`product_id_id`) REFERENCES `ims_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_invoice_details`
--

LOCK TABLES `ims_invoice_details` WRITE;
/*!40000 ALTER TABLE `ims_invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_invoices`
--

DROP TABLE IF EXISTS `ims_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `total` double NOT NULL,
  `customer_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IMS_invoices_customer_id_id_424ed849_fk_IMS_customers_id` (`customer_id_id`),
  CONSTRAINT `IMS_invoices_customer_id_id_424ed849_fk_IMS_customers_id` FOREIGN KEY (`customer_id_id`) REFERENCES `ims_customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_invoices`
--

LOCK TABLES `ims_invoices` WRITE;
/*!40000 ALTER TABLE `ims_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_products`
--

DROP TABLE IF EXISTS `ims_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `unit_price` double NOT NULL,
  `supplier_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IMS_products_supplier_id_id_944ad7d8_fk_IMS_suppliers_id` (`supplier_id_id`),
  CONSTRAINT `IMS_products_supplier_id_id_944ad7d8_fk_IMS_suppliers_id` FOREIGN KEY (`supplier_id_id`) REFERENCES `ims_suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_products`
--

LOCK TABLES `ims_products` WRITE;
/*!40000 ALTER TABLE `ims_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_purchases`
--

DROP TABLE IF EXISTS `ims_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_purchases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_price` double NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IMS_purchases_product_id_id_3a2282a6_fk_IMS_products_id` (`product_id_id`),
  CONSTRAINT `IMS_purchases_product_id_id_3a2282a6_fk_IMS_products_id` FOREIGN KEY (`product_id_id`) REFERENCES `ims_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_purchases`
--

LOCK TABLES `ims_purchases` WRITE;
/*!40000 ALTER TABLE `ims_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_suppliers`
--

DROP TABLE IF EXISTS `ims_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_number` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_suppliers`
--

LOCK TABLES `ims_suppliers` WRITE;
/*!40000 ALTER TABLE `ims_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 16:53:21
