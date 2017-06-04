/* SQL Manager for MySQL                              5.6.0.47256 */
/* -------------------------------------------------------------- */
/* Host     : localhost                                           */
/* Port     : 3306                                                */
/* Database : SIV                                                 */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8' */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `siv`;

CREATE DATABASE `SIV`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_spanish_ci';

USE `siv`;

/* Dropping database objects */

DROP TABLE IF EXISTS `precio`;
DROP TABLE IF EXISTS `tipo_precio`;
DROP TABLE IF EXISTS `detalle_producto`;
DROP TABLE IF EXISTS `subcategoria`;
DROP TABLE IF EXISTS `modelo`;
DROP TABLE IF EXISTS `marca`;
DROP TABLE IF EXISTS `categoria`;
DROP TABLE IF EXISTS `carrito`;
DROP TABLE IF EXISTS `producto`;
DROP TABLE IF EXISTS `usuario`;
DROP TABLE IF EXISTS `entidad`;

/* Structure for the `entidad` table :  */

CREATE TABLE `entidad` (
  `correo_electronico` VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL COMMENT 'correo electronico',
  `nombre` VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
  `celular` INTEGER(9) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY USING BTREE (`correo_electronico`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `usuario` table :  */

CREATE TABLE `usuario` (
  `correo_electronico` VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` VARCHAR(255) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` BIT(1) NOT NULL,
  PRIMARY KEY USING BTREE (`correo_electronico`),
  CONSTRAINT `usuario_fk1` FOREIGN KEY (`correo_electronico`) REFERENCES `entidad` (`correo_electronico`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `producto` table :  */

CREATE TABLE `producto` (
  `cod_producto` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` VARCHAR(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY USING BTREE (`cod_producto`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `carrito` table :  */

CREATE TABLE `carrito` (
  `correo_electronico` VARCHAR(150) COLLATE utf8_spanish_ci NOT NULL,
  `cod_producto` INTEGER(11) NOT NULL,
  `cantidad` INTEGER(11) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY USING BTREE (`correo_electronico`),
  KEY `cod_producto` USING BTREE (`cod_producto`),
  CONSTRAINT `carrito_fk1` FOREIGN KEY (`correo_electronico`) REFERENCES `usuario` (`correo_electronico`),
  CONSTRAINT `carrito_fk2` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `categoria` table :  */

CREATE TABLE `categoria` (
  `cod_categoria` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(25) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` VARCHAR(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`cod_categoria`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `marca` table :  */

CREATE TABLE `marca` (
  `cod_marca` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`cod_marca`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `modelo` table :  */

CREATE TABLE `modelo` (
  `cod_modelo` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`cod_modelo`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `subcategoria` table :  */

CREATE TABLE `subcategoria` (
  `cod_subcategoria` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `subcategoria` VARCHAR(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` VARCHAR(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`cod_subcategoria`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `detalle_producto` table :  */

CREATE TABLE `detalle_producto` (
  `cod_producto` INTEGER(11) NOT NULL,
  `cod_marca` INTEGER(11) NOT NULL,
  `cod_modelo` INTEGER(11) NOT NULL,
  `cod_categoria` INTEGER(11) NOT NULL,
  `cod_subcategoria` INTEGER(11) NOT NULL,
  KEY `cod_producto` USING BTREE (`cod_producto`),
  KEY `cod_marca` USING BTREE (`cod_marca`),
  KEY `cod_modelo` USING BTREE (`cod_modelo`),
  KEY `cod_categoria` USING BTREE (`cod_categoria`),
  KEY `cod_subcategoria` USING BTREE (`cod_subcategoria`),
  CONSTRAINT `detalle_producto_fk1` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`),
  CONSTRAINT `detalle_producto_fk2` FOREIGN KEY (`cod_marca`) REFERENCES `marca` (`cod_marca`),
  CONSTRAINT `detalle_producto_fk3` FOREIGN KEY (`cod_modelo`) REFERENCES `modelo` (`cod_modelo`),
  CONSTRAINT `detalle_producto_fk4` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`),
  CONSTRAINT `detalle_producto_fk5` FOREIGN KEY (`cod_subcategoria`) REFERENCES `subcategoria` (`cod_subcategoria`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `tipo_precio` table :  */

CREATE TABLE `tipo_precio` (
  `cod_tipo_precio` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`cod_tipo_precio`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/* Structure for the `precio` table :  */

CREATE TABLE `precio` (
  `cod_producto` INTEGER(11) NOT NULL,
  `precio` DECIMAL(12,2) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `cod_tipo` INTEGER(11) NOT NULL,
  PRIMARY KEY USING BTREE (`cod_producto`, `fecha`),
  KEY `cod_producto` USING BTREE (`cod_producto`),
  KEY `cod_tipo` USING BTREE (`cod_tipo`),
  KEY `cod_producto_2` USING BTREE (`cod_producto`),
  KEY `cod_producto_3` USING BTREE (`cod_producto`),
  CONSTRAINT `precio_fk2` FOREIGN KEY (`cod_tipo`) REFERENCES `tipo_precio` (`cod_tipo_precio`),
  CONSTRAINT `precio_fk3` FOREIGN KEY (`cod_producto`) REFERENCES `producto` (`cod_producto`)
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci'
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;