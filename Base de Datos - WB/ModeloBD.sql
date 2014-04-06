SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Distrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Distrito` (
  `idDistrito` CHAR(8) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDistrito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` CHAR(8) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apepat` VARCHAR(45) NOT NULL,
  `ApeMat` VARCHAR(45) NOT NULL,
  `Fec_Nac` DATE NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `idDistrito` CHAR(8) NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `fk_Persona_Distrito1_idx` (`idDistrito` ASC),
  CONSTRAINT `fk_Persona_Distrito1`
    FOREIGN KEY (`idDistrito`)
    REFERENCES `mydb`.`Distrito` (`idDistrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rol_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rol_Usuario` (
  `idRol_Usuario` CHAR(2) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `Usuario` CHAR(20) NOT NULL,
  `Clave` CHAR(40) NOT NULL,
  `Persona_idPersona` CHAR(8) NOT NULL,
  `Rol_Usuario_idRol_Usuario` CHAR(2) NOT NULL,
  INDEX `fk_Usuario_Persona_idx` (`Persona_idPersona` ASC),
  PRIMARY KEY (`Persona_idPersona`),
  INDEX `fk_Usuario_Rol_Usuario1_idx` (`Rol_Usuario_idRol_Usuario` ASC),
  CONSTRAINT `fk_Usuario_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol_Usuario1`
    FOREIGN KEY (`Rol_Usuario_idRol_Usuario`)
    REFERENCES `mydb`.`Rol_Usuario` (`idRol_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Correo` (
  `idTipo_Correo` CHAR(1) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Correo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correo` (
  `idCorreo` CHAR(100) NOT NULL,
  `Persona_idPersona` CHAR(8) NOT NULL,
  `Tipo_Correo_idTipo_Correo` CHAR(1) NOT NULL,
  PRIMARY KEY (`idCorreo`),
  INDEX `fk_Correo_Persona1_idx` (`Persona_idPersona` ASC),
  INDEX `fk_Correo_Tipo_Correo1_idx` (`Tipo_Correo_idTipo_Correo` ASC),
  CONSTRAINT `fk_Correo_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Correo_Tipo_Correo1`
    FOREIGN KEY (`Tipo_Correo_idTipo_Correo`)
    REFERENCES `mydb`.`Tipo_Correo` (`idTipo_Correo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Telefono` (
  `idTipo_Telefono` CHAR(1) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Telefono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefono` (
  `NroTelefono` DECIMAL(10,0) NOT NULL,
  `Persona_idPersona` CHAR(8) NOT NULL,
  `Tipo_Telefono_idTipo_Telefono` CHAR(1) NOT NULL,
  PRIMARY KEY (`NroTelefono`),
  INDEX `fk_Telefono_Persona1_idx` (`Persona_idPersona` ASC),
  INDEX `fk_Telefono_Tipo_Telefono1_idx` (`Tipo_Telefono_idTipo_Telefono` ASC),
  CONSTRAINT `fk_Telefono_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefono_Tipo_Telefono1`
    FOREIGN KEY (`Tipo_Telefono_idTipo_Telefono`)
    REFERENCES `mydb`.`Tipo_Telefono` (`idTipo_Telefono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
