ALTER TABLE `Propietario` DROP FOREIGN KEY `fk_AsesorPropietario`;
ALTER TABLE `Cliente` DROP FOREIGN KEY `fk_ClienteAsesor`;
ALTER TABLE `Inmueble` DROP FOREIGN KEY `fk_InmueblePropietario`;
ALTER TABLE `Casa` DROP FOREIGN KEY `fk_CasaInmueble`;
ALTER TABLE `Terreno` DROP FOREIGN KEY `fk_TerrenoInmueble`;
ALTER TABLE `Departamento` DROP FOREIGN KEY `fk_DepartamentoInmueble`;
ALTER TABLE `Edificio` DROP FOREIGN KEY `fk_EdificioInmueble`;
ALTER TABLE `Local` DROP FOREIGN KEY `fk_LocalInmueble`;
ALTER TABLE `Oficina` DROP FOREIGN KEY `fk_OficinaInmueble`;

DROP TABLE `Cliente`;
DROP TABLE `Inmueble`;
DROP TABLE `Asesor`;
DROP TABLE `Propietario`;
DROP TABLE `Casa`;
DROP TABLE `Terreno`;
DROP TABLE `Departamento`;
DROP TABLE `Local`;
DROP TABLE `Edificio`;
DROP TABLE `Oficina`;

CREATE TABLE `Cliente` (
`nombre` varchar(255) NOT NULL,
`apellidoP` varchar(255) NOT NULL,
`apellidoM` varchar(255) NOT NULL,
`correo` varchar(255) NOT NULL,
`telefono` varchar(15) NOT NULL,
`idAsesor` int(11) NOT NULL,
`idCliente` int(11) NOT NULL,
PRIMARY KEY (`idCliente`) 
);
CREATE TABLE `Inmueble` (
`idInmueble` int(11) NOT NULL,
`calle` varchar(255) NOT NULL,
`numExt` varchar(255) NOT NULL,
`numInt` varchar(255) NULL,
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
);
CREATE TABLE `Asesor` (
`nombre` varchar(255) NOT NULL,
`apellidoP` varchar(255) NOT NULL,
`apellidoM` varchar(255) NOT NULL,
`correo` varchar(255) NOT NULL,
`telefono` varchar(255) NOT NULL,
`idAsesor` int(11) NOT NULL,
`contrasena` varchar(255) NOT NULL,
PRIMARY KEY (`idAsesor`) 
);
CREATE TABLE `Propietario` (
`nombre` varchar(255) NOT NULL,
`apellidoP` varchar(255) NOT NULL,
`apellidoM` varchar(255) NOT NULL,
`correo` varchar(255) NOT NULL,
`celular` varchar(255) NOT NULL,
`direccion` varchar(255) NOT NULL,
`idPropietario` int(10) NOT NULL,
`idAsesor` varchar(255) NOT NULL,
PRIMARY KEY (`idPropietario`) 
);
CREATE TABLE `Casa` (
`idCasa` varchar(255) NOT NULL,
`tipoCasa` varchar(255) NOT NULL,
`metrosCuatrados` varchar(255) NOT NULL,
`metrosConstruccion` varchar(255) NOT NULL,
`habitaciones` varchar(255) NULL,
`banos` varchar(255) NULL,
`pisos` varchar(255) NULL,
`cochera` varchar(255) NULL,
`cochesCichera` varchar(255) NULL,
`fraccionamiento` varchar(255) NULL,
`vigilancia` varchar(255) NULL,
`areaVerde` varchar(255) NULL,
`cuartoServicio` varchar(255) NULL,
`comedor` varchar(255) NULL,
`sala` varchar(255) NULL,
`cocina` varchar(255) NULL,
`tipoCocina` varchar(255) NULL,
`jardin` varchar(255) NULL,
`areaLavado` varchar(255) NULL,
`cocheraTechada` varchar(255) NULL,
`idInmueble` int(10) NOT NULL,
PRIMARY KEY (`idCasa`) 
);
CREATE TABLE `Terreno` (
`idTerreno` int(11) NOT NULL,
`idInmueble` int(11) NOT NULL,
`metrosCuadrados` varchar(255) NOT NULL,
`formaTerreno` int(11) NOT NULL,
`usoSuelo` varchar(255) NOT NULL,
`esquina` varchar(255) NOT NULL,
`pendienteTerreno` varchar(255) NOT NULL,
PRIMARY KEY (`idTerreno`) 
);
CREATE TABLE `Departamento` (
`idDepartamento` int(11) NOT NULL,
`idInmueble` int(11) NOT NULL,
`metrosConstruccion` varchar(255) NOT NULL,
`banos` varchar(255) NULL,
`habitaciones` varchar(255) NULL,
`cocina` varchar(255) NULL,
`tipoCocina` varchar(255) NULL,
`estacionamiento` varchar(255) NULL,
`numCoches` varchar(255) NULL,
`sala` varchar(255) NULL,
`comedor` varchar(255) NULL,
PRIMARY KEY (`idDepartamento`) 
);
CREATE TABLE `Local` (
`idLocal` int(11) NOT NULL,
`idInmueble` int(11) NOT NULL,
`metrosCuadrados` varchar(255) NOT NULL,
`banos` varchar(255) NOT NULL,
`plazaComercial` varchar(255) NOT NULL,
PRIMARY KEY (`idLocal`) 
);
CREATE TABLE `Edificio` (
`idEdificio` int(11) NOT NULL,
`idInmueble` int(11) NOT NULL,
`metrosConstruccion` varchar(255) NOT NULL,
`pisos` varchar(255) NOT NULL,
PRIMARY KEY (`idEdificio`) 
);
CREATE TABLE `Oficina` (
`idOficina` varchar(255) NOT NULL,
`idInmueble` varchar(255) NOT NULL,
`banos` varchar(255) NOT NULL,
`metrosCuadrados` varchar(255) NOT NULL,
PRIMARY KEY (`idOficina`) 
);

ALTER TABLE `Propietario` ADD CONSTRAINT `fk_AsesorPropietario` FOREIGN KEY (`idAsesor`) REFERENCES `Asesor` (`idAsesor`);
ALTER TABLE `Cliente` ADD CONSTRAINT `fk_ClienteAsesor` FOREIGN KEY (`idAsesor`) REFERENCES `Asesor` (`idAsesor`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Inmueble` ADD CONSTRAINT `fk_InmueblePropietario` FOREIGN KEY (`idPropietario`) REFERENCES `Propietario` (`idPropietario`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Casa` ADD CONSTRAINT `fk_CasaInmueble` FOREIGN KEY (`idInmueble`) REFERENCES `Inmueble` (`idInmueble`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Terreno` ADD CONSTRAINT `fk_TerrenoInmueble` FOREIGN KEY (`idInmueble`) REFERENCES `Inmueble` (`idInmueble`);
ALTER TABLE `Departamento` ADD CONSTRAINT `fk_DepartamentoInmueble` FOREIGN KEY (`idInmueble`) REFERENCES `Inmueble` (`idInmueble`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Edificio` ADD CONSTRAINT `fk_EdificioInmueble` FOREIGN KEY (`idInmueble`) REFERENCES `Inmueble` (`idInmueble`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Local` ADD CONSTRAINT `fk_LocalInmueble` FOREIGN KEY (`idInmueble`) REFERENCES `Inmueble` (`idInmueble`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `Oficina` ADD CONSTRAINT `fk_OficinaInmueble` FOREIGN KEY (`idInmueble`) REFERENCES `Inmueble` (`idInmueble`) ON DELETE CASCADE ON UPDATE CASCADE;

