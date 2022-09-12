
-- Fri Sep  9 17:39:34 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema notas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema notas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notas` DEFAULT CHARACTER SET utf8mb3 ;
USE `notas` ;

-- -----------------------------------------------------
-- Table `notas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `fechaCreacion` DATETIME NOT NULL,
  `ultimaModificacion` DATETIME NOT NULL,
  `descripcion` TEXT NOT NULL,
  `eliminable` TINYINT NOT NULL,
  `id_categorias` INT NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_usario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_notas_usario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `notas`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notas`.`categoriaNota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas`.`categoriaNota` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_categoria` INT NULL,
  `id_nota` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoriaNota_categoria_idx` (`id_categoria` ASC) VISIBLE,
  INDEX `fk_categoriaNota_nota_idx` (`id_nota` ASC) VISIBLE,
  CONSTRAINT `fk_categoriaNota_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `notas`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoriaNota_nota`
    FOREIGN KEY (`id_nota`)
    REFERENCES `notas`.`notas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;