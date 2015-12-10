-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-12-2015 a las 12:14:58
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `veotek2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE IF NOT EXISTS `bitacora` (
  `idBitacora` int(11) NOT NULL AUTO_INCREMENT,
  `trabajo` varchar(128) DEFAULT NULL,
  `hora` datetime DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idBitacora`,`usuario_idusuario`),
  KEY `fk_Bitacora_usuario1_idx` (`usuario_idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`idBitacora`, `trabajo`, `hora`, `usuario_idusuario`) VALUES
(1, 'Revisando actividades.', '2015-12-09 10:46:28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `dia_entrada` date DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `dia_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `tiempo` varchar(8) NOT NULL,
  `tiempo_decimal` float(5,2) NOT NULL,
  `personal_idpersonal` int(11) NOT NULL,
  PRIMARY KEY (`idhorario`,`personal_idpersonal`),
  KEY `fk_horario_personal1_idx` (`personal_idpersonal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`idhorario`, `dia_entrada`, `hora_entrada`, `dia_salida`, `hora_salida`, `tiempo`, `tiempo_decimal`, `personal_idpersonal`) VALUES
(1, '2015-12-04', '16:43:35', '2015-12-04', '16:56:16', '0:13', 0.22, 4),
(2, '2015-12-04', '16:43:42', '2015-12-04', '16:45:16', '0:2', 0.03, 18),
(3, '2015-12-04', '16:43:49', '2015-12-04', '16:44:43', '0:1', 0.02, 15),
(4, '2015-12-04', '16:43:56', '2015-12-04', '17:59:34', '1:16', 1.27, 6),
(5, '2015-12-04', '16:44:04', '2015-12-04', '18:28:49', '1:45', 1.75, 23),
(6, '2015-12-04', '16:44:11', '2015-12-04', '19:11:19', '2:27', 2.45, 1),
(7, '2015-12-04', '16:44:20', '2015-12-04', '16:55:57', '0:12', 0.20, 7),
(8, '2015-12-04', '16:44:36', NULL, NULL, '', 0.00, 12),
(9, '2015-12-04', '16:44:53', '2015-12-04', '19:01:54', '2:17', 2.28, 9),
(10, '2015-12-04', '16:45:02', '2015-12-04', '16:56:09', '0:11', 0.18, 2),
(11, '2015-12-04', '16:45:09', '2015-12-04', '18:00:14', '1:15', 1.25, 20),
(12, '2015-12-04', '16:55:36', '2015-12-04', '16:56:24', '0:1', 0.02, 10),
(13, '2015-12-04', '16:55:43', '2015-12-04', '17:59:49', '1:4', 1.07, 11),
(14, '2015-12-04', '16:55:49', '2015-12-04', '18:57:36', '2:2', 2.03, 13),
(15, '2015-12-04', '16:56:35', '2015-12-04', '18:30:26', '1:34', 1.57, 16),
(16, '2015-12-04', '16:56:42', '2015-12-04', '18:30:01', '1:33', 1.55, 19),
(17, '2015-12-04', '16:56:55', '2015-12-04', '19:01:43', '2:5', 2.08, 22),
(18, '2015-12-04', '17:59:42', '2015-12-04', '18:59:48', '1:0', 1.00, 18),
(19, '2015-12-04', '17:59:56', '2015-12-04', '18:58:14', '0:58', 0.97, 17),
(20, '2015-12-04', '18:00:04', '2015-12-04', '18:29:17', '0:29', 0.48, 15),
(21, '2015-12-04', '18:29:24', '2015-12-04', '18:58:38', '0:29', 0.48, 3),
(22, '2015-12-04', '18:29:34', NULL, NULL, '', 0.00, 5),
(23, '2015-12-04', '18:29:47', '2015-12-04', '18:59:16', '0:29', 0.48, 11),
(24, '2015-12-04', '18:29:54', '2015-12-04', '18:59:01', '0:29', 0.48, 14),
(25, '2015-12-04', '18:30:20', NULL, NULL, '', 0.00, 2),
(26, '2015-12-04', '18:30:41', '2015-12-04', '19:11:39', '0:41', 0.68, 10),
(27, '2015-12-04', '18:30:50', NULL, NULL, '', 0.00, 20),
(28, '2015-12-04', '18:30:56', NULL, NULL, '', 0.00, 8),
(29, '2015-12-04', '18:57:29', NULL, NULL, '', 0.00, 16),
(30, '2015-12-04', '18:57:43', '2015-12-04', '18:59:40', '0:2', 0.03, 19),
(31, '2015-12-04', '18:57:49', NULL, NULL, '', 0.00, 7),
(32, '2015-12-04', '18:57:56', NULL, NULL, '', 0.00, 21),
(33, '2015-12-04', '18:58:27', NULL, NULL, '', 0.00, 15),
(34, '2015-12-04', '18:58:43', NULL, NULL, '', 0.00, 6),
(35, '2015-12-05', '13:33:32', '2015-12-05', '14:06:29', '0:33', 0.55, 15),
(36, '2015-12-05', '13:33:38', '2015-12-05', '14:57:36', '1:24', 1.40, 18),
(37, '2015-12-05', '13:33:43', '2015-12-05', '14:57:45', '1:24', 1.40, 4),
(38, '2015-12-05', '13:33:49', '2015-12-05', '14:07:33', '0:34', 0.57, 8),
(39, '2015-12-05', '13:33:55', '2015-12-05', '14:06:38', '0:33', 0.55, 2),
(40, '2015-12-05', '13:34:00', '2015-12-05', '14:06:21', '0:32', 0.53, 7),
(41, '2015-12-05', '13:34:06', '2015-12-05', '14:08:14', '0:34', 0.57, 1),
(42, '2015-12-05', '13:34:14', '2015-12-05', '14:57:59', '1:24', 1.40, 19),
(43, '2015-12-05', '13:34:20', '2015-12-05', '16:29:20', '2:55', 2.92, 22),
(44, '2015-12-05', '13:34:25', '2015-12-05', '15:00:05', '1:26', 1.43, 11),
(45, '2015-12-05', '13:34:30', '2015-12-05', '14:58:05', '1:24', 1.40, 13),
(48, '2015-12-05', '14:07:26', '2015-12-05', '14:57:52', '0:50', 0.83, 6),
(49, '2015-12-05', '14:08:05', '2015-12-05', '16:28:45', '2:21', 2.35, 7),
(50, '2015-12-05', '14:08:20', '2015-12-05', '16:29:02', '2:21', 2.35, 2),
(51, '2015-12-05', '14:58:11', '2015-12-05', '16:31:23', '1:33', 1.55, 12),
(52, '2015-12-05', '14:58:17', '2015-12-05', '16:28:39', '1:30', 1.50, 15),
(53, '2015-12-05', '14:58:22', '2015-12-05', '15:00:38', '0:2', 0.03, 17),
(54, '2015-12-05', '14:58:28', '2015-12-05', '16:30:16', '1:32', 1.53, 18),
(55, '2015-12-05', '14:59:45', '2015-12-05', '16:28:55', '1:29', 1.48, 3),
(56, '2015-12-05', '14:59:54', '2015-12-05', '17:01:32', '2:2', 2.03, 10),
(57, '2015-12-05', '15:00:00', '2015-12-05', '17:00:48', '2:1', 2.02, 23),
(58, '2015-12-05', '15:00:28', '2015-12-05', '16:29:08', '1:29', 1.48, 20),
(59, '2015-12-05', '15:00:32', '2015-12-05', '16:31:33', '1:31', 1.52, 13),
(60, '2015-12-05', '15:00:49', '2015-12-05', '16:30:24', '1:30', 1.50, 16),
(61, '2015-12-05', '15:00:55', '2015-12-05', '16:30:30', '1:30', 1.50, 9),
(62, '2015-12-05', '15:01:05', '2015-12-05', '17:00:43', '1:60', 2.00, 1),
(63, '2015-12-05', '15:01:27', '2015-12-05', '16:29:37', '1:28', 1.47, 4),
(64, '2015-12-05', '16:29:26', '2015-12-05', '16:30:10', '0:1', 0.02, 19),
(65, '2015-12-05', '16:29:32', NULL, NULL, '', 0.00, 14),
(66, '2015-12-05', '16:30:38', '2015-12-05', '17:00:39', '0:30', 0.50, 5),
(67, '2015-12-05', '16:31:38', '2015-12-05', '17:00:30', '0:29', 0.48, 3),
(68, '2015-12-05', '16:31:42', '2015-12-05', '17:01:13', '0:30', 0.50, 7),
(69, '2015-12-05', '16:31:47', '2015-12-05', '17:00:26', '0:29', 0.48, 6),
(70, '2015-12-05', '17:00:34', '2015-12-05', '17:00:59', '0:0', 0.00, 4),
(71, '2015-12-07', '08:32:00', NULL, NULL, '', 0.00, 1),
(72, '2015-12-07', '08:32:54', '2015-12-07', '08:42:34', '0:10', 0.17, 5),
(73, '2015-12-07', '08:37:12', NULL, NULL, '', 0.00, 4),
(74, '2015-12-07', '08:37:46', NULL, NULL, '', 0.00, 15),
(75, '2015-12-07', '08:38:42', NULL, NULL, '', 0.00, 21),
(76, '2015-12-07', '08:38:49', NULL, NULL, '', 0.00, 11),
(77, '2015-12-07', '08:41:46', NULL, NULL, '', 0.00, 13),
(78, '2015-12-07', '08:42:13', NULL, NULL, '', 0.00, 16),
(79, '2015-12-07', '08:42:27', NULL, NULL, '', 0.00, 2),
(80, '2015-12-07', '08:42:46', NULL, NULL, '', 0.00, 8),
(81, '2015-12-07', '08:43:07', NULL, NULL, '', 0.00, 3),
(82, '2015-12-07', '08:43:36', NULL, NULL, '', 0.00, 18),
(83, '2015-12-07', '08:43:42', NULL, NULL, '', 0.00, 9),
(84, '2015-12-07', '08:43:47', NULL, NULL, '', 0.00, 10),
(85, '2015-12-07', '08:44:02', NULL, NULL, '', 0.00, 22),
(86, '2015-12-07', '08:44:10', NULL, NULL, '', 0.00, 19),
(87, '2015-12-08', '09:54:04', '2015-12-08', '14:22:07', '4:28', 4.47, 11),
(88, '2015-12-08', '09:54:11', '2015-12-08', '14:21:18', '4:27', 4.45, 8),
(89, '2015-12-08', '09:54:20', '2015-12-08', '14:21:29', '4:27', 4.45, 14),
(90, '2015-12-08', '09:54:25', '2015-12-08', '16:42:30', '6:48', 6.80, 7),
(91, '2015-12-08', '09:54:30', '2015-12-08', '14:22:23', '4:28', 4.47, 6),
(92, '2015-12-08', '09:54:34', '2015-12-08', '14:21:14', '4:27', 4.45, 2),
(93, '2015-12-08', '09:54:40', '2015-12-08', '14:23:10', '4:29', 4.48, 1),
(94, '2015-12-08', '09:54:45', '2015-12-08', '16:43:38', '6:49', 6.82, 19),
(95, '2015-12-08', '09:54:50', '2015-12-08', '14:21:52', '4:27', 4.45, 18),
(96, '2015-12-08', '09:54:58', '2015-12-08', '14:22:58', '4:28', 4.47, 21),
(97, '2015-12-08', '09:55:35', '2015-12-08', '16:42:53', '6:47', 6.78, 22),
(98, '2015-12-08', '09:56:04', '2015-12-08', '14:21:36', '4:26', 4.43, 17),
(99, '2015-12-08', '09:59:26', '2015-12-08', '14:21:56', '4:23', 4.38, 3),
(100, '2015-12-08', '10:00:52', '2015-12-08', '14:22:02', '4:21', 4.35, 4),
(101, '2015-12-08', '10:01:25', '2015-12-08', '14:23:17', '4:22', 4.37, 9),
(102, '2015-12-08', '10:03:03', '2015-12-08', '10:22:16', '0:19', 0.32, 13),
(103, '2015-12-08', '10:17:22', '2015-12-08', '14:22:28', '4:5', 4.08, 10),
(104, '2015-12-08', '10:20:34', '2015-12-08', '16:43:02', '6:22', 6.37, 23),
(105, '2015-12-08', '10:21:12', '2015-12-08', '16:43:44', '6:23', 6.38, 16),
(106, '2015-12-08', '10:21:56', '2015-12-08', '16:42:03', '6:20', 6.33, 15),
(107, '2015-12-08', '10:22:39', '2015-12-08', '14:21:40', '3:59', 3.98, 13),
(108, '2015-12-08', '14:21:09', '2015-12-08', '16:42:40', '2:22', 2.37, 5),
(109, '2015-12-08', '14:21:24', '2015-12-08', '16:44:05', '2:23', 2.38, 12),
(110, '2015-12-08', '14:21:46', '2015-12-08', '14:22:49', '0:1', 0.02, 20),
(111, '2015-12-08', '16:41:57', '2015-12-08', '18:51:07', '2:9', 2.15, 18),
(112, '2015-12-08', '16:42:10', '2015-12-08', '18:57:30', '2:15', 2.25, 17),
(113, '2015-12-08', '16:42:16', '2015-12-08', '18:50:26', '2:8', 2.13, 3),
(114, '2015-12-08', '16:42:20', '2015-12-08', '18:57:15', '2:15', 2.25, 1),
(115, '2015-12-08', '16:42:25', '2015-12-08', '18:50:31', '2:8', 2.13, 2),
(116, '2015-12-08', '16:42:35', '2015-12-08', '18:57:25', '2:15', 2.25, 8),
(117, '2015-12-08', '16:44:11', NULL, NULL, '', 0.00, 13),
(118, '2015-12-08', '16:44:15', '2015-12-08', '18:51:02', '2:7', 2.12, 15),
(119, '2015-12-08', '16:44:33', '2015-12-08', '18:50:45', '2:6', 2.10, 7),
(120, '2015-12-08', '16:44:38', '2015-12-08', '18:51:13', '2:7', 2.12, 20),
(121, '2015-12-08', '16:44:50', '2015-12-08', '18:50:56', '2:6', 2.10, 10),
(122, '2015-12-08', '16:44:55', '2015-12-08', '18:57:41', '2:13', 2.22, 11),
(123, '2015-12-08', '18:50:36', NULL, NULL, '', 0.00, 4),
(124, '2015-12-08', '18:50:40', NULL, NULL, '', 0.00, 5),
(125, '2015-12-08', '18:50:51', NULL, NULL, '', 0.00, 9),
(126, '2015-12-08', '18:57:20', NULL, NULL, '', 0.00, 6),
(127, '2015-12-09', '08:24:46', NULL, NULL, '', 0.00, 2),
(128, '2015-12-09', '08:24:52', '2015-12-09', '08:25:02', '0:0', 0.00, 5),
(129, '2015-12-09', '08:24:57', NULL, NULL, '', 0.00, 7),
(130, '2015-12-09', '08:25:28', NULL, NULL, '', 0.00, 8),
(131, '2015-12-09', '08:25:34', NULL, NULL, '', 0.00, 9),
(132, '2015-12-09', '08:25:40', '2015-12-09', '08:26:38', '0:1', 0.02, 1),
(133, '2015-12-09', '08:25:45', NULL, NULL, '', 0.00, 11),
(134, '2015-12-09', '08:25:51', NULL, NULL, '', 0.00, 14),
(135, '2015-12-09', '08:25:56', NULL, NULL, '', 0.00, 20),
(136, '2015-12-09', '08:26:01', '2015-12-09', '08:26:32', '0:1', 0.02, 21),
(137, '2015-12-09', '08:26:06', NULL, NULL, '', 0.00, 17),
(138, '2015-12-09', '08:26:13', NULL, NULL, '', 0.00, 15),
(139, '2015-12-09', '08:26:18', NULL, NULL, '', 0.00, 10),
(140, '2015-12-09', '08:26:23', NULL, NULL, '', 0.00, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `tolerancia` time NOT NULL,
  `privilegios_idprivilegios` int(11) NOT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idpersonal`,`privilegios_idprivilegios`),
  KEY `fk_personal_privilegios1_idx` (`privilegios_idprivilegios`),
  KEY `fk_personal_usuario1_idx` (`usuario_idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `nombre`, `apellidos`, `foto`, `tolerancia`, `privilegios_idprivilegios`, `usuario_idusuario`) VALUES
(1, 'René', 'Alanís Teutle', 'img/profiles/placeholder-hi.png', '01:41:00', 1, 1),
(2, 'Fernando Christopher', 'Quitl Tiro', 'img/profiles/placeholder.png', '01:40:00', 1, 2),
(3, 'Israel', 'Ramírez Huerta', 'img/profiles/placeholder.png', '01:39:00', 2, 3),
(4, 'Sergio Arturo', 'Castro Hernández', 'img/profiles/placeholder.png', '01:41:00', 2, 4),
(5, 'Jorge', 'Munguía Mendez', 'img/profiles/profile-placeholder.jpg', '00:05:00', 2, 5),
(6, 'José Javier', 'Valencia Merino', 'img/profiles/placeholder-hi.png', '01:35:00', 2, 6),
(7, 'Sergio', 'Vega Morales', 'img/profiles/placeholder.jpg', '01:39:00', 2, 7),
(8, 'Humberto', 'Olivares Ortíz', 'img/profiles/placeholder-hi.png', '01:39:00', 2, 8),
(9, 'Diego Arturo', 'Hernández Fuentes', 'img/profiles/profile-placeholder.png', '01:47:00', 2, 9),
(10, 'Alejandra', 'Anduaga Coello', 'img/profiles/female-placeholder.png', '02:27:00', 2, 10),
(11, 'María Guadalupe', 'Sánchez González', 'img/profiles/female-placeholder.png', '01:40:00', 2, 11),
(12, 'Berenice', 'Juárez Morales', 'img/profiles/female-placeholder.png', '00:00:00', 2, 12),
(13, 'Laura', 'Navarro Valera', 'img/profiles/female-placeholder.png', '02:39:44', 2, 13),
(14, 'Araceli', 'Duran Morales', 'img/profiles/female-placeholder.png', '01:40:00', 2, 14),
(15, 'Emma', 'Ochoa Solar', 'img/profiles/female-placeholder.png', '02:08:00', 2, 15),
(16, 'Brianda', 'Vera Velasco', 'img/profiles/female-placeholder.png', '02:23:00', 2, 16),
(17, 'Andrea', 'Cervantes Cantero', 'img/profiles/female-placeholder.png', '01:42:00', 2, 17),
(18, 'María Georgina', 'Valerio Feliciano', 'img/profiles/female-placeholder.png', '01:35:00', 2, 18),
(19, 'Jesús Juan', 'Céspedes Sánchez', 'img/profiles/profile-placeholder-male.png', '01:35:00', 2, 19),
(20, 'Luis Ángel', 'Salvador Torres', 'img/profiles/placeholder.png', '00:06:00', 2, 20),
(21, 'Francisco Agustín', 'Gutiérrez Amador', 'img/profiles/profile-placeholder.png', '01:41:00', 2, 21),
(22, 'Igreane', 'Martínez Martínez', 'img/profiles/female-placeholder.png', '01:42:00', 2, 22),
(23, 'Rocío del Cármen', 'Corona de los Santos', 'img/profiles/female-placeholder.png', '02:01:00', 2, 23),
(24, 'demo', 'demo', 'img/profiles/placeholder (2).png', '00:00:00', 2, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE IF NOT EXISTS `privilegios` (
  `idprivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `modo` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`idprivilegios`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idprivilegios`, `modo`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tolerancia`
--

CREATE TABLE IF NOT EXISTS `tolerancia` (
  `idtolerancia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) DEFAULT NULL,
  `tolerancia` time DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idtolerancia`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Volcado de datos para la tabla `tolerancia`
--

INSERT INTO `tolerancia` (`idtolerancia`, `nombre`, `tolerancia`, `fecha`) VALUES
(1, 'René Alanís Teutle', '00:00:00', '2015-12-05'),
(2, 'Fernando Christopher Quitl Tiro', '00:00:00', '2015-12-05'),
(3, 'Israel Ramírez Huerta', '00:00:00', '2015-12-05'),
(4, 'Sergio Arturo Castro Hernández', '00:00:00', '2015-12-05'),
(5, 'Jorge Munguía Mendez', '00:00:00', '2015-12-05'),
(6, 'José Javier Valencia Merino', '00:00:00', '2015-12-05'),
(7, 'Sergio Vega Morales', '00:00:00', '2015-12-05'),
(8, 'Humberto Olivares Ortíz', '00:00:00', '2015-12-05'),
(9, 'Diego Arturo Hernández Fuentes', '00:00:00', '2015-12-05'),
(10, 'Alejandra Anduaga Coello', '00:00:00', '2015-12-05'),
(11, 'María Guadalupe Sánchez González', '00:00:00', '2015-12-05'),
(12, 'Berenice Juárez Morales', '00:00:00', '2015-12-05'),
(13, 'Laura Navarro Valera', '00:00:00', '2015-12-05'),
(14, 'Araceli Duran Morales', '00:00:00', '2015-12-05'),
(15, 'Emma Ochoa Solar', '00:00:00', '2015-12-05'),
(16, 'Brianda Vera Velasco', '00:00:00', '2015-12-05'),
(17, 'Andrea Cervantes Cantero', '00:00:00', '2015-12-05'),
(18, 'María Georgina Valerio Feliciano', '00:00:00', '2015-12-05'),
(19, 'Jesús Juan Céspedes Sánchez', '00:00:00', '2015-12-05'),
(20, 'Luis Ángel Salvador Torres', '00:00:00', '2015-12-05'),
(21, 'Francisco Agustín Gutiérrez Amador', '00:00:00', '2015-12-05'),
(22, 'Igreane Martínez Martínez', '00:00:00', '2015-12-05'),
(23, 'Rocío del Cármen Corona de los Santos', '00:00:00', '2015-12-05'),
(24, 'demo demo', '00:00:00', '2015-12-05'),
(25, 'René Alanís Teutle', '00:12:00', '2015-12-05'),
(26, 'Fernando Christopher Quitl Tiro', '00:00:00', '2015-12-05'),
(27, 'Israel Ramírez Huerta', '00:00:00', '2015-12-05'),
(28, 'Sergio Arturo Castro Hernández', '00:00:00', '2015-12-05'),
(29, 'Jorge Munguía Mendez', '00:00:00', '2015-12-05'),
(30, 'José Javier Valencia Merino', '00:00:00', '2015-12-05'),
(31, 'Sergio Vega Morales', '00:00:00', '2015-12-05'),
(32, 'Humberto Olivares Ortíz', '00:00:00', '2015-12-05'),
(33, 'Diego Arturo Hernández Fuentes', '00:00:00', '2015-12-05'),
(34, 'Alejandra Anduaga Coello', '00:00:00', '2015-12-05'),
(35, 'María Guadalupe Sánchez González', '00:00:00', '2015-12-05'),
(36, 'Berenice Juárez Morales', '00:00:00', '2015-12-05'),
(37, 'Laura Navarro Valera', '00:00:00', '2015-12-05'),
(38, 'Araceli Duran Morales', '00:00:00', '2015-12-05'),
(39, 'Emma Ochoa Solar', '00:00:00', '2015-12-05'),
(40, 'Brianda Vera Velasco', '00:00:00', '2015-12-05'),
(41, 'Andrea Cervantes Cantero', '00:00:00', '2015-12-05'),
(42, 'María Georgina Valerio Feliciano', '00:00:00', '2015-12-05'),
(43, 'Jesús Juan Céspedes Sánchez', '00:00:00', '2015-12-05'),
(44, 'Luis Ángel Salvador Torres', '00:00:00', '2015-12-05'),
(45, 'Francisco Agustín Gutiérrez Amador', '00:00:00', '2015-12-05'),
(46, 'Igreane Martínez Martínez', '00:00:00', '2015-12-05'),
(47, 'Rocío del Cármen Corona de los Santos', '00:00:00', '2015-12-05'),
(48, 'demo demo', '00:00:00', '2015-12-05'),
(49, 'René Alanís Teutle', '00:00:00', '2015-12-05'),
(50, 'Fernando Christopher Quitl Tiro', '00:00:00', '2015-12-05'),
(51, 'Israel Ramírez Huerta', '00:00:00', '2015-12-05'),
(52, 'Sergio Arturo Castro Hernández', '00:00:00', '2015-12-05'),
(53, 'Jorge Munguía Mendez', '00:13:00', '2015-12-05'),
(54, 'José Javier Valencia Merino', '00:00:00', '2015-12-05'),
(55, 'Sergio Vega Morales', '00:00:00', '2015-12-05'),
(56, 'Humberto Olivares Ortíz', '00:00:00', '2015-12-05'),
(57, 'Diego Arturo Hernández Fuentes', '00:00:00', '2015-12-05'),
(58, 'Alejandra Anduaga Coello', '00:00:00', '2015-12-05'),
(59, 'María Guadalupe Sánchez González', '00:00:00', '2015-12-05'),
(60, 'Berenice Juárez Morales', '00:00:00', '2015-12-05'),
(61, 'Laura Navarro Valera', '00:00:00', '2015-12-05'),
(62, 'Araceli Duran Morales', '00:00:00', '2015-12-05'),
(63, 'Emma Ochoa Solar', '00:00:00', '2015-12-05'),
(64, 'Brianda Vera Velasco', '00:00:00', '2015-12-05'),
(65, 'Andrea Cervantes Cantero', '00:00:00', '2015-12-05'),
(66, 'María Georgina Valerio Feliciano', '00:00:00', '2015-12-05'),
(67, 'Jesús Juan Céspedes Sánchez', '00:00:00', '2015-12-05'),
(68, 'Luis Ángel Salvador Torres', '00:00:00', '2015-12-05'),
(69, 'Francisco Agustín Gutiérrez Amador', '00:00:00', '2015-12-05'),
(70, 'Igreane Martínez Martínez', '00:00:00', '2015-12-05'),
(71, 'Rocío del Cármen Corona de los Santos', '00:00:00', '2015-12-05'),
(72, 'demo demo', '00:00:00', '2015-12-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`) VALUES
(1, 'rene-alanis'),
(2, 'fer-tiro'),
(3, 'almacen-isra'),
(4, 'bisel-sergio'),
(5, 'jorge-almacen'),
(6, 'javi-almacen'),
(7, 'vega-almacen'),
(8, 'beto-almacen'),
(9, 'sistemas-da'),
(10, 'admon-aa'),
(11, 'dgrafico-mg'),
(12, 'ventas-bere'),
(13, 'ventas-laura'),
(14, 'ventas-ara'),
(15, 'ventas-emma'),
(16, 'ventas-bri'),
(17, 'ventas-andy'),
(18, 'ventas-gina'),
(19, 'bisel-jesus'),
(20, 'bisel-angel'),
(21, 'bisel-fran'),
(22, 'ventas-iane'),
(23, 'ventas-chio'),
(24, 'demo');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `fk_Bitacora_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_personal1` FOREIGN KEY (`personal_idpersonal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_privilegios1` FOREIGN KEY (`privilegios_idprivilegios`) REFERENCES `privilegios` (`idprivilegios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
