-- MySQL Script generated by MySQL Workbench
-- Fri Sep 18 15:39:13 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tfg
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tfg` ;

-- -----------------------------------------------------
-- Schema tfg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tfg` DEFAULT CHARACTER SET utf8 ;
USE `tfg` ;

-- -----------------------------------------------------
-- Table `tfg`.`fichas_clinica_ets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`fichas_clinica_ets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vih` TINYINT(1) NULL,
  `sifilis` TINYINT(1) NULL,
  `hepatitis_b` TINYINT(1) NULL,
  `hpv` TINYINT(1) NULL,
  `comentario` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`fichas_clinica_piel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`fichas_clinica_piel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `psoriasis` TINYINT(1) NULL,
  `eccema` TINYINT(1) NULL,
  `queloide` TINYINT(1) NULL,
  `comentario` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`fichas_clinicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`fichas_clinicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grupo_sanguineo` CHAR(2) NULL,
  `factor_rh` CHAR(1) NULL,
  `alergias` VARCHAR(255) NULL,
  `problemas_cardiacos` VARCHAR(255) NULL,
  `comentarios` VARCHAR(255) NULL,
  `fichas_clinica_ets_id` INT NOT NULL,
  `fichas_clinica_piel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fichas_clinicas_fichas_clinica_ets_idx` (`fichas_clinica_ets_id` ASC),
  INDEX `fk_fichas_clinicas_fichas_clinica_piel1_idx` (`fichas_clinica_piel_id` ASC),
  CONSTRAINT `fk_fichas_clinicas_fichas_clinica_ets`
    FOREIGN KEY (`fichas_clinica_ets_id`)
    REFERENCES `tfg`.`fichas_clinica_ets` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichas_clinicas_fichas_clinica_piel1`
    FOREIGN KEY (`fichas_clinica_piel_id`)
    REFERENCES `tfg`.`fichas_clinica_piel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` TINYINT NOT NULL,
  `nombre` VARCHAR(64) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`personas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_documento` VARCHAR(64) NOT NULL,
  `nombre` VARCHAR(64) NOT NULL,
  `apellido` VARCHAR(64) NOT NULL,
  `telefono` VARCHAR(64) NOT NULL,
  `domicilio` VARCHAR(64) NOT NULL,
  `correo_electronico` VARCHAR(64) NOT NULL,
  `categorias_id_tipo_documento` INT NOT NULL,
  `categorias_id_rol` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_personas_categorias1_idx` (`categorias_id_tipo_documento` ASC),
  INDEX `fk_personas_categorias2_idx` (`categorias_id_rol` ASC),
  CONSTRAINT `fk_personas_categorias1`
    FOREIGN KEY (`categorias_id_tipo_documento`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_categorias2`
    FOREIGN KEY (`categorias_id_rol`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fichas_clinicas_id` INT NOT NULL,
  `personas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clientes_fichas_clinicas1_idx` (`fichas_clinicas_id` ASC),
  INDEX `fk_clientes_personas1_idx` (`personas_id` ASC),
  CONSTRAINT `fk_clientes_fichas_clinicas1`
    FOREIGN KEY (`fichas_clinicas_id`)
    REFERENCES `tfg`.`fichas_clinicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `tfg`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`usuarios` (
  `nombre` VARCHAR(64) NOT NULL,
  `contrasenia_hash` VARCHAR(255) NOT NULL,
  `ultimo_cambio` DATETIME NOT NULL,
  `activo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`tatuadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`tatuadores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_nombre` VARCHAR(64) NOT NULL,
  `personas_id` INT NOT NULL,
  `pseudonimo` VARCHAR(64) NULL,
  `color_hex` CHAR(7) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tatuadores_usuarios1_idx` (`usuarios_nombre` ASC),
  INDEX `fk_tatuadores_personas1_idx` (`personas_id` ASC),
  CONSTRAINT `fk_tatuadores_usuarios1`
    FOREIGN KEY (`usuarios_nombre`)
    REFERENCES `tfg`.`usuarios` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tatuadores_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `tfg`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`encargados_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`encargados_compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_nombre` VARCHAR(64) NOT NULL,
  `personas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_encargados_compras_usuarios1_idx` (`usuarios_nombre` ASC),
  INDEX `fk_encargados_compras_personas1_idx` (`personas_id` ASC),
  CONSTRAINT `fk_encargados_compras_usuarios1`
    FOREIGN KEY (`usuarios_nombre`)
    REFERENCES `tfg`.`usuarios` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_encargados_compras_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `tfg`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`recepcionistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`recepcionistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_nombre` VARCHAR(64) NOT NULL,
  `personas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recepcionistas_usuarios1_idx` (`usuarios_nombre` ASC),
  INDEX `fk_recepcionistas_personas1_idx` (`personas_id` ASC),
  CONSTRAINT `fk_recepcionistas_usuarios1`
    FOREIGN KEY (`usuarios_nombre`)
    REFERENCES `tfg`.`usuarios` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recepcionistas_personas1`
    FOREIGN KEY (`personas_id`)
    REFERENCES `tfg`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`turnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`turnos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(255) NULL,
  `fecha_inicio` DATETIME NOT NULL,
  `fecha_fin` DATETIME NULL,
  `seña` SMALLINT NOT NULL,
  `personas_id_iniciado_por` INT NOT NULL,
  `categorias_id_estado` INT NOT NULL,
  `categorias_id_prioridad` INT NOT NULL,
  `categorias_id_tipo_tatuaje` INT NOT NULL,
  `tatuadores_id` INT NOT NULL,
  `clientes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_turnos_personas1_idx` (`personas_id_iniciado_por` ASC),
  INDEX `fk_turnos_categorias1_idx` (`categorias_id_estado` ASC),
  INDEX `fk_turnos_categorias2_idx` (`categorias_id_prioridad` ASC),
  INDEX `fk_turnos_tatuadores1_idx` (`tatuadores_id` ASC),
  INDEX `fk_turnos_clientes1_idx` (`clientes_id` ASC),
  INDEX `fk_turnos_categorias3_idx` (`categorias_id_tipo_tatuaje` ASC),
  CONSTRAINT `fk_turnos_personas1`
    FOREIGN KEY (`personas_id_iniciado_por`)
    REFERENCES `tfg`.`personas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turnos_categorias1`
    FOREIGN KEY (`categorias_id_estado`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turnos_categorias2`
    FOREIGN KEY (`categorias_id_prioridad`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turnos_tatuadores1`
    FOREIGN KEY (`tatuadores_id`)
    REFERENCES `tfg`.`tatuadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turnos_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `tfg`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turnos_categorias3`
    FOREIGN KEY (`categorias_id_tipo_tatuaje`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tfg`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tfg`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cantidad` MEDIUMINT NOT NULL,
  `caracteristica` VARCHAR(255) NULL,
  `categorias_id_marca` INT NOT NULL,
  `categorias_id_tipo_producto` INT NOT NULL,
  `turnos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_productos_categorias1_idx` (`categorias_id_marca` ASC),
  INDEX `fk_productos_categorias2_idx` (`categorias_id_tipo_producto` ASC),
  INDEX `fk_productos_turnos1_idx` (`turnos_id` ASC),
  CONSTRAINT `fk_productos_categorias1`
    FOREIGN KEY (`categorias_id_marca`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categorias2`
    FOREIGN KEY (`categorias_id_tipo_producto`)
    REFERENCES `tfg`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_turnos1`
    FOREIGN KEY (`turnos_id`)
    REFERENCES `tfg`.`turnos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
