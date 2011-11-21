SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `elibrary` ;
CREATE SCHEMA IF NOT EXISTS `elibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `elibrary` ;

-- -----------------------------------------------------
-- Table `elibrary`.`resourcecategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elibrary`.`resourcecategory` ;

CREATE  TABLE IF NOT EXISTS `elibrary`.`resourcecategory` (
  `ResourceCategoryID` INT(11) NOT NULL ,
  `ResourceCategoryName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`ResourceCategoryID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `elibrary`.`speciality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elibrary`.`speciality` ;

CREATE  TABLE IF NOT EXISTS `elibrary`.`speciality` (
  `SpecialityID` INT(11) NOT NULL ,
  `SpecialityName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`SpecialityID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `elibrary`.`subjectcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elibrary`.`subjectcategory` ;

CREATE  TABLE IF NOT EXISTS `elibrary`.`subjectcategory` (
  `SubjectCategoryID` INT(11) NOT NULL ,
  `SubjectCategoryName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`SubjectCategoryID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `elibrary`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elibrary`.`subject` ;

CREATE  TABLE IF NOT EXISTS `elibrary`.`subject` (
  `SubjectID` INT(11) NOT NULL ,
  `SubjectCategoryID` INT(11) NULL DEFAULT NULL ,
  `SpecialityID` INT(11) NULL DEFAULT NULL ,
  `SubjectName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `SubjectIntroduce` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `CreditNumber` INT(11) NULL DEFAULT NULL ,
  `Level` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `PeriodOfTheory` INT(11) NULL DEFAULT NULL ,
  `PeriodOfPractice` INT(11) NULL DEFAULT NULL ,
  `CourseCode` varchar(50) collate utf8_unicode_ci default NULL,
  `Tearcher` varchar(255) collate utf8_unicode_ci default NULL,
  `PrerequisiteSubject` varchar(255) collate utf8_unicode_ci default NULL,
  `MidtermGrade` int(10) default NULL,
  `FinalGrade` int(10) default NULL,
  `IDResourceImage` int(11) default NULL,
  PRIMARY KEY (`SubjectID`) ,
  INDEX `fk_subject_subjectcategory` (`SubjectCategoryID` ASC) ,
  INDEX `fk_subject_speciality` (`SpecialityID` ASC) ,
  CONSTRAINT `fk_subject_speciality`
    FOREIGN KEY (`SpecialityID` )
    REFERENCES `elibrary`.`speciality` (`SpecialityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_subjectcategory`
    FOREIGN KEY (`SubjectCategoryID` )
    REFERENCES `elibrary`.`subjectcategory` (`SubjectCategoryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `elibrary`.`resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elibrary`.`resource` ;

CREATE  TABLE IF NOT EXISTS `elibrary`.`resource` (
  `ResourceID` INT(11) NOT NULL ,
  `ResourceCategoryID` INT(11) NULL DEFAULT NULL ,
  `SubjectID` INT(11) NULL DEFAULT NULL ,
  `ResourceName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `Size` INT(11) NULL DEFAULT NULL ,
  `RealDownloadLink` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `ServerDownloadLink` VARCHAR(255) NULL ,
  `ServerImageLink` VARCHAR(255) NULL ,
  `Summary` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `PostDate` DATE NULL DEFAULT NULL ,
  `ViewerNumber` INT(11) NULL DEFAULT NULL ,
  `DownloadNumber` INT(11) NULL DEFAULT NULL ,
  `Format` VARCHAR(45) NULL ,
  `Language` VARCHAR(45) NULL ,
  `VoteMark` INT NULL ,
  PRIMARY KEY (`ResourceID`) ,
  INDEX `fk_resource_resourcecategory` (`ResourceCategoryID` ASC) ,
  INDEX `fk_resource_subject` (`SubjectID` ASC) ,
  CONSTRAINT `fk_resource_resourcecategory`
    FOREIGN KEY (`ResourceCategoryID` )
    REFERENCES `elibrary`.`resourcecategory` (`ResourceCategoryID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_subject`
    FOREIGN KEY (`SubjectID` )
    REFERENCES `elibrary`.`subject` (`SubjectID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `elibrary`.`resourcecategory`
-- -----------------------------------------------------
START TRANSACTION;
USE `elibrary`;
INSERT INTO `elibrary`.`resourcecategory` (`ResourceCategoryID`, `ResourceCategoryName`) VALUES (1, 'Giáo trình');
INSERT INTO `elibrary`.`resourcecategory` (`ResourceCategoryID`, `ResourceCategoryName`) VALUES (2, 'Khóa luận');
INSERT INTO `elibrary`.`resourcecategory` (`ResourceCategoryID`, `ResourceCategoryName`) VALUES (3, 'Bài báo');
INSERT INTO `elibrary`.`resourcecategory` (`ResourceCategoryID`, `ResourceCategoryName`) VALUES (4, 'Bài tập');

COMMIT;

-- -----------------------------------------------------
-- Data for table `elibrary`.`speciality`
-- -----------------------------------------------------
START TRANSACTION;
USE `elibrary`;
INSERT INTO `elibrary`.`speciality` (`SpecialityID`, `SpecialityName`) VALUES (1, 'Khoa học máy tính');
INSERT INTO `elibrary`.`speciality` (`SpecialityID`, `SpecialityName`) VALUES (2, 'Công nghệ phần mềm');
INSERT INTO `elibrary`.`speciality` (`SpecialityID`, `SpecialityName`) VALUES (3, 'Hệ thống thống tin');
INSERT INTO `elibrary`.`speciality` (`SpecialityID`, `SpecialityName`) VALUES (4, 'Kỹ thuật máy tính');
INSERT INTO `elibrary`.`speciality` (`SpecialityID`, `SpecialityName`) VALUES (5, 'Mạng máy tính và truyền thông');

COMMIT;

-- -----------------------------------------------------
-- Data for table `elibrary`.`subjectcategory`
-- -----------------------------------------------------
START TRANSACTION;
USE `elibrary`;
INSERT INTO `elibrary`.`subjectcategory` (`SubjectCategoryID`, `SubjectCategoryName`) VALUES (1, 'Cơ bàn');
INSERT INTO `elibrary`.`subjectcategory` (`SubjectCategoryID`, `SubjectCategoryName`) VALUES (2, 'Chuyên ngành');
INSERT INTO `elibrary`.`subjectcategory` (`SubjectCategoryID`, `SubjectCategoryName`) VALUES (3, 'Tự chọn');

COMMIT;
