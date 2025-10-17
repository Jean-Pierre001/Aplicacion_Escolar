-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2025 a las 03:55:14
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
(17, 'Laboratorio 4', ''),
(18, 'taller 11', '');

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
(21, '7Mo TP', '', ''),
(22, '7Mo MMO', '', '');

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
(1, 7, 34, 49, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(2, 7, 58, 46, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(3, 7, 105, 39, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(4, 7, 58, 46, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(5, 7, 93, 137, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(6, 7, 83, 32, NULL, 'wednesday', '09:30:00', '10:30:00', NULL, NULL),
(7, 7, 93, 137, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(8, 7, 83, 32, NULL, 'thursday', '09:30:00', '10:30:00', NULL, NULL),
(9, 7, 105, 39, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(10, 7, 15, 16, NULL, 'friday', '09:30:00', '10:30:00', NULL, NULL),
(11, 7, 138, 92, NULL, 'monday', '13:00:00', '15:00:00', 8, 4),
(12, 7, 171, 65, NULL, 'monday', '15:00:00', '17:00:00', 8, 4),
(13, 7, 118, 21, NULL, 'tuesday', '14:00:00', '16:00:00', 8, 4),
(14, 7, 163, 97, NULL, 'wednesday', '13:00:00', '15:00:00', 8, 4),
(15, 7, 138, 24, NULL, 'wednesday', '15:00:00', '17:00:00', 8, 4),
(16, 7, 179, 73, NULL, 'thursday', '13:00:00', '14:00:00', 8, 4),
(17, 7, 171, 65, NULL, 'friday', '13:00:00', '15:00:00', 8, 4),
(18, 7, 163, 74, NULL, 'friday', '15:00:00', '17:00:00', 8, 4),
(19, 7, 171, 65, NULL, 'monday', '13:00:00', '15:00:00', 9, 4),
(20, 7, 118, 21, NULL, 'tuesday', '14:00:00', '16:00:00', 9, 4),
(21, 7, 138, 119, NULL, 'wednesday', '13:00:00', '15:00:00', 9, 4),
(22, 7, 179, 73, NULL, 'thursday', '13:00:00', '14:00:00', 9, 4),
(23, 7, 163, 74, NULL, 'friday', '13:00:00', '15:00:00', 9, 4),
(24, 8, 106, 39, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(25, 8, 59, 46, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(26, 8, 94, 14, NULL, 'monday', '09:30:00', '10:30:00', NULL, NULL),
(27, 8, 59, 46, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(28, 8, 16, 16, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(29, 8, 84, 5, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(30, 8, 106, 39, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(31, 8, 94, 14, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(32, 8, 106, 39, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(33, 8, 84, 98, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(34, 8, 94, 14, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(35, 8, 172, 78, NULL, 'monday', '13:00:00', '15:00:00', 10, 4),
(36, 8, 139, 120, NULL, 'tuesday', '13:00:00', '15:00:00', 10, 4),
(37, 8, 164, 91, NULL, 'wednesday', '13:00:00', '15:00:00', 10, 4),
(38, 8, 119, 64, NULL, 'wednesday', '15:00:00', '17:00:00', 10, 4),
(39, 8, 180, 120, NULL, 'thursday', '13:00:00', '14:00:00', 10, 4),
(40, 8, 164, 5, NULL, 'friday', '13:00:00', '15:00:00', 10, 4),
(41, 8, 139, 92, NULL, 'monday', '13:00:00', '15:00:00', 11, 4),
(42, 8, 164, 86, NULL, 'monday', '15:00:00', '17:00:00', 11, 4),
(43, 8, 119, 21, NULL, 'tuesday', '13:00:00', '15:00:00', 11, 4),
(44, 8, 139, 64, NULL, 'tuesday', '15:00:00', '17:00:00', 11, 4),
(45, 8, 172, 78, NULL, 'thursday', '13:00:00', '15:00:00', 11, 4),
(46, 8, 180, 78, NULL, 'thursday', '15:00:00', '16:00:00', 11, 4),
(47, 9, 17, 127, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(48, 9, 60, 30, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(49, 9, 107, 45, NULL, 'monday', '09:30:00', '10:30:00', NULL, NULL),
(50, 9, 107, 45, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(51, 9, 60, 30, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(52, 9, 95, 29, NULL, 'tuesday', '09:30:00', '10:30:00', NULL, NULL),
(53, 9, 85, 23, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(54, 9, 95, 29, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(55, 9, 85, 23, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(56, 9, 60, 30, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(57, 9, 36, 38, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(58, 9, 95, 29, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(59, 9, 173, 65, NULL, 'monday', '13:00:00', '15:00:00', 12, 4),
(60, 9, 120, 32, NULL, 'tuesday', '13:00:00', '15:00:00', 12, 4),
(61, 9, 140, 32, NULL, 'wednesday', '13:00:00', '15:00:00', 12, 4),
(62, 9, 165, 86, NULL, 'thursday', '13:00:00', '15:00:00', 12, 4),
(63, 9, 181, 86, NULL, 'thursday', '15:00:00', '16:00:00', 12, 4),
(64, 9, 140, 120, NULL, 'friday', '13:00:00', '17:00:00', 12, 4),
(65, 9, 120, 32, NULL, 'tuesday', '13:00:00', '15:00:00', 13, 4),
(66, 9, 181, 32, NULL, 'tuesday', '15:00:00', '17:00:00', 13, 4),
(67, 9, 173, 65, NULL, 'thursday', '13:00:00', '15:00:00', 13, 4),
(68, 9, 181, 65, NULL, 'thursday', '15:00:00', '16:00:00', 13, 4),
(69, 9, 165, 75, NULL, 'friday', '13:00:00', '17:00:00', 13, 4),
(70, 10, 108, 136, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(71, 10, 96, 29, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(72, 10, 53, 123, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(73, 10, 18, 127, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(74, 10, 74, 134, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(75, 10, 108, 136, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(76, 10, 66, 13, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(77, 10, 96, 29, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(78, 10, 37, 4, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(79, 10, 48, 30, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(80, 10, 121, 135, NULL, 'monday', '13:00:00', '15:00:00', 14, 4),
(81, 10, 166, 91, NULL, 'wednesday', '15:00:00', '17:00:00', 14, 4),
(82, 10, 174, 120, NULL, 'thursday', '15:00:00', '17:00:00', 14, 4),
(83, 10, 121, 135, NULL, 'monday', '13:00:00', '15:00:00', 35, 4),
(84, 10, 141, 74, NULL, 'tuesday', '13:00:00', '15:00:00', 35, 4),
(85, 10, 174, 65, NULL, 'wednesday', '13:00:00', '15:00:00', 35, 4),
(86, 10, 141, 74, NULL, 'thursday', '15:00:00', '17:00:00', 35, 4),
(87, 10, 166, 48, NULL, 'friday', '15:00:00', '17:00:00', 35, 4),
(88, 11, 109, 56, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(89, 11, 54, 123, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(90, 11, 75, 99, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(91, 11, 49, 28, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(92, 11, 67, 22, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(93, 11, 38, 38, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(94, 11, 109, 56, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(95, 11, 19, 93, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(96, 11, 167, 65, NULL, 'monday', '13:00:00', '15:00:00', 15, 4),
(97, 11, 142, 61, NULL, 'tuesday', '15:00:00', '17:00:00', 15, 4),
(98, 11, 175, 65, NULL, 'wednesday', '15:00:00', '17:00:00', 15, 4),
(99, 11, 142, 61, NULL, 'thursday', '15:00:00', '17:00:00', 15, 4),
(100, 11, 175, 65, NULL, 'friday', '13:00:00', '15:00:00', 15, 4),
(101, 11, 142, 118, NULL, 'monday', '13:00:00', '15:00:00', 34, 4),
(102, 11, 175, 65, NULL, 'tuesday', '15:00:00', '17:00:00', 34, 4),
(103, 11, 175, 65, NULL, 'wednesday', '13:00:00', '15:00:00', 34, 4),
(104, 11, 167, 61, NULL, 'thursday', '15:00:00', '17:00:00', 34, 4),
(105, 11, 167, 61, NULL, 'friday', '15:00:00', '17:00:00', 34, 4),
(106, 11, 122, 64, NULL, 'monday', '15:00:00', '17:00:00', NULL, NULL),
(107, 12, 20, 1, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(108, 12, 76, 89, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(109, 12, 31, 25, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(110, 12, 55, 26, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(111, 12, 98, 101, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(112, 12, 50, 28, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(113, 12, 98, 101, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(114, 12, 110, 113, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(115, 12, 68, 22, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(116, 12, 110, 113, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(117, 12, 168, 7, NULL, 'monday', '13:00:00', '15:00:00', 16, 4),
(118, 12, 143, 11, NULL, 'tuesday', '13:00:00', '15:00:00', 16, 4),
(119, 12, 123, 38, NULL, 'wednesday', '13:00:00', '15:00:00', 16, 4),
(120, 12, 176, 74, NULL, 'thursday', '13:00:00', '15:00:00', 16, 4),
(121, 12, 143, 82, NULL, 'monday', '15:00:00', '17:00:00', 33, 4),
(122, 12, 176, 82, NULL, 'tuesday', '15:00:00', '17:00:00', 33, 4),
(123, 12, 176, 82, NULL, 'thursday', '15:00:00', '17:00:00', 33, 4),
(124, 12, 176, 74, NULL, 'monday', '15:00:00', '17:00:00', NULL, NULL),
(125, 12, 168, 91, NULL, 'tuesday', '13:00:00', '15:00:00', NULL, NULL),
(126, 12, 123, 38, NULL, 'tuesday', '15:00:00', '17:00:00', NULL, NULL),
(127, 13, 99, 29, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(128, 13, 111, 33, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(129, 13, 56, 57, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(130, 13, 51, 43, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(131, 13, 99, 29, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(132, 13, 111, 33, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(133, 13, 77, 102, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(134, 13, 69, 13, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(135, 13, 32, 17, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(136, 13, 21, 127, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(137, 13, 185, 37, NULL, 'monday', '13:00:00', '14:00:00', 17, NULL),
(138, 13, 124, 37, NULL, 'monday', '15:00:00', '17:00:00', 17, NULL),
(139, 13, 169, 86, NULL, 'tuesday', '13:00:00', '15:00:00', 17, 4),
(140, 13, 169, 65, NULL, 'tuesday', '15:00:00', '17:00:00', 32, 4),
(141, 13, 177, 92, NULL, 'wednesday', '15:00:00', '17:00:00', 32, 4),
(142, 13, 177, 92, NULL, 'friday', '13:00:00', '15:00:00', 32, 4),
(143, 13, 124, 37, NULL, 'monday', '15:00:00', '17:00:00', NULL, NULL),
(144, 13, 144, 108, NULL, 'wednesday', '13:00:00', '15:00:00', NULL, 4),
(145, 13, 185, 15, NULL, 'monday', '12:00:00', '13:00:00', NULL, NULL),
(146, 13, 185, 15, NULL, 'thursday', '13:00:00', '15:00:00', NULL, NULL),
(147, 14, 78, 134, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(148, 14, 100, 108, NULL, 'monday', '08:30:00', '09:30:00', NULL, NULL),
(149, 14, 22, 110, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(150, 14, 33, 17, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(151, 14, 70, 84, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(152, 14, 112, 45, NULL, 'wednesday', '08:30:00', '09:30:00', NULL, NULL),
(153, 14, 57, 123, NULL, 'thursday', '08:30:00', '09:30:00', NULL, NULL),
(154, 14, 100, 108, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(155, 14, 112, 45, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(156, 14, 125, 24, NULL, 'monday', '13:00:00', '15:00:00', 30, 4),
(157, 14, 178, 103, NULL, 'wednesday', '13:00:00', '15:00:00', 30, 4),
(158, 14, 178, 103, NULL, 'friday', '13:00:00', '15:00:00', 30, 4),
(159, 14, 125, 24, NULL, 'monday', '15:00:00', '17:00:00', 31, 4),
(160, 14, 170, 86, NULL, 'wednesday', '15:00:00', '17:00:00', NULL, 4),
(161, 14, 170, 91, NULL, 'tuesday', '13:00:00', '15:00:00', NULL, 4),
(162, 14, 178, 76, NULL, 'tuesday', '15:00:00', '17:00:00', NULL, 4),
(163, 14, 178, 76, NULL, 'friday', '13:00:00', '15:00:00', NULL, 4),
(164, 15, 43, 9, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(165, 15, 80, 83, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(166, 15, 65, 13, NULL, 'tuesday', '08:30:00', '09:30:00', NULL, NULL),
(167, 15, 188, 83, NULL, 'tuesday', '10:40:00', '12:40:00', NULL, NULL),
(168, 15, 88, 137, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(169, 15, 24, 127, NULL, 'friday', '07:30:00', '08:30:00', NULL, NULL),
(170, 15, 47, 79, NULL, 'friday', '08:30:00', '09:30:00', NULL, NULL),
(171, 15, 152, 81, NULL, 'monday', '13:20:00', '15:20:00', 28, 14),
(172, 15, 150, 115, NULL, 'monday', '15:30:00', '17:30:00', 28, 14),
(173, 15, 146, 114, NULL, 'tuesday', '13:20:00', '15:20:00', 28, 14),
(174, 15, 152, 58, NULL, 'tuesday', '15:30:00', '17:30:00', 28, 14),
(175, 15, 153, 69, NULL, 'wednesday', '13:20:00', '15:20:00', 28, 14),
(176, 15, 146, 114, NULL, 'thursday', '13:20:00', '15:20:00', 28, 14),
(177, 15, 150, 115, NULL, 'thursday', '15:30:00', '17:30:00', 28, 14),
(178, 15, 150, 115, NULL, 'monday', '15:30:00', '17:30:00', 29, 14),
(179, 15, 152, 81, NULL, 'tuesday', '13:20:00', '15:20:00', 29, 14),
(180, 15, 146, 115, NULL, 'tuesday', '15:30:00', '17:30:00', 29, 14),
(181, 15, 153, 33, NULL, 'wednesday', '15:30:00', '17:30:00', 29, 14),
(182, 15, 153, 51, NULL, 'thursday', '13:20:00', '15:20:00', 29, 14),
(183, 15, 150, 115, NULL, 'thursday', '15:30:00', '17:30:00', 29, 14),
(184, 15, 188, 8, NULL, 'wednesday', '15:00:00', '16:30:00', NULL, NULL),
(185, 15, 188, 8, NULL, 'friday', '13:00:00', '14:00:00', NULL, NULL),
(186, 16, 87, 137, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(187, 16, 113, 33, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(188, 16, 42, 9, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(189, 16, 23, 7, NULL, 'wednesday', '07:30:00', '09:30:00', NULL, NULL),
(190, 16, 71, 13, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(191, 16, 46, 82, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(192, 16, 44, 83, NULL, 'thursday', '09:40:00', '11:40:00', NULL, NULL),
(193, 16, 113, 33, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(194, 16, 41, 73, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(195, 16, 137, 91, NULL, 'monday', '13:20:00', '15:20:00', 26, 4),
(196, 16, 126, 56, NULL, 'monday', '15:30:00', '17:30:00', 26, 4),
(197, 16, 160, 1, NULL, 'tuesday', '13:20:00', '15:20:00', 26, 4),
(198, 16, 135, 74, NULL, 'tuesday', '15:30:00', '17:30:00', 26, 4),
(199, 16, 160, 1, NULL, 'wednesday', '13:20:00', '15:20:00', 26, 4),
(200, 16, 135, 74, NULL, 'wednesday', '15:30:00', '17:30:00', 26, 4),
(201, 16, 127, 113, NULL, 'friday', '13:20:00', '15:20:00', 26, 4),
(202, 16, 126, 56, NULL, 'friday', '15:30:00', '17:30:00', 26, 4),
(203, 16, 137, 74, NULL, 'monday', '15:30:00', '17:30:00', 27, 4),
(204, 16, 126, 85, NULL, 'wednesday', '13:20:00', '15:20:00', 27, 4),
(205, 16, 160, 1, NULL, 'wednesday', '15:30:00', '17:30:00', 27, 4),
(206, 16, 137, 74, NULL, 'thursday', '13:20:00', '15:20:00', 27, 4),
(207, 16, 126, 74, NULL, 'thursday', '15:30:00', '17:30:00', 27, 4),
(208, 16, 127, 70, NULL, 'friday', '15:30:00', '17:30:00', 27, 4),
(209, 17, 116, 55, NULL, 'monday', '09:40:00', '11:40:00', NULL, NULL),
(210, 17, 116, 55, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(211, 17, 73, 22, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, NULL),
(212, 17, 82, 89, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(213, 17, 148, 53, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(214, 17, 26, 1, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(215, 17, 159, 94, NULL, 'monday', '13:20:00', '15:20:00', 18, 14),
(216, 17, 151, 116, NULL, 'monday', '15:30:00', '17:30:00', 18, 14),
(217, 17, 155, 51, NULL, 'wednesday', '13:20:00', '15:20:00', 18, 14),
(218, 17, 130, 116, NULL, 'wednesday', '15:30:00', '17:30:00', 18, 14),
(219, 17, 151, 116, NULL, 'thursday', '15:30:00', '17:30:00', 18, 14),
(220, 17, 155, 51, NULL, 'friday', '13:20:00', '15:20:00', 18, 14),
(221, 17, 147, 53, NULL, 'friday', '15:30:00', '17:30:00', 18, 14),
(222, 17, 155, 114, NULL, 'monday', '15:30:00', '17:30:00', 25, 14),
(223, 17, 130, 48, NULL, 'wednesday', '13:20:00', '15:20:00', 25, 14),
(224, 17, 151, 114, NULL, 'wednesday', '15:30:00', '17:30:00', 25, 14),
(225, 17, 147, 114, NULL, 'friday', '13:20:00', '15:20:00', 25, 14),
(226, 17, 147, 114, NULL, 'friday', '15:30:00', '17:30:00', 25, 14),
(227, 17, 190, 94, NULL, 'tuesday', '13:20:00', '14:20:00', NULL, NULL),
(228, 17, 190, 94, NULL, 'thursday', '13:20:00', '14:20:00', NULL, NULL),
(229, 18, 72, 13, NULL, 'monday', '07:30:00', '08:30:00', NULL, NULL),
(230, 18, 40, 91, NULL, 'monday', '09:50:00', '11:50:00', NULL, NULL),
(231, 18, 86, 104, NULL, 'tuesday', '07:30:00', '08:30:00', NULL, NULL),
(232, 18, 25, 7, NULL, 'tuesday', '08:40:00', '09:40:00', NULL, NULL),
(233, 18, 89, 36, NULL, 'wednesday', '07:30:00', '08:30:00', NULL, NULL),
(234, 18, 115, 45, NULL, 'wednesday', '08:40:00', '09:40:00', NULL, NULL),
(235, 18, 40, 91, NULL, 'wednesday', '09:50:00', '11:50:00', NULL, NULL),
(236, 18, 81, 111, NULL, 'thursday', '07:30:00', '08:30:00', NULL, NULL),
(237, 18, 115, 45, NULL, 'thursday', '08:40:00', '09:40:00', NULL, NULL),
(238, 18, 115, 45, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(239, 18, 81, 111, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(240, 18, 161, 117, NULL, 'monday', '13:20:00', '15:20:00', 19, 4),
(241, 18, 136, 73, NULL, 'monday', '15:30:00', '17:30:00', 19, 4),
(242, 18, 136, 73, NULL, 'tuesday', '13:20:00', '17:30:00', 19, 4),
(243, 18, 136, 73, NULL, 'thursday', '13:20:00', '15:20:00', 19, 4),
(244, 18, 136, 73, NULL, 'monday', '13:20:00', '15:20:00', 24, 4),
(245, 18, 128, 61, NULL, 'monday', '15:30:00', '17:30:00', 24, 4),
(246, 18, 161, 71, NULL, 'wednesday', '13:20:00', '17:30:00', 24, 4),
(247, 18, 115, 61, NULL, 'thursday', '13:20:00', '17:30:00', 24, 4),
(248, 18, 136, 92, NULL, 'friday', '13:20:00', '17:30:00', 24, 4),
(249, 18, 189, 48, NULL, 'wednesday', '13:20:00', '14:20:00', NULL, NULL),
(250, 18, 189, 48, NULL, 'friday', '13:20:00', '14:20:00', NULL, NULL),
(251, 19, 102, 77, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(252, 19, 92, 137, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, NULL),
(253, 19, 30, 24, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(254, 19, 63, 19, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(255, 19, 28, 7, NULL, 'friday', '09:40:00', '11:40:00', NULL, NULL),
(256, 19, 149, 48, NULL, 'tuesday', '15:30:00', '17:30:00', 20, 14),
(257, 19, 149, 48, NULL, 'thursday', '13:20:00', '15:20:00', 20, 14),
(258, 19, 149, 48, NULL, 'thursday', '15:30:00', '17:30:00', 20, 14),
(259, 19, 117, 114, NULL, 'friday', '13:20:00', '15:20:00', 20, 14),
(260, 19, 149, 48, NULL, 'friday', '15:30:00', '17:30:00', 20, 14),
(261, 19, 117, 47, NULL, 'tuesday', '15:30:00', '17:30:00', 23, 14),
(262, 19, 149, 69, NULL, 'wednesday', '15:30:00', '17:30:00', 23, 14),
(263, 19, 149, 69, NULL, 'thursday', '13:20:00', '17:30:00', 23, 14),
(264, 19, 149, 69, NULL, 'friday', '13:20:00', '17:30:00', 23, 14),
(265, 20, 39, 117, NULL, 'monday', '07:30:00', '09:30:00', NULL, NULL),
(266, 20, 91, 137, NULL, 'monday', '09:40:00', '11:00:00', NULL, NULL),
(267, 20, 62, 19, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, NULL),
(268, 20, 101, 92, NULL, 'tuesday', '09:40:00', '11:00:00', NULL, NULL),
(269, 20, 162, 117, NULL, 'wednesday', '09:40:00', '11:00:00', NULL, NULL),
(270, 20, 29, 25, NULL, 'thursday', '07:30:00', '09:30:00', NULL, NULL),
(271, 20, 162, 117, NULL, 'thursday', '09:40:00', '11:00:00', NULL, NULL),
(272, 20, 27, 7, NULL, 'friday', '07:30:00', '09:30:00', NULL, NULL),
(273, 20, 39, 117, NULL, 'friday', '09:40:00', '11:00:00', NULL, NULL),
(274, 20, 158, 117, NULL, 'monday', '13:20:00', '15:20:00', 21, NULL),
(275, 20, 162, 113, NULL, 'monday', '15:30:00', '17:30:00', 21, NULL),
(276, 20, 131, 117, NULL, 'tuesday', '15:30:00', '17:30:00', 21, NULL),
(277, 20, 131, 61, NULL, 'wednesday', '15:30:00', '17:30:00', 21, NULL),
(278, 20, 131, 61, NULL, 'thursday', '13:20:00', '15:20:00', 21, NULL),
(279, 20, 131, 61, NULL, 'friday', '13:20:00', '15:20:00', 21, NULL),
(280, 20, 132, 61, NULL, 'friday', '15:30:00', '17:30:00', 21, NULL),
(281, 20, 132, 117, NULL, 'monday', '13:20:00', '17:30:00', 22, NULL),
(282, 20, 132, 117, NULL, 'tuesday', '13:20:00', '15:20:00', 22, NULL),
(283, 20, 131, 117, NULL, 'tuesday', '15:30:00', '17:30:00', 22, NULL),
(284, 20, 131, 117, NULL, 'wednesday', '13:20:00', '15:20:00', 22, NULL),
(285, 20, 162, 113, NULL, 'wednesday', '15:30:00', '17:30:00', 22, NULL),
(286, 20, 131, 117, NULL, 'thursday', '13:20:00', '15:20:00', 22, NULL),
(287, 20, 129, 113, NULL, 'thursday', '15:30:00', '17:30:00', 22, NULL),
(288, 20, 129, 113, NULL, 'friday', '15:30:00', '17:30:00', 22, NULL);

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
  `description` text DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `turno` enum('mañana','tarde') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`subject_id`, `name`, `description`, `course_id`, `turno`) VALUES
(15, 'Ingles', '', 7, 'mañana'),
(16, 'Ingles', '', 8, 'mañana'),
(17, 'Ingles', '', 9, 'mañana'),
(18, 'Ingles', '', 10, 'mañana'),
(19, 'Ingles', '', 11, 'mañana'),
(20, 'Ingles', '', 12, 'mañana'),
(21, 'Ingles', '', 13, 'mañana'),
(22, 'Ingles', '', 14, 'mañana'),
(23, 'Ingles', '', 16, 'mañana'),
(24, 'Ingles', '', 15, 'mañana'),
(25, 'Ingles', '', 18, 'mañana'),
(26, 'Ingles', '', 17, 'mañana'),
(27, 'Ingles', '', 20, 'mañana'),
(28, 'Ingles', '', 19, 'mañana'),
(29, 'Arte', '', 20, 'mañana'),
(30, 'Arte', '', 19, 'mañana'),
(31, 'Plastica', '', 12, 'mañana'),
(32, 'Plastica', '', 13, 'mañana'),
(33, 'Plastica', '', 14, 'mañana'),
(34, 'Musica', '', 7, 'mañana'),
(35, 'Musica', '', 8, 'mañana'),
(36, 'Musica', '', 9, 'mañana'),
(37, 'Musica', '', 10, 'mañana'),
(38, 'Musica', '', 11, 'mañana'),
(39, 'Instalaciones Sanit. y de Gas', '', 20, 'mañana'),
(40, 'Resistencia y Ensayos de Materiales', '', 18, 'mañana'),
(41, 'Cto. de los Materiales', '', 16, 'mañana'),
(42, 'Salud y Adolescencia', '', 16, 'mañana'),
(43, 'Salud y Adolescencia', '', 15, 'mañana'),
(44, 'Fisica', '', 16, 'mañana'),
(45, 'Fisica', '', 15, 'mañana'),
(46, 'Quimica', '', 16, 'mañana'),
(47, 'Quimica', '', 15, 'mañana'),
(48, 'Biologia', '', 10, 'mañana'),
(49, 'Biologia', '', 11, 'mañana'),
(50, 'Biologia', '', 12, 'mañana'),
(51, 'Biologia', '', 13, 'mañana'),
(52, 'Biologia', '', 14, 'mañana'),
(53, 'Fisico Quimica', '', 10, 'mañana'),
(54, 'Fisico Quimica', '', 11, 'mañana'),
(55, 'Fisico Quimica', '', 12, 'mañana'),
(56, 'Fisico Quimica', '', 13, 'mañana'),
(57, 'Fisico Quimica', '', 14, 'mañana'),
(58, 'Ciencias Naturales', '', 7, 'mañana'),
(59, 'Ciencias Naturales', '', 8, 'mañana'),
(60, 'Ciencias Naturales', '', 9, 'mañana'),
(61, 'Derechos', '', 20, 'mañana'),
(62, 'Filosofia', '', 20, 'mañana'),
(63, 'Filosofia', '', 19, 'mañana'),
(64, 'Politica y Ciudadania', '', 17, 'mañana'),
(65, 'Geografia Sociales', '', 15, 'mañana'),
(66, 'Geografia', '', 10, 'mañana'),
(67, 'Geografia', '', 11, 'mañana'),
(68, 'Geografia', '', 12, 'mañana'),
(69, 'Geografia', '', 13, 'mañana'),
(70, 'Geografia', '', 14, 'mañana'),
(71, 'Geografia', '', 16, 'mañana'),
(72, 'Geografia', '', 18, 'mañana'),
(73, 'Geografia', '', 17, 'mañana'),
(74, 'Historia', '', 10, 'mañana'),
(75, 'Historia', '', 11, 'mañana'),
(76, 'Historia', '', 12, 'mañana'),
(77, 'Historia', '', 13, 'mañana'),
(78, 'Historia', '', 14, 'mañana'),
(79, 'Historia', '', 16, 'mañana'),
(80, 'Historia', '', 15, 'mañana'),
(81, 'Historia', '', 18, 'mañana'),
(82, 'Historia', '', 17, 'mañana'),
(83, 'Ciencias Sociales', '', 7, 'mañana'),
(84, 'Ciencias Sociales', '', 8, 'mañana'),
(85, 'Ciencias Sociales', '', 9, 'mañana'),
(86, 'Politica y Literatura', '', 18, 'mañana'),
(87, 'Literatura', '', 16, 'mañana'),
(88, 'Literatura', '', 15, 'mañana'),
(89, 'Literatura', '', 18, 'mañana'),
(90, 'Literatura', '', 17, 'mañana'),
(91, 'Literatura', '', 20, 'mañana'),
(92, 'Literatura', '', 19, 'mañana'),
(93, 'Practica del Lenguaje', '', 7, 'mañana'),
(94, 'Practica del Lenguaje', '', 8, 'mañana'),
(95, 'Practica del Lenguaje', '', 9, 'mañana'),
(96, 'Practica del Lenguaje', '', 10, 'mañana'),
(97, 'Practica del Lenguaje', '', 11, 'mañana'),
(98, 'Practica del Lenguaje', '', 12, 'mañana'),
(99, 'Practica del Lenguaje', '', 13, 'mañana'),
(100, 'Practica del Lenguaje', '', 14, 'mañana'),
(101, 'Matematica Aplicada', '', 20, 'mañana'),
(102, 'Matematica Discreta', '', 19, 'mañana'),
(104, 'Analisis', '', 18, 'mañana'),
(105, 'Matematica', '', 7, 'mañana'),
(106, 'Matematica', '', 8, 'mañana'),
(107, 'Matematica', '', 9, 'mañana'),
(108, 'Matematica', '', 10, 'mañana'),
(109, 'Matematica', '', 11, 'mañana'),
(110, 'Matematica', '', 12, 'mañana'),
(111, 'Matematica', '', 13, 'mañana'),
(112, 'Matematica', '', 14, 'mañana'),
(113, 'Matematica', '', 16, 'mañana'),
(114, 'Matematica', '', 15, 'mañana'),
(115, 'Analisis Matematico', '', 18, 'mañana'),
(116, 'Analisis Matematico', '', 17, 'mañana'),
(117, 'Lab de Procesos Industriales', '', 19, 'tarde'),
(118, 'Construccion Ciudadana', '', 7, 'tarde'),
(119, 'Construccion Ciudadana', '', 8, 'tarde'),
(120, 'Construccion Ciudadana', '', 9, 'tarde'),
(121, 'Construccion Ciudadana', '', 10, 'tarde'),
(122, 'Construccion Ciudadana', '', 11, 'tarde'),
(123, 'Construccion Ciudadana', '', 12, 'tarde'),
(124, 'Construccion Ciudadana', '', 13, 'tarde'),
(125, 'Construccion Ciudadana', '', 14, 'tarde'),
(126, 'Int. Anteproyecto', '', 16, 'tarde'),
(127, 'Proyecto', '', 16, 'tarde'),
(128, 'Proyecto', '', 18, 'tarde'),
(129, 'Proyecto', '', 20, 'tarde'),
(130, 'Lab de Diseño Web', '', 17, 'tarde'),
(131, 'Proyecto de Ejecucion de Instalaciones', '', 20, 'tarde'),
(132, 'Instalaciones', '', 20, 'tarde'),
(133, 'Instalaciones Sanitarias y de Gas', '', 20, 'tarde'),
(134, 'Interpretacion de Obra', '', 16, 'tarde'),
(135, 'Planificacion de Obra', '', 16, 'tarde'),
(136, 'Documentacion Tecnica', '', 18, 'tarde'),
(137, 'Dibujo Tecnologico', '', 16, 'tarde'),
(138, 'Procedimientos Tecnicos', '', 7, 'tarde'),
(139, 'Procedimientos Tecnicos', '', 8, 'tarde'),
(140, 'Procedimientos Tecnicos', '', 9, 'tarde'),
(141, 'Procedimientos Tecnicos', '', 10, 'tarde'),
(142, 'Procedimientos Tecnicos', '', 11, 'tarde'),
(143, 'Procedimientos Tecnicos', '', 12, 'tarde'),
(144, 'Procedimientos Tecnicos', '', 13, 'tarde'),
(145, 'Procedimientos Tecnicos', '', 14, 'tarde'),
(146, 'Lab de Hardware', '', 15, 'tarde'),
(147, 'Lab de Base de Datos', '', 17, 'tarde'),
(148, 'Base de Datos', '', 17, 'tarde'),
(149, 'Desarrollo de Aplicaciones Web', '', 19, 'tarde'),
(150, 'Lab de Aplicaciones', '', 15, 'tarde'),
(151, 'Lab de Redes Informaticas', '', 17, 'tarde'),
(152, 'Lab de Sistemas Operativos', '', 15, 'tarde'),
(153, 'Lab de Programacion', '', 15, 'tarde'),
(155, 'Programacion', '', 17, 'tarde'),
(156, 'Programacion 2', '', 19, 'tarde'),
(157, 'Sistemas', '', 18, 'tarde'),
(158, 'Sistemas', '', 20, 'tarde'),
(159, 'Modelos Y Sistemas', '', 17, 'tarde'),
(160, 'Sistemas Constructivos', '', 16, 'tarde'),
(161, 'Sistemas Constructivos', '', 18, 'tarde'),
(162, 'Sistemas Constructivos', '', 20, 'tarde'),
(163, 'Lenguaje Tecnologico', '', 7, 'tarde'),
(164, 'Lenguaje Tecnologico', '', 8, 'tarde'),
(165, 'Lenguaje Tecnologico', '', 9, 'tarde'),
(166, 'Lenguaje Tecnologico', '', 10, 'tarde'),
(167, 'Lenguaje Tecnologico', '', 11, 'tarde'),
(168, 'Lenguaje Tecnologico', '', 12, 'tarde'),
(169, 'Lenguaje Tecnologico', '', 13, 'tarde'),
(170, 'Lenguaje Tecnologico', '', 14, 'tarde'),
(171, 'Sistemas Tecnologicos', '', 7, 'tarde'),
(172, 'Sistemas Tecnologicos', '', 8, 'tarde'),
(173, 'Sistemas Tecnologicos', '', 9, 'tarde'),
(174, 'Sistemas Tecnologicos', '', 10, 'tarde'),
(175, 'Sistemas Tecnologicos', '', 11, 'tarde'),
(176, 'Sistemas Tecnologicos', '', 12, 'tarde'),
(177, 'Sistemas Tecnologicos', '', 13, 'tarde'),
(178, 'Sistemas Tecnologicos', '', 14, 'tarde'),
(179, 'Ed. Fisica', '', 7, 'tarde'),
(180, 'Ed. Fisica', '', 8, 'tarde'),
(181, 'Ed. Fisica', '', 9, 'tarde'),
(182, 'Ed. Fisica', '', 10, 'tarde'),
(183, 'Ed. Fisica', '', 11, 'tarde'),
(184, 'Ed. Fisica', '', 12, 'tarde'),
(185, 'Ed. Fisica', '', 13, 'tarde'),
(186, 'Ed. Fisica', '', 14, 'tarde'),
(187, 'Ed. Fisica', '', 16, 'tarde'),
(188, 'Ed. Fisica', '', 15, 'tarde'),
(189, 'Ed. Fisica', '', 18, 'tarde'),
(190, 'Ed. Fisica', '', 17, 'tarde'),
(191, 'Ed. Fisica', '', 20, 'tarde'),
(192, 'Ed. Fisica', '', 19, 'tarde');

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
  ADD PRIMARY KEY (`subject_id`);

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

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
