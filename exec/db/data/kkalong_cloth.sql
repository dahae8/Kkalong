-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: k9c105.p.ssafy.io    Database: kkalong
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cloth`
--

DROP TABLE IF EXISTS `cloth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloth` (
  `cloth_seq` int NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `cloth_name` varchar(40) NOT NULL COMMENT '옷 이름',
  `cloth_img_name` varchar(75) NOT NULL COMMENT '옷 원본 사진 파일 이름(cloth_소유자아이디_올린시간_무작위난수6자리)',
  `cloth_img_no_bg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '옷 누끼 사진 배경 없는 파일 존재 여부',
  `cloth_img_yes_bg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '옷 누끼 사진 배경있는 파일 존재여부',
  `cloth_img_masking` tinyint(1) NOT NULL DEFAULT '0' COMMENT '옷 마스킹 사진 파일 존재여부',
  `is_private` tinyint NOT NULL DEFAULT '0' COMMENT '공개 여부',
  `cloth_reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성날짜',
  `is_cloth_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '삭제여부',
  `cloth_del_date` datetime DEFAULT NULL COMMENT '삭제일시',
  `section_seq` int DEFAULT NULL COMMENT '옷장 상세정보 인덱스',
  `sort_seq` int NOT NULL COMMENT '옷 종류 인덱스',
  `member_seq` int NOT NULL COMMENT '소유자 인덱스',
  PRIMARY KEY (`cloth_seq`),
  KEY `FK_section_TO_cloth_1` (`section_seq`),
  KEY `FK_sort_TO_cloth_1` (`sort_seq`),
  KEY `FK_member_TO_cloth_1` (`member_seq`),
  CONSTRAINT `FK_member_TO_cloth_1` FOREIGN KEY (`member_seq`) REFERENCES `member` (`member_seq`),
  CONSTRAINT `FK_section_TO_cloth_1` FOREIGN KEY (`section_seq`) REFERENCES `section` (`section_seq`),
  CONSTRAINT `FK_sort_TO_cloth_1` FOREIGN KEY (`sort_seq`) REFERENCES `sort` (`sort_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloth`
--

LOCK TABLES `cloth` WRITE;
/*!40000 ALTER TABLE `cloth` DISABLE KEYS */;
INSERT INTO `cloth` VALUES (1,'옷태스트','태스트',0,0,0,0,'2023-11-06 02:42:51',1,'2023-11-16 02:36:25',1,1,28),(2,'옷태스트','태스트',0,0,0,0,'2023-11-06 02:43:21',1,'2023-11-16 02:36:25',1,2,28),(3,'옷태스트','태스트',0,0,0,0,'2023-11-06 02:43:47',1,'2023-11-16 02:36:25',1,3,28),(4,'옷태스트','태스트',0,0,0,0,'2023-11-06 02:44:27',1,'2023-11-16 02:36:25',1,4,28),(5,'옷태스트','태스트',0,0,0,1,'2023-11-06 02:44:27',1,'2023-11-16 02:36:25',1,4,28),(6,'옷태스트','태스트',0,0,0,0,'2023-11-06 02:44:27',1,'2023-11-16 02:36:25',1,5,28),(7,'옷태스트','태스트',0,0,0,1,'2023-11-06 02:44:27',1,'2023-11-16 02:36:25',1,5,28),(8,'옷태스트','태스트',0,0,0,0,'2023-11-06 02:44:27',1,'2023-11-16 02:36:25',1,6,28),(9,'옷태스트','태스트',0,0,0,1,'2023-11-06 02:44:27',1,'2023-11-16 02:36:25',1,6,28),(10,'옷태스트','태스트',0,0,0,0,'2023-11-06 07:06:09',1,'2023-11-10 09:33:10',2,4,26),(11,'옷태스트','태스트',0,0,0,1,'2023-11-06 07:06:09',1,NULL,NULL,4,26),(12,'옷태스트','태스트',0,0,0,0,'2023-11-06 07:06:09',1,NULL,NULL,5,26),(13,'옷태스트','태스트',0,0,0,1,'2023-11-06 07:06:09',1,NULL,NULL,5,26),(14,'옷태스트','태스트',0,0,0,0,'2023-11-06 07:06:09',1,NULL,NULL,6,26),(15,'태스트2','cloth_dahaetest0_231109_111147_071757',0,0,0,0,'2023-11-06 07:06:10',1,'2023-11-10 11:37:33',NULL,1,26),(16,'stringTest','cloth_dahaetest0_231107_165751_236841',1,1,0,1,'2023-11-07 16:57:55',1,'2023-11-10 11:37:34',2,1,26),(17,'태스트2','cloth_dahaetest0_231107_171933_079313',1,1,0,1,'2023-11-07 17:19:37',1,'2023-11-10 11:37:34',2,1,26),(18,'태스트2','cloth_dahaetest0_231109_100642_230977',1,1,1,0,'2023-11-09 10:06:45',0,NULL,NULL,1,26),(19,'태스트2','cloth_dahaetest0_231109_100845_360015',1,1,0,0,'2023-11-09 10:08:48',1,'2023-11-10 11:37:34',2,1,26),(20,'태스트2','cloth_dahaetest0_231109_101251_754374',1,1,1,0,'2023-11-09 10:12:55',0,NULL,NULL,1,26),(21,'바지 2','cloth_dahaetest0_231109_102122_094649',1,1,0,0,'2023-11-09 10:21:26',1,'2023-11-10 11:37:34',NULL,2,26),(22,'바지 2','cloth_dahaetest0_231109_103049_249857',1,1,1,0,'2023-11-09 10:30:52',0,NULL,NULL,2,26),(23,'바지 2','cloth_dahaetest0_231109_104254_700955',1,1,0,0,'2023-11-09 10:42:58',0,NULL,NULL,2,26),(24,'바지 2','cloth_dahaetest0_231109_104343_549994',1,1,0,0,'2023-11-09 10:43:46',0,NULL,NULL,2,26),(25,'바지 2','',1,1,0,0,'2023-11-09 10:46:14',1,NULL,NULL,2,26),(26,'바지 2','',1,1,0,0,'2023-11-09 11:01:05',1,NULL,NULL,2,26),(27,'바지 2','cloth_dahaetest0_231109_110948_621939',1,1,0,0,'2023-11-09 11:09:52',0,NULL,NULL,2,26),(28,'내옷','cloth_2dtest123456_231109_204714_866437',1,1,1,1,'2023-11-09 20:47:18',1,'2023-11-16 02:36:25',5,1,28),(29,'내옷','cloth_2dtest123456_231109_214859_149171',1,1,1,1,'2023-11-09 21:49:02',1,'2023-11-16 02:36:25',5,1,28),(30,'내옷','cloth_2dtest123456_231109_215710_953235',1,1,1,1,'2023-11-09 21:57:14',1,'2023-11-16 02:36:25',5,1,28),(31,'내옷','cloth_2dtest123456_231110_092435_492821',1,1,1,1,'2023-11-10 09:24:38',1,'2023-11-16 02:36:25',5,1,28),(32,'내옷','cloth_2dtest123456_231110_093731_978114',1,1,1,1,'2023-11-10 09:37:35',1,'2023-11-16 02:36:25',5,1,28),(34,'내옷','cloth_2dtest123456_231110_093731_978114',1,1,1,1,'2023-11-10 02:41:08',1,'2023-11-10 15:48:06',NULL,2,30),(35,'니옷g','cloth_2dtest123456_231110_093731_978114',1,1,1,1,'2023-11-10 02:41:25',1,NULL,14,1,30),(36,'우리옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 02:41:27',1,NULL,32,2,30),(37,'내옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 02:42:26',1,NULL,32,2,30),(38,'니옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 02:42:27',1,NULL,32,2,30),(39,'우리옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 02:42:28',1,NULL,NULL,2,30),(40,'내옷','cloth_2dtest123456_231110_093731_978114',1,1,1,1,'2023-11-10 02:43:08',1,NULL,NULL,2,30),(41,'내옷','cloth_2dtest123456_231110_120352_490863',1,1,1,1,'2023-11-10 12:03:56',1,'2023-11-16 02:36:25',5,1,28),(42,'내옷','cloth_2dtest123456_231110_121112_535890',1,1,1,1,'2023-11-10 12:11:15',1,'2023-11-16 02:36:25',5,1,28),(43,'데모용 옷 1','cloth_2dtest123456_231110_142829_035247',1,1,1,1,'2023-11-10 14:28:33',1,'2023-11-16 02:36:25',5,1,28),(44,'데모용 옷 1','cloth_2dtest123456_231110_142859_169646',1,1,1,1,'2023-11-10 14:29:03',1,'2023-11-16 02:36:25',5,1,28),(45,'데모용 옷 3','cloth_2dtest123456_231110_142915_095666',1,1,1,1,'2023-11-10 14:29:18',1,'2023-11-16 02:36:25',5,1,28),(46,'데모용 옷 4','cloth_2dtest123456_231110_142933_394229',1,1,1,0,'2023-11-10 14:29:37',1,'2023-11-16 02:36:25',5,1,28),(47,'다른옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 05:37:46',0,NULL,NULL,2,30),(48,'저옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 05:37:47',0,NULL,NULL,1,30),(49,'그옷ff','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 05:37:48',0,NULL,NULL,2,30),(50,'그옷','cloth_2dtest123456_231110_093731_978114',1,1,1,0,'2023-11-10 05:37:50',0,NULL,NULL,2,30),(51,'분홍색 니트','cloth_dahaetest0_231110_152231_103630',1,1,1,0,'2023-11-10 14:44:43',0,NULL,NULL,1,26),(52,'데모용 옷 5','cloth_2dtest123456_231110_164155_766139',1,1,1,1,'2023-11-10 16:41:59',1,'2023-11-16 02:36:25',5,1,28),(53,'데모용 옷 6','cloth_2dtest123456_231110_165134_025391',1,1,1,1,'2023-11-10 16:51:38',1,'2023-11-16 02:36:25',5,1,28),(55,'qweqwe','qweqwe',1,1,1,0,'2023-11-12 08:34:33',1,NULL,NULL,1,29),(56,'qwe','cloth_ssafy_231113_152301_503006',1,1,1,1,'2023-11-13 15:23:04',1,'2023-11-13 15:50:02',25,2,30),(57,'ehuu','cloth_ssafy_231113_152511_903497',1,1,1,1,'2023-11-13 15:25:14',1,'2023-11-13 15:37:35',25,5,30),(58,'ehuu','cloth_ssafy_231113_152534_962554',1,1,1,1,'2023-11-13 15:25:38',0,NULL,NULL,2,30),(59,'dd','cloth_ssafy_231113_161454_455315',1,1,1,1,'2023-11-13 16:14:57',1,'2023-11-13 16:15:04',26,2,30),(60,'dual','cloth_ssafy_231113_174240_392044',1,1,1,1,'2023-11-13 17:42:43',0,NULL,NULL,2,30),(61,'fu','cloth_ssafy_231113_194247_202766',1,1,1,1,'2023-11-13 19:42:50',1,'2023-11-13 19:44:10',27,3,30),(62,'heyt','cloth_ssafy_231114_113118_257370',1,1,1,1,'2023-11-14 11:31:21',0,NULL,NULL,1,30),(63,'gg','cloth_ssafy_231115_053104_810857',1,1,1,1,'2023-11-15 05:31:07',0,NULL,NULL,2,30),(64,'aaa','cloth_ssafy_231115_053129_583633',1,1,1,0,'2023-11-15 05:31:32',0,NULL,NULL,3,30),(65,'dsaf','cloth_ssafy_231115_053156_767844',1,1,1,1,'2023-11-15 05:31:59',0,NULL,NULL,2,30),(66,'sss','cloth_ssafy_231115_053247_828399',1,1,1,1,'2023-11-15 05:32:50',0,NULL,NULL,2,30),(67,'dd','cloth_ssafy_231115_085440_355283',1,1,1,1,'2023-11-15 08:54:43',0,NULL,NULL,1,30),(68,'yy','cloth_ssafy_231115_085740_525330',1,1,1,1,'2023-11-15 08:57:43',0,NULL,NULL,2,30),(69,'testtest','cloth_ssafy_231115_091150_802645',1,1,1,1,'2023-11-15 09:11:53',0,NULL,NULL,1,30),(70,'f','cloth_ssafy_231115_102541_567077',1,1,1,1,'2023-11-15 10:25:44',0,NULL,NULL,2,30),(71,'g','cloth_ssafy_231115_102613_268168',1,1,1,1,'2023-11-15 10:26:16',0,NULL,NULL,2,30),(72,'asdfg','cloth_ssafy_231115_103042_561779',1,1,1,1,'2023-11-15 10:30:45',0,NULL,NULL,2,30),(73,'','cloth_3dtest123456_231115_140913_104927',1,1,0,1,'2023-11-15 14:09:16',0,NULL,NULL,1,29),(74,'tedtt','cloth_3dtest123456_231115_141022_810831',1,1,0,1,'2023-11-15 14:10:25',0,NULL,21,1,29),(75,'tt','cloth_ssafy_231115_143414_209557',1,1,1,1,'2023-11-15 14:34:17',0,NULL,NULL,1,30),(76,'1','cloth_kkalong105_231115_151851_504735',1,1,0,1,'2023-11-15 15:18:54',1,'2023-11-15 15:19:00',49,2,56),(77,'1','cloth_kkalong105_231115_151928_460183',1,1,0,0,'2023-11-15 15:19:31',1,'2023-11-16 16:54:18',NULL,2,56),(78,'test1','cloth_test1234_231115_171129_741540',1,1,1,1,'2023-11-15 17:11:32',1,'2023-11-16 07:40:48',53,1,61),(79,'test1','cloth_test1234_231115_171153_860403',1,1,1,1,'2023-11-15 17:11:56',1,'2023-11-16 07:40:48',53,1,61),(80,'test1','cloth_test1234_231115_171206_226935',1,1,1,1,'2023-11-15 17:12:10',1,'2023-11-16 07:40:48',53,1,61),(81,'test1','cloth_test1234_231115_171220_457990',1,1,1,1,'2023-11-15 17:12:23',1,'2023-11-16 07:40:48',53,1,61),(82,'test1','cloth_test1234_231115_171234_522279',1,1,1,1,'2023-11-15 17:12:38',1,'2023-11-16 07:40:48',53,1,61),(83,'test1','cloth_test1234_231115_171308_470404',1,1,1,1,'2023-11-15 17:13:11',1,'2023-11-16 07:40:48',53,1,61),(84,'test1','cloth_test1234_231115_171337_370416',1,1,1,1,'2023-11-15 17:13:40',1,'2023-11-16 07:40:48',53,1,61),(85,'test1','cloth_test1234_231115_171358_568889',1,1,1,1,'2023-11-15 17:14:01',1,'2023-11-16 07:40:48',53,1,61),(86,'test1','cloth_test1234_231115_171411_325223',1,1,1,1,'2023-11-15 17:14:15',1,'2023-11-16 07:40:48',53,1,61),(87,'test2','cloth_test1234_231115_171655_680029',1,1,1,1,'2023-11-15 17:16:58',1,'2023-11-16 06:56:59',53,2,61),(88,'test2','cloth_test1234_231115_171708_100777',1,1,1,1,'2023-11-15 17:17:11',1,'2023-11-16 06:56:59',53,2,61),(89,'test2','cloth_test1234_231115_171721_115293',1,1,1,1,'2023-11-15 17:17:24',1,'2023-11-16 06:56:59',53,2,61),(90,'test3','cloth_test1234_231115_171752_605341',1,1,1,1,'2023-11-15 17:17:55',1,'2023-11-16 06:56:59',53,3,61),(91,'test3','cloth_test1234_231115_171807_935768',1,1,1,1,'2023-11-15 17:18:10',1,'2023-11-16 06:56:59',53,3,61),(92,'test3','cloth_test1234_231115_171820_153524',1,1,1,1,'2023-11-15 17:18:23',1,'2023-11-16 06:56:59',53,3,61),(93,'test4','cloth_test1234_231115_171905_441667',1,1,1,1,'2023-11-15 17:19:08',0,NULL,54,5,61),(94,'test4','cloth_test1234_231115_171920_759716',1,1,1,1,'2023-11-15 17:19:23',0,NULL,54,5,61),(95,'원','cloth_onestore2_231116_093428_518472',1,1,1,1,'2023-11-16 09:34:32',0,NULL,61,5,59),(96,'워워','cloth_onestore2_231116_093537_626923',1,1,1,1,'2023-11-16 09:35:41',0,NULL,63,1,59),(97,'내옷','cloth_asdf1234_231116_101648_972201',1,1,1,1,'2023-11-16 10:16:51',0,NULL,66,1,62),(98,'dd','cloth_ssafy_231116_120829_931888',1,1,1,1,'2023-11-16 12:08:32',0,NULL,NULL,1,30),(99,'dualmaster','cloth_ssafy_231116_133456_337742',1,1,1,1,'2023-11-16 13:34:59',0,NULL,NULL,5,30),(100,'ddd','cloth_ssafy_231116_133617_682488',1,1,0,1,'2023-11-16 13:36:20',0,NULL,NULL,3,30),(101,'asdf','cloth_ssafy_231116_133746_926947',1,1,0,1,'2023-11-16 13:37:49',0,NULL,NULL,1,30),(102,'test5','cloth_test1234_231116_135158_136573',1,1,1,1,'2023-11-16 13:52:02',0,NULL,54,5,61),(103,'test5','cloth_test1234_231116_135234_908225',1,1,1,1,'2023-11-16 13:52:38',0,NULL,54,5,61),(104,'test5','cloth_test1234_231116_135335_916740',1,1,1,1,'2023-11-16 13:53:38',0,NULL,54,5,61),(105,'test5','cloth_test1234_231116_135403_403793',1,1,1,1,'2023-11-16 13:54:07',0,NULL,54,5,61),(106,'test5','cloth_test1234_231116_140041_666800',1,1,1,1,'2023-11-16 14:00:45',0,NULL,54,5,61),(107,'test5','cloth_test1234_231116_140059_344048',1,1,1,1,'2023-11-16 14:01:03',0,NULL,54,5,61),(108,'test5','cloth_test1234_231116_140122_654076',1,1,1,1,'2023-11-16 14:01:25',0,NULL,54,1,61),(109,'test1','cloth_test1234_231116_140743_103495',1,1,1,1,'2023-11-16 14:07:47',1,'2023-11-16 07:40:48',53,1,61),(110,'test1','cloth_test1234_231116_140839_109444',1,1,1,1,'2023-11-16 14:08:46',1,'2023-11-16 07:40:48',53,1,61),(111,'test1','cloth_test1234_231116_141034_473239',1,1,1,1,'2023-11-16 14:10:37',1,'2023-11-16 07:40:48',54,1,61),(112,'test1','cloth_test1234_231116_141053_118544',1,1,1,1,'2023-11-16 14:10:56',1,'2023-11-16 07:40:48',54,1,61),(113,'test1','cloth_test1234_231116_141106_424217',1,1,1,1,'2023-11-16 14:11:21',1,'2023-11-16 07:40:48',54,1,61),(114,'test1','cloth_test1234_231116_141146_998144',1,1,1,1,'2023-11-16 14:11:49',1,'2023-11-16 07:40:48',54,1,61),(115,'test1','cloth_test1234_231116_141205_822685',1,1,1,1,'2023-11-16 14:12:09',1,'2023-11-16 07:40:48',54,1,61),(116,'test1','cloth_test1234_231116_141219_330191',1,1,1,1,'2023-11-16 14:12:23',1,'2023-11-16 07:40:48',54,1,61),(117,'test1','cloth_test1234_231116_141247_506337',1,1,1,1,'2023-11-16 14:12:50',1,'2023-11-16 07:40:48',54,1,61),(118,'test1','cloth_test1234_231116_141304_991463',1,1,1,1,'2023-11-16 14:13:08',1,'2023-11-16 07:40:48',54,1,61),(119,'test1','cloth_test1234_231116_141319_265852',1,1,1,1,'2023-11-16 14:13:22',1,'2023-11-16 07:40:48',54,1,61),(120,'청자켓','cloth_kkalong105_231116_153311_200762',1,1,1,0,'2023-11-16 15:35:59',0,NULL,84,3,56),(121,'패딩','cloth_kkalong105_231116_155401_306861',1,1,1,1,'2023-11-16 15:54:10',0,NULL,84,3,56),(122,'주황반팔니트','cloth_test1234_231116_155812_445293',1,1,1,0,'2023-11-16 15:58:16',0,NULL,53,1,61),(123,'빨간반팔','cloth_test1234_231116_155850_376583',1,1,1,0,'2023-11-16 15:58:53',0,NULL,53,1,61),(124,'무늬긴팔','cloth_test1234_231116_160003_639803',1,1,1,0,'2023-11-16 16:00:06',0,NULL,53,1,61),(125,'무늬나시','cloth_test1234_231116_160055_419432',1,1,1,0,'2023-11-16 16:00:59',0,NULL,53,1,61),(126,'노란나시','cloth_test1234_231116_160157_447757',1,1,1,0,'2023-11-16 16:02:01',0,NULL,53,1,61),(127,'플리스','cloth_kkalong105_231116_160507_098878',1,1,1,0,'2023-11-16 16:05:11',0,NULL,84,3,56),(128,'떙땡나시','cloth_test1234_231116_160522_683008',1,1,1,0,'2023-11-16 16:05:26',0,NULL,53,1,61),(129,'시스루반팔','cloth_test1234_231116_160614_012733',1,1,1,0,'2023-11-16 16:06:17',0,NULL,53,1,61),(130,'꽃무늬 원피스','cloth_kkalong105_231116_160618_119013',1,1,1,0,'2023-11-16 16:06:22',0,NULL,84,5,56),(131,'꽃무늬나시','cloth_test1234_231116_160717_072520',1,1,1,0,'2023-11-16 16:07:21',0,NULL,53,1,61),(132,'분홍 꽃무늬 원피스','cloth_kkalong105_231116_160757_070967',1,1,1,1,'2023-11-16 16:08:00',0,NULL,84,5,56),(133,'장 치마','cloth_kkalong105_231116_161158_233997',1,1,0,0,'2023-11-16 16:12:02',0,NULL,84,4,56),(134,'잠나시','cloth_test1234_231116_161202_059190',1,1,1,0,'2023-11-16 16:12:06',0,NULL,53,1,61),(135,'장 치마','cloth_kkalong105_231116_161256_741799',1,1,1,0,'2023-11-16 16:12:59',1,'2023-11-16 16:28:46',84,4,56),(136,'빨간니트반팔','cloth_test1234_231116_161308_126385',1,1,1,0,'2023-11-16 16:13:11',0,NULL,53,1,61),(137,'캐릭터반팔','cloth_test1234_231116_161359_054253',1,1,1,0,'2023-11-16 16:14:02',0,NULL,53,1,61),(138,'갈색 미니스커','cloth_kkalong105_231116_161424_004226',1,1,1,0,'2023-11-16 16:14:27',0,NULL,86,4,56),(139,'핑크브이넥반팔','cloth_test1234_231116_161450_009714',1,1,1,1,'2023-11-16 16:14:53',0,NULL,53,1,61),(140,'반바지','cloth_kkalong105_231116_161545_789757',1,1,1,1,'2023-11-16 16:15:49',0,NULL,86,2,56),(141,'청바지','cloth_kkalong105_231116_161637_867271',1,1,1,0,'2023-11-16 16:16:41',0,NULL,86,2,56),(142,'양말','cloth_kkalong105_231116_161824_900563',1,1,1,0,'2023-11-16 16:18:28',0,NULL,87,6,56),(143,'비니','cloth_kkalong105_231116_161958_325556',1,1,1,0,'2023-11-16 16:20:01',0,NULL,87,6,56),(144,'배낭','cloth_kkalong105_231116_163058_472230',1,1,1,0,'2023-11-16 16:31:01',0,NULL,88,6,56),(145,'주황색 니트','cloth_kkalong105_231116_163747_199018',1,1,1,0,'2023-11-16 16:37:51',0,NULL,86,1,56),(146,'분홍 맨투맨','cloth_kkalong105_231116_165807_793809',1,1,1,1,'2023-11-16 16:58:10',0,NULL,86,1,56),(147,'호랑이 반팔','cloth_kkalong105_231116_170630_418755',1,1,1,1,'2023-11-16 17:06:33',0,NULL,86,1,56),(148,'흰 반팔','cloth_kkalong105_231116_172132_167077',1,1,0,0,'2023-11-16 17:30:28',1,'2023-11-16 19:39:40',86,1,56),(149,'흰 반팔','cloth_kkalong105_231116_174729_313567',1,1,1,0,'2023-11-16 17:47:32',0,NULL,86,1,56),(150,'줄무늬 니트','cloth_kkalong105_231116_180459_988676',1,1,1,0,'2023-11-16 18:05:04',0,NULL,86,1,56),(151,'흰 니트','cloth_kkalong105_231116_180911_150277',1,1,1,0,'2023-11-16 18:09:15',0,NULL,86,1,56),(152,'곰돌이 맨투맨','cloth_kkalong105_231116_201804_828762',1,1,1,0,'2023-11-16 20:18:07',0,NULL,86,1,56),(153,'노란색 맨투맨','cloth_kkalong105_231116_202534_597790',1,1,1,0,'2023-11-16 20:25:38',0,NULL,86,1,56),(154,'초록 반팔티','cloth_kkalong105_231116_202856_359373',1,1,1,0,'2023-11-16 20:28:59',0,NULL,86,1,56),(155,'땡땡','cloth_kkalong105_231117_091019_257118',1,1,1,1,'2023-11-17 09:10:23',0,NULL,86,1,56),(156,'니트 ','cloth_kkalong105_231117_091603_798136',1,1,1,1,'2023-11-17 09:16:08',0,NULL,86,1,56),(157,'ㅣㅣ','cloth_kkalong105_231117_094759_044261',1,1,1,1,'2023-11-17 09:48:02',0,NULL,105,1,56);
/*!40000 ALTER TABLE `cloth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-17 10:00:30
