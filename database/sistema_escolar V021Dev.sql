-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2025 a las 19:11:29
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
-- Base de datos: `sistema_escolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classrooms`
--

CREATE TABLE `classrooms` (
  `classroom_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `classrooms`
--

INSERT INTO `classrooms` (`classroom_id`, `name`, `description`) VALUES
(4, 'Taller 1', ''),
(5, 'Taller 2', ''),
(6, 'Taller 3', ''),
(7, 'Taller 4', ''),
(8, 'Taller 5', ''),
(9, 'Taller 6', ''),
(10, 'Taller 7', ''),
(11, 'Taller 8', ''),
(12, 'Taller 9', ''),
(13, 'Taller 10', ''),
(14, 'Laboratorio 1', ''),
(15, 'Laboratorio 2', ''),
(16, 'Laboratorio 3', ''),
(17, 'Laboratorio 4', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `technical_degree` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`course_id`, `name`, `description`, `technical_degree`) VALUES
(7, '1Ro Primera', '', ''),
(8, '1Ro Segunda', '', ''),
(9, '1Ro Tercera', '', ''),
(10, '2Do Primera', '', ''),
(11, '2Do Segunda', '', ''),
(12, '3Ro Primera', '', ''),
(13, '3Ro Segunda', '', ''),
(14, '3Ro Tercera', '', ''),
(15, '4To TP', '', 'Tecnico En Programacion'),
(16, '4To MMO', '', 'Maestro Mayor de Obra'),
(17, '5To TP', '', 'Tecnico En Programacion'),
(18, '5To MMO', '', 'Maestro Mayor de Obra'),
(19, '6To TP', '', 'Tecnico En Programacion'),
(20, '6To MMO', '', 'Maestro Mayor de Obra'),
(21, '7Mo TP', '', 'Tecnico En Programacion'),
(22, '7Mo MMO', '', 'Maestro Mayor de Obra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`group_id`, `course_id`, `name`, `description`) VALUES
(8, 7, 'Grupo 1', ''),
(9, 7, 'Grupo 2', ''),
(10, 8, 'Grupo 1', ''),
(11, 8, 'Grupo 2', ''),
(12, 9, 'Grupo 1', ''),
(13, 9, 'Grupo 2', ''),
(14, 10, 'Grupo 1', ''),
(15, 11, 'Grupo 1', ''),
(16, 12, 'Grupo 1', ''),
(17, 13, 'Grupo 1', ''),
(18, 17, 'Grupo 1', ''),
(19, 18, 'Grupo 1', ''),
(20, 19, 'Grupo 1', ''),
(21, 20, 'Grupo 1', ''),
(22, 20, 'Grupo 2', ''),
(23, 19, 'Grupo 2', ''),
(24, 18, 'Grupo 2', ''),
(25, 17, 'Grupo 2', ''),
(26, 16, 'Grupo 1', ''),
(27, 16, 'Grupo 2', ''),
(28, 15, 'Grupo 1', ''),
(29, 15, 'Grupo 2', ''),
(30, 14, 'Grupo 1', ''),
(31, 14, 'Grupo 2', ''),
(32, 13, 'Grupo 2', ''),
(33, 12, 'Grupo 2', ''),
(34, 11, 'Grupo 2', ''),
(35, 10, 'Grupo 2', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `description`, `created_at`) VALUES
(2, 'Administrador', '', '2025-10-11 15:52:33'),
(3, 'Preceptor', '', '2025-10-11 15:57:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `page`, `action`, `created_at`) VALUES
(411, 2, 'index.php', 'view', '2025-10-15 22:26:21'),
(412, 2, 'attendance.php', 'view', '2025-10-15 22:26:21'),
(413, 2, 'attendance_report.php', 'view', '2025-10-15 22:26:21'),
(414, 2, 'attendance_reports_list.php', 'view', '2025-10-15 22:26:21'),
(415, 2, 'student_attendance.php', 'view', '2025-10-15 22:26:21'),
(416, 2, 'teachers_attendance.php', 'view', '2025-10-15 22:26:21'),
(417, 2, 'teachers.php', 'view', '2025-10-15 22:26:21'),
(418, 2, 'students.php', 'view', '2025-10-15 22:26:21'),
(419, 2, 'courses.php', 'view', '2025-10-15 22:26:21'),
(420, 2, 'subjects.php', 'view', '2025-10-15 22:26:21'),
(421, 2, 'classrooms.php', 'view', '2025-10-15 22:26:21'),
(422, 2, 'schedules.php', 'view', '2025-10-15 22:26:21'),
(423, 2, 'users.php', 'view', '2025-10-15 22:26:21'),
(424, 2, 'roles.php', 'view', '2025-10-15 22:26:21'),
(425, 2, 'attendance_report_admin.php', 'view', '2025-10-15 22:26:21'),
(426, 3, 'index.php', 'view', '2025-10-15 22:32:35'),
(427, 3, 'attendance.php', 'view', '2025-10-15 22:32:35'),
(428, 3, 'attendance_report.php', 'view', '2025-10-15 22:32:35'),
(429, 3, 'student_attendance.php', 'view', '2025-10-15 22:32:35'),
(430, 3, 'teachers_attendance.php', 'view', '2025-10-15 22:32:35'),
(431, 3, 'roles.php', 'view', '2025-10-15 22:32:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `substitute_teacher_id` int(11) DEFAULT NULL,
  `weekday` enum('monday','tuesday','wednesday','thursday','friday','saturday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `course_id`, `subject_id`, `teacher_id`, `substitute_teacher_id`, `weekday`, `start_time`, `end_time`, `group_id`, `classroom_id`) VALUES
(1, 21, 1, 58, NULL, 'thursday', '07:30:00', '10:40:00', NULL, NULL),
(2, 21, 2, 51, NULL, 'tuesday', '15:30:00', '17:30:00', NULL, NULL),
(3, 21, 2, 51, NULL, 'thursday', '15:30:00', '17:30:00', NULL, NULL),
(4, 21, 3, 81, NULL, 'friday', '09:40:00', '11:40:00', NULL, 15),
(5, 21, 3, 81, NULL, 'tuesday', '13:20:00', '15:20:00', NULL, 15),
(6, 21, 3, 81, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, 15),
(7, 21, 4, 67, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(8, 21, 5, 94, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, NULL),
(9, 21, 6, 118, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(10, 21, 7, 121, NULL, 'thursday', '13:20:00', '15:20:00', NULL, 15),
(11, 21, 7, 121, NULL, 'friday', '13:20:00', '15:20:00', NULL, 15),
(12, 21, 8, 48, NULL, 'tuesday', '13:20:00', '15:20:00', NULL, 14),
(13, 21, 8, 48, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, 14),
(14, 19, 20, 93, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(15, 19, 20, 93, NULL, 'thursday', '11:40:00', '12:40:00', NULL, NULL),
(16, 19, 21, 108, NULL, 'monday', '10:40:00', '12:40:00', NULL, NULL),
(17, 19, 23, 102, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(18, 19, 24, 75, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(19, 19, 25, 117, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(20, 19, 25, 117, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(21, 19, 26, 113, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(22, 19, 27, 47, NULL, 'friday', '08:30:00', '10:30:00', NULL, NULL),
(23, 19, 28, 57, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(24, 19, 29, 60, NULL, 'friday', '10:30:00', '12:30:00', NULL, NULL),
(25, 19, 30, 92, NULL, 'monday', '13:20:00', '15:20:00', 20, 14),
(26, 19, 30, 92, NULL, 'thursday', '13:20:00', '15:20:00', 20, 14),
(27, 19, 31, 13, NULL, 'tuesday', '13:20:00', '15:20:00', 20, 4),
(28, 19, 32, 107, NULL, 'tuesday', '15:30:00', '17:30:00', 20, 14),
(29, 19, 33, 106, NULL, 'wednesday', '13:20:00', '15:20:00', 20, 14),
(30, 19, 34, 114, NULL, 'monday', '13:20:00', '15:20:00', 23, 15),
(31, 19, 34, 114, NULL, 'thursday', '13:20:00', '15:20:00', 23, 15),
(32, 19, 35, 11, NULL, 'tuesday', '13:20:00', '15:20:00', 23, 5),
(33, 19, 36, 106, NULL, 'tuesday', '15:30:00', '17:30:00', 23, 15),
(34, 19, 37, 107, NULL, 'wednesday', '13:20:00', '15:20:00', 23, 15),
(35, 20, 38, 93, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(36, 20, 38, 93, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(37, 20, 39, 108, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(38, 20, 41, 102, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(39, 20, 42, 75, NULL, 'thursday', '08:30:00', '10:30:00', NULL, NULL),
(40, 20, 43, 117, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(41, 20, 44, 76, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(42, 20, 45, 110, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(43, 20, 46, 60, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(44, 20, 40, 10, NULL, 'monday', '13:20:00', '15:20:00', NULL, NULL),
(45, 20, 47, 91, NULL, 'monday', '15:30:00', '17:30:00', 21, 6),
(46, 20, 48, 110, NULL, 'tuesday', '13:20:00', '15:20:00', 21, 6),
(47, 20, 49, 134, NULL, 'wednesday', '13:20:00', '15:20:00', 21, 6),
(48, 20, 50, 135, NULL, 'thursday', '13:20:00', '15:20:00', 21, 6),
(49, 20, 51, 91, NULL, 'monday', '15:30:00', '17:30:00', 22, 7),
(50, 20, 52, 110, NULL, 'tuesday', '13:20:00', '15:20:00', 22, 7),
(51, 20, 53, 134, NULL, 'wednesday', '13:20:00', '15:20:00', 22, 7),
(52, 20, 54, 135, NULL, 'thursday', '13:20:00', '15:20:00', 22, 7),
(53, 17, 55, 127, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(54, 17, 56, 120, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(55, 17, 56, 120, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(56, 17, 57, 121, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(57, 17, 58, 29, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(58, 17, 59, 125, NULL, 'wednesday', '08:30:00', '10:30:00', NULL, NULL),
(59, 17, 60, 115, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(60, 17, 61, 130, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(61, 17, 62, 57, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(62, 17, 63, 113, NULL, 'friday', '09:30:00', '11:30:00', NULL, NULL),
(63, 17, 64, 40, NULL, 'monday', '13:20:00', '15:20:00', NULL, NULL),
(64, 17, 65, 129, NULL, 'tuesday', '13:20:00', '15:20:00', 18, 14),
(65, 17, 66, 121, NULL, 'wednesday', '13:20:00', '15:20:00', 18, 14),
(66, 17, 67, 129, NULL, 'thursday', '13:20:00', '15:20:00', 18, 14),
(67, 17, 68, 57, NULL, 'friday', '13:20:00', '15:20:00', 18, 14),
(68, 17, 69, 129, NULL, 'tuesday', '15:30:00', '17:30:00', 25, 15),
(69, 17, 70, 121, NULL, 'wednesday', '15:30:00', '17:30:00', 25, 15),
(70, 17, 71, 129, NULL, 'thursday', '15:30:00', '17:30:00', 25, 15),
(71, 17, 72, 57, NULL, 'friday', '15:30:00', '17:30:00', 25, 15),
(72, 18, 73, 127, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(73, 18, 74, 120, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(74, 18, 74, 120, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, NULL),
(75, 18, 75, 29, NULL, 'friday', '09:30:00', '11:30:00', NULL, NULL),
(76, 18, 76, 125, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(77, 18, 77, 115, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(78, 18, 78, 130, NULL, 'thursday', '11:40:00', '12:40:00', NULL, NULL),
(79, 18, 78, 130, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(80, 18, 79, 110, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(81, 18, 80, 50, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(82, 18, 81, 40, NULL, 'monday', '15:30:00', '17:30:00', NULL, NULL),
(83, 18, 82, 50, NULL, 'wednesday', '13:20:00', '15:20:00', 19, 8),
(84, 18, 83, 76, NULL, 'thursday', '13:20:00', '15:20:00', 19, 8),
(85, 18, 84, 55, NULL, 'tuesday', '13:20:00', '15:20:00', 19, 8),
(86, 18, 85, 76, NULL, 'friday', '13:20:00', '15:20:00', 19, 8),
(87, 18, 86, 50, NULL, 'wednesday', '15:30:00', '17:30:00', 24, 9),
(88, 18, 87, 76, NULL, 'thursday', '15:30:00', '17:30:00', 24, 9),
(89, 18, 88, 55, NULL, 'tuesday', '15:30:00', '17:30:00', 24, 9),
(90, 18, 89, 76, NULL, 'friday', '15:30:00', '17:30:00', 24, 9),
(91, 15, 90, 130, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(92, 15, 91, 125, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(93, 15, 93, 101, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(94, 15, 94, 116, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(95, 15, 95, 29, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(96, 15, 96, 11, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(97, 15, 96, 11, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(98, 15, 97, 13, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(99, 15, 98, 7, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(100, 15, 99, 113, NULL, 'friday', '09:30:00', '11:30:00', NULL, NULL),
(101, 16, 104, 130, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(102, 16, 105, 125, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(103, 16, 107, 101, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(104, 16, 108, 116, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(105, 16, 109, 29, NULL, 'friday', '09:30:00', '11:30:00', NULL, NULL),
(106, 16, 110, 11, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(107, 16, 110, 11, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(108, 16, 111, 13, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(109, 16, 112, 7, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(110, 16, 113, 110, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(111, 12, 132, 43, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(112, 12, 133, 26, 57, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(113, 12, 134, 13, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(114, 12, 135, 66, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(115, 12, 136, 17, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(116, 12, 137, 12, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(117, 12, 138, 127, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(118, 12, 139, 11, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(119, 12, 140, 116, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(120, 12, 141, 109, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(121, 12, 142, 73, NULL, 'monday', '11:40:00', '12:40:00', NULL, 10),
(122, 12, 143, 73, NULL, 'tuesday', '11:40:00', '12:40:00', NULL, 10),
(123, 12, 144, 73, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, 10),
(124, 12, 144, 73, NULL, 'thursday', '11:40:00', '12:40:00', NULL, 10),
(125, 13, 119, 43, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(126, 13, 120, 26, 57, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(127, 13, 121, 13, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(128, 13, 122, 66, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(129, 13, 123, 17, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(130, 13, 124, 12, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(131, 13, 125, 127, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(132, 13, 126, 11, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(133, 13, 127, 116, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(134, 13, 128, 109, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(135, 13, 129, 73, NULL, 'monday', '11:40:00', '12:40:00', NULL, 11),
(136, 13, 130, 73, NULL, 'tuesday', '11:40:00', '12:40:00', NULL, 11),
(137, 13, 131, 73, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, 11),
(138, 13, 131, 73, NULL, 'thursday', '11:40:00', '12:40:00', NULL, 11),
(139, 10, 171, 7, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(140, 10, 172, 13, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(141, 10, 173, 29, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(142, 10, 174, 116, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(143, 10, 175, 17, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(144, 10, 176, 12, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(145, 10, 177, 127, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(146, 10, 178, 11, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(147, 10, 179, 116, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(148, 10, 180, 109, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(149, 10, 181, 73, NULL, 'monday', '11:40:00', '12:40:00', NULL, 12),
(150, 10, 182, 73, NULL, 'monday', '11:40:00', '12:40:00', NULL, 12),
(151, 10, 183, 73, NULL, 'tuesday', '11:40:00', '12:40:00', NULL, 12),
(152, 10, 184, 73, NULL, 'tuesday', '11:40:00', '12:40:00', NULL, 12),
(153, 10, 185, 73, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, 12),
(154, 10, 185, 73, NULL, 'thursday', '11:40:00', '12:40:00', NULL, 12),
(155, 11, 158, 7, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(156, 11, 159, 13, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(157, 11, 160, 29, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(158, 11, 161, 116, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(159, 11, 162, 17, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(160, 11, 163, 12, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(161, 11, 164, 127, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(162, 11, 165, 11, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(163, 11, 166, 116, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(164, 11, 167, 109, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(165, 11, 168, 73, NULL, 'monday', '11:40:00', '12:40:00', NULL, 13),
(166, 11, 169, 73, NULL, 'tuesday', '11:40:00', '12:40:00', NULL, 13),
(167, 11, 170, 73, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, 13),
(168, 11, 170, 73, NULL, 'thursday', '11:40:00', '12:40:00', NULL, 13),
(169, 7, 214, 116, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(170, 7, 215, 7, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(171, 7, 216, 17, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(172, 7, 218, 127, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(173, 7, 219, 11, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(174, 7, 220, 130, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(175, 7, 221, 109, NULL, 'tuesday', '09:40:01', '11:40:00', NULL, NULL),
(176, 7, 222, 73, NULL, 'wednesday', '09:40:00', '10:40:00', 8, 4),
(177, 7, 224, 73, NULL, 'thursday', '09:40:00', '10:40:00', 8, 4),
(178, 7, 226, 73, NULL, 'friday', '09:40:00', '10:40:00', 8, 4),
(179, 7, 223, 73, NULL, 'wednesday', '10:40:00', '11:40:00', 9, 5),
(180, 7, 225, 73, NULL, 'thursday', '10:40:00', '11:40:00', 9, 5),
(181, 7, 227, 73, NULL, 'friday', '10:40:00', '11:40:00', 9, 5),
(182, 8, 200, 116, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(183, 8, 201, 7, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(184, 8, 202, 17, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(185, 8, 204, 127, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(186, 8, 205, 11, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(187, 8, 206, 130, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(188, 8, 207, 109, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(189, 8, 208, 73, NULL, 'wednesday', '09:40:00', '10:40:00', 10, 6),
(190, 8, 210, 73, NULL, 'thursday', '09:40:00', '10:40:00', 10, 6),
(191, 8, 212, 73, NULL, 'friday', '09:40:00', '10:40:00', 10, 6),
(192, 8, 209, 73, NULL, 'wednesday', '10:40:00', '11:40:00', 11, 7),
(193, 8, 211, 73, NULL, 'thursday', '10:40:00', '11:40:00', 11, 7),
(194, 8, 213, 73, NULL, 'friday', '10:40:00', '11:40:00', 11, 7),
(195, 9, 186, 116, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(196, 9, 187, 7, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(197, 9, 188, 17, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(198, 9, 190, 127, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(199, 9, 191, 11, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(200, 9, 192, 130, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(201, 9, 193, 109, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(202, 9, 194, 73, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, 8),
(203, 9, 195, 73, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, 9),
(204, 9, 196, 73, NULL, 'thursday', '09:40:00', '10:40:00', 12, 8),
(205, 9, 198, 73, NULL, 'friday', '09:40:00', '10:40:00', 12, 8),
(206, 9, 197, 73, NULL, 'thursday', '10:40:00', '11:40:00', 13, 9),
(207, 9, 199, 73, NULL, 'friday', '10:40:00', '11:40:00', 13, 9),
(208, 21, 1, 58, NULL, 'thursday', '07:30:00', '10:40:00', NULL, NULL),
(209, 21, 2, 51, NULL, 'tuesday', '15:30:00', '17:30:00', NULL, NULL),
(210, 21, 2, 51, NULL, 'thursday', '15:30:00', '17:30:00', NULL, NULL),
(211, 21, 3, 81, NULL, 'friday', '09:40:00', '11:40:00', NULL, 15),
(212, 21, 3, 81, NULL, 'tuesday', '13:20:00', '15:20:00', NULL, 15),
(213, 21, 3, 81, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, 15),
(214, 21, 4, 67, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(215, 21, 5, 94, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, NULL),
(216, 21, 6, 118, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(217, 21, 7, 121, NULL, 'thursday', '13:20:00', '15:20:00', NULL, 15),
(218, 21, 7, 121, NULL, 'friday', '13:20:00', '15:20:00', NULL, 15),
(219, 21, 8, 48, NULL, 'tuesday', '13:20:00', '15:20:00', NULL, 14),
(220, 21, 8, 48, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, 14),
(221, 22, 9, 76, NULL, 'monday', '07:30:00', '10:40:00', NULL, NULL),
(222, 22, 10, 134, NULL, 'tuesday', '13:20:00', '15:20:00', NULL, 4),
(223, 22, 10, 134, NULL, 'wednesday', '15:30:00', '17:30:00', NULL, 4),
(224, 22, 10, 134, NULL, 'friday', '13:20:00', '15:20:00', NULL, 4),
(225, 22, 11, 67, NULL, 'monday', '15:30:00', '17:30:00', NULL, NULL),
(226, 22, 12, 94, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, NULL),
(227, 22, 13, 118, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(228, 22, 14, 50, NULL, 'thursday', '13:20:00', '15:20:00', NULL, 4),
(229, 22, 15, 50, NULL, 'thursday', '15:30:00', '17:30:00', NULL, 4),
(230, 22, 15, 50, NULL, 'friday', '15:30:00', '17:30:00', NULL, 4),
(231, 22, 16, 76, NULL, 'tuesday', '09:40:00', '12:50:00', NULL, 4),
(232, 19, 20, 93, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(233, 19, 20, 93, NULL, 'thursday', '11:40:00', '12:40:00', NULL, NULL),
(234, 19, 21, 108, NULL, 'monday', '10:40:00', '12:40:00', NULL, NULL),
(235, 19, 23, 102, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(236, 19, 24, 75, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(237, 19, 25, 117, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(238, 19, 25, 117, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(239, 19, 26, 113, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(240, 19, 27, 47, NULL, 'friday', '08:30:00', '10:30:00', NULL, NULL),
(241, 19, 28, 57, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(242, 19, 29, 60, NULL, 'friday', '10:30:00', '12:30:00', NULL, NULL),
(243, 19, 30, 92, NULL, 'monday', '13:20:00', '15:20:00', 20, 14),
(244, 19, 30, 92, NULL, 'thursday', '13:20:00', '15:20:00', 20, 14),
(245, 19, 31, 13, NULL, 'tuesday', '13:20:00', '15:20:00', 20, 4),
(246, 19, 32, 107, NULL, 'tuesday', '15:30:00', '17:30:00', 20, 14),
(247, 19, 33, 106, NULL, 'wednesday', '13:20:00', '15:20:00', 20, 14),
(248, 19, 34, 114, NULL, 'monday', '13:20:00', '15:20:00', 23, 15),
(249, 19, 34, 114, NULL, 'thursday', '13:20:00', '15:20:00', 23, 15),
(250, 19, 35, 11, NULL, 'tuesday', '13:20:00', '15:20:00', 23, 5),
(251, 19, 36, 106, NULL, 'tuesday', '15:30:00', '17:30:00', 23, 15),
(252, 19, 37, 107, NULL, 'wednesday', '13:20:00', '15:20:00', 23, 15),
(253, 20, 38, 93, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(254, 20, 38, 93, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(255, 20, 39, 108, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(256, 20, 41, 102, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(257, 20, 42, 75, NULL, 'thursday', '08:30:00', '10:30:00', NULL, NULL),
(258, 20, 43, 117, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(259, 20, 44, 76, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(260, 20, 45, 110, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(261, 20, 46, 60, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(262, 20, 40, 10, NULL, 'monday', '13:20:00', '15:20:00', NULL, NULL),
(263, 20, 47, 91, NULL, 'monday', '15:30:00', '17:30:00', 21, 6),
(264, 20, 48, 110, NULL, 'tuesday', '13:20:00', '15:20:00', 21, 6),
(265, 20, 49, 134, NULL, 'wednesday', '13:20:00', '15:20:00', 21, 6),
(266, 20, 50, 135, NULL, 'thursday', '13:20:00', '15:20:00', 21, 6),
(267, 20, 51, 91, NULL, 'monday', '15:30:00', '17:30:00', 22, 7),
(268, 20, 52, 110, NULL, 'tuesday', '13:20:00', '15:20:00', 22, 7),
(269, 20, 53, 134, NULL, 'wednesday', '13:20:00', '15:20:00', 22, 7),
(270, 20, 54, 135, NULL, 'thursday', '13:20:00', '15:20:00', 22, 7),
(271, 17, 55, 127, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(272, 17, 56, 120, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(273, 17, 56, 120, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(274, 17, 57, 121, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(275, 17, 58, 29, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(276, 17, 59, 125, NULL, 'wednesday', '08:30:00', '10:30:00', NULL, NULL),
(277, 17, 60, 115, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(278, 17, 61, 130, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(279, 17, 62, 57, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(280, 17, 63, 113, NULL, 'friday', '09:30:00', '11:30:00', NULL, NULL),
(281, 17, 64, 40, NULL, 'monday', '13:20:00', '15:20:00', NULL, NULL),
(282, 17, 65, 129, NULL, 'tuesday', '13:20:00', '15:20:00', 18, 14),
(283, 17, 66, 121, NULL, 'wednesday', '13:20:00', '15:20:00', 18, 14),
(284, 17, 67, 129, NULL, 'thursday', '13:20:00', '15:20:00', 18, 14),
(285, 17, 68, 57, NULL, 'friday', '13:20:00', '15:20:00', 18, 14),
(286, 17, 69, 129, NULL, 'tuesday', '15:30:00', '17:30:00', 25, 15),
(287, 17, 70, 121, NULL, 'wednesday', '15:30:00', '17:30:00', 25, 15),
(288, 17, 71, 129, NULL, 'thursday', '15:30:00', '17:30:00', 25, 15),
(289, 17, 72, 57, NULL, 'friday', '15:30:00', '17:30:00', 25, 15),
(290, 18, 73, 127, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(291, 18, 74, 120, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(292, 18, 74, 120, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, NULL),
(293, 18, 75, 29, NULL, 'friday', '09:30:00', '11:30:00', NULL, NULL),
(294, 18, 76, 125, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(295, 18, 77, 115, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(296, 18, 78, 130, NULL, 'thursday', '11:40:00', '12:40:00', NULL, NULL),
(297, 18, 78, 130, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(298, 18, 79, 110, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(299, 18, 80, 50, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(300, 18, 81, 40, NULL, 'monday', '15:30:00', '17:30:00', NULL, NULL),
(301, 18, 82, 50, NULL, 'wednesday', '13:20:00', '15:20:00', 19, 8),
(302, 18, 83, 76, NULL, 'thursday', '13:20:00', '15:20:00', 19, 8),
(303, 18, 84, 55, NULL, 'tuesday', '13:20:00', '15:20:00', 19, 8),
(304, 18, 85, 76, NULL, 'friday', '13:20:00', '15:20:00', 19, 8),
(305, 18, 86, 50, NULL, 'wednesday', '15:30:00', '17:30:00', 24, 9),
(306, 18, 87, 76, NULL, 'thursday', '15:30:00', '17:30:00', 24, 9),
(307, 18, 88, 55, NULL, 'tuesday', '15:30:00', '17:30:00', 24, 9),
(308, 18, 89, 76, NULL, 'friday', '15:30:00', '17:30:00', 24, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL,
  `DNI` int(50) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` datetime NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `CUPOF` int(70) NOT NULL,
  `description` text DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `turno` enum('mañana','tarde') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`subject_id`, `name`, `CUPOF`, `description`, `course_id`, `turno`) VALUES
(1, 'MODELOS Y SISTEMAS (MYS)', 2480501, '7°TP', 21, 'mañana'),
(2, 'PROYECTO, DISEÑO E IMPLEMENTACION DE SISTEMAS COMPUTACIONALES (TECPRPYD7)', 2480505, '7°TP', 21, 'tarde'),
(3, 'PRACTICAS PROFESIONALIZANTES DEL SECTOR INFORMATICA (TECPRPP7)', 2480495, '7°TP', 21, 'mañana'),
(4, 'EMPRENDIMIENTOS PRODUCTIVOS Y DESARROLLO LOCAL (TECPREM7)', 2480498, '7°TP', 21, 'mañana'),
(5, 'EVALUACION DE PROYECTO (TECPREV7)', 2480499, '7°TP', 21, 'tarde'),
(6, 'ORGANIZACION Y METODOS (OYM)', 2480503, '7°TP', 21, 'mañana'),
(7, 'PROYECTO DE DESARROLLO DE SOFTWARE PARA PLATAFORMAS MOVILES (TECPRPR7)', 2480507, '7°TP', 21, 'tarde'),
(8, 'PROYECTO DE IMPLEMENTACION DE SITIOS WEB DINAMICOS (PWD)', 2480508, '7°TP', 21, 'tarde'),
(9, 'ESTRUCTURAS (ESR)', 2480491, '7°MMO', 22, 'mañana'),
(10, 'PROYECTO FINAL (PRF)', 2480492, '7°MMO', 22, 'tarde'),
(11, 'EJERCICIO PROFESIONAL DE LA CONSTRUCCION (EPC) GRUPO 1', 2480494, '7°MMO', 22, 'tarde'),
(12, 'PRACTICAS PROFESIONALIZANTES DEL SECTOR CONSTRUCCIONES EDILICIAS (ZTECMMPP7) GRUPO 1', 2480487, '7°MMO', 22, 'mañana'),
(13, 'DIRECCION DE OBRA (TECMMDI7) GRUPO 1', 2480493, '7°MMO', 22, 'tarde'),
(14, 'EMPRENDIMIENTOS PRODUCTIVOS Y DESARROLLO LOCAL (ZTECMMEM7)', 2480488, '7°MMO', 22, 'tarde'),
(15, 'INSTALACIONES DE ACONDICONAMIENTO DEL AIRE (ZTECMMIN7)', 2480490, '7°MMO', 22, 'mañana'),
(16, 'PROYECTO FINAL (PRF) GRUPO 2', 2625349, '7°MMO', 22, 'tarde'),
(17, 'EJERCICIO PROFESIONAL DE LA CONSTRUCCION (EPC) GRUPO 2', 2625353, '7°MMO', 22, 'tarde'),
(18, 'PRACTICAS PROFESIONALIZANTES DEL SECTOR CONSTRUCCIONES EDILICIAS (ZTECMMPP7) GRUPO 2', 2625355, '7°MMO', 22, 'mañana'),
(19, 'DIRECCION DE OBRA (TECMMDI7) GRUPO 2', 2625351, '7°MMO', 22, 'tarde'),
(20, 'Literatura (LIT)', 2459981, '6° 1° TECPR', 19, 'mañana'),
(21, 'Ingles (IGS)', 2459990, '6° 1° TECPR', 19, 'mañana'),
(22, 'Ed fisica (EFC)', 2459995, '6° 1° TECPR', 19, 'tarde'),
(23, 'Filosofia (FIA)', 2459999, '6° 1° TECPR', 19, 'mañana'),
(24, 'Arte (RTE)', 2460001, '6° 1° TECPR', 19, 'mañana'),
(25, 'Matematica Discreta (MDI)', 2460004, '6° 1° TECPR', 19, 'mañana'),
(26, 'Sistemas Digitales (SD)', 2460008, '6° 1° TECPR', 19, 'mañana'),
(27, 'Sistemas de Gestion y Autogestion (SGA)', 2460023, '6° 1° TECPR', 19, 'mañana'),
(28, 'Seguridad Informatica (INS)', 2460027, '6° 1° TECPR', 19, 'mañana'),
(29, 'Derecho del Trabajo (DET)', 2460031, '6° 1° TECPR', 19, 'mañana'),
(30, 'Laboratorio de Programacion 3 (LPR) GRUPO 1', 2460034, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(31, 'Laboratorio de Procesos Industriales (LPI) GRUPO 1', 2460038, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(32, 'Desarrollo de Aplicaciones WEB (Estatica) (DWE) GRUPO 1', 2460042, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(33, 'Desarrollo de aplicaciones WEB (Dinamicas) (DWD) GRUPO 1', 2460046, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(34, 'Laboratorio de Programacion 3 (LPR) GRUPO 2', 2625341, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(35, 'Laboratorio de Procesos Industriales (LPI) GRUPO 2', 2625344, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(36, 'Desarrollo de Aplicaciones WEB (Estatica) (DWE) GRUPO 2', 2625348, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(37, 'Desarrollo de aplicaciones WEB (Dinamicas) (DWD) GRUPO 2', 2625346, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(38, 'Literatura (LIT)', 2460050, '6° 1° MMO', 20, 'mañana'),
(39, 'Ingles (IGS)', 2460055, '6° 1° MMO', 20, 'mañana'),
(40, 'Ed fisica (EFC)', 2460057, '6° 1° MMO', 20, 'tarde'),
(41, 'Filosofia (FIA)', 2460061, '6° 1° MMO', 20, 'mañana'),
(42, 'Arte (RTE)', 2460065, '6° 1° MMO', 20, 'mañana'),
(43, 'Matematica aplicada (MAP)', 2460069, '6° 1° MMO', 20, 'mañana'),
(44, 'Instalaciones Sanitarias y de Gas (ISI)', 2460072, '6° 1° MMO', 20, 'mañana'),
(45, 'Estructuras (ESR)', 2460075, '6° 1° MMO', 20, 'mañana'),
(46, 'Derechos del trabajo (DET)', 2460080, '6° 1° MMO', 20, 'mañana'),
(47, 'Proyectos de Instalaciones (PIN) GRUPO 1', 2460083, '6° 1° MMO', 20, 'tarde'),
(48, 'Direccion de la ejecucion de instalaciones (DEJ) GRUPO 1', 2460087, '6° 1° MMO', 20, 'tarde'),
(49, 'Sistemas Constructivos (SCO) GRUPO 1', 2460453, '6° 1° MMO', 20, 'tarde'),
(50, 'Proyectos (ORP) GRUPO 1', 2460455, '6° 1° MMO', 20, 'tarde'),
(51, 'Proyectos de Instalaciones (PIN) GRUPO 2', 2554117, '6° 1° MMO', 20, 'tarde'),
(52, 'Direccion de la ejecucion de instalaciones (DEJ) GRUPO 2', 2554118, '6° 1° MMO', 20, 'tarde'),
(53, 'Sistemas Constructivos (SCO) GRUPO 2', 2554120, '6° 1° MMO', 20, 'tarde'),
(54, 'Proyectos (ORP) GRUPO 2', 2554121, '6° 1° MMO', 20, 'tarde'),
(55, 'POLITICA Y CIUDADANIA (PYC)', 2355764, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(56, 'ANALISIS MATEMATICO (AM)', 2355772, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(57, 'MODELOS Y SISTEMAS (MYS)', 2355773, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(58, 'GEOGRAFIA (GGF)', 2355775, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(59, 'INGLES (IGS)', 2355778, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(60, 'HISTORIA (HTR)', 2355780, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(61, 'LITERATURA (LIT)', 2355785, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(62, 'BASE DE DATOS (BDD)', 2355791, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(63, 'SISTEMAS DIGITALES (SD)', 2355797, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(64, 'EDUCACION FISICA EFC', 2355802, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(65, 'LAB. DE REDES INFORMATICAS (LRI) G1', 2355805, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(66, 'LAB DE PROGRAMACION (LPR) G1', 2355808, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(67, 'LAB DE DISEÑO WEB (LDW) G1', 2355812, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(68, 'LAB DE DISEÑO DE BASE DE DATOS (LDB) G1', 2355816, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(69, 'LAB. DE REDES INFORMATICAS G2', 2554124, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(70, 'LAB DE PROGRAMACION G2', 2554123, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(71, 'LAB DE DISEÑO WEB G2', 2554127, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(72, 'LAB DE DISEÑO DE BASE DE DATOS G2', 2554128, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(73, 'POLITICA Y CIUDADANIA (PYC)', 2355819, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(74, 'ANALISIS MATEMATICO (AM)', 2355821, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(75, 'GEOGRAFIA (GGF)', 2355823, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(76, 'INGLES (IGS)', 2355824, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(77, 'HISTORIA (HTR)', 2355825, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(78, 'LITERATURA (LIT)', 2355826, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(79, 'RESISTENCIA Y ENSAYO DE LOS MATERIALES (REM)', 2355827, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(80, 'INSTALACIONES ELECTRICAS (IE)', 2355828, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(81, 'EDUCACION FISICA EFC', 2355829, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(82, 'PROYECTO (ORP) G1', 2355830, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(83, 'SISTEMAS CONSTRUCTIVOS (SCO) G1', 2355831, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(84, 'MATERIALES DE OBRA (MAO) G1', 2355832, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(85, 'DOCUMENTACION TECNICA (DOT) G1', 2355833, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(86, 'PROYECTO G2', 2554115, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(87, 'SISTEMAS CONSTRUCTIVOS G2', 2554114, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(88, 'MATERIALES DE OBRA G2', 2554112, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(89, 'DOCUMENTACION TECNICA G2', 2554109, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(90, 'LITERATURA', 2273304, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(91, 'INGLES IGS', 2273787, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(92, 'ED. FISICA EFC', 2273801, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(93, 'SALUD Y ADOLESCENCIA SYA', 2273842, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(94, 'HISTORIA HTR', 2273812, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(95, 'GEOGRAFIA GGF', 2273826, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(96, 'MATEMATICA (MCS)', 2266313, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(97, 'FISICA (FIS)', 2273834, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(98, 'QUIMICA (QMC)', 2266311, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(99, 'TECNOLOGIAS ELECTRONICAS (TEE)', 2273852, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(100, 'LAB. DE PROGRAMACION (LPR)', 2273856, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(101, 'LAB. DE HARDWARE (LHW)', 2273859, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(102, 'LAB. DE SISTEMAS OPERATIVOS (LSO)', 2273863, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(103, 'LAB. DE APLICACIONES (LPA)', 2273867, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(104, 'LITERATURA', 2265880, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(105, 'INGLES IGS', 2265886, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(106, 'ED. FISICA EFC', 2265887, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(107, 'SALUD Y ADOLESCENCIASY', 2265893, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(108, 'HISTORIA HTR', 2265889, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(109, 'GEOGRAFIA GGF', 2265891, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(110, 'MATEMATICA (MCS)', 2265879, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(111, 'FISICA (FIS)', 2269002, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(112, 'QUIMICA (QMC)', 2265877, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(113, 'CONOC. DE LOS MATERIALES (CMM)', 2265899, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(114, 'DIBUJO TECNOLOGICO (DTM)', 2266285, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(115, 'INTERP. DE ANTEPROYECTOS (IAN)', 2266287, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(116, 'PLANIFICACION DE OBRA (POB)', 2266288, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(117, 'SISTEMAS CONSTRUCTIVOS (SCO)', 2266292, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(118, 'PROYECTO (ORP)', 2266297, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(119, 'BIOLOGIA', 2209455, '3° CURSO: 2°', 13, 'mañana'),
(120, 'FISICO QUIMICA', 2209457, '3° CURSO: 2°', 13, 'mañana'),
(121, 'GEOGRAFIA', 2209473, '3° CURSO: 2°', 13, 'mañana'),
(122, 'HISTORIA', 2209459, '3° CURSO: 2°', 13, 'mañana'),
(123, 'ED. ARTISTICA', 2209463, '3° CURSO: 2°', 13, 'mañana'),
(124, 'ED. FISICA', 2209461, '3° CURSO: 2°', 13, 'mañana'),
(125, 'INGLES', 2209465, '3° CURSO: 2°', 13, 'mañana'),
(126, 'MATEMATICA', 2209467, '3° CURSO: 2°', 13, 'mañana'),
(127, 'P. DEL LENGUAJE', 2209469, '3° CURSO: 2°', 13, 'mañana'),
(128, 'CONST. CIUDADANA', 2209471, '3° CURSO: 2°', 13, 'mañana'),
(129, 'LENGUAJES TECNOLOGICOS (LT)', 2209442, '3° CURSO: 2°', 13, 'mañana'),
(130, 'SISTEMAS TECNOLOGICOS (ST1)', 2209438, '3° CURSO: 2°', 13, 'mañana'),
(131, 'PROCEDIMIENTOS TECNOLOGICOS (PCS)', 2209446, '3° CURSO: 2°', 13, 'mañana'),
(132, 'BIOLOGIA', 2209454, '3° CURSO: 1°', 12, 'mañana'),
(133, 'FISICO QUIMICA', 2209456, '3° CURSO: 1°', 12, 'mañana'),
(134, 'GEOGRAFIA', 2209472, '3° CURSO: 1°', 12, 'mañana'),
(135, 'HISTORIA', 2209458, '3° CURSO: 1°', 12, 'mañana'),
(136, 'ED. ARTISTICA', 2209462, '3° CURSO: 1°', 12, 'mañana'),
(137, 'ED. FISICA', 2209460, '3° CURSO: 1°', 12, 'mañana'),
(138, 'INGLES', 2209464, '3° CURSO: 1°', 12, 'mañana'),
(139, 'MATEMATICA', 2209466, '3° CURSO: 1°', 12, 'mañana'),
(140, 'P. DEL LENGUAJE', 2209468, '3° CURSO: 1°', 12, 'mañana'),
(141, 'CONST. CIUDADANA', 2209470, '3° CURSO: 1°', 12, 'mañana'),
(142, 'LENGUAJES TECNOLOGICOS (LT)', 2209441, '3° CURSO: 1°', 12, 'mañana'),
(143, 'SISTEMAS TECNOLOGICOS (ST1)', 2209436, '3° CURSO: 1°', 12, 'mañana'),
(144, 'PROCEDIMIENTOS TECNOLOGICOS (PCS)', 2209444, '3° CURSO: 1°', 12, 'mañana'),
(145, 'BIOLOGIA (BLG)', 2745924, '2° 3°', 14, 'mañana'),
(146, 'FISICO QUIMICA (FQA)', 2745928, '2° 3°', 14, 'mañana'),
(147, 'GEOGRAFIA (GGF)', 2745929, '2° 3°', 14, 'mañana'),
(148, 'HISTORIA (HTR)', 2745930, '2° 3°', 14, 'mañana'),
(149, 'ED. ARTISTICA (APV)', 2745925, '2° 3°', 14, 'mañana'),
(150, 'ED. FISICA (EFC)', 2745926, '2° 3°', 14, 'mañana'),
(151, 'INGLES (IGS)', 2745931, '2° 3°', 14, 'tarde'),
(152, 'MATEMATICA (MTM)', 2745932, '2° 3°', 14, 'tarde'),
(153, 'P. DEL LENGUAJE (PLG)', 2745933, '2° 3°', 14, 'tarde'),
(154, 'CONST. CIUDADANA (CCD)', 2745934, '2° 3°', 14, 'tarde'),
(155, 'LENGUAJES TECNOLOGICOS (LTE)', 2745936, '2° 3°', 14, 'tarde'),
(156, 'SISTEMAS TECNOLOGICOS (ST2)', 2745935, '2° 3°', 14, 'tarde'),
(157, 'PROCEDIMIENTOS TECNOLOGICOS (PCE)', 2745937, '2° 3°', 14, 'tarde'),
(158, 'BIOLOGIA', 2139934, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(159, 'FISICO QUIMICA', 2139939, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(160, 'GEOGRAFIA', 2139935, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(161, 'HISTORIA', 2139937, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(162, 'ED. ARTISTICA', 2139942, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(163, 'ED. FISICA', 2139941, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(164, 'INGLES', 2139943, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(165, 'MATEMATICA', 2139944, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(166, 'P. DEL LENGUAJE', 2139945, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(167, 'CONST. CIUDADANA', 2139946, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(168, 'LENGUAJES TECNOLOGICOS (LTE)', 2139884, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(169, 'SISTEMAS TECNOLOGICOS (ST2)', 2139883, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(170, 'PROCEDIMIENTOS TECNOLOGICOS (PCE)', 2139902, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(171, 'BIOLOGIA', 2139853, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(172, 'FISICO QUIMICA', 2139854, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(173, 'GEOGRAFIA GGF', 2139852, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(174, 'HISTORIA HTR', 2139843, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(175, 'ED. ARTISTICA ARTE', 2139849, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(176, 'ED. FISICA EFC', 2139841, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(177, 'INGLES IGS', 2139845, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(178, 'MATEMATICA MTM', 2139850, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(179, 'P. DEL LENGUAJE PLG', 2139855, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(180, 'CONST. CIUDADANA CCD', 2139839, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(181, 'LENGUAJES TECNOLOGICOS (LTE)', 2139822, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(182, 'LENGUAJES TECNOLOGICOS (LTE)', 2139872, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(183, 'SISTEMAS TECNOLOGICOS (ST2)', 2139832, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(184, 'SISTEMAS TECNOLOGICOS (ST2)', 2139874, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(185, 'PROCEDIMIENTOS TECNOLOGICOS (Adic)', 2139878, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(186, 'CIENCIAS SOCIALES', 2087037, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(187, 'CIENCIAS NATURALES', 2087046, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(188, 'ED. ARTISTICA MUS', 2087058, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(189, 'ED. FISICA', 2087054, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(190, 'INGLES', 2087056, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(191, 'MATEMATICA', 2087049, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(192, 'P. DEL LENGUAJE', 2087051, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(193, 'CONST. CIUDADANA', 2087052, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(194, 'LENGUAJES TECNOLOGICOS', 2087069, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(195, 'LENGUAJES TECNOLOGICOS (Adic)', 2087072, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(196, 'SISTEMAS TECNOLOGICOS G1', 2087066, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(197, 'SISTEMAS TECNOLOGICOS G2', 2087067, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(198, 'PROCEDIMIENTOS TÉCNICOS G1', 2087060, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(199, 'PROCEDIMIENTOS TÉCNICOS G2', 2087064, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(200, 'CIENCIAS SOCIALES', 2078222, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(201, 'CIENCIAS NATURALES', 2078195, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(202, 'ED. ARTISTICA', 2078217, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(203, 'ED. FISICA', 2078238, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(204, 'INGLES', 2078244, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(205, 'MATEMATICA', 2078230, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(206, 'P. DEL LENGUAJE', 2078236, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(207, 'CONST. CIUDADANA', 2078243, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(208, 'LENGUAJES TECNOLOGICOS LTS G1', 2078254, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(209, 'LENGUAJES TECNOLOGICOS LTS G2', 2078255, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(210, 'SISTEMAS TECNOLOGICOS STS G1', 2078257, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(211, 'SISTEMAS TECNOLOGICOS STS G2', 2078262, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(212, 'PROCEDIMIENTOS TECNICOS PCT G1', 2078251, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(213, 'PROCEDIMIENTOS TECNICOS PCT G2', 2078250, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(214, 'CIENCIAS SOCIALES CSC', 2078225, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(215, 'CIENCIAS NATURALES CNC', 2078214, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(216, 'ED. ARTISTICA ARTE', 2078245, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(217, 'ED. FISICA EFC', 2078240, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(218, 'INGLES IGS', 2078267, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(219, 'MATEMATICA MTM', 2078227, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(220, 'P. DEL LENGUAJE PLG', 2078234, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(221, 'CONST. CIUDADANA CCD', 2078241, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(222, 'LENGUAJES TECNOLOGICOS LTS G1', 2078253, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(223, 'LENGUAJES TECNOLOGICOS LTS G2', 2078252, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(224, 'SISTEMAS TECNOLOGICOS STS G1', 2078260, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(225, 'SISTEMAS TECNOLOGICOS STS G2', 2078256, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(226, 'PROCEDIMIENTOS TECNICOS PCT G1', 2078246, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(227, 'PROCEDIMIENTOS TECNICOS PCT G2', 2078248, 'AÑO: 1° CURSO: 1°', 7, 'mañana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `user_id`, `first_name`, `last_name`) VALUES
(1, NULL, 'MAYDA', 'AGUIRRE'),
(2, NULL, 'ISABEL', 'ARTINOVI'),
(3, NULL, 'PABLO JESÚS', 'ASCHEMACHER'),
(4, NULL, 'AGUSTÍN', 'AVILA'),
(5, NULL, 'LEANDRO', 'BARBIERI'),
(6, NULL, 'CAROLINA', 'BEILINSON'),
(7, NULL, 'MARIANELA', 'BEZICH'),
(8, NULL, 'MAURO', 'BIANCO'),
(9, NULL, 'ANDREA', 'CABRERA'),
(10, NULL, 'MARIANA', 'CAMOU'),
(11, NULL, 'SEBASTIAN', 'CANELO'),
(12, NULL, 'DANIELA', 'CECIOLI'),
(13, NULL, 'FEDERICO', 'CLUIGI'),
(14, NULL, 'MARIA ALFONSINA', 'CONSTANTINO'),
(15, NULL, 'CRISTIAN', 'COÑOMILLA'),
(16, NULL, 'DAIANA', 'COÑUEGUIR'),
(17, NULL, 'MARIA DE LOS ANGELES', 'DAVERIO'),
(18, NULL, 'PABLO', 'DE ABAJO'),
(19, NULL, 'CLAUDIO', 'DIUMACAN'),
(20, NULL, 'MARIO', 'DUARTE'),
(21, NULL, 'NATALIA', 'ECHARREN'),
(22, NULL, 'PATRICIA', 'ESCALADA'),
(23, NULL, 'JULIANA', 'FAILUTTA'),
(24, NULL, 'ANDREA', 'FERRARI'),
(25, NULL, 'FABIANA', 'FOIS'),
(26, NULL, 'GIANNINA', 'FUMAROLA'),
(27, NULL, 'IVAN', 'GRASO'),
(28, NULL, 'LILIANA', 'GRAZIOLI'),
(29, NULL, 'LUDMILA', 'GUIDI'),
(30, NULL, 'MARIANELA', 'IBAÑEZ'),
(31, NULL, 'DANIELA', 'IGNACI'),
(32, NULL, 'FLAVIA', 'ILGNER'),
(33, NULL, 'ANTONELA', 'LARA'),
(34, NULL, 'SAMANTA', 'JAUGE'),
(35, NULL, 'JUAN EDUARDO', 'KEES'),
(36, NULL, 'PAULA', 'KUNUSCH'),
(37, NULL, 'MAGALI', 'LAI'),
(38, NULL, 'VANINA', 'LAMAS'),
(39, NULL, 'PAULINA', 'LEDESMA'),
(40, NULL, 'CLAUDIO', 'LEÓN'),
(41, NULL, 'LIDIA', 'MALASPINA'),
(42, NULL, 'CARINA', 'MATO'),
(43, NULL, 'GUILLERMO', 'MAYER'),
(44, NULL, 'NANCY', 'MICHELENA'),
(45, NULL, 'DAMIAN', 'MISSIATI'),
(46, NULL, 'GLENDA', 'MORALES RIOS'),
(47, NULL, 'CARLA', 'MULLER'),
(48, NULL, 'BRUNO', 'AMICO'),
(49, NULL, 'LAZARO', 'ARTOLA TAILMITTE'),
(50, NULL, 'DANIEL', 'BENGOCHEA'),
(51, NULL, 'NATALIA', 'BENITEZ'),
(52, NULL, 'MIRTA', 'BEZA'),
(53, NULL, 'JORGE', 'CABRERA'),
(54, NULL, 'PABLO', 'CAFERATTA'),
(55, NULL, 'LUIS', 'CALLEA'),
(56, NULL, 'MALENA', 'CAMPOS'),
(57, NULL, 'IVAN', 'CEVOLI'),
(58, NULL, 'JAVIER', 'CHAVARRIA'),
(59, NULL, 'DALMA', 'CORREA'),
(60, NULL, 'GISELA', 'CURA'),
(61, NULL, 'MAGALI', 'DAVICO'),
(62, NULL, 'DIEGO', 'DE VEGA'),
(63, NULL, 'DANIELA', 'DEL FRARI'),
(64, NULL, 'DAMIAN', 'DIEGO'),
(65, NULL, 'MARIA LAURA', 'ELFI'),
(66, NULL, 'IRIS', 'ESCUDERO'),
(67, NULL, 'VERONICA', 'EZCURRA'),
(68, NULL, 'MONICA', 'FERMIN'),
(69, NULL, 'PABLO', 'FIORAVANTI'),
(70, NULL, 'GERMAN', 'GASTARINZA'),
(71, NULL, 'NATALIA', 'GIANNI'),
(72, NULL, 'MIGUEL', 'GIMENEZ'),
(73, NULL, 'RODRIGO', 'GOROSTEGUI'),
(74, NULL, 'ERNESTO', 'GUIDI'),
(75, NULL, 'JORGELINA', 'HENRIQUE'),
(76, NULL, 'EDUARDO', 'KEES'),
(77, NULL, 'MARCELA', 'LABBE'),
(78, NULL, 'GERMAN', 'LECENER'),
(79, NULL, 'MIRIAM', 'LOPEZ'),
(80, NULL, 'MARCELO', 'MENDOZA'),
(81, NULL, 'ALEJANDRO', 'MEZQUITA'),
(82, NULL, 'ELIANA', 'MUÑOZ'),
(83, NULL, 'OSCAR', 'MUÑOZ'),
(84, NULL, 'CLAUDIA', 'NEUMAN'),
(85, NULL, 'SUSANA', 'NOCETI'),
(86, NULL, 'NADIA', 'OLIVES'),
(87, NULL, 'DIEGO', 'PALMERO'),
(88, NULL, 'JUAN SEBASTIAN', 'PEÑA'),
(89, NULL, 'ANGEL', 'PICHON'),
(90, NULL, 'MARIO', 'PIPPI'),
(91, NULL, 'SERGIO', 'PIZARRO'),
(92, NULL, 'NICOLAS', 'RECCHI'),
(93, NULL, 'BELEN', 'RICHIAN'),
(94, NULL, 'JUAN', 'RODRIGUEZ MOURA'),
(95, NULL, 'ENRIQUE', 'DIEGO'),
(96, NULL, 'LUNA JOEL', 'VALI'),
(97, NULL, 'MARIA', 'PARRA'),
(98, NULL, 'MARCELA', 'GUEVARA'),
(99, NULL, 'DAVID', 'GUZMAN'),
(100, NULL, 'GRISELDA', 'SCAFAVATTI'),
(101, NULL, 'NOELIA', 'PEREZ'),
(102, NULL, 'MARIA LAURA', 'SCHWIND'),
(103, NULL, 'EZEQUIEL', 'PICHIÑAN'),
(104, NULL, 'SUSANA', 'LOPEZ'),
(105, NULL, 'LUCIA', 'BEROQUI'),
(106, NULL, 'LEANDRO', 'DUARTE'),
(107, NULL, 'ROLANDO', 'ARRIZABALAGA'),
(108, NULL, 'TAMARA', 'GONZALEZ'),
(109, NULL, 'MAYRA', 'CHAPARRO'),
(110, NULL, 'JOSE', 'UGARTE'),
(111, NULL, 'VICTORIA', 'TALAVERA'),
(112, NULL, 'GABRIELA', 'VENEGAS'),
(113, NULL, 'LAUTARO', 'ROHT'),
(114, NULL, 'MARIO', 'ROSAS'),
(115, NULL, 'EVANGELINA', 'RUIZ'),
(116, NULL, 'JULIETA', 'RUIZ'),
(117, NULL, 'CECILIA', 'SPETTEL'),
(118, NULL, 'MARIA VANESA', 'SURIN'),
(119, NULL, 'GRUDL NATALIA', 'URSINO'),
(120, NULL, 'MARIA LAURA', 'YUNES'),
(121, NULL, 'CARLOS', 'MULLER'),
(122, NULL, 'MIRTA', 'PAEZ'),
(123, NULL, 'LOREANA', 'QUINTANILLA'),
(124, NULL, 'MEIER JULIETA', 'QUIÑONES'),
(125, NULL, 'CARONLINA', 'REIMER'),
(126, NULL, 'MENDINUTA MICAELA', 'REIRA'),
(127, NULL, 'NADIA', 'ROBLEOD'),
(128, NULL, 'KARINA', 'RODRIGUEZ'),
(129, NULL, 'CARLOS', 'ROSAS'),
(130, NULL, 'FLORENCIA', 'SALERNO'),
(131, NULL, 'SILVIA', 'SIERRA'),
(132, NULL, 'SILVIA', 'SIERRA'),
(133, NULL, 'FERNANDO', 'SUELDO'),
(134, NULL, 'JULIANA', 'VERBEKE'),
(135, NULL, 'GABRIELA', 'VIDAL'),
(136, NULL, 'FACUNDO', 'VILIANI'),
(137, NULL, 'CLERIA', 'OLIVARES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` datetime NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `role_id`) VALUES
(1, 'Admin', 'Principal', 'admin@school.com', 'admin123', '2025-10-01 18:47:31', NULL),
(2, 'Laura', 'Gomez', 'lgomez@school.com', 'teacher123', '2025-10-01 18:47:31', NULL),
(3, 'Carlos', 'Perez', 'cperez@school.com', 'teacher123', '2025-10-01 18:47:31', NULL),
(4, 'Ana', 'Martinez', 'amartinez@school.com', 'student123', '2025-10-01 18:47:31', NULL),
(6, 'Jean', 'Lobos', 'Agustin500cm@gmail.com', '$2y$10$UjQbXjTwxf9ZBI.7n4Cw8uXRDGYJsh.FWbaon5YRTfLzdA3ij4OHO', '2025-10-11 16:07:27', 2),
(7, 'Pablo', 'De Arriba', 'Pablo@gmail.com', '$2y$10$dFAXCaUx3aNFk796ANKZc.HLL7/b.jEshWcLnOWpXIw8XWNTdQmRW', '2025-10-11 16:08:26', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indices de la tabla `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `fk_schedules_groups` (`group_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `fk_substitute_teacher` (`substitute_teacher_id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `fk_students_groups` (`group_id`);

--
-- Indices de la tabla `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indices de la tabla `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `CUPOF` (`CUPOF`);

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_roles` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=432;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedules_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_substitute_teacher` FOREIGN KEY (`substitute_teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_4` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`);

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `student_attendance`
--
ALTER TABLE `student_attendance`
  ADD CONSTRAINT `student_attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `student_attendance_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`);

--
-- Filtros para la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  ADD CONSTRAINT `teacher_attendance_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `teacher_attendance_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
