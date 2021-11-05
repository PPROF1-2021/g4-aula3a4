-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Find_my_Team_Database_V.1.0
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Find_my_Team_Database_V.1.0
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Find_my_Team_Database_V.1.0` DEFAULT CHARACTER SET utf8 ;
USE `Find_my_Team_Database_V.1.0` ;

-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Estados` (
  `idEstado` SMALLINT(20) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Generos` (
  `idGenero` SMALLINT(15) NOT NULL,
  `nombre` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `telefono` VARCHAR(30) NULL,
  `ciudad` VARCHAR(25) NOT NULL,
  `idUbicacion_cliente` INT NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  `idGenero` SMALLINT(15) NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  INDEX `idGenero_idx` (`idGenero` ASC) VISIBLE,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGenero`
    FOREIGN KEY (`idGenero`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Generos` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Usuarios` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(20) NOT NULL,
  `correo_electronico` VARCHAR(45) NOT NULL,
  `idCliente` INT NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idCliente`
    FOREIGN KEY ()
    REFERENCES `Find_my_Team_Database_V.1.0`.`Clientes` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Ubicacion_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Ubicacion_clientes` (
  `idUbicacion_cliente` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `observaciones` VARCHAR(150) NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idUbicacion_cliente`),
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idUbicacion_cliente`
    FOREIGN KEY (`idUbicacion_cliente`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Clientes` (`idUbicacion_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Ubicacion_establecimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Ubicacion_establecimiento` (
  `idUbicacion_establecimiento` SMALLINT(15) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `observaciones` VARCHAR(40) NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idUbicacion_establecimiento`),
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Telefonos_establecimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Telefonos_establecimiento` (
  `idTelefono_establecimiento` SMALLINT(20) NOT NULL AUTO_INCREMENT,
  `telefono` VARCHAR(45) NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idTelefono_establecimiento`),
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Establecimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Establecimientos` (
  `idEstablecimiento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad_canchas` VARCHAR(10) NULL,
  `idUbicacion_Establecimiento` SMALLINT(15) NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  `idTelefono_establecimiento` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idEstablecimiento`),
  INDEX `idUbicacion_establecimiento_idx` (`idUbicacion_Establecimiento` ASC) VISIBLE,
  INDEX `idTelefono_establecimiento_idx` (`idTelefono_establecimiento` ASC) VISIBLE,
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idUbicacion_establecimiento`
    FOREIGN KEY (`idUbicacion_Establecimiento`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Ubicacion_establecimiento` (`idUbicacion_establecimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTelefono_establecimiento`
    FOREIGN KEY (`idTelefono_establecimiento`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Telefonos_establecimiento` (`idTelefono_establecimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Canchas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Canchas` (
  `idCancha` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `tamaño` VARCHAR(30) NOT NULL,
  `precio` VARCHAR(20) NOT NULL,
  `idEstablecimiento` INT NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idCancha`),
  INDEX `idEstablecimiento_idx` (`idEstablecimiento` ASC) VISIBLE,
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idEstablecimiento`
    FOREIGN KEY (`idEstablecimiento`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Establecimientos` (`idEstablecimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Partidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Partidos` (
  `idPartido` INT NOT NULL AUTO_INCREMENT,
  `idCancha` INT NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idPartido`),
  INDEX `idCancha_idx` (`idCancha` ASC) VISIBLE,
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  CONSTRAINT `idCancha`
    FOREIGN KEY (`idCancha`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Canchas` (`idCancha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Equipos` (
  `idEquipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `idUsuario` INT NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  PRIMARY KEY (`idEquipo`),
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Find_my_Team_Database_V.1.0`.`Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Find_my_Team_Database_V.1.0`.`Eventos` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  `idPartido` INT NOT NULL,
  `idEquipo` INT NOT NULL,
  `idEstado` SMALLINT(20) NOT NULL,
  `Descripcion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idEvento`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `idPartido_idx` (`idPartido` ASC) VISIBLE,
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  INDEX `idEquipo_idx` (`idEquipo` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPartido`
    FOREIGN KEY (`idPartido`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Partidos` (`idPartido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Estados` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEquipo`
    FOREIGN KEY (`idEquipo`)
    REFERENCES `Find_my_Team_Database_V.1.0`.`Equipos` (`idEquipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
