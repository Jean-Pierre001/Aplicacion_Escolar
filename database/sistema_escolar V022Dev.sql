-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2025 a las 02:49:22
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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

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
