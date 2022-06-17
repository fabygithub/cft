-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2022 a las 15:32:17
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_agregarTipoProducto` (IN `nombre` VARCHAR(20))  BEGIN
	INSERT INTO tipoproducto VALUES(null, nombre);
    SELECT "El cliente fue agregado correctamente" AS Resultado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_nombre_consultar` (IN `pedirNombre` VARCHAR(20))  BEGIN
	SELECT * FROM tipoproducto
    WHERE nombre = pedirNombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_tipoProducto_producto_consulta` ()  BEGIN
	SELECT codigo, t.nombre, cantidad, precio, subtotal, pr.nombre, apellido, cargo
    FROM producto p, tipoproducto t, proveedores pr
    WHERE t.idTipoProducto=p.idTipoProducto
    AND p.idTipoProducto=pr.idproveedor;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loginusuarios`
--

CREATE TABLE `loginusuarios` (
  `usuario` varchar(30) NOT NULL,
  `contrasena` varchar(40) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `loginusuarios`
--

INSERT INTO `loginusuarios` (`usuario`, `contrasena`, `metodo`) VALUES
('Alfredo', '261c5ad45770cc14875c8f46eaa3eca42568104a', 'SHA'),
('Benjamin', 'HOLA', 'TEXTO'),
('Fernando', 'c6f00988430dbc8e83a7bc7ab5256346', 'MD5'),
('Ignacio', '261c5ad45770cc14875c8f46eaa3eca42568104a', 'SHA1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `idTipoProducto` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `idTipoProducto`, `codigo`, `descripcion`, `cantidad`, `precio`, `subtotal`, `iva`, `total`, `idproveedor`) VALUES
(1, 1, 'tecl', 'teclado negro', 100, 2000, 200000, 38000, 238000, 1),
(2, 5, 'mo', 'mouse negro', 100, 2000, 200000, 38000, 238000, 2),
(3, 2, 'compu', 'computador msi', 5, 10000, 50000, 9500, 59500, 2),
(4, 5, 'mo', 'mouse inalambrico', 25, 1500, 37500, 7125, 44625, 1),
(5, 4, 'hp', 'notebook LG', 10, 50000, 500000, 95000, 595000, NULL),
(6, 2, 'msi', 'computador de escritorio', 30, 150000, 4500000, 855000, 5355000, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `nombrecompañia` varchar(40) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `cargo` varchar(40) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `region` varchar(60) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `nombrecompañia`, `nombre`, `apellido`, `cargo`, `direccion`, `ciudad`, `region`, `telefono`) VALUES
(1, 'compañoa s.a', 'Jorge', 'Rojas', 'Proveedor', 'Avda. Franncia', 'Santiago', 'Region metropolitana', '65445'),
(2, 'sitio s.a.', 'Juan', 'Varas', 'Cliente', 'Avda. las Pataguas', 'Valparaiso', 'Viña del mar', '345654');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`idTipoProducto`, `Nombre`) VALUES
(1, 'teclado'),
(2, 'pc'),
(3, 'mouse'),
(4, 'tablet'),
(5, 'notebook'),
(6, 'Galio');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `loginusuarios`
--
ALTER TABLE `loginusuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `idproveedor` (`idproveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idTipoProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `idproveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`),
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipoProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
