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
INSERT INTO `faculty` VALUES (1,'Computer science','Khoa học máy tính'),(2,'Software engineering','Công nghệ phần mềm'),(3,'Information system','Hệ thống thông tin'),(4,'Computer technical','Kỹ thuật máy tính'),(5,'Computer network & Communication','Mạng máy tính và truyền thông');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,1,NULL,'Đại số','Algebra','Nội dung môn học bao gồm: những kiến thức cơ bản về ma trận, định thức và giải hệ phương trình tuyến tính, không gian tuyến tính(cơ sở, số chiều, không gian con, …)và ánh xạ tuyến tính (các phép toán, nhân, ảnh, …), dạng song song tuyến tính và dạng toàn phương.','none',3,'Đại học',45,0,'DS001','None','Không có','None',30,70,'12','None','None',00000000003),(2,1,NULL,'Cấu trúc rời rạc','Discrete Structures','Cung cấp cho sinh viên những kiến thức cơ bản về toán rời rạc (cơ sở logic toán, tập hợp và quan hệ hai ngôi, đại số bool và hàm bool). Đồ thị và cây và một số khái niệm cơ bản của lý thuyết đồ thị .','None',4,'Đại học',60,0,'CT001','None','Đại số','Algebra',30,70,'12','None','None',00000000003),(3,2,2,'Nhập môn phát triển Game ','Introduction To Video Game Development','Môn học cung cấp cho sinh viên những kiến thức cơ bản về quy trình hình thành và phát triển một trò chơi điện tử; các kỹ thuật cơ bản trong lập trình Game 2D trên máy tính và những ý niệm ban đầu về thiết kế trò chơi điện tử. Sinh viên có khả năng phát triển game tetris, battle Tank, Isometric game.','none',4,'Đại học',30,30,'NM001','None','Tin học đại cương, Lập trình for Windows, Cấu trúc dữ liệu và giải thuật','Programming Windows',30,70,'12','None','None',00000000003),(4,2,2,'Nhập môn công nghệ phần mềm','Introduction about Software Engineering','Học phần cung cấp những hiểu biết cơ sở về  quy trình phát triển phần mềm  theo quy cách công nghiệp: phân tích yêu cầu, thiết kế phần mềm, cài đặt, kiểm thử, vận hành và bảo trì phần mềm. Học phần cũng cung cấp cho sinh viên các công nghệ cơ bản được dùng trong các khâu của tiến trình phát triển phần mềm.','None',4,'Đại học',45,45,'NM002','None','Tin học đại cương, Cơ sở dữ liệu, Cấu trúc dữ liệu và giải thuật','Programming Windows',30,70,'15','None','None',00000000003),(5,2,1,'Đặc tả hình thức ','Formal Specification','Môn học nhằm Cung cấp cho sinh viên các kiến thức liên quan đến hướng tiếp cận xây dựng phần mềm dùng đặc tả hình thức, các thành phần cơ sở trong đặc tả hình thức nói chung như cơ sở toán học, mô hình hoá dữ liệu kiểu tập hợp, đặc tả hàm, số và kiểu mảng, kiểu đối tượng phức và ánh xạ, và các ngôn ngữ đặc tả hình thức Z & VDM.','None',4,'Đại học',60,0,'DT001','None','Tin học đại cương, Lập trình hướng đối tượng, Cấu trúc dữ liệu và giải thuật','None',40,60,'13','None','None',00000000003),(6,2,1,'Quản lý dự án công nghệ thông tin','Information Technology Project Management','Cung cấp những hiểu biết về cách quản lý và thực hiện dự án Công nghệ thông tin. Giới thiệu những tri thức cốt lõi về quản lý dự án nói chung và quản lý dự án Công nghệ thông tin nói riêng. Đề cập tới những yêu cầu kỹ năng của người quản lý dự án so với yêu cầu quản lý kỹ thuật.','None',4,'Đại học',45,30,'QL001','None','Tin học đại cương, Kiến trúc máy tính, Lập trình nhúng cơ bản','None',30,70,'9','None','None',00000000003),(7,3,1,'Giao tiếp người máy ','Human Computer Interaction','Nội dung môn học giới thiệu cho sinh viên những vấn đề cơ bản thiết kế giao tiếp người máy. Kết thúc khoá học sinh viên có khả năng hiểu và nắm các quy trình thiết kế giao diện.','None',4,'Đại học',45,45,'GT1','None','Tin học đại cương, Nhập môn công nghệ phần mềm','Introduction about Software Engineering',30,70,'15','None','None',00000000003),(8,3,1,'Thống kê tin học ','Statistics informatics','Cung cấp cho sinh viên những kiến thức cơ bản về hiên tượng và đại lượng ngẫu nhiên cùng các phương pháp của toán thống kê .Trình bày những khái niệm nền tảng cùa giải tích ngẫu nhiên.Giới thiệu về một số phần mềm thựchành thông dụng trong thống kê.','None',4,'Đại học',60,45,'KN001','None','Đại số','Algebra',30,70,'12','None','None',00000000003),(9,3,3,'Công nghệ XML và ứng dụng ','XML and Its Applications','Môn học nhằm cung cấp cho sinh viên những kiến thức cơ sở về những khái niệm, nguyên tắc để đặc tả tài liệu XML hợp lệ, các kỹ thuật chuyển đổi, truy vấn và xử lý dữ liệu trong XML. Bên cạnh đó, môn học giúp sinh viên tìm hiểu về một số kỹ thuật cốt lõi để khai thác tính năng ứng dụng mạnh mẽ của ngôn ngữ này.','None',4,'Đại học',45,60,'CN002','None','Cơ sở dữ liệu','None',30,70,'15','None','None',00000000003),(10,3,4,'Xử lý song song ','Paralell Programming','Khóa học trang bị cho học viên kiến thức để thiết kế các thuật toán song song hiệu quả như Thiết kế các thuật toán song song, Phân tích hiệu năng của chương trình song song, Lập trình đa tuyến với POSIX, Lập trình với OpenMP và ứng dựng các kỹ thuật lập trình song song để giải quyết các bài toán khoa học.','None',4,'Đại học',60,90,'XL001','None','Cấu trúc dữ liệu và giải thuật','None',40,60,'12','None','None',00000000003),(11,3,5,'Công nghệ Portal ','Web Portal Technology','Môn học nhằm cung cấp cho sinh viên những kiến thức cơ sở về thế hệ Website mới, đó là “Website thông minh” hay “cổng điện tử”. Ngoài ra môn học còn cung cấp cho sinh viên các vấn đề liên quan tới thiết kế, xây dựng các cổng điện tử, đặc biệt là chính phủ điện tử, thương mại điện tử.','None',4,'Đại học',40,60,'CN003','None','Lập trình for Windows, Ngôn ngữ lập trình Java','None',50,50,'15','None','None',00000000003),(12,3,2,'Thiết kế 3D Game Engine ','3D Engine Game Design','Môn học cung cấp cho sinh viên kiến thức cơ bản về kiến trúc của 3D Game Engine; cách thiết kế và xây dựng các thành phần cơ bản của 3D Game Engine như Scene Graphs, Portal, BSP, Lightning & Shadow, Animation, … Kết thúc khóa học, sinh viên sẽ có khả năng tự thiết kế và xây dựng một 3D Engine phục vụ cho các game 3D tương đối phức tạp cũng như có thể nhanh chóng tiếp cận và sử dụng một 3D Game Engine có sẵn để xây dựng một 3D game.','None',4,'Đại học',45,75,'TK001','None','Nhập môn lập trình 3D game','none',40,60,'12','None','None',00000000003),(13,1,NULL,'Giải tích I ','Calculus I','Trang bị cho sinh viên những kiến thức cơ bản về Toán giải tích và cách vận dụng để giải quyết các bài toán kỹ thuât và công nghệ. Khối luợng kiến thức này được kết nối một cách hợp lý với các phần sau tạo nên nền tảng quan trọng về toán cao cấp để người học tiếp thu được các kiến thức cơ sở ngành. Giới hạn ,đạo hàm, vi phân của hàm biến thực. Tích phân, bội, đường, mặt.','None',4,'Đại học',60,90,'GT001','None','Đại số','Algebra',30,70,'12','None','None',00000000003);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,8,1,NULL,NULL,12,'1.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'1.jpg'),(2,8,2,NULL,NULL,12,'2.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'2.jpg'),(3,8,3,NULL,NULL,12,'3.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'3.jpg'),(4,8,4,NULL,NULL,15,'4.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'4.jpg'),(5,8,5,NULL,NULL,12,'5.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'5.jpg'),(6,8,6,NULL,NULL,11,'6.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'6.jpg'),(7,8,7,NULL,NULL,12,'7.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'7.jpg'),(8,8,8,NULL,NULL,11,'8.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'8.jpg'),(9,8,9,NULL,NULL,12,'9.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'9.jpg'),(10,8,10,NULL,NULL,12,'10.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'10.jpg'),(11,8,11,NULL,NULL,11,'11.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'11.jpg'),(12,8,12,NULL,NULL,12,'12.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'12.jgp'),(13,8,13,NULL,NULL,13,'13.jpg',NULL,NULL,NULL,NULL,NULL,'jpg',NULL,NULL,NULL,NULL,'13.jpg'),(14,10,1,NULL,NULL,NULL,'tailieu.xlsx',NULL,NULL,NULL,NULL,NULL,'xlsx',NULL,NULL,1,NULL,'tlieu.xlsx'),(15,7,1,'Chương 1','Chapter 1',NULL,NULL,'Giới thiệu môn học','Subject Introduce',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(16,7,1,'Chương 2','Chapter 2',NULL,NULL,'Bài mở đầu','Begin',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(17,7,2,'Chương 1','Chapter 1',NULL,NULL,'Giới thiệu môn học','Subject introduce',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL),(18,7,2,'Chương 2','Chapter 2',NULL,NULL,'Khái quát tầm nhìn Cấu Trúc Rời Rạc','Summary Discrete Structures',NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(19,4,1,NULL,NULL,NULL,'tailieu.docx',NULL,NULL,NULL,NULL,NULL,'docx',NULL,NULL,1,NULL,'tlieu.docx'),(20,6,1,'Đồ án Đại Số 1','Algebla project 1',NULL,'doan1.docx','Đồ án mẫu của môn Đại Số năm 2009','Project template 2009',NULL,NULL,NULL,'docx',NULL,NULL,NULL,'Tăng Phước Đại','doandaiso1.docx'),(21,6,1,'Đồ án Đại số 2','Algebra project 2',NULL,'doan2.docx','Đồ án mẩu của môn Đại số năm 2010','Project template 2010',NULL,NULL,NULL,'docx',NULL,NULL,NULL,'Võ Đình Bảy','doandaiso2.docx'),(22,6,1,'Đồ án Đại số 3','Algebra project 3',NULL,'doan3.docx','Đồ án mẫu của năm 2011','Projecttemplate 2011',NULL,NULL,NULL,'docx',NULL,NULL,NULL,'Lăng Uy Tín','doandaiso3.docx'),(23,9,1,'Nhập môn Đại Số - NXB Giáo Dục 2000','Algebra begin -2000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,9,1,'Đại Số Nâng Cao - NXB trẻ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,9,1,'Cấu trúc chương trình với Đại số - Đồng Nai 1998',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,10,1,NULL,NULL,NULL,'tl.docx',NULL,NULL,NULL,NULL,NULL,'docx',NULL,NULL,1,NULL,'tailieu.docx'),(27,4,1,NULL,NULL,NULL,'btap.pptx',NULL,NULL,NULL,NULL,NULL,'pptx',NULL,NULL,2,NULL,'baitapchuong2.pptx');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-12-05 17:53:12
