-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: elibrary
-- ------------------------------------------------------
-- Server version	5.5.17

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
-- Current Database: `elibrary`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `elibrary` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `elibrary`;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciality` (
  `SpecialityID` int(11) NOT NULL,
  `SpecialityName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SpecialityNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SpecialityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (1,'Computer science','Khoa học máy tính'),(2,'Software engineering','Công nghệ phần mềm'),(3,'hệ thống thông tin','Hệ thống thông tin'),(4,'Kỹ thuật máy tình','Kỹ thuật máy tính'),(5,'MMT & TT','Mạng máy tính và truyền thông');
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `subjectcategory`
--

DROP TABLE IF EXISTS `subjectcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectcategory` (
  `SubjectCategoryID` int(11) NOT NULL,
  `SubjectCategoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectCategoryNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SubjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectcategory`
--

LOCK TABLES `subjectcategory` WRITE;
/*!40000 ALTER TABLE `subjectcategory` DISABLE KEYS */;
INSERT INTO `subjectcategory` VALUES (1,'basic','Căn bản'),(2,'Speciality','Chuyên ngành'),(3,'Free','Tự chọn');
/*!40000 ALTER TABLE `subjectcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectCategoryID` int(11) DEFAULT NULL,
  `SpecialityID` int(11) DEFAULT NULL,
  `SubjectName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectIntroduce` text COLLATE utf8_unicode_ci,
  `CreditNumber` int(11) DEFAULT NULL,
  `Level` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PeriodOfTheory` int(11) DEFAULT NULL,
  `PeriodOfPractice` int(11) DEFAULT NULL,
  `CourseCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Teacher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PrerequisiteSubject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MidtermGrade` int(10) DEFAULT NULL,
  `FinalGrade` int(10) DEFAULT NULL,
  `SubjectNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectIntroduceVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TimeTeaching` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProjectRequitement` text COLLATE utf8_unicode_ci,
  `ProjectRequitementUS` text COLLATE utf8_unicode_ci,
  `NumberChapter` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `fk_subject_subjectcategory` (`SubjectCategoryID`),
  KEY `fk_subject_speciality` (`SpecialityID`),
  CONSTRAINT `fk_subject_speciality` FOREIGN KEY (`SpecialityID`) REFERENCES `speciality` (`SpecialityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_subjectcategory` FOREIGN KEY (`SubjectCategoryID`) REFERENCES `subjectcategory` (`SubjectCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

--
-- Table structure for table `resourcecategory`
--

DROP TABLE IF EXISTS `resourcecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcecategory` (
  `ResourceCategoryID` int(11) NOT NULL,
  `ResourceCategoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ResourceCategoryNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ResourceCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcecategory`
--

LOCK TABLES `resourcecategory` WRITE;
/*!40000 ALTER TABLE `resourcecategory` DISABLE KEYS */;
INSERT INTO `resourcecategory` VALUES (1,'Subject','Giáo trình'),(2,'Khóa luận','Khóa luận'),(3,'Paper','Bài báo'),(4,'Assignments','Bài tập'),(5,'Example','Ví dụ'),(6,'Project','Đồ án mẫu'),(7,'Chapter','Chương'),(8,'Image','Ảnh'),(9,'Reading','Tài liệu tham khảo'),(10,'Lecture Note','Bài giảng'),(11,'Video','Video');
/*!40000 ALTER TABLE `resourcecategory` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,1,2,'Techology','<p>CreateSubject</p>',NULL,'Đại học',5,6,'3223','test','Cơ bản',20,30,'Tin học cơ bản','<p>CreateSubject</p>','4','<p>CreateSubject</p>','<p>CreateSubject</p>',NULL),(2,1,1,'code','<p>intro demo 1</p>',NULL,'Đại học',45,45,'0x01','none','none',30,70,'Lập trình','<p>giới thiệu demo1</p>','90','<p>Yêu cầu 1</p>','<p>Requite 1</p>',NULL),(3,2,1,'Web development','<p>web develoment introduce</p>',NULL,'Đại học',60,45,'0x0x0x','nguyễn Hoàng Hải','Lập trình web cơ bản',30,70,'Lập trình web','<p>giới thiệu lập trình web</p>','90','<p>yêu cầu 1</p>','<p>Requite 1</p>',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `ResourceID` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceCategoryID` int(11) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  `ResourceName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Size` int(11) DEFAULT NULL,
  `ServerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PostDate` date DEFAULT NULL,
  `ViewerNumber` int(11) DEFAULT NULL,
  `DownloadNumber` int(11) DEFAULT NULL,
  `Format` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Language` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VoteMark` int(11) DEFAULT NULL,
  `ResourceNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SummaryVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OderChapter` int(11) DEFAULT NULL,
  `Author` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UploadName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ResourceID`),
  KEY `fk_resource_resourcecategory` (`ResourceCategoryID`),
  KEY `fk_resource_subject` (`SubjectID`),
  CONSTRAINT `fk_resource_resourcecategory` FOREIGN KEY (`ResourceCategoryID`) REFERENCES `resourcecategory` (`ResourceCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_subject` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,7,1,'chapter1demo',NULL,NULL,'<p>summary chapter 1</p>',NULL,NULL,NULL,NULL,NULL,NULL,'demochuong1','<p>tổng quan chương 1</p>',1,NULL,NULL),(2,9,1,NULL,5229,'Image_file8429567255224932696','tÃ i liá»?u tham kháº£o demo 1',NULL,NULL,NULL,'rar',NULL,NULL,'tài liệu tham khảo demo 1',NULL,NULL,NULL,'Dump20111201.rar'),(3,10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tài nguyên doc demo',NULL,0,NULL,NULL),(4,7,3,'Chapter 1',NULL,NULL,'<p>summary 1</p>',NULL,NULL,NULL,NULL,NULL,NULL,'chương 1','<p>tóm tắt 1</p>',1,NULL,NULL),(5,7,3,'Chapter 2',NULL,NULL,'<p>summary 2</p>',NULL,NULL,NULL,NULL,NULL,NULL,'chương 2','<p>tóm tắt 2</p>',2,NULL,NULL),(6,6,3,'project 1',6990713,'project_file5716784500388840152',NULL,'2012-12-02',NULL,NULL,'rar',NULL,NULL,'đồ án 1',NULL,NULL,'A','Desktop.rar'),(7,6,3,'project 2',6990713,'project_file6152625052528009849',NULL,'2012-12-02',NULL,NULL,'rar',NULL,NULL,'đồ án 2',NULL,NULL,'B','Desktop.rar'),(8,6,3,'project 3',6990713,'project_file7697715299884994015',NULL,'2012-12-02',NULL,NULL,'rar',NULL,NULL,'đồ án 3',NULL,NULL,'C','Desktop.rar'),(9,10,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'pdt',NULL,NULL,'bài giảng 1',NULL,1,NULL,NULL),(10,10,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'doc',NULL,NULL,'bài giảng 2',NULL,2,NULL,NULL),(11,10,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ppt',NULL,NULL,'bải giảng 3',NULL,1,NULL,NULL),(12,9,3,'reading 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tài liệu tham khảo 1',NULL,NULL,NULL,NULL),(13,9,3,'reading 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tài liệu tham khảo 2',NULL,NULL,NULL,NULL),(14,9,3,'reading 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tài liệu tham khảo 3',NULL,NULL,NULL,NULL),(15,9,3,NULL,17340,'Image_file8620590396700820785','abcabc',NULL,NULL,NULL,'PNG',NULL,NULL,'tài liệu tham khảo 4',NULL,NULL,NULL,'Capture.PNG'),(16,6,3,'Web development J2EE',6938,'project_file7453454337060575780',NULL,'2012-12-02',NULL,NULL,'sql',NULL,NULL,'đồ án 1',NULL,NULL,'Hoang','27112011.sql');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2011-12-03  2:53:51
