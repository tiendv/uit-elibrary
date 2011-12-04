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
DROP DATABASE elibrary;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `elibrary` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `elibrary`;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `FacultyID` int(11) NOT NULL,
  `FacultyNameEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FacultyNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Computer science','Khoa học máy tính'),(2,'Software engineering','Công nghệ phần mềm'),(3,'hệ thống thông tin','Hệ thống thông tin'),(4,'Kỹ thuật máy tình','Kỹ thuật máy tính'),(5,'MMT & TT','Mạng máy tính và truyền thông');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `resourcecategory`
--

DROP TABLE IF EXISTS `resourcecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcecategory` (
  `ResourceCategoryID` int(11) NOT NULL,
  `ResourceCategoryNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ResourceCategoryNameEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ResourceCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcecategory`
--

LOCK TABLES `resourcecategory` WRITE;
/*!40000 ALTER TABLE `resourcecategory` DISABLE KEYS */;
INSERT INTO `resourcecategory` VALUES (1,'Giáo trình','Subject'),(2,'Khóa luận','Khóa luận'),(3,'Bài báo','Paper'),(4,'Bài tập','Assignments'),(5,'Ví dụ','Example'),(6,'Đồ án mẫu','Project'),(7,'Chương','Chapter'),(8,'Ảnh','Image'),(9,'Tài liệu tham khảo','Reading'),(10,'Bài giảng','Lecture Note'),(11,'Video','Video');
/*!40000 ALTER TABLE `resourcecategory` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `subjectcategory`
--

DROP TABLE IF EXISTS `subjectcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjectcategory` (
  `SubjectCategoryID` int(11) NOT NULL,
  `SubjectCategoryNameEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectCategoryNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SubjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectcategory`
--

LOCK TABLES `subjectcategory` WRITE;
/*!40000 ALTER TABLE `subjectcategory` DISABLE KEYS */;
INSERT INTO `subjectcategory` VALUES (1,'Base','Cơ sở'),(2,'Sub major','Chuyên ngành'),(3,'Optional','Tự chọn');
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
  `FacultyID` int(11) DEFAULT NULL,
  `SubjectNameVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectNameEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SubjectIntroduceVN` text COLLATE utf8_unicode_ci,
  `SubjectIntroduceEN` text COLLATE utf8_unicode_ci,
  `NumberOfCredit` int(11) DEFAULT NULL,
  `Level` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PeriodOfTheory` int(11) DEFAULT NULL,
  `PeriodOfPractice` int(11) DEFAULT NULL,
  `CourseCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Teacher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PrerequisiteSubjectVN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PrerequisiteSubjectEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MidtermGrade` int(10) DEFAULT NULL,
  `FinalGrade` int(10) DEFAULT NULL,
  `TimeTeaching` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProjectRequirementEN` text COLLATE utf8_unicode_ci,
  `ProjectRequirementVN` text COLLATE utf8_unicode_ci,
  `NumberChapter` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `fk_subject_subjectcategory` (`SubjectCategoryID`),
  KEY `fk_subject_speciality` (`FacultyID`),
  CONSTRAINT `fk_subject_faculty` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_subjectcategory` FOREIGN KEY (`SubjectCategoryID`) REFERENCES `subjectcategory` (`SubjectCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
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
  `ResourceNameVN` text COLLATE utf8_unicode_ci,
  `ResourceNameEN` text COLLATE utf8_unicode_ci,
  `Size` int(11) DEFAULT NULL,
  `ServerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SummaryVN` text COLLATE utf8_unicode_ci,
  `SummaryEN` text COLLATE utf8_unicode_ci,
  `PostDate` date DEFAULT NULL,
  `ViewerNumber` int(11) DEFAULT NULL,
  `DownloadNumber` int(11) DEFAULT NULL,
  `Format` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Language` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VoteMark` int(11) DEFAULT NULL,
  `OrderChapter` int(11) DEFAULT NULL,
  `Author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UploadName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ResourceID`),
  KEY `fk_resource_resourcecategory` (`ResourceCategoryID`),
  KEY `fk_resource_subject` (`SubjectID`),
  CONSTRAINT `fk_resource_resourcecategory` FOREIGN KEY (`ResourceCategoryID`) REFERENCES `resourcecategory` (`ResourceCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_subject` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2011-12-04  1:13:50
