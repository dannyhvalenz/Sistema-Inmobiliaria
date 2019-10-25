/*
 Navicat Premium Data Transfer

 Source Server         : Local instance 3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : Inmobiliaria

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/10/2019 16:17:45
*/
DROP DATABASE IF EXISTS `Inmobiliaria`;
CREATE DATABASE `Inmobiliaria`;
USE `Inmobiliaria`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Asesor
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Asesor`;
CREATE TABLE `Inmobiliaria.Asesor` (
  `nombre` varchar(255) NOT NULL,
  `apellidoP` varchar(255) NOT NULL,
  `apellidoM` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `idAsesor` int(11) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`idAsesor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of Asesor
-- ----------------------------
BEGIN;
INSERT INTO `Inmobiliaria.Asesor` VALUES ('Daniela', 'Hernandez', 'Valenzuela', 'dany@live.com', '2717117751', 1, '12345');
INSERT INTO `Inmobiliaria.Asesor` VALUES ('Valeria', 'Sanchez', 'Garcia', 'valeria@live.com', '2282121211', 2, '12345');
COMMIT;

-- ----------------------------
-- Table structure for Casa
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Casa`;
CREATE TABLE `Inmobiliaria.Casa` (
  `idCasa` varchar(255) NOT NULL,
  `tipoCasa` varchar(255) NOT NULL,
  `metrosCuatrados` varchar(255) NOT NULL,
  `metrosConstruccion` varchar(255) NOT NULL,
  `habitaciones` varchar(255) DEFAULT NULL,
  `banos` varchar(255) DEFAULT NULL,
  `pisos` varchar(255) DEFAULT NULL,
  `cochera` varchar(255) DEFAULT NULL,
  `cochesCichera` varchar(255) DEFAULT NULL,
  `fraccionamiento` varchar(255) DEFAULT NULL,
  `vigilancia` varchar(255) DEFAULT NULL,
  `areaVerde` varchar(255) DEFAULT NULL,
  `cuartoServicio` varchar(255) DEFAULT NULL,
  `comedor` varchar(255) DEFAULT NULL,
  `sala` varchar(255) DEFAULT NULL,
  `cocina` varchar(255) DEFAULT NULL,
  `tipoCocina` varchar(255) DEFAULT NULL,
  `jardin` varchar(255) DEFAULT NULL,
  `areaLavado` varchar(255) DEFAULT NULL,
  `cocheraTechada` varchar(255) DEFAULT NULL,
  `idInmueble` int(10) NOT NULL,
  PRIMARY KEY (`idCasa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Cliente
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Cliente`;
CREATE TABLE `Inmobiliaria.Cliente` (
  `nombre` varchar(255) NOT NULL,
  `apellidoP` varchar(255) NOT NULL,
  `apellidoM` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `idAsesor` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Departamento
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Departamento`;
CREATE TABLE `Inmobiliaria.Departamento` (
  `idDepartamento` int(11) NOT NULL,
  `idInmueble` int(11) NOT NULL,
  `metrosConstruccion` varchar(255) NOT NULL,
  `banos` varchar(255) DEFAULT NULL,
  `habitaciones` varchar(255) DEFAULT NULL,
  `cocina` varchar(255) DEFAULT NULL,
  `tipoCocina` varchar(255) DEFAULT NULL,
  `estacionamiento` varchar(255) DEFAULT NULL,
  `numCoches` varchar(255) DEFAULT NULL,
  `sala` varchar(255) DEFAULT NULL,
  `comedor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Edificio
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Edificio`;
CREATE TABLE `Edificio` (
  `idEdificio` int(11) NOT NULL,
  `idInmueble` int(11) NOT NULL,
  `metrosConstruccion` varchar(255) NOT NULL,
  `pisos` varchar(255) NOT NULL,
  PRIMARY KEY (`idEdificio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Inmueble
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Inmueble`;
CREATE TABLE `Inmobiliaria.Inmueble` (
  `idInmueble` int(11) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `numExt` varchar(255) NOT NULL,
  `numInt` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `servicios` varchar(255) NOT NULL,
  `idPropietario` int(11) NOT NULL,
  `tipoInmueble` varchar(255) NOT NULL,
  `agua` varchar(255) NOT NULL,
  `luz` varchar(255) NOT NULL,
  `drenaje` varchar(255) NOT NULL,
  PRIMARY KEY (`idInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Local
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Local`;
CREATE TABLE `Local` (
  `idLocal` int(11) NOT NULL,
  `idInmueble` int(11) NOT NULL,
  `metrosCuadrados` varchar(255) NOT NULL,
  `banos` varchar(255) NOT NULL,
  `plazaComercial` varchar(255) NOT NULL,
  PRIMARY KEY (`idLocal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Oficina
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Oficina`;
CREATE TABLE `Inmobiliaria.Oficina` (
  `idOficina` varchar(255) NOT NULL,
  `idInmueble` varchar(255) NOT NULL,
  `banos` varchar(255) NOT NULL,
  `metrosCuadrados` varchar(255) NOT NULL,
  PRIMARY KEY (`idOficina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Propietario
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Propietario`;
CREATE TABLE `Inmobiliaria.Propietario` (
  `nombre` varchar(255) NOT NULL,
  `apellidoP` varchar(255) NOT NULL,
  `apellidoM` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `idPropietario` int(10) NOT NULL,
  `idAsesor` varchar(255) NOT NULL,
  PRIMARY KEY (`idPropietario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for Terreno
-- ----------------------------
DROP TABLE IF EXISTS `Inmobiliaria.Terreno`;
CREATE TABLE `Inmobiliaria.Terreno` (
  `idTerreno` int(11) NOT NULL,
  `idInmueble` int(11) NOT NULL,
  `metrosCuadrados` varchar(255) NOT NULL,
  `formaTerreno` int(11) NOT NULL,
  `usoSuelo` varchar(255) NOT NULL,
  `esquina` varchar(255) NOT NULL,
  `pendienteTerreno` varchar(255) NOT NULL,
  PRIMARY KEY (`idTerreno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
