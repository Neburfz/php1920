-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2020 a las 09:22:59
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `empleadosnm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `cod_dpto` varchar(4) NOT NULL DEFAULT '',
  `nombre_dpto` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`cod_dpto`, `nombre_dpto`) VALUES
('DP01', 'Departamento1'),
('DP02', 'Departamento2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `dni` varchar(9) NOT NULL DEFAULT '',
  `nombre` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `salario` double DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`dni`, `nombre`, `apellidos`, `fecha_nac`, `salario`) VALUES
('1234567A', 'Ruben', 'Fernandez Zaplana', '2000-01-20', 2000),
('1234567B', 'David', 'Perez Serrano', '2000-07-14', 2000),
('9090R', 'Gonzalo', 'Ruiz Alonso', '2000-04-12', 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emple_dept`
--

CREATE TABLE IF NOT EXISTS `emple_dept` (
  `dni` varchar(9) NOT NULL DEFAULT '',
  `cod_dpto` varchar(4) NOT NULL DEFAULT '',
  `fecha_ini` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`dni`,`cod_dpto`,`fecha_ini`),
  KEY `fk_empl_dept_cod_dpto` (`cod_dpto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `emple_dept`
--

INSERT INTO `emple_dept` (`dni`, `cod_dpto`, `fecha_ini`, `fecha_fin`) VALUES
('1234567A', 'DP01', '2019-12-04 00:00:00', NULL),
('1234567B', 'DP02', '2019-12-04 00:00:00', NULL),
('9090R', 'DP01', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `emple_dept`
--
ALTER TABLE `emple_dept`
  ADD CONSTRAINT `fk_empl_dept_cod_dpto` FOREIGN KEY (`cod_dpto`) REFERENCES `departamento` (`cod_dpto`),
  ADD CONSTRAINT `fk_empl_dept_dni` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
