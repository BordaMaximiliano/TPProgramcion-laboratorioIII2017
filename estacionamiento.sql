-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2017 a las 02:16:09
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estacionamiento`
--
CREATE DATABASE IF NOT EXISTS `estacionamiento` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `estacionamiento`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocheras`
--

CREATE TABLE `cocheras` (
  `codigo` int(11) NOT NULL COMMENT '(199,299,399)',
  `piso` int(11) NOT NULL COMMENT '(1,2,3)',
  `descripcion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `especial` varchar(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'N' COMMENT '(s,n prioridad embarazadas)	',
  `sucursal` int(11) NOT NULL DEFAULT '1' COMMENT '(default 01, fuera de alcance)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cocheras`
--

INSERT INTO `cocheras` (`codigo`, `piso`, `descripcion`, `especial`, `sucursal`) VALUES
(1, 0, 'cochera discapacitados del piso PB', 'S', 1),
(2, 0, 'cochera discapacitados del piso PB', 'S', 1),
(3, 0, 'cochera discapacitados del piso PB', 'S', 1),
(4, 0, 'cochera normal del piso PB', 'N', 1),
(101, 1, 'cochera normal del primer piso', 'N', 1),
(102, 1, 'cochera normal del primer piso', 'N', 1),
(103, 1, 'cochera normal del primer piso', 'N', 1),
(104, 1, 'cochera normal del primer piso', 'N', 1),
(201, 2, 'cochera normal del segundo piso', 'N', 1),
(202, 2, 'cochera normal del segundo piso', 'N', 1),
(203, 2, 'cochera normal del segundo piso', 'N', 1),
(301, 3, 'cochera normal del tercer piso', 'N', 1),
(302, 3, 'cochera normal del tercer piso', 'N', 1),
(303, 3, 'cochera normal del tercer piso', 'N', 1),
(401, 4, 'cochera normal del cuarto piso', 'N', 1),
(402, 4, 'cochera normal del cuarto piso', 'N', 1),
(403, 4, 'cochera normal del cuarto piso', 'N', 1),
(404, 4, 'cochera normal del cuarto piso', 'N', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `codigoEmpleado` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `codigoTurno` int(11) NOT NULL,
  `estado` varchar(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'A' COMMENT '(baja logica)',
  `tipoUsuario` varchar(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'C' COMMENT 'definira si es administrador ''A'' o usuario normal ''C''',
  `usuario` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contraseña` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`codigoEmpleado`, `nombre`, `apellido`, `codigoTurno`, `estado`, `tipoUsuario`, `usuario`, `contraseña`) VALUES
(1, 'Juan', 'Perez', 1, 'A', 'C', 'jperez', NULL),
(2, 'jose', 'Gimenez', 2, 'A', 'C', 'jgimenez', NULL),
(3, 'Pedro', 'Augustus', 3, 'A', 'C', 'paugustus', NULL),
(4, 'Maxi', 'Bordis', 4, 'A', 'A', 'mbordis', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `codigoPago` int(11) NOT NULL,
  `codigoPrecio` int(11) DEFAULT NULL COMMENT 'no se colocara valor hasta que no salga el vehiculo',
  `codigoCochera` int(11) NOT NULL COMMENT 'se le asignara una cochera al ingresar',
  `codigoVehiculo` int(11) NOT NULL COMMENT 'al ingresar',
  `monto` decimal(10,0) DEFAULT NULL COMMENT '(al salir)(si es nulo y es de tipo diario es porque aun esta estacionado)',
  `HIngreso` date NOT NULL COMMENT 'al ingresar',
  `HSalida` date DEFAULT NULL COMMENT '(al salir)(se utilizara para determinar si la cochera esta ocupada = null)',
  `fecha` date NOT NULL COMMENT 'al ingresar (se validara la fecha, ya que si la salida la hace al otro dia se le cobra estadia y luego el proporcional del dia corriente)',
  `codigoEmpleadoIngreso` int(11) NOT NULL COMMENT 'al ingresar',
  `codigoEmpleadoEgreso` int(11) DEFAULT NULL COMMENT '(al salir)(servira para arqueo diario, por si un auto entra en un turno y paga y sale en el otro )'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaprecio`
--

CREATE TABLE `listaprecio` (
  `codigoPrecio` int(11) NOT NULL,
  `tipoMonto` varchar(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'hora, mediaestadia, estadia, quincenal, mensual',
  `descripcion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `rangoDDHoras` int(11) NOT NULL COMMENT 'se coloca la cantidad minima de horas para esta categoria',
  `rangoHHHoras` int(11) NOT NULL COMMENT '(se coloca la cantidad maxima de horas para esta categoria',
  `monto` decimal(10,0) NOT NULL,
  `tipoPrecio` varchar(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'D' COMMENT '(sera D si el costo es diario para entrar dentro del calculo diario, M si es mensual o quincenal)',
  `multiplica` varchar(1) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `listaprecio`
--

INSERT INTO `listaprecio` (`codigoPrecio`, `tipoMonto`, `descripcion`, `rangoDDHoras`, `rangoHHHoras`, `monto`, `tipoPrecio`, `multiplica`) VALUES
(1, 'H', 'Cobro por modalidad de hora', 0, 3, '50', 'D', 'S'),
(2, 'M', 'Cobro por modalidad de media estadia', 3, 5, '150', 'D', 'N'),
(3, 'E', 'Cobro por modalidad de estadia', 5, 24, '300', 'D', 'N'),
(4, 'Q', 'Cobro por modalidad quincenal', 0, 0, '3000', 'M', 'N'),
(5, 'X', 'Cobro por modalidad mensual', 0, 0, '5000', 'M', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `codigoTurno` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `horarioEntrada` varchar(5) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'horario permitido para loguar la entrada',
  `horarioSalida` varchar(5) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`codigoTurno`, `descripcion`, `horarioEntrada`, `horarioSalida`) VALUES
(1, 'Turno mañana', '06:00', '12:00'),
(2, 'Turno tarde', '12:01', '18:00'),
(3, 'Turno noche', '18:01', '24:00'),
(4, 'Supervisor', '00:01', '24:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `patente` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `color` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `marcaAutomovil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoVehiculo` varchar(5) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cocheras`
--
ALTER TABLE `cocheras`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`codigoEmpleado`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`codigoPago`);

--
-- Indices de la tabla `listaprecio`
--
ALTER TABLE `listaprecio`
  ADD PRIMARY KEY (`codigoPrecio`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`codigoTurno`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
