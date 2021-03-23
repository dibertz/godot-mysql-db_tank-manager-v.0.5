-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2021 a las 21:00:51
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dibertz_wp690`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wpb6_clients`
--

CREATE TABLE `wpb6_clients` (
  `ID` int(11) NOT NULL,
  `user_login` varchar(15) NOT NULL,
  `user_level` int(2) NOT NULL,
  `user_voucher` int(6) NOT NULL,
  `user_money` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `wpb6_clients`
--

INSERT INTO `wpb6_clients` (`ID`, `user_login`, `user_level`, `user_voucher`, `user_money`) VALUES
(1, 'Guest', 5, 500, 1000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `wpb6_clients`
--
ALTER TABLE `wpb6_clients`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `wpb6_clients`
--
ALTER TABLE `wpb6_clients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
