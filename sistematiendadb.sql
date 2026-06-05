-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2026 a las 22:10:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistematiendadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ClienteId` int(11) NOT NULL,
  `Nombre` longtext NOT NULL,
  `Apellido` longtext NOT NULL,
  `Email` longtext NOT NULL,
  `Telefono` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteId`, `Nombre`, `Apellido`, `Email`, `Telefono`) VALUES
(2, 'María', 'GómeX', 'maria@gmail.com', '0982222222'),
(3, 'Carlos', 'Lopez', 'carlos@gmail.com', '0973333333'),
(4, 'Andrea', 'Mendoza', 'andrea@gmail.com', '0964444444'),
(5, 'Luis', 'Ramírez', 'luis@gmail.com', '0955555555'),
(6, 'Luis', 'Huallco', 'luishualco2005@gmail.com', '0989523533');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `CompraId` int(11) NOT NULL,
  `ClienteId` int(11) NOT NULL,
  `ProductoId` int(11) NOT NULL,
  `Fecha` datetime(6) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Total` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`CompraId`, `ClienteId`, `ProductoId`, `Fecha`, `Cantidad`, `Total`) VALUES
(2, 2, 2, '2026-06-05 11:46:03.000000', 3, 135.00),
(3, 3, 3, '2026-06-05 11:46:03.000000', 3, 182.25),
(4, 4, 4, '2026-06-05 11:46:03.000000', 5, 194.95),
(5, 5, 5, '2026-06-05 11:46:03.000000', 1, 29.90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProductoId` int(11) NOT NULL,
  `Nombre` longtext NOT NULL,
  `Talla` longtext NOT NULL,
  `Color` longtext NOT NULL,
  `Precio` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ProductoId`, `Nombre`, `Talla`, `Color`, `Precio`) VALUES
(1, 'Camiseta Nike', 'M', 'Negro', 25.50),
(2, 'Pantalón Adidas', 'L', 'Azul', 45.00),
(3, 'Chaqueta Puma', 'S', 'Rojo', 60.75),
(4, 'Sudadera Reebok', 'XL', 'Gris', 38.99),
(5, 'Short Under Armour', 'M', 'Blanco', 29.90),
(6, 'Camisa Venus', 'XXL', 'Negro', 25.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20260605051508_InicialMySQL', '9.0.0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteId`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`CompraId`),
  ADD KEY `IX_Compras_ClienteId` (`ClienteId`),
  ADD KEY `IX_Compras_ProductoId` (`ProductoId`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoId`);

--
-- Indices de la tabla `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `CompraId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK_Compras_Clientes_ClienteId` FOREIGN KEY (`ClienteId`) REFERENCES `clientes` (`ClienteId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Compras_Productos_ProductoId` FOREIGN KEY (`ProductoId`) REFERENCES `productos` (`ProductoId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
