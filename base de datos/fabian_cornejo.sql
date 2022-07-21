-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2022 a las 07:10:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fabian_cornejo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_inventario` (IN `cantidad` INT(11))   BEGIN
 UPDATE inventario
 SET
 cantidad = 200 WHERE 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_tablas` (IN `cantidad` INT(11))   SELECT * from inventario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tupla` (IN `codigoInven` INT(11), IN `cantidad` INT(11), IN `valorArriendo` INT(11), IN `valorVenta` INT(11))   INSERT INTO `inventario`
(`codigoInven`, `cantidad`, `valorArriendo`, `valorVenta`) 
VALUES (codigoInven,cantidad,valorArriendo,valorVenta)$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `max_inventario` () RETURNS INT(11)  BEGIN
  DECLARE numero int; 
  SELECT max(cantidad)into numero FROM inventario;
  RETURN numero;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `multiplicar_inventario` () RETURNS INT(11)  BEGIN
  DECLARE numero int; 
  SELECT max(cantidad*10) FROM inventario into numero ;
  RETURN numero;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `codigoInven` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valorArriendo` int(11) NOT NULL,
  `valorVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`codigoInven`, `cantidad`, `valorArriendo`, `valorVenta`) VALUES
(0, 200, 0, 0),
(10, 200, 10000, 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `codigoPelicula` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `duracion` varchar(10) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`codigoInven`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`codigoPelicula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
