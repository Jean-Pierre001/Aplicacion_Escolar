-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2025 a las 03:12:06
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
(1, 7, 1, 49, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(2, 7, 1, 49, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(3, 7, 6, 46, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(4, 7, 6, 46, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(5, 7, 8, 92, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(6, 7, 8, 92, NULL, 'monday', '14:20:00', '15:20:00', NULL, NULL),
(7, 7, 8, 47, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(8, 7, 8, 47, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(9, 7, 1, 39, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(10, 7, 1, 39, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(11, 7, 6, 46, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(12, 7, 6, 46, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(13, 7, 101, 72, NULL, 'tuesday', '11:40:00', '12:40:00', NULL, NULL),
(14, 7, 10, 16, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(15, 7, 10, 16, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(16, 7, 10, 21, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(17, 7, 10, 21, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(18, 7, 1, 137, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(19, 7, 1, 137, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(20, 7, 10, 32, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(21, 7, 10, 32, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(22, 7, 101, 72, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, NULL),
(23, 7, 1, 91, NULL, 'wednesday', '13:20:00', '14:20:00', 8, 4),
(24, 7, 1, 91, NULL, 'wednesday', '14:20:00', '15:20:00', 8, 4),
(25, 7, 1, 119, NULL, 'wednesday', '15:30:00', '16:30:00', 9, 4),
(26, 7, 1, 119, NULL, 'wednesday', '16:30:00', '17:30:00', 9, 4),
(27, 7, 1, 137, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(28, 7, 1, 137, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(29, 7, 10, 32, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(30, 7, 10, 32, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(31, 7, 101, 72, NULL, 'thursday', '11:40:00', '12:40:00', NULL, NULL),
(32, 7, 8, 47, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(33, 7, 8, 47, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(34, 7, 1, 39, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(35, 7, 1, 39, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(36, 7, 9, 16, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(37, 7, 9, 16, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(38, 7, 8, 27, NULL, 'friday', '14:20:00', '15:20:00', 8, NULL),
(39, 7, 8, 74, NULL, 'friday', '15:30:00', '16:30:00', 9, NULL),
(40, 7, 8, 74, NULL, 'friday', '16:30:00', '17:30:00', 9, NULL),
(41, 8, 6, 46, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(42, 8, 6, 46, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(43, 8, 1, 14, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(44, 8, 1, 14, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(45, 8, 8, 2, NULL, 'monday', '11:40:00', '12:40:00', NULL, NULL),
(46, 8, 8, 146, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(47, 8, 8, 78, NULL, 'monday', '15:30:00', '16:30:00', 10, NULL),
(48, 8, 8, 92, NULL, 'monday', '16:30:00', '17:30:00', 11, NULL),
(49, 8, 6, 46, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(50, 8, 6, 46, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(51, 8, 9, 16, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(52, 8, 9, 16, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(53, 8, 8, 120, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(54, 8, 8, 120, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(55, 8, 8, 86, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(56, 8, 8, 86, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(57, 8, 1, 39, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(58, 8, 1, 39, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(59, 8, 10, 98, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(60, 8, 10, 98, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(61, 8, 8, 146, NULL, 'wednesday', '11:40:00', '12:40:00', NULL, NULL),
(62, 8, 10, 64, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(63, 8, 10, 64, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(64, 8, 1, 39, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(65, 8, 1, 39, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(66, 8, 1, 5, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(67, 8, 1, 5, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(68, 8, 8, 91, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(69, 8, 8, 78, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(70, 8, 1, 14, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(71, 8, 1, 14, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(72, 8, 10, 98, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(73, 8, 10, 98, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(74, 9, 1, 127, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(75, 9, 9, 127, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(76, 9, 1, 45, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(77, 9, 1, 45, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(78, 9, 8, 47, NULL, 'monday', '13:20:00', '14:20:00', 12, NULL),
(79, 9, 8, 139, NULL, 'monday', '14:20:00', '15:20:00', 13, NULL),
(80, 9, 8, 15, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(81, 9, 8, 15, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(82, 9, 6, 30, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(83, 9, 6, 30, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(84, 9, 1, 45, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(85, 9, 1, 45, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(86, 9, 10, 32, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(87, 9, 10, 32, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(88, 9, 10, 15, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(89, 9, 10, 15, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(90, 9, 10, 23, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(91, 9, 10, 23, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(92, 9, 1, 29, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(93, 9, 1, 29, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(94, 9, 8, 15, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(95, 9, 8, 15, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(96, 9, 10, 23, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(97, 9, 10, 23, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(98, 9, 6, 30, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(99, 9, 6, 30, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(100, 9, 8, 86, NULL, 'thursday', '13:20:00', '14:20:00', 12, NULL),
(101, 9, 8, 47, NULL, 'thursday', '14:20:00', '15:20:00', 13, NULL),
(102, 9, 1, 38, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(103, 9, 1, 38, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(104, 9, 1, 29, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(105, 9, 1, 29, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(106, 9, 8, 120, NULL, 'friday', '13:20:00', '14:20:00', 12, NULL),
(107, 9, 8, 75, NULL, 'friday', '14:20:00', '15:20:00', 13, NULL),
(108, 10, 25, 136, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(109, 10, 25, 136, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(110, 10, 26, 29, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(111, 10, 26, 29, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(112, 10, 34, 135, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(113, 10, 34, 135, NULL, 'monday', '14:20:00', '15:20:00', NULL, NULL),
(114, 10, 32, 15, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(115, 10, 32, 15, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(116, 10, 27, 123, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(117, 10, 27, 123, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(118, 10, 26, 127, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(119, 10, 33, 127, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(120, 10, 32, 78, NULL, 'tuesday', '13:20:00', '14:20:00', 14, NULL),
(121, 10, 32, 74, NULL, 'tuesday', '14:20:00', '15:20:00', 15, NULL),
(122, 10, 32, 78, NULL, 'tuesday', '15:30:00', '16:30:00', 14, NULL),
(123, 10, 32, 74, NULL, 'tuesday', '16:30:00', '17:30:00', 15, NULL),
(124, 10, 28, 134, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(125, 10, 28, 134, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(126, 10, 25, 136, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(127, 10, 25, 136, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(128, 10, 36, 15, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(129, 10, 25, 91, NULL, 'wednesday', '15:30:00', '16:30:00', 14, 4),
(130, 10, 25, 91, NULL, 'wednesday', '16:30:00', '17:30:00', 14, 4),
(131, 10, 29, 13, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(132, 10, 29, 13, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(133, 10, 26, 29, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(134, 10, 26, 29, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(135, 10, 32, 120, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(136, 10, 32, 74, NULL, 'thursday', '15:30:00', '16:30:00', 15, NULL),
(137, 10, 32, 47, NULL, 'thursday', '16:30:00', '17:30:00', 15, NULL),
(138, 10, 31, 4, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(139, 10, 31, 4, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(140, 10, 30, 30, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(141, 10, 30, 30, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(142, 10, 32, 78, NULL, 'friday', '15:30:00', '16:30:00', 14, NULL),
(143, 10, 32, 47, NULL, 'friday', '16:30:00', '17:30:00', 15, NULL),
(144, 11, 38, 79, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(145, 11, 38, 79, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(146, 11, 43, 56, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(147, 11, 43, 56, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(148, 11, 44, 15, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(149, 11, 44, 64, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(150, 11, 44, 64, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(151, 11, 38, 79, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(152, 11, 38, 79, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(153, 11, 39, 123, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(154, 11, 39, 123, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(155, 11, 44, 118, NULL, 'tuesday', '13:20:00', '14:20:00', 16, NULL),
(156, 11, 44, 124, NULL, 'tuesday', '14:20:00', '15:20:00', 17, NULL),
(157, 11, 44, 118, NULL, 'tuesday', '15:30:00', '16:30:00', 16, NULL),
(158, 11, 44, 124, NULL, 'tuesday', '16:30:00', '17:30:00', 17, NULL),
(159, 11, 42, 28, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(160, 11, 42, 28, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(161, 11, 40, 124, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(162, 11, 40, 124, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(163, 11, 44, 61, NULL, 'wednesday', '13:20:00', '14:20:00', 16, NULL),
(164, 11, 44, 61, NULL, 'wednesday', '14:20:00', '15:20:00', 16, NULL),
(165, 11, 44, 64, NULL, 'wednesday', '15:30:00', '16:30:00', 17, NULL),
(166, 11, 44, 64, NULL, 'wednesday', '16:30:00', '17:30:00', 17, NULL),
(167, 11, 41, 22, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(168, 11, 41, 22, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(169, 11, 43, 38, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(170, 11, 43, 38, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(171, 11, 44, 120, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(172, 11, 44, 118, NULL, 'thursday', '15:30:00', '16:30:00', 16, NULL),
(173, 11, 44, 118, NULL, 'thursday', '16:30:00', '17:30:00', 16, NULL),
(174, 11, 37, 56, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(175, 11, 37, 56, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(176, 11, 45, 90, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(177, 11, 45, 90, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(178, 11, 44, 15, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(179, 11, 44, 61, NULL, 'friday', '15:30:00', '16:30:00', 16, NULL),
(180, 11, 44, 75, NULL, 'friday', '16:30:00', '17:30:00', 17, NULL),
(181, 12, 11, 1, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(182, 12, 57, 1, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(183, 12, 52, 89, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(184, 12, 52, 89, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(185, 12, 49, 9, NULL, 'monday', '13:20:00', '14:20:00', 18, NULL),
(186, 12, 56, 83, NULL, 'monday', '14:20:00', '15:20:00', 19, NULL),
(187, 12, 56, 74, NULL, 'monday', '15:30:00', '16:30:00', 19, NULL),
(188, 12, 56, 74, NULL, 'monday', '16:30:00', '17:30:00', 19, NULL),
(189, 12, 60, 25, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(190, 12, 60, 25, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(191, 12, 51, 57, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(192, 12, 51, 57, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(193, 12, 49, 83, NULL, 'tuesday', '13:20:00', '14:20:00', 18, NULL),
(194, 12, 49, 91, NULL, 'tuesday', '14:20:00', '15:20:00', 19, NULL),
(195, 12, 58, 10, NULL, 'tuesday', '15:30:00', '16:30:00', 19, NULL),
(196, 12, 58, 10, NULL, 'tuesday', '16:30:00', '17:30:00', 19, NULL),
(197, 12, 50, 88, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(198, 12, 50, 88, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(199, 12, 54, 28, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(200, 12, 54, 28, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(201, 12, 56, 15, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(202, 12, 50, 88, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(203, 12, 50, 88, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(204, 12, 49, 139, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(205, 12, 49, 139, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(206, 12, 49, 83, NULL, 'thursday', '14:20:00', '15:20:00', 18, NULL),
(207, 12, 58, 38, NULL, 'thursday', '15:30:00', '16:30:00', NULL, NULL),
(208, 12, 58, 38, NULL, 'thursday', '16:30:00', '17:30:00', NULL, NULL),
(209, 12, 53, 22, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(210, 12, 53, 22, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(211, 12, 49, 139, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(212, 12, 49, 139, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(213, 12, 56, 15, NULL, 'friday', '14:20:00', '15:20:00', NULL, NULL),
(214, 12, 49, 91, NULL, 'friday', '15:30:00', '16:30:00', 19, NULL),
(215, 12, 56, 83, NULL, 'friday', '16:30:00', '17:30:00', 19, NULL),
(216, 13, 62, 29, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(217, 13, 62, 29, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(218, 13, 61, 139, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(219, 13, 61, 139, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(220, 13, 68, 12, NULL, 'monday', '12:05:00', '13:05:00', NULL, NULL),
(221, 13, 70, 37, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(222, 13, 70, 37, NULL, 'monday', '14:20:00', '15:20:00', NULL, NULL),
(223, 13, 63, 57, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(224, 13, 63, 57, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(225, 13, 66, 85, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(226, 13, 66, 85, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(227, 13, 68, 86, NULL, 'tuesday', '13:20:00', '14:20:00', 20, NULL),
(228, 13, 68, 47, NULL, 'tuesday', '14:20:00', '15:20:00', 21, NULL),
(229, 13, 68, 86, NULL, 'tuesday', '15:30:00', '16:30:00', 20, NULL),
(230, 13, 68, 47, NULL, 'tuesday', '16:30:00', '17:30:00', 21, NULL),
(231, 13, 62, 29, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(232, 13, 62, 29, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(233, 13, 61, 139, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(234, 13, 61, 139, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(235, 13, 68, 78, NULL, 'wednesday', '14:20:00', '15:20:00', 20, NULL),
(236, 13, 68, 92, NULL, 'wednesday', '15:30:00', '16:30:00', 20, NULL),
(237, 13, 68, 80, NULL, 'wednesday', '16:30:00', '17:30:00', 21, NULL),
(238, 13, 64, 102, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(239, 13, 64, 102, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(240, 13, 65, 13, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(241, 13, 65, 13, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(242, 13, 68, 12, NULL, 'thursday', '11:40:00', '12:40:00', NULL, NULL),
(243, 13, 68, 78, NULL, 'thursday', '14:20:00', '15:20:00', 20, NULL),
(244, 13, 68, 78, NULL, 'thursday', '15:30:00', '16:30:00', 20, NULL),
(245, 13, 68, 78, NULL, 'thursday', '16:30:00', '17:30:00', 20, NULL),
(246, 13, 60, 14, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(247, 13, 60, 14, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(248, 13, 69, 127, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(249, 13, 69, 127, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(250, 13, 68, 78, NULL, 'friday', '14:20:00', '15:20:00', 20, NULL),
(251, 13, 68, 92, NULL, 'friday', '15:30:00', '16:30:00', 20, NULL),
(252, 13, 68, 92, NULL, 'friday', '16:30:00', '17:30:00', 20, NULL),
(253, 15, 87, 27, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(254, 15, 87, 27, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(255, 15, 73, 11, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(256, 15, 73, 11, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(257, 15, 76, 97, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(258, 15, 88, 80, NULL, 'monday', '14:20:00', '15:20:00', NULL, NULL),
(259, 15, 76, 97, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(260, 15, 76, 97, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(261, 15, 89, 8, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(262, 15, 89, 8, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(263, 15, 73, 11, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(264, 15, 73, 11, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(265, 15, 88, 80, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(266, 15, 88, 80, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(267, 15, 88, 97, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(268, 15, 88, 80, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(269, 15, 90, 84, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(270, 15, 90, 84, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(271, 15, 92, 66, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(272, 15, 92, 66, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(273, 15, 76, 139, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(274, 15, 76, 139, NULL, 'wednesday', '14:20:00', '15:20:00', NULL, NULL),
(275, 15, 75, 5, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(276, 15, 75, 5, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(277, 15, 93, 80, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(278, 15, 93, 80, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(279, 15, 72, 137, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(280, 15, 72, 137, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(281, 15, 76, 95, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(282, 15, 76, 7, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(283, 15, 76, 97, NULL, 'thursday', '15:30:00', '16:30:00', NULL, NULL),
(284, 15, 88, 80, NULL, 'thursday', '16:30:00', '17:30:00', NULL, NULL),
(285, 15, 72, 127, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(286, 15, 72, 127, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(287, 15, 85, 79, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(288, 15, 85, 79, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(289, 15, 94, 5, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(290, 15, 76, 95, NULL, 'friday', '15:30:00', '16:30:00', NULL, NULL),
(291, 15, 76, 95, NULL, 'friday', '16:30:00', '17:30:00', NULL, NULL),
(292, 16, 72, 137, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(293, 16, 72, 137, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(294, 16, 89, 8, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(295, 16, 89, 8, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(296, 16, 91, 91, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(297, 16, 100, 56, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(298, 16, 100, 9, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(299, 16, 73, 25, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(300, 16, 73, 25, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(301, 16, 87, 30, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(302, 16, 87, 30, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(303, 16, 75, 27, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(304, 16, 100, 74, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(305, 16, 100, 85, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(306, 16, 72, 83, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(307, 16, 72, 83, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(308, 16, 92, 13, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(309, 16, 92, 13, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(310, 16, 100, 85, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(311, 16, 100, 73, NULL, 'wednesday', '14:20:00', '15:20:00', NULL, NULL),
(312, 16, 100, 73, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(313, 16, 100, 73, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(314, 16, 85, 83, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(315, 16, 85, 83, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(316, 16, 90, 84, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(317, 16, 90, 84, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(318, 16, 75, 27, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(319, 16, 75, 27, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(320, 16, 73, 139, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(321, 16, 73, 139, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(322, 16, 100, 73, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(323, 16, 100, 73, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(324, 16, 100, 96, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(325, 16, 100, 95, NULL, 'friday', '14:20:00', '15:20:00', NULL, NULL),
(326, 16, 100, 56, NULL, 'friday', '15:30:00', '16:30:00', NULL, NULL),
(327, 16, 100, 91, NULL, 'friday', '16:30:00', '17:30:00', NULL, NULL),
(499, 19, 115, 65, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(500, 19, 115, 65, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(501, 19, 116, 89, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(502, 19, 127, 39, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(503, 19, 118, 7, NULL, 'monday', '13:20:00', '14:20:00', 22, NULL),
(504, 19, 118, 95, NULL, 'monday', '14:20:00', '15:20:00', 23, NULL),
(505, 19, 118, 95, NULL, 'monday', '16:30:00', '17:30:00', 23, NULL),
(506, 19, 117, 39, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(507, 19, 117, 39, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(508, 19, 117, 39, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(509, 19, 115, 65, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(510, 19, 118, 95, NULL, 'tuesday', '15:30:00', '16:30:00', 23, NULL),
(511, 19, 118, 95, NULL, 'tuesday', '16:30:00', '17:30:00', 23, NULL),
(512, 19, 119, 95, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(513, 19, 119, 95, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(514, 19, 120, 137, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(515, 19, 120, 137, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(516, 19, 118, 7, NULL, 'wednesday', '15:30:00', '16:30:00', 22, NULL),
(517, 19, 118, 95, NULL, 'wednesday', '16:30:00', '17:30:00', 23, NULL),
(518, 19, 128, 24, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(519, 19, 128, 24, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(520, 19, 127, 39, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(521, 19, 127, 39, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(522, 19, 121, 2, NULL, 'thursday', '13:20:00', '14:20:00', 22, NULL),
(523, 19, 121, 2, NULL, 'thursday', '14:20:00', '15:20:00', 22, NULL),
(524, 19, 121, 39, NULL, 'thursday', '15:30:00', '16:30:00', 23, NULL),
(525, 19, 121, 39, NULL, 'thursday', '16:30:00', '17:30:00', 23, NULL),
(526, 19, 122, 20, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(527, 19, 122, 20, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(528, 19, 72, 7, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(529, 19, 72, 7, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(530, 19, 118, 95, NULL, 'friday', '13:20:00', '14:20:00', 23, NULL),
(531, 19, 121, 2, NULL, 'friday', '14:20:00', '15:20:00', 22, NULL),
(532, 19, 121, 39, NULL, 'friday', '15:30:00', '16:30:00', 23, NULL),
(533, 19, 121, 39, NULL, 'friday', '16:30:00', '17:30:00', 23, NULL),
(534, 20, 123, 104, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(535, 20, 123, 104, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(536, 20, 120, 137, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(537, 20, 120, 137, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(538, 20, 75, 95, NULL, 'monday', '11:50:00', '12:50:00', NULL, NULL),
(539, 20, 106, 96, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(540, 20, 106, 96, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(541, 20, 122, 20, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(542, 20, 122, 20, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(543, 20, 124, 92, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(544, 20, 124, 92, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(545, 20, 108, 9, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(546, 20, 108, 104, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(547, 20, 108, 104, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(548, 20, 108, 104, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(549, 20, 116, 89, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(550, 20, 116, 89, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(551, 20, 125, 104, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(552, 20, 125, 104, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(553, 20, 75, 95, NULL, 'wednesday', '11:50:00', '12:50:00', NULL, NULL),
(554, 20, 108, 61, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(555, 20, 106, 96, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(556, 20, 128, 25, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(557, 20, 128, 25, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(558, 20, 125, 104, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(559, 20, 125, 104, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(560, 20, 126, 61, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(561, 20, 126, 104, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(562, 20, 108, 9, NULL, 'thursday', '15:30:00', '16:30:00', NULL, NULL),
(563, 20, 108, 96, NULL, 'thursday', '16:30:00', '17:30:00', NULL, NULL),
(564, 20, 72, 7, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(565, 20, 72, 7, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(566, 20, 125, 104, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(567, 20, 125, 104, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(568, 20, 123, 61, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(569, 20, 126, 61, NULL, 'friday', '14:20:00', '15:20:00', NULL, NULL),
(570, 20, 126, 61, NULL, 'friday', '15:30:00', '16:30:00', NULL, NULL),
(571, 20, 108, 96, NULL, 'friday', '16:30:00', '17:30:00', NULL, NULL),
(572, 21, 129, 118, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(573, 21, 129, 118, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(574, 21, 130, 117, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(575, 21, 130, 117, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(576, 21, 135, 7, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(577, 21, 135, 7, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(578, 21, 131, 95, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(579, 21, 131, 95, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(580, 21, 132, 80, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(581, 21, 132, 80, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(582, 21, 135, 7, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(583, 21, 135, 7, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(584, 21, 132, 80, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(585, 21, 132, 80, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(586, 21, 133, 96, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(587, 21, 133, 96, NULL, 'wednesday', '14:20:00', '15:20:00', NULL, NULL),
(588, 21, 135, 7, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(589, 21, 135, 7, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(590, 21, 134, 12, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(591, 21, 134, 12, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(592, 21, 134, 12, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(593, 21, 135, 7, NULL, 'thursday', '15:30:00', '16:30:00', NULL, NULL),
(594, 21, 135, 7, NULL, 'thursday', '16:30:00', '17:30:00', NULL, NULL),
(595, 21, 131, 95, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(596, 21, 131, 95, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(597, 21, 132, 80, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(598, 21, 132, 80, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(599, 21, 135, 7, NULL, 'friday', '15:30:00', '16:30:00', NULL, NULL),
(600, 21, 135, 7, NULL, 'friday', '16:30:00', '17:30:00', NULL, NULL),
(601, 22, 132, 73, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(602, 22, 132, 73, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(603, 22, 132, 43, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(604, 22, 132, 43, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(605, 22, 137, 56, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(606, 22, 137, 43, NULL, 'monday', '14:20:00', '15:20:00', NULL, NULL),
(607, 22, 137, 29, NULL, 'monday', '15:30:00', '16:30:00', NULL, NULL),
(608, 22, 137, 29, NULL, 'monday', '16:30:00', '17:30:00', NULL, NULL),
(609, 22, 136, 96, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(610, 22, 136, 96, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(611, 22, 138, 85, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(612, 22, 138, 85, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(613, 22, 137, 56, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(614, 22, 137, 6, NULL, 'tuesday', '14:20:00', '15:20:00', NULL, NULL),
(615, 22, 137, 29, NULL, 'tuesday', '15:30:00', '16:30:00', NULL, NULL),
(616, 22, 137, 6, NULL, 'tuesday', '16:30:00', '17:30:00', NULL, NULL),
(617, 22, 132, 73, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(618, 22, 132, 73, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(619, 22, 132, 43, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(620, 22, 132, 43, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(621, 22, 137, 56, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(622, 22, 137, 43, NULL, 'wednesday', '14:20:00', '15:20:00', NULL, NULL),
(623, 22, 137, 29, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(624, 22, 137, 6, NULL, 'wednesday', '16:30:00', '17:30:00', NULL, NULL),
(625, 22, 136, 96, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(626, 22, 136, 96, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(627, 22, 138, 85, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(628, 22, 138, 85, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(629, 22, 137, 43, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(630, 22, 137, 29, NULL, 'thursday', '14:20:00', '15:20:00', NULL, NULL),
(631, 22, 137, 6, NULL, 'thursday', '15:30:00', '16:30:00', NULL, NULL),
(632, 22, 137, 6, NULL, 'thursday', '16:30:00', '17:30:00', NULL, NULL),
(633, 22, 132, 73, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(634, 22, 132, 73, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(635, 22, 132, 43, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(636, 22, 132, 43, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(637, 22, 137, 56, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(638, 22, 137, 29, NULL, 'friday', '14:20:00', '15:20:00', NULL, NULL),
(639, 22, 137, 6, NULL, 'friday', '15:30:00', '16:30:00', NULL, NULL),
(640, 22, 137, 6, NULL, 'friday', '16:30:00', '17:30:00', NULL, NULL),
(715, 17, 95, 8, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(716, 17, 95, 8, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(717, 17, 96, 11, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(718, 17, 96, 11, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(719, 17, 97, 96, NULL, 'monday', '13:20:00', '14:20:00', NULL, NULL),
(720, 17, 98, 97, NULL, 'monday', '15:30:00', '16:30:00', 18, NULL),
(721, 17, 99, 95, NULL, 'monday', '16:30:00', '17:30:00', 25, NULL),
(722, 17, 96, 11, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(723, 17, 96, 11, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(724, 17, 100, 22, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(725, 17, 100, 22, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(726, 17, 101, 35, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(727, 17, 102, 97, NULL, 'tuesday', '14:20:00', '15:20:00', 25, NULL),
(728, 17, 102, 97, NULL, 'tuesday', '15:30:00', '16:30:00', 25, NULL),
(729, 17, 97, 139, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(730, 17, 97, 139, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(731, 17, 103, 89, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(732, 17, 103, 89, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(733, 17, 99, 7, NULL, 'wednesday', '13:20:00', '14:20:00', 18, NULL),
(734, 17, 104, 2, NULL, 'wednesday', '14:20:00', '15:20:00', 25, NULL),
(735, 17, 104, 39, NULL, 'wednesday', '15:30:00', '16:30:00', 18, NULL),
(736, 17, 98, 95, NULL, 'wednesday', '16:30:00', '17:30:00', 25, NULL),
(737, 17, 97, 96, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(738, 17, 97, 96, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(739, 17, 72, 94, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(740, 17, 72, 94, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(741, 17, 101, 35, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(742, 17, 99, 95, NULL, 'thursday', '14:20:00', '15:20:00', 25, NULL),
(743, 17, 98, 95, NULL, 'thursday', '15:30:00', '16:30:00', 18, NULL),
(744, 17, 99, 95, NULL, 'thursday', '16:30:00', '17:30:00', 25, NULL),
(745, 17, 102, 10, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(746, 17, 102, 10, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(747, 17, 6, 1, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(748, 17, 6, 1, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(749, 17, 99, 7, NULL, 'friday', '14:20:00', '15:20:00', 18, NULL),
(750, 17, 102, 10, NULL, 'friday', '15:30:00', '16:30:00', 18, NULL),
(751, 17, 98, 95, NULL, 'friday', '16:30:00', '17:30:00', 25, NULL),
(752, 18, 100, 13, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(753, 18, 100, 13, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(754, 18, 105, 80, NULL, 'monday', '09:40:00', '10:40:00', NULL, NULL),
(755, 18, 105, 80, NULL, 'monday', '10:40:00', '11:40:00', NULL, NULL),
(756, 18, 106, 104, NULL, 'monday', '13:20:00', '14:20:00', 19, NULL),
(757, 18, 107, 73, NULL, 'monday', '14:20:00', '15:20:00', 24, NULL),
(758, 18, 106, 104, NULL, 'monday', '15:30:00', '16:30:00', 19, NULL),
(759, 18, 108, 61, NULL, 'monday', '16:30:00', '17:30:00', 24, NULL),
(760, 18, 95, 71, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(761, 18, 95, 71, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(762, 18, 109, 91, NULL, 'tuesday', '09:40:00', '10:40:00', NULL, NULL),
(763, 18, 109, 91, NULL, 'tuesday', '10:40:00', '11:40:00', NULL, NULL),
(764, 18, 110, 61, NULL, 'tuesday', '13:20:00', '14:20:00', 19, NULL),
(765, 18, 110, 75, NULL, 'tuesday', '14:20:00', '15:20:00', 19, NULL),
(766, 18, 106, 75, NULL, 'tuesday', '15:30:00', '16:30:00', 24, NULL),
(767, 18, 108, 56, NULL, 'tuesday', '16:30:00', '17:30:00', 24, NULL),
(768, 18, 72, 36, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(769, 18, 72, 36, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(770, 18, 6, 7, NULL, 'wednesday', '09:40:00', '10:40:00', NULL, NULL),
(771, 18, 6, 7, NULL, 'wednesday', '10:40:00', '11:40:00', NULL, NULL),
(772, 18, 101, 15, NULL, 'wednesday', '14:20:00', '15:20:00', NULL, NULL),
(773, 18, 101, 15, NULL, 'wednesday', '15:30:00', '16:30:00', NULL, NULL),
(774, 18, 109, 91, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(775, 18, 109, 91, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(776, 18, 96, 45, NULL, 'thursday', '09:40:00', '10:40:00', NULL, NULL),
(777, 18, 96, 45, NULL, 'thursday', '10:40:00', '11:40:00', NULL, NULL),
(778, 18, 107, 73, NULL, 'thursday', '13:20:00', '14:20:00', 19, NULL),
(779, 18, 110, 115, NULL, 'thursday', '14:20:00', '15:20:00', 24, NULL),
(780, 18, 110, 115, NULL, 'thursday', '15:30:00', '16:30:00', 24, NULL),
(781, 18, 108, 61, NULL, 'thursday', '16:30:00', '17:30:00', 24, NULL),
(782, 18, 96, 45, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(783, 18, 96, 45, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(784, 18, 109, 91, NULL, 'friday', '09:40:00', '10:40:00', NULL, NULL),
(785, 18, 103, 115, NULL, 'friday', '10:40:00', '11:40:00', NULL, NULL),
(786, 18, 101, 15, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(787, 18, 108, 115, NULL, 'friday', '15:30:00', '16:30:00', 19, NULL),
(788, 18, 107, 73, NULL, 'friday', '16:30:00', '17:30:00', 24, NULL);

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
(1, 'Matemática I', 1010100, '', 7, 'mañana'),
(2, 'Lengua y Literatura I', 1010101, '', 7, 'mañana'),
(3, 'Física y Química I', 1010102, '', 7, 'mañana'),
(4, 'Historia I', 1010103, '', 7, 'mañana'),
(5, 'Geografía I', 1010104, '', 7, 'mañana'),
(6, 'Biología I', 1010105, '', 7, 'mañana'),
(7, 'Educación Artística I', 1010106, '', 7, 'mañana'),
(8, 'Educación Física I', 1010107, '', 7, 'tarde'),
(9, 'Inglés I', 1010108, '', 7, 'tarde'),
(10, 'Formación Ética y Ciudadana I', 1010109, '', 7, 'tarde'),
(11, 'Tecnología de la Información I', 1010110, '', 7, 'tarde'),
(12, 'Espacios Curriculares I', 1010111, '', 7, 'tarde'),
(13, 'Matemática I', 1010200, '', 8, 'mañana'),
(14, 'Lengua y Literatura I', 1010201, '', 8, 'mañana'),
(15, 'Física y Química I', 1010202, '', 8, 'mañana'),
(16, 'Historia I', 1010203, '', 8, 'mañana'),
(17, 'Geografía I', 1010204, '', 8, 'mañana'),
(18, 'Biología I', 1010205, '', 8, 'mañana'),
(19, 'Educación Artística I', 1010206, '', 8, 'mañana'),
(20, 'Educación Física I', 1010207, '', 8, 'tarde'),
(21, 'Inglés I', 1010208, '', 8, 'tarde'),
(22, 'Formación Ética y Ciudadana I', 1010209, '', 8, 'tarde'),
(23, 'Tecnología de la Información I', 1010210, '', 8, 'tarde'),
(24, 'Espacios Curriculares I', 1010211, '', 8, 'tarde'),
(25, 'Matemática II', 1020100, '', 10, 'mañana'),
(26, 'Lengua y Literatura II', 1020101, '', 10, 'mañana'),
(27, 'Física y Química II', 1020102, '', 10, 'mañana'),
(28, 'Historia II', 1020103, '', 10, 'mañana'),
(29, 'Geografía II', 1020104, '', 10, 'mañana'),
(30, 'Biología II', 1020105, '', 10, 'mañana'),
(31, 'Educación Artística II', 1020106, '', 10, 'mañana'),
(32, 'Educación Física II', 1020107, '', 10, 'tarde'),
(33, 'Inglés II', 1020108, '', 10, 'tarde'),
(34, 'Formación Ética y Ciudadana II', 1020109, '', 10, 'tarde'),
(35, 'Tecnología de la Información II', 1020110, '', 10, 'tarde'),
(36, 'Espacios Curriculares II', 1020111, '', 10, 'tarde'),
(37, 'Matemática II', 1020200, '', 11, 'mañana'),
(38, 'Lengua y Literatura II', 1020201, '', 11, 'mañana'),
(39, 'Física y Química II', 1020202, '', 11, 'mañana'),
(40, 'Historia II', 1020203, '', 11, 'mañana'),
(41, 'Geografía II', 1020204, '', 11, 'mañana'),
(42, 'Biología II', 1020205, '', 11, 'mañana'),
(43, 'Educación Artística II', 1020206, '', 11, 'mañana'),
(44, 'Educación Física II', 1020207, '', 11, 'tarde'),
(45, 'Inglés II', 1020208, '', 11, 'tarde'),
(46, 'Formación Ética y Ciudadana II', 1020209, '', 11, 'tarde'),
(47, 'Tecnología de la Información II', 1020210, '', 11, 'tarde'),
(48, 'Espacios Curriculares II', 1020211, '', 11, 'tarde'),
(49, 'Matemática III', 1030100, '', 12, 'mañana'),
(50, 'Lengua y Literatura III', 1030101, '', 12, 'mañana'),
(51, 'Física y Química III', 1030102, '', 12, 'mañana'),
(52, 'Historia III', 1030103, '', 12, 'mañana'),
(53, 'Geografía III', 1030104, '', 12, 'mañana'),
(54, 'Biología III', 1030105, '', 12, 'mañana'),
(55, 'Educación Artística III', 1030106, '', 12, 'mañana'),
(56, 'Educación Física III', 1030107, '', 12, 'tarde'),
(57, 'Inglés III', 1030108, '', 12, 'tarde'),
(58, 'Formación Ética y Ciudadana III', 1030109, '', 12, 'tarde'),
(59, 'Tecnología de la Información III', 1030110, '', 12, 'tarde'),
(60, 'Espacios Curriculares III', 1030111, '', 12, 'tarde'),
(61, 'Matemática III', 1030200, '', 13, 'mañana'),
(62, 'Lengua y Literatura III', 1030201, '', 13, 'mañana'),
(63, 'Física y Química III', 1030202, '', 13, 'mañana'),
(64, 'Historia III', 1030203, '', 13, 'mañana'),
(65, 'Geografía III', 1030204, '', 13, 'mañana'),
(66, 'Biología III', 1030205, '', 13, 'mañana'),
(67, 'Educación Artística III', 1030206, '', 13, 'mañana'),
(68, 'Educación Física III', 1030207, '', 13, 'tarde'),
(69, 'Inglés III', 1030208, '', 13, 'tarde'),
(70, 'Formación Ética y Ciudadana III', 1030209, '', 13, 'tarde'),
(71, 'Tecnología de la Información III', 1030210, '', 13, 'tarde'),
(72, 'Espacios Curriculares III', 1030211, '', 13, 'tarde'),
(73, 'Matemática III', 1030300, '', 14, 'mañana'),
(74, 'Lengua y Literatura III', 1030301, '', 14, 'mañana'),
(75, 'Física y Química III', 1030302, '', 14, 'mañana'),
(76, 'Historia III', 1030303, '', 14, 'mañana'),
(77, 'Geografía III', 1030304, '', 14, 'mañana'),
(78, 'Biología III', 1030305, '', 14, 'mañana'),
(79, 'Educación Artística III', 1030306, '', 14, 'mañana'),
(80, 'Educación Física III', 1030307, '', 14, 'tarde'),
(81, 'Inglés III', 1030308, '', 14, 'tarde'),
(82, 'Formación Ética y Ciudadana III', 1030309, '', 14, 'tarde'),
(83, 'Tecnología de la Información III', 1030310, '', 14, 'tarde'),
(84, 'Espacios Curriculares III', 1030311, '', 14, 'tarde'),
(85, 'Lengua y Literatura IV', 1041501, '', 15, 'mañana'),
(86, 'Matemática IV', 1041502, '', 15, 'mañana'),
(87, 'Física IV', 1041503, '', 15, 'mañana'),
(88, 'Inglés IV', 1041504, '', 15, 'mañana'),
(89, 'Historia IV', 1041505, '', 15, 'mañana'),
(90, 'Geografía IV', 1041506, '', 15, 'mañana'),
(91, 'Biología IV', 1041507, '', 15, 'mañana'),
(92, 'Educación Física IV', 1041508, '', 15, 'tarde'),
(93, 'Formación Ética y Ciudadana IV', 1041509, '', 15, 'tarde'),
(94, 'Tecnología de la Información y Comunicación IV', 1041510, '', 15, 'tarde'),
(95, 'Introducción a la Programación', 1041511, '', 15, 'tarde'),
(96, 'Sistemas Operativos', 1041512, '', 15, 'tarde'),
(97, 'Hardware y Redes', 1041513, '', 15, 'tarde'),
(98, 'Taller de Programación I', 1041514, '', 15, 'tarde'),
(99, 'Espacio Curricular de Definición Institucional IV', 1041515, '', 15, 'tarde'),
(100, 'Lengua y Literatura IV', 1041601, '', 16, 'mañana'),
(101, 'Matemática IV', 1041602, '', 16, 'mañana'),
(102, 'Física IV', 1041603, '', 16, 'mañana'),
(103, 'Inglés IV', 1041604, '', 16, 'mañana'),
(104, 'Historia IV', 1041605, '', 16, 'mañana'),
(105, 'Geografía IV', 1041606, '', 16, 'mañana'),
(106, 'Biología IV', 1041607, '', 16, 'mañana'),
(107, 'Educación Física IV', 1041608, '', 16, 'tarde'),
(108, 'Formación Ética y Ciudadana IV', 1041609, '', 16, 'tarde'),
(109, 'Tecnología de la Información y Comunicación IV', 1041610, '', 16, 'tarde'),
(110, 'Dibujo Técnico IV', 1041611, '', 16, 'tarde'),
(111, 'Tecnología de los Materiales IV', 1041612, '', 16, 'tarde'),
(112, 'Sistemas Estructurales IV', 1041613, '', 16, 'tarde'),
(113, 'Taller de Construcciones I', 1041614, '', 16, 'tarde'),
(114, 'Espacio Curricular de Definición Institucional IV', 1041615, '', 16, 'tarde'),
(115, 'Lengua y Literatura V', 1051501, '', 17, 'mañana'),
(116, 'Matemática V', 1051502, '', 17, 'mañana'),
(117, 'Química V', 1051503, '', 17, 'mañana'),
(118, 'Inglés V', 1051504, '', 17, 'mañana'),
(119, 'Historia V', 1051505, '', 17, 'mañana'),
(120, 'Geografía V', 1051506, '', 17, 'mañana'),
(121, 'Biología V', 1051507, '', 17, 'mañana'),
(122, 'Educación Física V', 1051508, '', 17, 'tarde'),
(123, 'Formación Ética y Ciudadana V', 1051509, '', 17, 'tarde'),
(124, 'Bases de Datos', 1051510, '', 17, 'tarde'),
(125, 'Programación Avanzada', 1051511, '', 17, 'tarde'),
(126, 'Diseño Web', 1051512, '', 17, 'tarde'),
(127, 'Análisis y Diseño de Sistemas', 1051513, '', 17, 'tarde'),
(128, 'Taller de Programación II', 1051514, '', 17, 'tarde'),
(129, 'Espacio Curricular de Definición Institucional V', 1051515, '', 17, 'tarde'),
(130, 'Lengua y Literatura V', 1051601, '', 18, 'mañana'),
(131, 'Matemática V', 1051602, '', 18, 'mañana'),
(132, 'Química V', 1051603, '', 18, 'mañana'),
(133, 'Inglés V', 1051604, '', 18, 'mañana'),
(134, 'Historia V', 1051605, '', 18, 'mañana'),
(135, 'Geografía V', 1051606, '', 18, 'mañana'),
(136, 'Biología V', 1051607, '', 18, 'mañana'),
(137, 'Educación Física V', 1051608, '', 18, 'tarde'),
(138, 'Formación Ética y Ciudadana V', 1051609, '', 18, 'tarde'),
(139, 'Dibujo Técnico V', 1051610, '', 18, 'tarde'),
(140, 'Instalaciones V', 1051611, '', 18, 'tarde'),
(141, 'Sistemas Estructurales V', 1051612, '', 18, 'tarde'),
(142, 'Topografía', 1051613, '', 18, 'tarde'),
(143, 'Taller de Construcciones II', 1051614, '', 18, 'tarde'),
(144, 'Espacio Curricular de Definición Institucional V', 1051615, '', 18, 'tarde'),
(145, 'Lengua y Literatura VI', 1061501, '', 19, 'mañana'),
(146, 'Matemática VI', 1061502, '', 19, 'mañana'),
(147, 'Física Aplicada VI', 1061503, '', 19, 'mañana'),
(148, 'Inglés VI', 1061504, '', 19, 'mañana'),
(149, 'Historia VI', 1061505, '', 19, 'mañana'),
(150, 'Geografía VI', 1061506, '', 19, 'mañana'),
(151, 'Educación Física VI', 1061507, '', 19, 'tarde'),
(152, 'Formación Ética y Ciudadana VI', 1061508, '', 19, 'tarde'),
(153, 'Sistemas de Gestión Empresarial', 1061509, '', 19, 'tarde'),
(154, 'Seguridad Informática', 1061510, '', 19, 'tarde'),
(155, 'Programación Móvil', 1061511, '', 19, 'tarde'),
(156, 'Desarrollo de Software', 1061512, '', 19, 'tarde'),
(157, 'Taller de Programación III', 1061513, '', 19, 'tarde'),
(158, 'Práctica Profesionalizante I', 1061514, '', 19, 'tarde'),
(159, 'Espacio Curricular de Definición Institucional VI', 1061515, '', 19, 'tarde'),
(160, 'Lengua y Literatura VI', 1061601, '', 20, 'mañana'),
(161, 'Matemática VI', 1061602, '', 20, 'mañana'),
(162, 'Química Aplicada VI', 1061603, '', 20, 'mañana'),
(163, 'Inglés VI', 1061604, '', 20, 'mañana'),
(164, 'Historia VI', 1061605, '', 20, 'mañana'),
(165, 'Geografía VI', 1061606, '', 20, 'mañana'),
(166, 'Educación Física VI', 1061607, '', 20, 'tarde'),
(167, 'Formación Ética y Ciudadana VI', 1061608, '', 20, 'tarde'),
(168, 'Dibujo Técnico VI', 1061609, '', 20, 'tarde'),
(169, 'Instalaciones VI', 1061610, '', 20, 'tarde'),
(170, 'Cómputo y Presupuesto', 1061611, '', 20, 'tarde'),
(171, 'Legislación de Obra', 1061612, '', 20, 'tarde'),
(172, 'Taller de Construcciones III', 1061613, '', 20, 'tarde'),
(173, 'Práctica Profesionalizante I', 1061614, '', 20, 'tarde'),
(174, 'Espacio Curricular de Definición Institucional VI', 1061615, '', 20, 'tarde'),
(175, 'Lengua y Literatura VII', 1071501, '', 21, 'mañana'),
(176, 'Matemática VII', 1071502, '', 21, 'mañana'),
(177, 'Física Aplicada VII', 1071503, '', 21, 'mañana'),
(178, 'Inglés VII', 1071504, '', 21, 'mañana'),
(179, 'Historia VII', 1071505, '', 21, 'mañana'),
(180, 'Geografía VII', 1071506, '', 21, 'mañana'),
(181, 'Educación Física VII', 1071507, '', 21, 'tarde'),
(182, 'Formación Ética y Ciudadana VII', 1071508, '', 21, 'tarde'),
(183, 'Inteligencia Artificial', 1071509, '', 21, 'tarde'),
(184, 'Cloud Computing', 1071510, '', 21, 'tarde'),
(185, 'Programación de Videojuegos', 1071511, '', 21, 'tarde'),
(186, 'Emprendedorismo y Gestión', 1071512, '', 21, 'tarde'),
(187, 'Taller de Programación IV', 1071513, '', 21, 'tarde'),
(188, 'Práctica Profesionalizante II', 1071514, '', 21, 'tarde'),
(189, 'Espacio Curricular de Definición Institucional VII', 1071515, '', 21, 'tarde'),
(190, 'Lengua y Literatura VII', 1071601, '', 22, 'mañana'),
(191, 'Matemática VII', 1071602, '', 22, 'mañana'),
(192, 'Química Aplicada VII', 1071603, '', 22, 'mañana'),
(193, 'Inglés VII', 1071604, '', 22, 'mañana'),
(194, 'Historia VII', 1071605, '', 22, 'mañana'),
(195, 'Geografía VII', 1071606, '', 22, 'mañana'),
(196, 'Educación Física VII', 1071607, '', 22, 'tarde'),
(197, 'Formación Ética y Ciudadana VII', 1071608, '', 22, 'tarde'),
(198, 'Dibujo Técnico VII', 1071609, '', 22, 'tarde'),
(199, 'Instalaciones VII', 1071610, '', 22, 'tarde'),
(200, 'Planificación y Dirección de Obra', 1071611, '', 22, 'tarde'),
(201, 'Seguridad e Higiene en Obra', 1071612, '', 22, 'tarde'),
(202, 'Taller de Construcciones IV', 1071613, '', 22, 'tarde'),
(203, 'Práctica Profesionalizante II', 1071614, '', 22, 'tarde'),
(204, 'Espacio Curricular de Definición Institucional VII', 1071615, '', 22, 'tarde');

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
(137, NULL, 'CLERIA', 'OLIVARES'),
(138, NULL, 'CRISTINA', 'GUTIÉRREZ'),
(139, NULL, 'ANTONELLA BELEN', 'JARA'),
(140, NULL, 'FABIO', 'FIORAVANTI'),
(141, NULL, 'CARLOS', 'MANGIALINO'),
(142, NULL, 'LORENA', 'NEUMANN'),
(143, NULL, 'JAIME', 'DEVICENZI'),
(144, NULL, 'IVONNE', 'CONEJEROS'),
(145, NULL, 'CARLOS', 'MISISATTI'),
(146, NULL, 'PATRICIA', 'LAFQUEN'),
(147, NULL, 'MAILÉN', 'CAMPOS'),
(148, NULL, 'VIRGINIA', 'GAGGIOLI'),
(149, NULL, 'DANIELA', 'IGUACEL'),
(150, NULL, 'ISABEL', 'ANTINORI');

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789;

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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

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
