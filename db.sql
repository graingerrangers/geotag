-- MySQL dump 10.13  Distrib 5.6.27, for osx10.10 (x86_64)
--
-- Host: aac6g0qms3rhoc.cn42r3n8fae4.us-west-2.rds.amazonaws.com    Database: ebdb
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add users',7,'add_users'),(20,'Can change users',7,'change_users'),(21,'Can delete users',7,'delete_users'),(22,'Can add reviews',8,'add_reviews'),(23,'Can change reviews',8,'change_reviews'),(24,'Can delete reviews',8,'delete_reviews'),(25,'Can add locations',9,'add_locations'),(26,'Can change locations',9,'change_locations'),(27,'Can delete locations',9,'delete_locations'),(28,'Can add events',10,'add_events'),(29,'Can change events',10,'change_events'),(30,'Can delete events',10,'delete_events'),(31,'Can add is_ attending',11,'add_is_attending'),(32,'Can change is_ attending',11,'change_is_attending'),(33,'Can delete is_ attending',11,'delete_is_attending'),(34,'Can add classifieds',12,'add_classifieds'),(35,'Can change classifieds',12,'change_classifieds'),(36,'Can delete classifieds',12,'delete_classifieds'),(37,'Can add is_ friend',13,'add_is_friend'),(38,'Can change is_ friend',13,'change_is_friend'),(39,'Can delete is_ friend',13,'delete_is_friend');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'geotag','classifieds'),(10,'geotag','events'),(11,'geotag','is_attending'),(13,'geotag','is_friend'),(9,'geotag','locations'),(8,'geotag','reviews'),(7,'geotag','users'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-03-13 06:38:01.037069'),(2,'auth','0001_initial','2017-03-13 06:38:02.917795'),(3,'admin','0001_initial','2017-03-13 06:38:03.271149'),(4,'admin','0002_logentry_remove_auto_add','2017-03-13 06:38:03.337396'),(5,'contenttypes','0002_remove_content_type_name','2017-03-13 06:38:03.851455'),(6,'auth','0002_alter_permission_name_max_length','2017-03-13 06:38:03.991463'),(7,'auth','0003_alter_user_email_max_length','2017-03-13 06:38:04.137011'),(8,'auth','0004_alter_user_username_opts','2017-03-13 06:38:04.163983'),(9,'auth','0005_alter_user_last_login_null','2017-03-13 06:38:04.402211'),(10,'auth','0006_require_contenttypes_0002','2017-03-13 06:38:04.415535'),(11,'auth','0007_alter_validators_add_error_messages','2017-03-13 06:38:04.439500'),(12,'geotag','0001_initial','2017-03-13 06:38:05.017653'),(13,'geotag','0002_auto_20170313_0440','2017-03-13 06:38:06.072643'),(14,'sessions','0001_initial','2017-03-13 06:38:06.257277');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7kep6n9gzoivehiy2xvbv5fepqnc0zfw','NGU2ZjVlYTZjNWVlYmFiZTg5MDY4YTMwNzY0MGRkYjU4ZGI3MmRlNTp7ImlkIjoiNDE5Mzc4NTE1MTA2OTE1In0=','2017-05-10 17:34:19.959039'),('d19jjmnl7qwjeempmgo5utvcr7aj5tin','YTQ3NTcyMmMyZTgzMjBjMTdiY2E2YWNhMWY1OTQxZmNlMDViZGRhYjp7ImlkIjoiMTAyMTEyOTM2OTMwNDk2ODQifQ==','2017-05-10 07:13:45.953579'),('fw5d7vurj2xdp770vhknppl3r9aqibu8','YTQ3NTcyMmMyZTgzMjBjMTdiY2E2YWNhMWY1OTQxZmNlMDViZGRhYjp7ImlkIjoiMTAyMTEyOTM2OTMwNDk2ODQifQ==','2017-05-10 18:04:04.945080'),('nboi735ry3bltf689q8eeckqqdscsqpf','MzU1ZjQ0MGI3ZTNiMTY0M2MxN2VhOWRlMmYwNGJkNDM5ZjRhMTg0YTp7ImlkIjoiMTAyMTAwNDg3NzY2MjkzMjUifQ==','2017-05-11 01:25:13.097499');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_classifieds`
--

DROP TABLE IF EXISTS `geotag_classifieds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_classifieds` (
  `classified_id` int(11) NOT NULL,
  `description` varchar(140) NOT NULL,
  `name` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` double NOT NULL,
  `user_id_id` varchar(30) NOT NULL,
  PRIMARY KEY (`classified_id`),
  KEY `geotag_classifieds_user_id_id_efbbd94d_fk_geotag_users_fb_id` (`user_id_id`),
  CONSTRAINT `geotag_classifieds_user_id_id_efbbd94d_fk_geotag_users_fb_id` FOREIGN KEY (`user_id_id`) REFERENCES `geotag_users` (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_classifieds`
--

LOCK TABLES `geotag_classifieds` WRITE;
/*!40000 ALTER TABLE `geotag_classifieds` DISABLE KEYS */;
INSERT INTO `geotag_classifieds` VALUES (1,'Companionship ;) <3 <3','Ryan Gates','Personals',95,'astha2'),(2,'UsedBicycle','Astha','Sales',55,'asharm52'),(3,'Tutoring','Aayush','Services',20,'ramg'),(9,'Sample','Sample','Sales',9,'59');
/*!40000 ALTER TABLE `geotag_classifieds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_events`
--

DROP TABLE IF EXISTS `geotag_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_events` (
  `event_id` int(11) NOT NULL,
  `description` varchar(140) NOT NULL,
  `name` varchar(30) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `max_group_size` int(11) NOT NULL,
  `fee` double NOT NULL,
  `public` tinyint(1) NOT NULL,
  `host_id_id` varchar(30) NOT NULL,
  `location_id_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `geotag_events_host_id_id_3e2e83db_fk_geotag_users_fb_id` (`host_id_id`),
  KEY `geotag_events_05cf32c5` (`location_id_id`),
  CONSTRAINT `geotag_e_location_id_id_6f31d62a_fk_geotag_locations_location_id` FOREIGN KEY (`location_id_id`) REFERENCES `geotag_locations` (`location_id`),
  CONSTRAINT `geotag_events_host_id_id_3e2e83db_fk_geotag_users_fb_id` FOREIGN KEY (`host_id_id`) REFERENCES `geotag_users` (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_events`
--

LOCK TABLES `geotag_events` WRITE;
/*!40000 ALTER TABLE `geotag_events` DISABLE KEYS */;
INSERT INTO `geotag_events` VALUES (4,'lolololol','Event','2016-09-17','2016-09-17',20,0,0,'astha2',45),(7,'CS 411 House Party','Ram','2016-12-17','2016-12-17',5,5,0,'rgates',205),(10,'thursday night brothers','tnb','0000-00-00','0000-00-00',500,0,1,'astha2',34),(64,'Study for CS 411','Ryan','2017-04-26','2017-04-26',6,0,1,'ramg',251),(65,'Study for CS 357','Aayush','2017-04-22','2017-04-22',4,0,0,'asharm52',251),(67,'Sample event','Astha','2016-09-17','2016-09-17',28,9,0,'asharm52',1),(88,'Dancing on tables at Lion','Lion with Ryan','2017-04-17','2017-04-17',30,0,0,'asharm52',177),(99,'Rager on Quad','Rahul','2017-04-29','2017-04-30',40,3,0,'astha2',187),(100,'Dungeons and Dragons','Ram','2017-04-25','2017-04-29',8,0,1,'supahot3',20),(101,'Free Speech Rally','Kyle Chapman','2017-05-01','2017-05-01',60,0,1,'srirasao2',115),(102,'Making America Great Again','Donald','2017-01-20','2025-01-20',300,17.76,1,'ramg',135),(107,'Present 411','Aayush','2017-04-26','2017-04-26',4,0,0,'59',21),(108,'Studying Linking','Ryan','2017-04-24','2017-04-24',4,0,0,'14',6),(109,'Test Event','Aayush','2017-04-26','2017-04-26',6,4,1,'419378515106915',8),(60000,'jaskldj','jaskdjask','2017-04-26','2017-04-27',55,0,1,'59',7);
/*!40000 ALTER TABLE `geotag_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_is_attending`
--

DROP TABLE IF EXISTS `geotag_is_attending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_is_attending` (
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `event_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_is_attending`
--

LOCK TABLES `geotag_is_attending` WRITE;
/*!40000 ALTER TABLE `geotag_is_attending` DISABLE KEYS */;
INSERT INTO `geotag_is_attending` VALUES ('10210048776629325',7),('10210048776629325',10),('10210048776629325',88),('10210048776629325',100),('10210048776629325',101),('10210048776629325',102),('10211293693049684',4),('10211293693049684',65),('10211293693049684',99),('10211293693049684',100),('10211293693049684',102),('419378515106915',4),('419378515106915',65),('419378515106915',67),('419378515106915',88),('419378515106915',99),('419378515106915',101),('astha2',4),('astha2',67),('ramg',67),('rgates',7),('rgates',67);
/*!40000 ALTER TABLE `geotag_is_attending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_is_friend`
--

DROP TABLE IF EXISTS `geotag_is_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_is_friend` (
  `user1_id` varchar(30) NOT NULL DEFAULT '',
  `user2_id` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`user1_id`,`user2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_is_friend`
--

LOCK TABLES `geotag_is_friend` WRITE;
/*!40000 ALTER TABLE `geotag_is_friend` DISABLE KEYS */;
INSERT INTO `geotag_is_friend` VALUES ('10210048776629325','10210048776629325'),('10210048776629325','419378515106915'),('10210048776629325','ramg'),('10210048776629325','rgates'),('10211293693049684','419378515106915'),('10211293693049684','ramg'),('10211293693049684','rgates'),('419378515106915','10210048776629325'),('asharm52','rgates3'),('astha2','ramg'),('astha2','rgates'),('ramg','astha2'),('rgupta2','rgates3');
/*!40000 ALTER TABLE `geotag_is_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_locations`
--

DROP TABLE IF EXISTS `geotag_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_locations` (
  `location_id` int(11) NOT NULL,
  `popularity` double NOT NULL,
  `coord_x` double NOT NULL,
  `coord_y` double NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `assigned_tag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_locations`
--

LOCK TABLES `geotag_locations` WRITE;
/*!40000 ALTER TABLE `geotag_locations` DISABLE KEYS */;
INSERT INTO `geotag_locations` VALUES (1,2,40.1096200389,-88.228030119,'Union','Union'),(2,2,40.110398791,-88.227301899,'Union','Union'),(3,3,40.110203764,-88.2278856078,'Union','Union'),(4,7,40.1085626913,-88.226864082,'Union','Union'),(5,8,40.1099854041,-88.2284875344,'Union','Union'),(6,3,40.1088881001,-88.2265714877,'Union','Union'),(7,9,40.1094131428,-88.2274130394,'Union','Union'),(8,7,40.108931776,-88.2280187984,'Union','Union'),(9,8,40.1086286856,-88.226822067,'Union','Union'),(10,6,40.1091035223,-88.2284077959,'Union','Union'),(11,5,40.1103143395,-88.2268446421,'Union','Union'),(12,2,40.1097148932,-88.2280413778,'Union','Union'),(13,6,40.1100719169,-88.2273464887,'Union','Union'),(14,5,40.1092666219,-88.2265009078,'Union','Union'),(15,4,40.1100315832,-88.2280429286,'Union','Union'),(16,5,40.1097578871,-88.2275548681,'Union','Union'),(17,9,40.1091930175,-88.2279223564,'Union','Union'),(18,9,40.1104632851,-88.227320734,'Union','Union'),(19,4,40.1090886728,-88.226705458,'Union','Union'),(20,7,40.1102675431,-88.2275332571,'Union','Union'),(21,6,40.1104444568,-88.2265864044,'Union','Union'),(22,9,40.1091683135,-88.2273824809,'Union','Union'),(23,4,40.1093731434,-88.2269443114,'Union','Union'),(24,4,40.1090040681,-88.228118461,'Union','Union'),(25,9,40.1091092097,-88.2272362831,'Union','Union'),(26,2,40.1095384147,-88.2270008868,'Union','Union'),(27,1,40.1094756804,-88.2269702694,'Union','Union'),(28,2,40.1087989812,-88.228343459,'Union','Union'),(29,4,40.1101309711,-88.2269269202,'Union','Union'),(30,7,40.1101453966,-88.2268634984,'Union','Union'),(31,8,40.1101044696,-88.2276304602,'Union','Union'),(32,6,40.1103243719,-88.2270918906,'Union','Union'),(33,5,40.1097453706,-88.2278126204,'Union','Union'),(34,6,40.1098046959,-88.2272388152,'Union','Union'),(35,9,40.109301078,-88.2277675201,'Union','Union'),(36,2,40.1096950722,-88.2266647304,'Union','Union'),(37,5,40.1085122949,-88.2279646189,'Union','Union'),(38,3,40.1092146629,-88.2274266287,'Union','Union'),(39,4,40.1092958227,-88.2277522381,'Union','Union'),(40,9,40.1104960169,-88.2281856095,'Union','Union'),(41,2,40.1091194755,-88.2273647967,'Union','Union'),(42,4,40.1095674358,-88.227546684,'Union','Union'),(43,4,40.1091337653,-88.226696227,'Union','Union'),(44,8,40.1089033572,-88.2280936617,'Union','Union'),(45,9,40.1089544138,-88.228090004,'Union','Union'),(46,9,40.1093964909,-88.226538322,'Union','Union'),(47,9,40.1086104851,-88.2275432147,'Union','Union'),(48,5,40.1102677022,-88.2282592586,'Union','Union'),(49,5,40.1102158526,-88.2275149663,'Union','Union'),(50,8,40.110102227,-88.2278290076,'Union','Union'),(51,3,40.1096131916,-88.2279516959,'Union','Union'),(52,9,40.1092401522,-88.2281150895,'Union','Union'),(53,5,40.1103595876,-88.2276979967,'Union','Union'),(54,7,40.109947996,-88.228104464,'Union','Union'),(55,2,40.1104818623,-88.2267465732,'Union','Union'),(56,1,40.1103926739,-88.2277281207,'Union','Union'),(57,7,40.1093881736,-88.2276634087,'Union','Union'),(58,5,40.1095705916,-88.2266629206,'Union','Union'),(59,6,40.1086738455,-88.226704876,'Union','Union'),(60,6,40.1091759813,-88.2270890846,'Union','Union'),(61,3,40.109476985,-88.2283032506,'Union','Union'),(62,9,40.1085151792,-88.2274293795,'Union','Quad'),(63,7,40.1094801969,-88.2270985339,'Union','Union'),(64,4,40.1092294315,-88.227584044,'Union','Union'),(65,3,40.1087906953,-88.2284525444,'Union','Union'),(66,7,40.1092040465,-88.2277325758,'Union','Union'),(67,5,40.1088520803,-88.2265976173,'Union','Union'),(68,3,40.1103513147,-88.2276878278,'Union','Union'),(69,7,40.1100277541,-88.2279709946,'Union','Union'),(70,5,40.1089487795,-88.2284456881,'Union','Union'),(71,7,40.1085133755,-88.2271912343,'Union','Quad'),(72,6,40.1103770619,-88.2277302696,'Union','Union'),(73,7,40.1097590531,-88.2283274074,'Union','Union'),(74,7,40.1086866678,-88.2272150785,'Union','Union'),(75,5,40.1094804163,-88.2283019121,'Union','Union'),(76,6,40.1089877106,-88.227788859,'Union','Union'),(77,5,40.1092195031,-88.227091574,'Union','Union'),(78,2,40.1102916648,-88.2266805699,'Union','Union'),(79,2,40.1089810285,-88.2282695568,'Union','Union'),(80,7,40.1102260002,-88.2276567681,'Union','Union'),(81,1,40.1101971795,-88.2276196067,'Union','Union'),(82,2,40.1086500558,-88.2277458445,'Union','Union'),(83,4,40.1085843438,-88.2282963293,'Union','Union'),(84,4,40.1088543665,-88.2273173446,'Union','Union'),(85,8,40.1086089742,-88.2269751173,'Union','Union'),(86,5,40.1097001703,-88.2265392404,'Union','Union'),(87,4,40.1094963572,-88.2269332228,'Union','Union'),(88,5,40.1090922708,-88.2277327843,'Union','Union'),(89,8,40.1097069272,-88.2275887681,'Union','Union'),(90,2,40.1100034248,-88.2270618626,'Union','Union'),(91,2,40.109273974,-88.2269807518,'Union','Union'),(92,6,40.109449273,-88.2267577412,'Union','Union'),(93,4,40.1093453946,-88.2284683166,'Union','Union'),(94,4,40.1096047875,-88.2280738598,'Union','Union'),(95,3,40.1104968225,-88.2270071325,'Union','Union'),(96,2,40.1101302104,-88.2276153171,'Union','Union'),(97,6,40.1097688761,-88.2276250118,'Union','Union'),(98,5,40.1089559882,-88.2274927989,'Union','Union'),(99,1,40.1095199073,-88.227726862,'Union','Union'),(100,7,40.1141897756,-88.2258122804,'Siebel','Siebel'),(101,9,40.1136531374,-88.2250666849,'Siebel','Siebel'),(102,6,40.1145277163,-88.225891881,'Siebel','Siebel'),(103,7,40.113270023,-88.2259697677,'Siebel','Siebel'),(104,1,40.1137302501,-88.2242660652,'Siebel','Siebel'),(105,7,40.1130433397,-88.2243381065,'Siebel','Siebel'),(106,4,40.1143350408,-88.225829187,'Siebel','Siebel'),(107,5,40.1140840946,-88.2240869956,'Siebel','Siebel'),(108,9,40.1147960271,-88.2256171978,'Siebel','Siebel'),(109,5,40.1131373007,-88.2240693167,'Siebel','Siebel'),(110,4,40.1132399991,-88.2252924387,'Siebel','Siebel'),(111,8,40.1131413186,-88.2255143863,'Siebel','Siebel'),(112,3,40.1130144835,-88.2249126351,'Siebel','Siebel'),(113,4,40.1135666693,-88.2244990859,'Siebel','Siebel'),(114,9,40.1131050712,-88.2244067576,'Siebel','Siebel'),(115,8,40.1144741609,-88.2258559675,'Siebel','Siebel'),(116,9,40.1146315651,-88.2244995908,'Siebel','Siebel'),(117,5,40.114225196,-88.2248941844,'Siebel','Siebel'),(118,3,40.1135216574,-88.224206758,'Siebel','Siebel'),(119,1,40.1135518536,-88.2257985213,'Siebel','Siebel'),(120,1,40.113997195,-88.2249579112,'Siebel','Siebel'),(121,1,40.1134753627,-88.2244976032,'Siebel','Siebel'),(122,5,40.1131468586,-88.2254985191,'Siebel','Siebel'),(123,4,40.1133765359,-88.2256369464,'Siebel','Siebel'),(124,7,40.1132643227,-88.2259750498,'Siebel','Siebel'),(125,9,40.1142219016,-88.2250092481,'Siebel','Siebel'),(126,3,40.1136461161,-88.2248937563,'Siebel','Siebel'),(127,6,40.1137744168,-88.2241981732,'Siebel','Siebel'),(128,4,40.1138364462,-88.2248085669,'Siebel','Siebel'),(129,3,40.1135140851,-88.2253639098,'Siebel','Siebel'),(130,5,40.1134950149,-88.2240065723,'Siebel','Siebel'),(131,5,40.1142288072,-88.2258242421,'Siebel','Siebel'),(132,9,40.1130600802,-88.2256363542,'Siebel','Siebel'),(133,7,40.1138204448,-88.2241936753,'Siebel','Siebel'),(134,9,40.113836689,-88.2254564374,'Siebel','Siebel'),(135,2,40.1130458557,-88.2242755063,'Siebel','Siebel'),(136,8,40.1142819182,-88.2244724551,'Siebel','Siebel'),(137,5,40.1143213639,-88.2247489299,'Siebel','Siebel'),(138,9,40.1141038812,-88.2255152748,'Siebel','Siebel'),(139,7,40.1133359082,-88.2257010438,'Siebel','Siebel'),(140,4,40.1131632205,-88.224348032,'Siebel','Siebel'),(141,8,40.1133760834,-88.225764423,'Siebel','Siebel'),(142,7,40.1137951117,-88.2250778823,'Siebel','Siebel'),(143,9,40.113289628,-88.2258488302,'Siebel','Siebel'),(144,2,40.1142154164,-88.2250802264,'Siebel','Siebel'),(145,3,40.1137806645,-88.2251867988,'Siebel','Siebel'),(146,6,40.1138510007,-88.2256046359,'Siebel','Siebel'),(147,5,40.1132086234,-88.2259641841,'Siebel','Siebel'),(148,8,40.1144044046,-88.2259802677,'Siebel','Siebel'),(149,9,40.1146533332,-88.2256988131,'Siebel','Siebel'),(150,8,40.1143952061,-88.225434394,'Siebel','Siebel'),(151,2,40.1131310219,-88.2256374924,'Siebel','Siebel'),(152,3,40.113958816,-88.2241623957,'Siebel','Siebel'),(153,6,40.1139293555,-88.2248238271,'Siebel','Siebel'),(154,2,40.1146316819,-88.2242493102,'Siebel','Siebel'),(155,6,40.1144275605,-88.2247380677,'Siebel','Siebel'),(156,6,40.1145851095,-88.2255439209,'Siebel','Siebel'),(157,4,40.1136044486,-88.2258089572,'Siebel','Siebel'),(158,3,40.1140774611,-88.225520033,'Siebel','Siebel'),(159,8,40.1143808738,-88.2243879743,'Siebel','Siebel'),(160,5,40.1142428158,-88.2241307989,'Siebel','Siebel'),(161,5,40.1132035088,-88.2252620987,'Siebel','Siebel'),(162,9,40.1130598323,-88.2251973586,'Siebel','Siebel'),(163,9,40.1134559824,-88.2247391186,'Siebel','Siebel'),(164,4,40.1140843966,-88.2257801662,'Siebel','Siebel'),(165,7,40.1139376372,-88.2259869607,'Siebel','Siebel'),(166,2,40.1136975047,-88.2248768209,'Siebel','Siebel'),(167,6,40.1146055393,-88.2243953618,'Siebel','Siebel'),(168,7,40.1142950189,-88.2251954288,'Siebel','Siebel'),(169,2,40.1142070376,-88.2253044147,'Siebel','Siebel'),(170,1,40.1132868102,-88.2257626528,'Siebel','Siebel'),(171,6,40.1137730398,-88.2256559584,'Siebel','Siebel'),(172,8,40.1138759097,-88.2255740296,'Siebel','Siebel'),(173,9,40.1133124822,-88.2240240272,'Siebel','Siebel'),(174,5,40.1138272079,-88.2248534184,'Siebel','Siebel'),(175,6,40.1130277648,-88.2247691231,'Siebel','Siebel'),(176,5,40.1138571504,-88.2246122134,'Siebel','Siebel'),(177,4,40.1142588585,-88.2249445588,'Siebel','Siebel'),(178,2,40.1146369858,-88.2254908737,'Siebel','Siebel'),(179,4,40.1130289659,-88.2259367767,'Siebel','Siebel'),(180,9,40.1142967293,-88.2248963231,'Siebel','Siebel'),(181,8,40.114023458,-88.2240428209,'Siebel','Siebel'),(182,6,40.1138097162,-88.2258057822,'Siebel','Siebel'),(183,5,40.1134433148,-88.2256336671,'Siebel','Siebel'),(184,4,40.1130242699,-88.2247705864,'Siebel','Siebel'),(185,4,40.1143568312,-88.2250655374,'Siebel','Siebel'),(186,9,40.1134836837,-88.2253506426,'Siebel','Siebel'),(187,9,40.1135537861,-88.2247237255,'Siebel','Siebel'),(188,2,40.1132747531,-88.2240456788,'Siebel','Siebel'),(189,2,40.114280487,-88.2245601923,'Siebel','Siebel'),(190,4,40.1131663244,-88.2240615519,'Siebel','Siebel'),(191,4,40.1138891819,-88.2253288998,'Siebel','Siebel'),(192,6,40.1145279822,-88.2243887641,'Siebel','Siebel'),(193,4,40.113649029,-88.2249798049,'Siebel','Siebel'),(194,5,40.1144453044,-88.2247786638,'Siebel','Siebel'),(195,1,40.1139044894,-88.2241794265,'Siebel','Siebel'),(196,1,40.1138307061,-88.2245199032,'Siebel','Siebel'),(197,8,40.1143944771,-88.224297792,'Siebel','Siebel'),(198,1,40.1136404184,-88.2246028153,'Siebel','Siebel'),(199,5,40.1140243265,-88.2246565685,'Siebel','Siebel'),(200,9,40.1090613135,-88.2281979453,'Quad','Union'),(201,1,40.108276866,-88.2284067833,'Quad','Quad'),(202,6,40.1077928499,-88.2285753807,'Quad','Quad'),(203,8,40.1092384266,-88.228197164,'Quad','Union'),(204,4,40.1065943297,-88.2283973505,'Quad','Quad'),(205,9,40.1080382162,-88.2253739846,'Quad','Quad'),(206,9,40.1086929372,-88.2278200709,'Quad','Union'),(207,2,40.1067555556,-88.2288256522,'Quad','Library'),(208,8,40.1068225582,-88.2286739178,'Quad','Quad'),(209,9,40.1061399048,-88.2262974776,'Quad','Quad'),(210,3,40.106358314,-88.226873496,'Quad','Quad'),(211,3,40.1070591366,-88.228041345,'Quad','Quad'),(212,4,40.1091161904,-88.2269319467,'Quad','Union'),(213,9,40.1076708413,-88.2256861596,'Quad','Quad'),(214,4,40.1071734001,-88.2278277362,'Quad','Quad'),(215,4,40.1070309005,-88.229289708,'Quad','Library'),(216,9,40.107715148,-88.2281692551,'Quad','Quad'),(217,9,40.1080952795,-88.2253309897,'Quad','Quad'),(218,6,40.1071337333,-88.2257048964,'Quad','Quad'),(219,1,40.107312493,-88.2293606153,'Quad','Quad'),(220,8,40.1078166272,-88.2269578239,'Quad','Quad'),(221,9,40.107956682,-88.225604288,'Quad','Quad'),(222,1,40.1085684063,-88.2288197498,'Quad','Union'),(223,6,40.1090812298,-88.227121429,'Quad','Union'),(224,2,40.1087528988,-88.2271104474,'Quad','Union'),(225,2,40.1078523513,-88.2278503573,'Quad','Quad'),(226,7,40.1063510095,-88.2287327631,'Quad','Library'),(227,2,40.1067192673,-88.2284906013,'Quad','Quad'),(228,1,40.1089933468,-88.2280627143,'Quad','Union'),(229,8,40.1084067298,-88.2289430966,'Quad','Quad'),(230,9,40.1091399259,-88.2276461804,'Quad','Union'),(231,2,40.1062103205,-88.2271585381,'Quad','Quad'),(232,2,40.1091246886,-88.2268564781,'Quad','Union'),(233,8,40.1064455771,-88.2288951766,'Quad','Library'),(234,5,40.1088960454,-88.2260834147,'Quad','Union'),(235,9,40.105519847,-88.2279084796,'Quad','Library'),(236,3,40.1080912373,-88.2286577176,'Quad','Quad'),(237,5,40.107442017,-88.2287202487,'Quad','Quad'),(238,8,40.108406628,-88.2280937639,'Quad','Quad'),(239,3,40.1069764338,-88.2282621348,'Quad','Quad'),(240,5,40.1067897656,-88.2287071374,'Quad','Quad'),(241,8,40.1086814215,-88.2260324507,'Quad','Union'),(242,3,40.105548845,-88.2271254872,'Quad','Library'),(243,8,40.106891456,-88.2278021378,'Quad','Quad'),(244,9,40.1085239232,-88.2262551957,'Quad','Quad'),(245,7,40.1065404016,-88.2268060067,'Quad','Quad'),(246,7,40.107524558,-88.226688298,'Quad','Quad'),(247,8,40.1057011352,-88.2254931988,'Quad','Quad'),(248,1,40.1078397501,-88.2285451463,'Quad','Quad'),(249,2,40.1057950678,-88.2269190934,'Quad','Quad'),(250,1,40.1057399532,-88.2272077377,'Quad','Quad'),(251,3,40.1073646488,-88.2287184669,'Quad','Quad'),(252,5,40.1060513488,-88.225670198,'Quad','Quad'),(253,8,40.1089577737,-88.2271827366,'Quad','Union'),(254,4,40.1082090477,-88.2255892447,'Quad','Quad'),(255,7,40.1064837594,-88.2257153377,'Quad','Quad'),(256,6,40.1088715073,-88.2256413352,'Quad','Union'),(257,2,40.1065528134,-88.2271443423,'Quad','Quad'),(258,2,40.1080763165,-88.2291647347,'Quad','Quad'),(259,9,40.1074307242,-88.2271590309,'Quad','Quad'),(260,5,40.1081222411,-88.2273412412,'Quad','Quad'),(261,2,40.1076291857,-88.2261303849,'Quad','Quad'),(262,3,40.1068702546,-88.228793235,'Quad','Quad'),(263,9,40.1083596845,-88.2275512508,'Quad','Quad'),(264,3,40.1059566243,-88.2250027354,'Quad','Quad'),(265,7,40.1075219132,-88.2291164736,'Quad','Quad'),(266,4,40.1084772767,-88.2279844809,'Quad','Quad'),(267,9,40.1055938738,-88.2292597663,'Quad','Library'),(268,5,40.1055793806,-88.2279563155,'Quad','Library'),(269,7,40.1090597963,-88.2292098896,'Quad','Union'),(270,5,40.1067643515,-88.226673233,'Quad','Quad'),(271,7,40.1078614594,-88.2280668725,'Quad','Quad'),(272,5,40.1078553078,-88.2273324426,'Quad','Quad'),(273,3,40.1063131275,-88.2272892972,'Quad','Quad'),(274,8,40.1090389991,-88.2261600406,'Quad','Union'),(275,1,40.1062589323,-88.2277460291,'Quad','Quad'),(276,9,40.1080975976,-88.2286510455,'Quad','Quad'),(277,9,40.1090099911,-88.2265152397,'Quad','Union'),(278,2,40.1080049067,-88.2277875942,'Quad','Quad'),(279,6,40.1085863723,-88.2252739896,'Quad','Quad'),(280,1,40.1075005544,-88.2277848706,'Quad','Quad'),(281,2,40.1056906334,-88.2268647204,'Quad','Quad'),(282,2,40.1074922938,-88.2261604523,'Quad','Quad'),(283,3,40.1076362139,-88.2263369211,'Quad','Quad'),(284,3,40.1082194806,-88.2280152309,'Quad','Quad'),(285,7,40.1091818262,-88.227183584,'Quad','Union'),(286,4,40.1078706439,-88.2269403138,'Quad','Quad'),(287,4,40.10877017,-88.2256649549,'Quad','Union'),(288,7,40.107650301,-88.2261380404,'Quad','Quad'),(289,7,40.1077254293,-88.2263311605,'Quad','Quad'),(290,7,40.1067384229,-88.2283482158,'Quad','Quad'),(291,9,40.1063084796,-88.2253330514,'Quad','Quad'),(292,1,40.1055922015,-88.2288910477,'Quad','Library'),(293,7,40.1089156437,-88.2260129892,'Quad','Union'),(294,4,40.108321173,-88.2290271979,'Quad','Quad'),(295,6,40.1078402075,-88.2262901447,'Quad','Quad'),(296,1,40.1070573879,-88.2293154384,'Quad','Library'),(297,8,40.1077570226,-88.2289077001,'Quad','Quad'),(298,1,40.1083443113,-88.2269894402,'Quad','Quad'),(299,1,40.1069415338,-88.2260302145,'Quad','Quad'),(301,5,40.105214,-88.228944,'Library','Library'),(302,5,40.10522,-88.22895,'Library','Library'),(303,5,40.10523,-88.22896,'Library','Library'),(304,5,40.10524,-88.22897,'Library','Library');
/*!40000 ALTER TABLE `geotag_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_reviews`
--

DROP TABLE IF EXISTS `geotag_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_reviews` (
  `review_id` int(11) NOT NULL,
  `content` varchar(140) NOT NULL,
  `user_id_id` varchar(30) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `geotag_reviews_18624dd3` (`user_id_id`),
  CONSTRAINT `geotag_reviews_user_id_id_c3b71206_fk_geotag_users_fb_id` FOREIGN KEY (`user_id_id`) REFERENCES `geotag_users` (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_reviews`
--

LOCK TABLES `geotag_reviews` WRITE;
/*!40000 ALTER TABLE `geotag_reviews` DISABLE KEYS */;
INSERT INTO `geotag_reviews` VALUES (5,'This event was horrible!!!!','asharm52');
/*!40000 ALTER TABLE `geotag_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geotag_users`
--

DROP TABLE IF EXISTS `geotag_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geotag_users` (
  `fb_id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(140) NOT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geotag_users`
--

LOCK TABLES `geotag_users` WRITE;
/*!40000 ALTER TABLE `geotag_users` DISABLE KEYS */;
INSERT INTO `geotag_users` VALUES ('10210048776629325','Ryan Gates',''),('10211293693049684','Ram Gupta',''),('14','123sb','new event'),('419378515106915','Aayush Sharma',''),('59','Raj','Template'),('alekson2','Tadas','CS 391 TA'),('asharm52','Aayush Sharma','PRAISE KEK'),('astha2','Astha Saxena','AYY LMAO'),('ramg','Ram Gupta','genius'),('rgates','Ryan Gates','ryan'),('snoop420','Cordozar','Blaze it'),('srirasao2','Rahul','Just your average country boy'),('supahot3','Supa','I\'m not a rapper');
/*!40000 ALTER TABLE `geotag_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `km_clusters`
--

DROP TABLE IF EXISTS `km_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `km_clusters` (
  `tag` varchar(30) NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `km_clusters`
--

LOCK TABLES `km_clusters` WRITE;
/*!40000 ALTER TABLE `km_clusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `km_clusters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-30 12:55:35
