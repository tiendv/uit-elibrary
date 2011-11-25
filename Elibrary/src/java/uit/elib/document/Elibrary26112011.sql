/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.0.51b-community-nt-log : Database - elibrary
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`elibrary` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `elibrary`;

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `ResourceID` int(11) NOT NULL auto_increment,
  `ResourceCategoryID` int(11) default NULL,
  `SubjectID` int(11) default NULL,
  `ResourceName` varchar(255) collate utf8_unicode_ci default NULL,
  `Size` int(11) default NULL,
  `ServerName` varchar(255) collate utf8_unicode_ci default NULL,
  `Summary` varchar(255) collate utf8_unicode_ci default NULL,
  `PostDate` date default NULL,
  `ViewerNumber` int(11) default NULL,
  `DownloadNumber` int(11) default NULL,
  `Format` varchar(45) collate utf8_unicode_ci default NULL,
  `Language` varchar(45) collate utf8_unicode_ci default NULL,
  `VoteMark` int(11) default NULL,
  `ResourceNameVN` varchar(255) collate utf8_unicode_ci default NULL,
  `SummaryVN` varchar(255) collate utf8_unicode_ci default NULL,
  `OderChapter` int(11) default NULL,
  `Author` varchar(11) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ResourceID`),
  KEY `fk_resource_resourcecategory` (`ResourceCategoryID`),
  KEY `fk_resource_subject` (`SubjectID`),
  CONSTRAINT `fk_resource_resourcecategory` FOREIGN KEY (`ResourceCategoryID`) REFERENCES `resourcecategory` (`ResourceCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_subject` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `resource` */

LOCK TABLES `resource` WRITE;

UNLOCK TABLES;

/*Table structure for table `resourcecategory` */

DROP TABLE IF EXISTS `resourcecategory`;

CREATE TABLE `resourcecategory` (
  `ResourceCategoryID` int(11) NOT NULL,
  `ResourceCategoryName` varchar(255) collate utf8_unicode_ci default NULL,
  `ResourceCategoryNameVN` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ResourceCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `resourcecategory` */

LOCK TABLES `resourcecategory` WRITE;

insert  into `resourcecategory`(`ResourceCategoryID`,`ResourceCategoryName`,`ResourceCategoryNameVN`) values (1,'Giáo trình',NULL),(2,'Khóa luận',NULL),(3,'Bài báo',NULL),(4,'Bài tập',NULL),(5,'Ví dụ',NULL),(6,'Đồ án mẫu',NULL),(7,'Chương',NULL),(8,'Ảnh',NULL),(9,'Tài liệu tham khảo',NULL),(10,'Bài giảng',NULL),(11,'Video',NULL);

UNLOCK TABLES;

/*Table structure for table `speciality` */

DROP TABLE IF EXISTS `speciality`;

CREATE TABLE `speciality` (
  `SpecialityID` int(11) NOT NULL,
  `SpecialityName` varchar(255) collate utf8_unicode_ci default NULL,
  `SpecialityNameVN` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`SpecialityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `speciality` */

LOCK TABLES `speciality` WRITE;

insert  into `speciality`(`SpecialityID`,`SpecialityName`,`SpecialityNameVN`) values (1,'Khoa học máy tính',NULL),(2,'Công nghệ phần mềm',NULL),(3,'Hệ thống thông tin',NULL),(4,'Kỹ thuật máy tính',NULL),(5,'Mạng máy tính và truyền thông',NULL);

UNLOCK TABLES;

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL auto_increment,
  `SubjectCategoryID` int(11) default NULL,
  `SpecialityID` int(11) default NULL,
  `SubjectName` varchar(255) collate utf8_unicode_ci default NULL,
  `SubjectIntroduce` text collate utf8_unicode_ci,
  `CreditNumber` int(11) default NULL,
  `Level` varchar(45) collate utf8_unicode_ci default NULL,
  `PeriodOfTheory` int(11) default NULL,
  `PeriodOfPractice` int(11) default NULL,
  `CourseCode` varchar(50) collate utf8_unicode_ci default NULL,
  `Teacher` varchar(255) collate utf8_unicode_ci default NULL,
  `PrerequisiteSubject` varchar(255) collate utf8_unicode_ci default NULL,
  `MidtermGrade` int(10) default NULL,
  `FinalGrade` int(10) default NULL,
  `SubjectNameVN` varchar(255) collate utf8_unicode_ci default NULL,
  `SubjectIntroduceVN` varchar(255) collate utf8_unicode_ci default NULL,
  `TimeTeaching` varchar(255) collate utf8_unicode_ci default NULL,
  `ProjectRequitement` text collate utf8_unicode_ci,
  `ProjectRequitementUS` text collate utf8_unicode_ci,
  PRIMARY KEY  (`SubjectID`),
  KEY `fk_subject_subjectcategory` (`SubjectCategoryID`),
  KEY `fk_subject_speciality` (`SpecialityID`),
  CONSTRAINT `fk_subject_speciality` FOREIGN KEY (`SpecialityID`) REFERENCES `speciality` (`SpecialityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_subjectcategory` FOREIGN KEY (`SubjectCategoryID`) REFERENCES `subjectcategory` (`SubjectCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `subject` */

LOCK TABLES `subject` WRITE;

UNLOCK TABLES;

/*Table structure for table `subjectcategory` */

DROP TABLE IF EXISTS `subjectcategory`;

CREATE TABLE `subjectcategory` (
  `SubjectCategoryID` int(11) NOT NULL,
  `SubjectCategoryName` varchar(255) collate utf8_unicode_ci default NULL,
  `SubjectCategoryNameVN` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`SubjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `subjectcategory` */

LOCK TABLES `subjectcategory` WRITE;

insert  into `subjectcategory`(`SubjectCategoryID`,`SubjectCategoryName`,`SubjectCategoryNameVN`) values (1,'Căn bản',NULL),(2,'Chuyên ngành',NULL),(3,'Tự chọn',NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;