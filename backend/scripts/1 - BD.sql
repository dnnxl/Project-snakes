-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Image` (
  `NbImage` INT NOT NULL AUTO_INCREMENT,
  `SnakeType` TINYINT NULL,
  PRIMARY KEY (`NbImage`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idImagen_UNIQUE` ON `mydb`.`Image` (`NbImage` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`PrincipalInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PrincipalInformation` (
  `idPrincipalInformation` INT NOT NULL AUTO_INCREMENT,
  `DTSighting` DATE NOT NULL,
  `XCoordinate` FLOAT NOT NULL,
  `YCoordinate` FLOAT NOT NULL,
  `AditionalInformation` VARCHAR(500) NULL,
  `Image_NbImage` INT NOT NULL,
  PRIMARY KEY (`idPrincipalInformation`),
  CONSTRAINT `fk_PrincipalInformation_Image1`
    FOREIGN KEY (`Image_NbImage`)
    REFERENCES `mydb`.`Image` (`NbImage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PrincipalInformation_Image1_idx` ON `mydb`.`PrincipalInformation` (`Image_NbImage` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Sighting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sighting` (
  `NbSighting` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NULL,
  `UserContact` VARCHAR(45) NULL,
  `DTSighting` DATE default (DATE(CURRENT_TIMESTAMP)),
  `XCoordinate` FLOAT NOT NULL,
  `YCoordinate` FLOAT NOT NULL,
  `TxtComent` VARCHAR(45) NULL,
  `Image_NbImage` INT NOT NULL,
  `PrincipalInformation_idPrincipalInformation` INT NOT NULL,
  PRIMARY KEY (`NbSighting`),
  CONSTRAINT `fk_Sighting_Image`
    FOREIGN KEY (`Image_NbImage`)
    REFERENCES `mydb`.`Image` (`NbImage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sighting_PrincipalInformation1`
    FOREIGN KEY (`PrincipalInformation_idPrincipalInformation`)
    REFERENCES `mydb`.`PrincipalInformation` (`idPrincipalInformation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idAvistamiento_UNIQUE` ON `mydb`.`Sighting` (`NbSighting` ASC) VISIBLE;

CREATE INDEX `fk_Sighting_Image_idx` ON `mydb`.`Sighting` (`Image_NbImage` ASC) VISIBLE;

CREATE INDEX `fk_Sighting_PrincipalInformation1_idx` ON `mydb`.`Sighting` (`PrincipalInformation_idPrincipalInformation` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LogBook` (
  `idLogBook` INT NOT NULL AUTO_INCREMENT,
  `change` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idLogBook`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `NbSpecialist` INT NOT NULL AUTO_INCREMENT,
  `NameSpecialist` VARCHAR(45) NOT NULL,
  `PaswordSpecialist` VARCHAR(45) NULL,
  `AuthorAnswer` VARCHAR(45) NULL,
  PRIMARY KEY (`NbSpecialist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SightingByAnswer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SightingByAnswer` (
  `idSightingByAnswer` INT NOT NULL AUTO_INCREMENT,
  `TextAnswer` VARCHAR(45) NULL,
  `Sighting_NbSighting` INT NOT NULL,
  `answer_Nbanswer` INT NOT NULL,
  PRIMARY KEY (`idSightingByAnswer`),
  CONSTRAINT `fk_SightingByAnswer_Sighting1`
    FOREIGN KEY (`Sighting_NbSighting`)
    REFERENCES `mydb`.`Sighting` (`NbSighting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SightingByAnswer_answer1`
    FOREIGN KEY (`answer_Nbanswer`)
    REFERENCES `mydb`.`Specialist` (`NbSpecialist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SightingByAnswer_Sighting1_idx` ON `mydb`.`SightingByAnswer` (`Sighting_NbSighting` ASC) VISIBLE;

CREATE INDEX `fk_SightingByAnswer_answer1_idx` ON `mydb`.`SightingByAnswer` (`answer_Nbanswer` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
