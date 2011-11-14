SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `elibrary` ;
CREATE SCHEMA IF NOT EXISTS `elibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `elibrary` ;

-- -----------------------------------------------------
-- Table `elibrary`.`resourcescategory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `elibrary`.`resourcescategory` (
  `ResourceCategoryID` INT(11) NOT NULL ,
  `ResourceCategoryName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  PRIMARY KEY (`ResourceCategoryID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `elibrary`.`speciality`
-- -----------------------------------------------------
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
  PRIMARY KEY (`SubjectID`) ,
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

CREATE INDEX `fk_subject_subjectcategory` ON `elibrary`.`subject` (`SubjectCategoryID` ASC) ;

CREATE INDEX `fk_subject_speciality` ON `elibrary`.`subject` (`SpecialityID` ASC) ;


-- -----------------------------------------------------
-- Table `elibrary`.`resources`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `elibrary`.`resources` (
  `ResourceID` INT(11) NOT NULL ,
  `ResourceCategoryID` INT(11) NULL DEFAULT NULL ,
  `SubjectID` INT(11) NULL DEFAULT NULL ,
  `ResourceName` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `Size` INT(11) NULL DEFAULT NULL ,
  `DownloadLink` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `ImageLink` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `Summary` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL ,
  `PostDate` DATE NULL DEFAULT NULL ,
  `ViewerNumber` INT(11) NULL DEFAULT NULL ,
  `DownloadNumber` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`ResourceID`) ,
  CONSTRAINT `fk_resource_resourcecategory`
    FOREIGN KEY (`ResourceCategoryID` )
    REFERENCES `elibrary`.`resourcescategory` (`ResourceCategoryID` )
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

CREATE INDEX `fk_resource_resourcecategory` ON `elibrary`.`resources` (`ResourceCategoryID` ASC) ;

CREATE INDEX `fk_resource_subject` ON `elibrary`.`resources` (`SubjectID` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
