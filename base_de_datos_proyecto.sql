-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.17-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para base_de_datos_proyecto
DROP DATABASE IF EXISTS `base_de_datos_proyecto`;
CREATE DATABASE IF NOT EXISTS `base_de_datos_proyecto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `base_de_datos_proyecto`;

-- Volcando estructura para tabla base_de_datos_proyecto.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `NIT` varchar(15) NOT NULL,
  `primer_nombre` varchar(12) DEFAULT NULL,
  `segundo_nombre` varchar(12) DEFAULT NULL,
  `primer_apellido` varchar(12) DEFAULT NULL,
  `segundo_apellido` varchar(12) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `celular` varchar(8) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.cliente: ~5 rows (aproximadamente)
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`NIT`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `correo`, `telefono`, `celular`, `direccion`) VALUES
	('1', 'Carlos', 'Enrique', 'alvarado', 'Lege', 'Quisui1@gmail.com', '77650455', '46073819', 'Ciudad'),
	('2', 'Timmy', 'Edwin', 'Chocoylate', 'Sarahi', 'Edwin@gmail.com', '77650456', '46073918', 'Ciudad'),
	('3', 'Hugo', 'Daniel', 'Lucas', 'Gramaja', 'joja@gmail.com', '77650488', '46079831', 'Ciudad'),
	('4', 'Mariano', 'Jose', 'Rodriguez', 'Vallaja', 'Mariov@gmail.com', '77650489', '46087891', 'Quezaltenango'),
	('5', 'Mika', 'sonla', 'Jose', 'Valle', 'Valle@gmail.com', '77650489', '78951545', 'Totonicapan');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.comprobante
DROP TABLE IF EXISTS `comprobante`;
CREATE TABLE IF NOT EXISTS `comprobante` (
  `idcomprobante` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(45) DEFAULT NULL,
  `abono/adelanto` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idcomprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.comprobante: ~0 rows (aproximadamente)
DELETE FROM `comprobante`;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.producto: ~0 rows (aproximadamente)
DELETE FROM `producto`;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.productos_utilizados
DROP TABLE IF EXISTS `productos_utilizados`;
CREATE TABLE IF NOT EXISTS `productos_utilizados` (
  `tipo_de_servicio_idtipo_de_servicio` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  KEY `fk_Tipo de Servicio_has_Producto_Producto1_idx` (`producto_idproducto`),
  KEY `fk_Tipo de Servicio_has_Producto_Tipo de Servicio1_idx` (`tipo_de_servicio_idtipo_de_servicio`),
  CONSTRAINT `fk_Tipo de Servicio_has_Producto_Producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tipo de Servicio_has_Producto_Tipo de Servicio1` FOREIGN KEY (`tipo_de_servicio_idtipo_de_servicio`) REFERENCES `tipo_de_servicio` (`idtipo_de_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.productos_utilizados: ~0 rows (aproximadamente)
DELETE FROM `productos_utilizados`;
/*!40000 ALTER TABLE `productos_utilizados` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_utilizados` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.producto_a_comprar
DROP TABLE IF EXISTS `producto_a_comprar`;
CREATE TABLE IF NOT EXISTS `producto_a_comprar` (
  `proveedor_idproveedor` int(11) NOT NULL,
  `producto_idproducto` int(11) NOT NULL,
  KEY `fk_Proveedor_has_Producto_Producto1_idx` (`producto_idproducto`),
  KEY `fk_Proveedor_has_Producto_Proveedor1_idx` (`proveedor_idproveedor`),
  CONSTRAINT `fk_Proveedor_has_Producto_Producto1` FOREIGN KEY (`producto_idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1` FOREIGN KEY (`proveedor_idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.producto_a_comprar: ~0 rows (aproximadamente)
DELETE FROM `producto_a_comprar`;
/*!40000 ALTER TABLE `producto_a_comprar` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_a_comprar` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.proveedor
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `marca` varchar(15) DEFAULT NULL,
  `origen` varchar(20) DEFAULT NULL,
  `correo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.proveedor: ~0 rows (aproximadamente)
DELETE FROM `proveedor`;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.servicio
DROP TABLE IF EXISTS `servicio`;
CREATE TABLE IF NOT EXISTS `servicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `comprobante_idcomprobante` int(11) NOT NULL,
  `trabajador_DPI` varchar(30) NOT NULL,
  `vehiculo_placa` varchar(10) NOT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `fk_Servicio_Comprobante1_idx` (`comprobante_idcomprobante`),
  KEY `fk_Servicio_Trabajador1_idx` (`trabajador_DPI`),
  KEY `fk_Servicio_Vehiculo1_idx` (`vehiculo_placa`),
  CONSTRAINT `fk_Servicio_Comprobante1` FOREIGN KEY (`comprobante_idcomprobante`) REFERENCES `comprobante` (`idcomprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_Trabajador1` FOREIGN KEY (`trabajador_DPI`) REFERENCES `trabajador` (`DPI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_Vehiculo1` FOREIGN KEY (`vehiculo_placa`) REFERENCES `vehiculo` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.servicio: ~0 rows (aproximadamente)
DELETE FROM `servicio`;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.tipo_de_servicio
DROP TABLE IF EXISTS `tipo_de_servicio`;
CREATE TABLE IF NOT EXISTS `tipo_de_servicio` (
  `idtipo_de_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_de_servicio` varchar(45) DEFAULT NULL,
  `servicio_idservicio` int(11) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtipo_de_servicio`),
  KEY `fk_Tipo de Servicio_Servicio1_idx` (`servicio_idservicio`),
  CONSTRAINT `fk_Tipo de Servicio_Servicio1` FOREIGN KEY (`servicio_idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.tipo_de_servicio: ~0 rows (aproximadamente)
DELETE FROM `tipo_de_servicio`;
/*!40000 ALTER TABLE `tipo_de_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_de_servicio` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.trabajador
DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE IF NOT EXISTS `trabajador` (
  `DPI` varchar(30) NOT NULL,
  `primer_nombre` varchar(12) NOT NULL,
  `segundo_nombre` varchar(12) DEFAULT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `hora entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `igss` varchar(45) DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `puesto` varchar(15) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `celular` varchar(8) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`DPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.trabajador: ~3 rows (aproximadamente)
DELETE FROM `trabajador`;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` (`DPI`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `hora entrada`, `hora_salida`, `igss`, `salario`, `puesto`, `direccion`, `celular`, `telefono`) VALUES
	('1', 'Josebas', 'El', 'Autentico', 'Wild', '07:00:00', '16:00:00', '46081818', 10000, 'Trabajador', 'Ciudad', '46087818', '77652101'),
	('2', 'Maria', 'Db', 'Heidi', 'Sql', '06:00:00', '18:00:00', '4881123', 8000, 'Supervisor', 'Quetzaltenango', '88947789', '11235481'),
	('3', 'Hugo', 'Daniel', 'Tzul', 'Bustamante', '05:00:00', '23:00:00', '4588794', 90000, 'Supervisor', 'QUetzaltenango', '5859812', '15235748');
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idtipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Administrador` varchar(5) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.usuario: ~0 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla base_de_datos_proyecto.vehiculo
DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `placa` varchar(10) NOT NULL,
  `marca` varchar(15) DEFAULT NULL,
  `modelo` varchar(15) DEFAULT NULL,
  `anio` varchar(4) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `cliente_NIT` varchar(15) NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `fk_Vehiculo_Cliente1_idx` (`cliente_NIT`),
  CONSTRAINT `fk_Vehiculo_Cliente1` FOREIGN KEY (`cliente_NIT`) REFERENCES `cliente` (`NIT`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla base_de_datos_proyecto.vehiculo: ~4 rows (aproximadamente)
DELETE FROM `vehiculo`;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` (`placa`, `marca`, `modelo`, `anio`, `Color`, `tipo`, `cliente_NIT`) VALUES
	('1238ae', 'BMW', 'z5', '2016', 'Negro', 'Super_Veloz', '3'),
	('8423a8', 'Audi', 'a4', '2018', 'Verde', 'Veloz', '2'),
	('8621e5', 'Zuzuki', '25a', '2017', 'Rojo', 'Deportivo', '1'),
	('a88432', 'Clue', '88a', '2017', 'Mate', 'Deportivo', '4');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
