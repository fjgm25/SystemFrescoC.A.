-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2021 a las 06:16:47
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurant`
--
CREATE DATABASE IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `restaurant`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion`
--

CREATE TABLE `atencion` (
  `idatencion` int(11) NOT NULL,
  `idmesa` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `atencion`
--

INSERT INTO `atencion` (`idatencion`, `idmesa`, `usuario`, `estado`) VALUES
(5, 6, 'admin', 'Facturado'),
(6, 1, 'admin', 'Facturado'),
(7, 3, 'admin', 'Facturado'),
(8, 5, 'admin', 'Facturado'),
(9, 1, 'admin', 'Facturado'),
(10, 1, 'admin', 'Facturado'),
(11, 1, 'admin', 'Facturado'),
(12, 4, 'admin', 'Facturado'),
(13, 4, 'admin', 'Facturado'),
(14, 5, 'admin', 'Facturado');

--
-- Disparadores `atencion`
--
DELIMITER $$
CREATE TRIGGER `atencion_AFTER_INSERT` AFTER INSERT ON `atencion` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('atenciones','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idatencion)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_auditoria` int(11) NOT NULL,
  `tabla` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `valor_id` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id_auditoria`, `tabla`, `tipo`, `fecha`, `hora`, `usuario`, `valor_id`) VALUES
(42, 'categorias', 'UPDATE', '2021-11-05', '19:47:08', 'root@localhost', '22'),
(43, 'categorias', 'UPDATE', '2021-11-05', '19:47:28', 'root@localhost', '22'),
(44, 'categorias', 'UPDATE', '2021-11-05', '19:48:33', 'root@localhost', '13'),
(46, 'categorias', 'UPDATE', '2021-11-05', '21:38:17', 'root@localhost', '22'),
(48, 'empleado', 'UPDATE', '2021-11-05', '21:49:46', 'root@localhost', '2'),
(49, 'reservas', 'UPDATE', '2021-11-05', '22:08:48', 'root@localhost', '3'),
(50, 'productos', 'UPDATE', '2021-11-05', '22:54:18', 'root@localhost', '61'),
(51, 'usuarios', 'UPDATE', '2021-11-05', '23:13:46', 'root@localhost', '10'),
(52, 'usuarios', 'UPDATE', '2021-11-06', '01:51:33', 'root@localhost', '10'),
(53, 'rol', 'INSERT', '2021-11-06', '01:56:42', 'root@localhost', '4'),
(54, 'reservas', 'INSERT', '2021-11-06', '02:38:16', 'root@localhost', '30'),
(55, 'reservas', 'UPDATE', '2021-11-06', '02:38:30', 'root@localhost', '30'),
(56, 'reservas', 'UPDATE', '2021-11-06', '02:38:36', 'root@localhost', '30'),
(57, 'productos', 'INSERT', '2021-11-06', '02:39:08', 'root@localhost', '72'),
(58, 'categorias', 'INSERT', '2021-11-06', '02:39:36', 'root@localhost', '24'),
(59, 'categorias', 'UPDATE', '2021-11-06', '02:39:48', 'root@localhost', '24'),
(60, 'ordenes', 'INSERT', '2021-11-06', '02:40:31', 'root@localhost', '35'),
(61, 'ordenes', 'INSERT', '2021-11-06', '02:40:31', 'root@localhost', '36'),
(62, 'ordenes', 'INSERT', '2021-11-06', '02:40:31', 'root@localhost', '37'),
(63, 'atenciones', 'INSERT', '2021-11-06', '02:40:49', 'root@localhost', '13'),
(64, 'empleado', 'INSERT', '2021-11-06', '02:43:42', 'root@localhost', '3'),
(65, 'empleado', 'UPDATE', '2021-11-06', '02:44:00', 'root@localhost', '3'),
(66, 'usuarios', 'INSERT', '2021-11-06', '02:44:29', 'root@localhost', '18'),
(68, 'categorias', 'UPDATE', '2021-11-21', '20:30:24', 'root@localhost', '23'),
(73, 'categorias', 'UPDATE', '2021-11-21', '20:48:27', 'root@localhost', '13'),
(75, 'categorias', 'UPDATE', '2021-11-21', '20:48:50', 'root@localhost', '9'),
(77, 'categorias', 'UPDATE', '2021-11-21', '21:43:04', 'root@localhost', '22'),
(78, 'categorias', 'UPDATE', '2021-11-21', '22:36:00', 'root@localhost', '24'),
(79, 'categorias', 'UPDATE', '2021-11-21', '22:43:36', 'root@localhost', '23'),
(80, 'categorias', 'UPDATE', '2021-11-21', '22:43:47', 'root@localhost', '17'),
(81, 'categorias', 'UPDATE', '2021-11-21', '22:43:51', 'root@localhost', '24'),
(82, 'categorias', 'UPDATE', '2021-11-21', '22:43:58', 'root@localhost', '24'),
(83, 'categorias', 'UPDATE', '2021-11-21', '22:44:02', 'root@localhost', '9'),
(84, 'categorias', 'UPDATE', '2021-11-21', '22:44:04', 'root@localhost', '13'),
(85, 'categorias', 'UPDATE', '2021-11-21', '22:44:06', 'root@localhost', '17'),
(86, 'categorias', 'UPDATE', '2021-11-21', '22:44:08', 'root@localhost', '23'),
(87, 'productos', 'UPDATE', '2021-11-21', '23:18:46', 'root@localhost', '55'),
(88, 'productos', 'UPDATE', '2021-11-21', '23:29:43', 'root@localhost', '72'),
(89, 'productos', 'UPDATE', '2021-11-21', '23:31:56', 'root@localhost', '72'),
(90, 'productos', 'UPDATE', '2021-11-21', '23:32:05', 'root@localhost', '72'),
(91, 'usuarios', 'UPDATE', '2021-11-21', '23:53:34', 'root@localhost', '15'),
(92, 'usuarios', 'UPDATE', '2021-11-21', '23:53:38', 'root@localhost', '10'),
(93, 'usuarios', 'UPDATE', '2021-11-21', '23:53:42', 'root@localhost', '12'),
(94, 'usuarios', 'UPDATE', '2021-11-21', '23:53:44', 'root@localhost', '13'),
(95, 'usuarios', 'UPDATE', '2021-11-21', '23:53:48', 'root@localhost', '16'),
(96, 'usuarios', 'UPDATE', '2021-11-22', '00:12:43', 'root@localhost', '10'),
(97, 'ordenes', 'INSERT', '2021-11-22', '00:14:16', 'root@localhost', '38'),
(98, 'ordenes', 'INSERT', '2021-11-22', '00:14:16', 'root@localhost', '39'),
(99, 'ordenes', 'INSERT', '2021-11-22', '00:14:16', 'root@localhost', '40'),
(100, 'ordenes', 'INSERT', '2021-11-22', '00:14:16', 'root@localhost', '41'),
(101, 'atenciones', 'INSERT', '2021-11-22', '00:14:20', 'root@localhost', '14'),
(102, 'categorias', 'UPDATE', '2021-11-22', '00:14:55', 'root@localhost', '19'),
(103, 'categorias', 'UPDATE', '2021-11-22', '00:15:03', 'root@localhost', '19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `idcargo` int(11) NOT NULL,
  `descripcion` char(128) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idcargo`, `descripcion`, `estado`) VALUES
(1, 'mesonero', 1),
(2, 'cajero', 1),
(3, 'cocinero', 1),
(4, 'recepcionista', 1);

--
-- Disparadores `cargos`
--
DELIMITER $$
CREATE TRIGGER `cargos_AFTER_INSERT` AFTER INSERT ON `cargos` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('cargos','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idcargo)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `nombrecategoria` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `nombrecategoria`, `estado`) VALUES
(8, 'POSTRES ', 1),
(9, 'ENSALADAS', 1),
(13, 'CARNE', 1),
(17, 'BEBIDAS ', 1),
(18, 'PANES', 1),
(19, 'DESAYUNO', 1),
(20, 'PIZZAS', 1),
(21, 'ADICIONALES', 1),
(22, 'NAVIDAD 2', 0),
(23, 'COMPOTAS DIETETICAS', 1),
(24, 'NAVIDAD', 1);

--
-- Disparadores `categorias`
--
DELIMITER $$
CREATE TRIGGER `categorias_AFTER_INSERT` AFTER INSERT ON `categorias` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('categorias','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idcategoria)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `categorias_AFTER_UPDATE` AFTER UPDATE ON `categorias` FOR EACH ROW INSERT INTO categorias_respaldo(idcategoria,nombrecategoria,fecha,hora) VALUES (old.idcategoria,old.nombrecategoria,CURRENT_DATE(),CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `categorias_BEFORE_UPDATE` BEFORE UPDATE ON `categorias` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('categorias','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idcategoria)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_respaldo`
--

CREATE TABLE `categorias_respaldo` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `nombrecategoria` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias_respaldo`
--

INSERT INTO `categorias_respaldo` (`id`, `idcategoria`, `nombrecategoria`, `fecha`, `hora`) VALUES
(1, 9, 'ENSALADAS', '2021-11-21', '20:48:50'),
(2, 13, 'CARNE', '2021-11-21', '20:48:27'),
(3, 22, 'NAVIDAD', '2021-11-05', '21:38:17'),
(4, 23, 'COMPOTAS DIETETICAS', '2021-11-21', '20:30:24'),
(5, 24, 'NAVIDAD', '2021-11-06', '02:39:48'),
(6, 22, 'NAVIDAD 2', '2021-11-21', '21:43:04'),
(7, 24, 'NAVIDAD', '2021-11-21', '22:36:00'),
(8, 23, 'COMPOTAS DIETETICAS', '2021-11-21', '22:43:36'),
(9, 17, 'BEBIDAS ', '2021-11-21', '22:43:47'),
(10, 24, 'NAVIDAD', '2021-11-21', '22:43:51'),
(11, 24, 'NAVIDAD', '2021-11-21', '22:43:58'),
(12, 9, 'ENSALADAS', '2021-11-21', '22:44:02'),
(13, 13, 'CARNE', '2021-11-21', '22:44:04'),
(14, 17, 'BEBIDAS ', '2021-11-21', '22:44:06'),
(15, 23, 'COMPOTAS DIETETICAS', '2021-11-21', '22:44:08'),
(16, 19, 'DESAYUNO', '2021-11-22', '00:14:55'),
(17, 19, 'DESAYUNO', '2021-11-22', '00:15:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Tipo_de_documento` varchar(5) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Numero_de_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Nacionalidad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha_de_nacimiento` date DEFAULT NULL,
  `Sexo` varchar(1) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Email` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Telefono1` bigint(20) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `Tipo_de_documento`, `Numero_de_documento`, `Nacionalidad`, `Apellidos`, `Nombres`, `Fecha_de_nacimiento`, `Sexo`, `Ciudad`, `Direccion`, `Email`, `Telefono1`, `estado`) VALUES
(1, '1', '25727258', 'Venezolana', 'Perez Chacon', 'Karen Ninoska', '1996-05-28', 'M', 'Tachira', NULL, NULL, NULL, 1);

--
-- Disparadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `cliente_AFTER_INSERT` AFTER INSERT ON `cliente` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('cliente','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.id_cliente)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_empleado` int(11) NOT NULL,
  `tipo_de_documento` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero_de_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nacionalidad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono1` bigint(20) DEFAULT NULL,
  `telefono2` bigint(20) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_empleado`, `tipo_de_documento`, `numero_de_documento`, `nacionalidad`, `apellidos`, `nombres`, `fecha_de_nacimiento`, `direccion`, `telefono1`, `telefono2`, `cargo`, `estado`) VALUES
(2, '1', '25727258', 'Venezolana', 'Perez Chacon', 'Karen Ninoska', '1996-05-28', 'Palo Alto', 0, 0, 2, 1),
(3, 'Cédula de Identidad', '33243234', 'Venezuela', 'El Escamoso', 'Pedro', '0000-00-00', 'Silent Hill', 54343323, 0, 1, 1);

--
-- Disparadores `empleado`
--
DELIMITER $$
CREATE TRIGGER `empleado_AFTER_INSERT` AFTER INSERT ON `empleado` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('empleado','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.id_empleado)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `empleado_AFTER_UPDATE` AFTER UPDATE ON `empleado` FOR EACH ROW INSERT INTO empleado_respaldo (ID_empleado, tipo_de_documento, numero_de_documento, nacionalidad, apellidos, nombres, fecha_de_nacimiento, direccion, telefono1, telefono2, cargo, fecha,hora) VALUES (old.ID_empleado, old.tipo_de_documento, old.numero_de_documento, old.nacionalidad, old.apellidos, old.nombres, old.fecha_de_nacimiento, old.direccion, old.telefono1, old.telefono2, old.cargo,CURRENT_DATE(),CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `empleado_BEFORE_UPDATE` BEFORE UPDATE ON `empleado` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('empleado','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.id_empleado)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_respaldo`
--

CREATE TABLE `empleado_respaldo` (
  `id` int(11) NOT NULL,
  `ID_empleado` int(11) NOT NULL,
  `tipo_de_documento` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `numero_de_documento` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nacionalidad` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombres` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono1` bigint(20) DEFAULT NULL,
  `telefono2` bigint(20) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado_respaldo`
--

INSERT INTO `empleado_respaldo` (`id`, `ID_empleado`, `tipo_de_documento`, `numero_de_documento`, `nacionalidad`, `apellidos`, `nombres`, `fecha_de_nacimiento`, `direccion`, `telefono1`, `telefono2`, `cargo`, `fecha`, `hora`) VALUES
(1, 2, '1', '25727258', 'Venezolana', 'Perez Chacon', 'Karen Ninoska', '1996-05-28', NULL, NULL, NULL, 2, '2021-11-05', '21:49:46'),
(2, 3, 'Cédula de Identidad', '33243234', 'Venezuela', 'Escamoso', 'Pedro', NULL, 'Silent Hill', 54343323, 0, 1, '2021-11-06', '02:44:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `codmesa` int(11) NOT NULL,
  `mesa` text COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`codmesa`, `mesa`, `estado`) VALUES
(1, 'MESA 1', 1),
(2, 'MESA 2', 1),
(3, 'MESA 3', 1),
(4, 'MESA 4', 1),
(5, 'MESA 5', 1),
(6, 'MESA 6', 1),
(7, 'MESA 7', 1),
(8, 'MESA 8', 1),
(9, 'MESA 9', 1),
(10, 'MESA 10', 1),
(13, 'MESA 11', 0),
(14, 'MESA 11', 0),
(15, 'MESA 11A', 0),
(16, 'MESA 11', 1);

--
-- Disparadores `mesas`
--
DELIMITER $$
CREATE TRIGGER `mesas_AFTER_INSERT` AFTER INSERT ON `mesas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('mesas','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.codmesa)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mesas_AFTER_UPDATE` AFTER UPDATE ON `mesas` FOR EACH ROW INSERT INTO mesas_respaldo (codmesa, mesa,fecha,hora) VALUES (old.codmesa, old.mesa,CURRENT_DATE(),CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mesas_BEFORE_UPDATE` BEFORE UPDATE ON `mesas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('mesas','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.codmesa)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas_respaldo`
--

CREATE TABLE `mesas_respaldo` (
  `id` int(11) NOT NULL,
  `codmesa` int(11) NOT NULL,
  `mesa` text COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `idorden` int(11) NOT NULL,
  `codmesa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `total` int(11) NOT NULL,
  `fecha` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `hora` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `dia` date NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `empleado` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `mesa` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `PDF` varchar(50) COLLATE utf8_spanish2_ci DEFAULT '0',
  `idatencion` int(11) DEFAULT '0',
  `estado` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`idorden`, `codmesa`, `idproducto`, `precio`, `cantidad`, `total`, `fecha`, `hora`, `dia`, `usuario`, `empleado`, `mesa`, `PDF`, `idatencion`, `estado`) VALUES
(14, 1, 56, 20, 1, 20, 'Sabado, 14 de Noviembre de 2021', '04:44 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 1', '1', 6, 'Facturado'),
(15, 5, 56, 20, 1, 20, 'Sabado, 14 de Noviembre de 2021', '04:46 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 5', '1', 7, 'Facturado'),
(16, 15, 68, 60, 1, 60, 'Sabado, 14 de Noviembre de 2021', '04:46 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 11', '1', 8, 'Facturado'),
(17, 8, 56, 20, 1, 20, 'Sabado, 14 de Noviembre de 2021', '04:53 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 8', '1', 9, 'Facturado'),
(18, 2, 67, 70, 1, 70, 'Sabado, 14 de Noviembre de 2021', '04:55 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 2', '1', 0, 'Pendiente'),
(19, 6, 14, 43, 1, 43, 'Sabado, 14 de Noviembre de 2021', '04:56 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 6', '1', 5, 'Facturado'),
(20, 1, 68, 60, 1, 60, 'Sabado, 14 de Noviembre de 2021', '04:57 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 1', '1', 6, 'Facturado'),
(21, 3, 67, 70, 1, 70, 'Sabado, 14 de Noviembre de 2021', '04:57 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 3', '1', 7, 'Facturado'),
(22, 5, 61, 40, 1, 40, 'Sabado, 14 de Noviembre de 2021', '04:58 am', '2021-11-14', 'admin', 'Prueba Prueba', ' MESA 5', '1', 8, 'Facturado'),
(28, 1, 11, 10, 1, 10, 'Viernes, 15 de Octubre de 2021', '12:42 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 1', '1', 11, 'Facturado'),
(29, 1, 67, 70, 1, 70, 'Viernes, 15 de Octubre de 2021', '12:42 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 1', '1', 11, 'Facturado'),
(30, 3, 53, 5, 1, 5, 'Viernes, 15 de Octubre de 2021', '12:53 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 3', '0', 0, 'Pendiente'),
(31, 3, 68, 60, 1, 60, 'Viernes, 15 de Octubre de 2021', '12:53 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 3', '0', 0, 'Pendiente'),
(32, 4, 57, 9, 2, 18, 'Viernes, 15 de Octubre de 2021', '02:32 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 4', '1', 12, 'Facturado'),
(33, 4, 54, 45, 2, 90, 'Viernes, 15 de Octubre de 2021', '02:32 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 4', '1', 12, 'Facturado'),
(34, 4, 15, 29, 1, 29, 'Viernes, 15 de Octubre de 2021', '02:32 am', '2021-10-15', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 4', '1', 12, 'Eliminado'),
(35, 4, 11, 10, 2, 20, 'Sabado, 6 de Noviembre de 2021', '03:40 am', '2021-11-06', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 4', '1', 13, 'Facturado'),
(36, 4, 72, 55, 1, 55, 'Sabado, 6 de Noviembre de 2021', '03:40 am', '2021-11-06', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 4', '1', 13, 'Facturado'),
(37, 4, 15, 29, 1, 29, 'Sabado, 6 de Noviembre de 2021', '03:40 am', '2021-11-06', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 4', '1', 13, 'Eliminado'),
(38, 5, 11, 10, 1, 10, 'Lunes, 22 de Noviembre de 2021', '01:14 am', '2021-11-22', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 5', '1', 14, 'Facturado'),
(39, 5, 49, 36, 1, 36, 'Lunes, 22 de Noviembre de 2021', '01:14 am', '2021-11-22', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 5', '1', 14, 'Facturado'),
(40, 5, 14, 43, 1, 43, 'Lunes, 22 de Noviembre de 2021', '01:14 am', '2021-11-22', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 5', '1', 14, 'Facturado'),
(41, 5, 46, 35, 1, 35, 'Lunes, 22 de Noviembre de 2021', '01:14 am', '2021-11-22', 'admin', 'Karen Ninoska Perez Chacon', ' MESA 5', '1', 14, 'Facturado');

--
-- Disparadores `ordenes`
--
DELIMITER $$
CREATE TRIGGER `ordenes_AFTER_INSERT` AFTER INSERT ON `ordenes` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('ordenes','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idorden)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `nombreproducto` text CHARACTER SET latin1 NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `precio` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `nombreproducto`, `idcategoria`, `precio`, `idusuario`, `estado`) VALUES
(11, 'AGUA CON GAS', 17, 10, 1, 1),
(12, 'COCA COLA 500ML', 17, 33, 1, 1),
(13, 'VINO LA CASONA MALBEC', 17, 128, 1, 1),
(14, 'ENSALADA COCIDA DE GALLINA', 9, 43, 1, 1),
(15, 'ENSALADA MIXTA', 9, 29, 1, 1),
(16, 'SODA 500 ML', 17, 17, 1, 1),
(18, 'HELADOS 2 BOLAS', 8, 40, 1, 1),
(19, 'MILANESA CON FRITAS', 13, 117, 1, 1),
(20, 'VINO VALDEROBLE TINTO', 17, 100, 1, 1),
(21, 'FLAN', 8, 40, 1, 1),
(23, 'COLITA DE CUADRIL', 13, 130, 1, 1),
(39, 'HALLACAS', 22, 15, 1, 1),
(40, 'BANANA SPLIT', 8, 35, 1, 1),
(41, 'MONDONGO MUTE', 13, 25, 1, 1),
(42, 'PISCA ANDINA', 19, 25, 1, 1),
(43, 'CHCHA ANDINA', 17, 35, 1, 1),
(44, 'MASATO TACHIRENSE', 17, 40, 1, 1),
(45, 'HELADO DE 3 BOLAS', 8, 30, 1, 1),
(46, 'CALDO DE PAPAS', 19, 35, 1, 1),
(47, 'MAZAMORRA', 8, 10, 1, 1),
(48, 'HIGOS RELLENOS CON AREQUIPE', 8, 8, 1, 1),
(49, 'ALIADOS', 8, 36, 1, 1),
(50, 'TORTA DE MAZORCA', 8, 12, 1, 1),
(51, 'PALEONIAS', 8, 36, 1, 1),
(52, 'PAN DE JAMON', 22, 12, 1, 1),
(53, 'AGUA PANELA', 17, 5, 1, 1),
(54, 'BISTECK A LA PLANCHA', 13, 45, 1, 1),
(55, 'BABY BEEF', 13, 65, 1, 0),
(56, 'QUESADILLA', 18, 20, 1, 1),
(57, 'CAFE', 17, 9, 1, 1),
(58, 'PAN DE JAMON', 22, 32, 1, 1),
(59, 'MICHE ANDINO', 17, 10, 1, 1),
(60, 'CALENTADO ANDINO', 17, 5, 1, 1),
(61, 'PIZZA HAWAIANA PEQUEÑA', 20, 40, 17, 1),
(63, 'JUGO DE NARANJA', 17, 22, 1, 1),
(64, 'PIZZA TRES QUESOS PEQUEÃƒÆ’Ã¢â‚¬ËœA', 20, 40, 1, 1),
(65, 'PIZZA TRES QUESOS MEDIANA', 20, 55, 1, 1),
(67, 'PIZZA HAWAIANA GRANDE', 20, 70, 1, 1),
(68, 'PIZZA HAWAIANA MEDIANA', 20, 60, 1, 1),
(69, 'PIZZA TRES QUESOS GRANDE', 20, 60, 1, 1),
(70, 'PEPSI MANZANA', 17, 50, 17, 0),
(71, 'GELATINA GOLDEN', 8, 140, 17, 1),
(72, 'BANANA SUPER SPLIT', 8, 55, 17, 0);

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `productos_AFTER_INSERT` AFTER INSERT ON `productos` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('productos','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idproducto)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW INSERT INTO productos_respaldo (idproducto, nombreproducto, idcategoria, precio, idusuario, fecha,hora) VALUES (old.idproducto, old.nombreproducto, old.idcategoria, old.precio, old.idusuario, CURRENT_DATE(), CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `productos_BEFORE_UPDATE` BEFORE UPDATE ON `productos` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('productos','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idproducto)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_respaldo`
--

CREATE TABLE `productos_respaldo` (
  `id` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `nombreproducto` text CHARACTER SET latin1 NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `precio` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos_respaldo`
--

INSERT INTO `productos_respaldo` (`id`, `idproducto`, `nombreproducto`, `idcategoria`, `precio`, `idusuario`, `fecha`, `hora`) VALUES
(1, 61, 'PIZZA HAWAIANA PEQUENA', 20, 40, 1, '2021-11-05', '22:54:18'),
(2, 55, 'BABY BEEF', 13, 65, 1, '2021-11-21', '23:18:46'),
(3, 72, 'BANANA SUPER SPLIT', 8, 55, 17, '2021-11-21', '23:29:43'),
(4, 72, 'BANANA SUPER SPLIT', 8, 55, 17, '2021-11-21', '23:31:56'),
(5, 72, 'BANANA SUPER SPLIT', 8, 55, 17, '2021-11-21', '23:32:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idreserva` int(11) NOT NULL,
  `nombrecliente` varchar(150) CHARACTER SET latin1 NOT NULL,
  `cantidadpersonas` varchar(150) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(150) CHARACTER SET latin1 NOT NULL,
  `diallegada` date NOT NULL,
  `horallegada` text CHARACTER SET latin1 NOT NULL,
  `observaciones` text CHARACTER SET latin1 NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idreserva`, `nombrecliente`, `cantidadpersonas`, `telefono`, `diallegada`, `horallegada`, `observaciones`, `estado`) VALUES
(3, 'CARLOS ALVARES', '12', '12345678', '2021-11-24', '21:00', 'MESA LIBRE', 1),
(12, 'BIANCA ANIDUZZI', '2', '4584463', '2021-10-16', '22:00', 'Sin Restricciones', 1),
(16, 'MARCOS ALBA', '13', '23455677', '2021-11-25', '20:45', 'VINO GRAN RESERVA\r\n', 1),
(17, 'BRUCE WAYNE', '22', '3414584463', '2021-11-24', '21:30', 'SIN PAN', 1),
(19, 'BIANCA ANIDUZZI', '14', '153693019', '2021-11-28', '22:00', 'MOZO JULIA\r\n', 1),
(20, 'Nando Oxenford', '6', '4147428622', '2021-10-18', '10:30', 'Vista a la calle', 1),
(21, 'Nando Oxenford', '5', '4247396804', '2021-10-18', '10:30', 'Sin Restricciones', 0),
(22, 'FDFDF', '5', '234233242', '2021-10-22', '10:30', 'Sin Restricciones', 0),
(23, 'NANDO OXENFORD', '11', '1255', '2021-10-22', '15:30', 'Sin Restricciones', 1),
(24, 'NANDO OXENFORD', '11', '1255', '2021-10-22', '15:30', 'Sin Restricciones', 1),
(25, 'ZXCXC', '5', '21325', '2021-10-30', '15:33', 'Sin Restricciones', 0),
(26, 'NANDO OXENFORD CAVA', '3', '4147425522', '2021-12-31', '15:15', 'CON AIRE ACONDICIONADO', 1),
(27, 'PEDRO PETRO', '6', '423546', '2021-11-27', '20:45', 'Sin Restricciones', 0),
(28, 'ELBER SIMPO', '4', '04160894325', '2021-10-30', '16:20', 'Sin Restricciones', 1),
(29, 'BALBIN BALCUENO', '2', '0276543434', '2021-10-30', '17:30', 'Sin Restricciones', 0),
(30, 'PEDRO ESCAMOSO', '8', '234123123', '2021-11-18', '13:40', 'BODA', 0);

--
-- Disparadores `reservas`
--
DELIMITER $$
CREATE TRIGGER `reservas_AFTER_INSERT` AFTER INSERT ON `reservas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('reservas','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idreserva)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reservas_AFTER_UPDATE` AFTER UPDATE ON `reservas` FOR EACH ROW INSERT INTO reservas_respaldo (idreserva,nombrecliente,cantidadpersonas, telefono, diallegada, horallegada, observaciones,fecha,hora) VALUES (old.idreserva,old.nombrecliente,old.cantidadpersonas,old.telefono, old.diallegada,old.horallegada,old.observaciones,CURRENT_DATE(), CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reservas_BEFORE_UPDATE` BEFORE UPDATE ON `reservas` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('reservas','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idreserva)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_respaldo`
--

CREATE TABLE `reservas_respaldo` (
  `id` int(11) NOT NULL,
  `idreserva` int(11) NOT NULL,
  `nombrecliente` varchar(150) CHARACTER SET latin1 NOT NULL,
  `cantidadpersonas` varchar(150) CHARACTER SET latin1 NOT NULL,
  `telefono` varchar(150) CHARACTER SET latin1 NOT NULL,
  `diallegada` date NOT NULL,
  `horallegada` text CHARACTER SET latin1 NOT NULL,
  `observaciones` text CHARACTER SET latin1 NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `reservas_respaldo`
--

INSERT INTO `reservas_respaldo` (`id`, `idreserva`, `nombrecliente`, `cantidadpersonas`, `telefono`, `diallegada`, `horallegada`, `observaciones`, `fecha`, `hora`) VALUES
(1, 30, 'PEDRO ESCAMOSO', '8', '234123123', '2021-11-18', '13:40', 'CUMPLEAÑOS', '2021-11-06', '02:38:30'),
(2, 30, 'PEDRO ESCAMOSO', '8', '234123123', '2021-11-18', '13:40', 'BODA', '2021-11-06', '02:38:36'),
(3, 3, 'CARLOS ALVARES', '12', '12345678', '2021-11-24', '21:00', 'LIBRE MESA', '2021-11-05', '22:08:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `descripcion` char(128) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `descripcion`, `estado`) VALUES
(1, 'admin', 1),
(2, 'cajero', 1),
(3, 'mesonero', 1),
(4, 'prueba', 1);

--
-- Disparadores `rol`
--
DELIMITER $$
CREATE TRIGGER `rol_AFTER_INSERT` AFTER INSERT ON `rol` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('rol','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idrol)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombreusuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` char(255) COLLATE utf8_spanish2_ci NOT NULL,
  `fechacreado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_usuario` int(11) NOT NULL DEFAULT '0',
  `ID_empleado` int(11) DEFAULT '0',
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombreusuario`, `password`, `fechacreado`, `tipo_usuario`, `ID_empleado`, `estado`) VALUES
(1, 'admin', 'cefbd13986ef4b4c6d57e681da43f7abc076d4d6236df728c1b57519763edd305ee8d6d3c94d5d853dbdc36c1a3169c5e7c4d8bccbf48fb31a6e0eb7758a9f8f', '2021-10-10 07:48:14', 1, NULL, 1),
(6, 'kperez', 'b11a40f05459da396dc8bf609233ddc43267eeba29a5e3d97dd662875765dd0cb89e848ebf0c2b23f2ce932023fe0184077cf60fce1ff9830e911ea15532c590', '2021-10-08 05:24:19', 2, 2, 1),
(9, 'prueba', '288289cdd6edf145926f8a9d354c4b93547ac48660cbd7be38c58102c87a77b5927fde7a08de457a00e46a9b62e82c469a13a6fdd7448aacf9691cbfb5e5a294', '2021-10-09 22:27:08', 0, NULL, 0),
(10, 'prueba20', '33bbaa39c080a8e2c0bd730e4cf5b02606a205d62991386da24b00321cec76aa471e6138fc036c79054772c7686d1ed6ceed95fb23a60f8a4bbe06346a2e782f', '2021-10-10 04:38:27', 3, NULL, 1),
(11, 'test', '69b8982b4d0a0dab66aa92a2e4f8eb6f3f8f0b5f9d902a127df556a55426523b45596f6471e477f02f4061acb88af461b928aa468dd1aa5a3faaa663e4d60379', '2021-10-10 04:39:19', 0, NULL, 0),
(12, 'prueba3', '4f87f273fecf84a4d95123ddced6b6b2cec229877f9a324ae164cf7e13ea29b579114ac2c1628161afa0c84fff87f6a35110c03762f4fe01de593e574352af66', '2021-10-10 06:13:59', 2, NULL, 0),
(13, 'prueba7', 'ea1f1e35836df122195c29a9311a080af509f5d921f0a74a26791205a25dd58b9a9b461be9b2d9e21fd708fd7dede1caca472ab7453c898588eeeb6b36257291', '2021-10-26 04:56:19', 0, NULL, 0),
(15, 'prueba 4', 'e5abaad3c8965486fee892f3d7d2b6022aca033151ed15b31af1cadb92c448060681a8c851babc74239d7c6a9c6cd710ae542fdf3299c8328de9a09b75100725', '2021-10-26 06:01:16', 0, 1, 0),
(16, 'prueba7', 'ea1f1e35836df122195c29a9311a080af509f5d921f0a74a26791205a25dd58b9a9b461be9b2d9e21fd708fd7dede1caca472ab7453c898588eeeb6b36257291', '2021-10-26 18:32:14', 0, 1, 0),
(17, 'Prueba', '0ba7c1f753b174aa04d3aea086c8fd27a99fc16da1705bbde09c1cb3cba565c1a1cdb93afb06d7b147eb0203440a0bfcf2f943834a2bc3f41059a8fbd44dba92', '2021-11-15 01:31:30', 3, 0, 1),
(18, 'pescamoso', 'd7b04ff5211f60d3a678ae5d31a49679531f5a2712a634b574a6e8a375c163f7303feacfcbf3c3356e285e33518c054a7db5eb507d57616dff21428b23a8f9ec', '2021-11-06 07:44:29', 3, 3, 1);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `usuarios_AFTER_INSERT` AFTER INSERT ON `usuarios` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('usuarios','INSERT',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idusuario)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `usuarios_AFTER_UPDATE` AFTER UPDATE ON `usuarios` FOR EACH ROW INSERT INTO usuarios_respaldo (idusuario, nombreusuario, fechacreado, tipo_usuario, ID_empleado,fecha,hora) VALUES (old.idusuario, old.nombreusuario, old.fechacreado, old.tipo_usuario, old.ID_empleado,CURRENT_DATE(), CURRENT_TIME())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `usuarios_BEFORE_UPDATE` BEFORE UPDATE ON `usuarios` FOR EACH ROW INSERT INTO auditoria(tabla,tipo,fecha,hora,usuario,valor_id) VALUES('usuarios','UPDATE',CURRENT_DATE(),CURRENT_TIME(),USER(),new.idusuario)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_respaldo`
--

CREATE TABLE `usuarios_respaldo` (
  `id` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `nombreusuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` char(255) COLLATE utf8_spanish2_ci NOT NULL,
  `fechacreado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_usuario` int(11) NOT NULL DEFAULT '0',
  `ID_empleado` int(11) DEFAULT '0',
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios_respaldo`
--

INSERT INTO `usuarios_respaldo` (`id`, `idusuario`, `nombreusuario`, `password`, `fechacreado`, `tipo_usuario`, `ID_empleado`, `fecha`, `hora`) VALUES
(1, 10, 'prueba20', '', '2021-10-10 04:38:27', 4, NULL, '2021-11-06', '01:51:33'),
(2, 10, 'prueba20', '', '2021-10-10 04:38:27', 0, NULL, '2021-11-05', '23:13:46'),
(3, 15, 'prueba 4', '', '2021-10-26 06:01:16', 0, 1, '2021-11-21', '23:53:34'),
(4, 10, 'prueba20', '', '2021-10-10 04:38:27', 3, NULL, '2021-11-21', '23:53:38'),
(5, 12, 'prueba3', '', '2021-10-10 06:13:59', 2, NULL, '2021-11-21', '23:53:42'),
(6, 13, 'prueba7', '', '2021-10-26 04:56:19', 0, NULL, '2021-11-21', '23:53:44'),
(7, 16, 'prueba7', '', '2021-10-26 18:32:14', 0, 1, '2021-11-21', '23:53:48'),
(8, 10, 'prueba20', '', '2021-10-10 04:38:27', 3, NULL, '2021-11-22', '00:12:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atencion`
--
ALTER TABLE `atencion`
  ADD PRIMARY KEY (`idatencion`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_auditoria`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `categorias_respaldo`
--
ALTER TABLE `categorias_respaldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_empleado`),
  ADD KEY `cargo` (`cargo`);

--
-- Indices de la tabla `empleado_respaldo`
--
ALTER TABLE `empleado_respaldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`codmesa`);

--
-- Indices de la tabla `mesas_respaldo`
--
ALTER TABLE `mesas_respaldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`idorden`),
  ADD KEY `codmesa` (`codmesa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `FK_productos_categorias` (`idcategoria`),
  ADD KEY `FK_productos_usuarios` (`idusuario`);

--
-- Indices de la tabla `productos_respaldo`
--
ALTER TABLE `productos_respaldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idreserva`);

--
-- Indices de la tabla `reservas_respaldo`
--
ALTER TABLE `reservas_respaldo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `tipo_usuario` (`tipo_usuario`),
  ADD KEY `ID_empleado` (`ID_empleado`);

--
-- Indices de la tabla `usuarios_respaldo`
--
ALTER TABLE `usuarios_respaldo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atencion`
--
ALTER TABLE `atencion`
  MODIFY `idatencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `idcargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `categorias_respaldo`
--
ALTER TABLE `categorias_respaldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleado_respaldo`
--
ALTER TABLE `empleado_respaldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `codmesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `mesas_respaldo`
--
ALTER TABLE `mesas_respaldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `idorden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `productos_respaldo`
--
ALTER TABLE `productos_respaldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `reservas_respaldo`
--
ALTER TABLE `reservas_respaldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios_respaldo`
--
ALTER TABLE `usuarios_respaldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`idcargo`);

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`codmesa`) REFERENCES `mesas` (`codmesa`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_productos_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
