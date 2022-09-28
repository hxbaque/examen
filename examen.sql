-- MySQL Script generated by MySQL Workbench
-- Wed Sep 28 02:26:46 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8 ;
USE `examen` ;

-- -----------------------------------------------------
-- Table `examen`.`genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `examen`.`genero` ;

CREATE TABLE IF NOT EXISTS `examen`.`genero` (
  `idGenero` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`categoria`
-- -----------------------------------------------------
-- MySQL Script generated by MySQL Workbench
-- Wed Sep 28 02:26:46 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8 ;
USE `examen` ;

-- -----------------------------------------------------
-- Table `examen`.`genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genero` ;

CREATE TABLE IF NOT EXISTS .`genero` (
  `idGenero` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categoria` ;

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cliente` ;

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` INT NOT NULL,
  `cedula` VARCHAR(10) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `genero` INT NOT NULL,
  `fechaNacimiento` DATETIME NULL,
  `categoria` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_cliente_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`idGenero`),
  CONSTRAINT `fk_cliente_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`tipo_contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_contacto` ;

CREATE TABLE IF NOT EXISTS `tipo_contacto` (
  `idTipoContacto` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoContacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`contacto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contacto` ;

CREATE TABLE IF NOT EXISTS `contacto` (
  `idContacto` INT NOT NULL,
  `cliente` INT NOT NULL,
  `tipoContacto` INT NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idContacto`),
  CONSTRAINT `fk_contacto_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_tipo_contacto` FOREIGN KEY (`tipoContacto`) REFERENCES `tipo_contacto` (`idTipoContacto`) ON DELETE NO ACTION ON UPDATE NO ACTION )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into tipo_contacto(idTipoContacto,descripcion) values(1,'Dirrecion Trabajo'); 
insert into tipo_contacto(idTipoContacto,descripcion) values(2,'Dirrecion Domicilio'); 
insert into tipo_contacto(idTipoContacto,descripcion) values(3,'Telefono Trabajo'); 
insert into tipo_contacto(idTipoContacto,descripcion) values(4,'Telefono Personal'); 
insert into tipo_contacto(idTipoContacto,descripcion) values(5,'Telefono Domicilio'); 

insert into genero(idGenero,descripcion) values(1,'Masculino');
insert into genero(idGenero,descripcion) values(2,'Femenino');

insert into categoria(idCategoria,descripcion) values(1,'Bronce');
insert into categoria(idCategoria,descripcion) values(2,'Silver');
insert into categoria(idCategoria,descripcion) values(3,'Gold');
insert into categoria(idCategoria,descripcion) values(4,'Platinum');
insert into cliente(idCliente,cedula,nombre,apellido,genero,fechaNacimiento,categoria) values(1,'0950578942','JOSE','PEÑA',1,now(),1); 
insert into contacto(idContacto,cliente,tipoContacto,valor) values(1,1,1,"Las Peñas");
