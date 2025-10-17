-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2025 a las 18:54:02
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
(229, 'MODELOS Y SISTEMAS (MYS)', 2480501, '7°TP', 21, 'mañana'),
(230, 'PROYECTO, DISEÑO E IMPLEMENTACION DE SISTEMAS COMPUTACIONALES (TECPRPYD7)', 2480505, '7°TP', 21, 'tarde'),
(231, 'PRACTICAS PROFESIONALIZANTES DEL SECTOR INFORMATICA (TECPRPP7)', 2480495, '7°TP', 21, 'mañana'),
(232, 'EMPRENDIMIENTOS PRODUCTIVOS Y DESARROLLO LOCAL (TECPREM7)', 2480498, '7°TP', 21, 'mañana'),
(233, 'EVALUACION DE PROYECTO (TECPREV7)', 2480499, '7°TP', 21, 'tarde'),
(234, 'ORGANIZACION Y METODOS (OYM)', 2480503, '7°TP', 21, 'mañana'),
(235, 'PROYECTO DE DESARROLLO DE SOFTWARE PARA PLATAFORMAS MOVILES (TECPRPR7)', 2480507, '7°TP', 21, 'tarde'),
(236, 'PROYECTO DE IMPLEMENTACION DE SITIOS WEB DINAMICOS (PWD)', 2480508, '7°TP', 21, 'tarde'),
(237, 'ESTRUCTURAS (ESR)', 2480491, '7°MMO', 22, 'mañana'),
(238, 'PROYECTO FINAL (PRF)', 2480492, '7°MMO', 22, 'tarde'),
(239, 'EJERCICIO PROFESIONAL DE LA CONSTRUCCION (EPC) GRUPO 1', 2480494, '7°MMO', 22, 'tarde'),
(240, 'PRACTICAS PROFESIONALIZANTES DEL SECTOR CONSTRUCCIONES EDILICIAS (ZTECMMPP7) GRUPO 1', 2480487, '7°MMO', 22, 'mañana'),
(241, 'DIRECCION DE OBRA (TECMMDI7) GRUPO 1', 2480493, '7°MMO', 22, 'tarde'),
(242, 'EMPRENDIMIENTOS PRODUCTIVOS Y DESARROLLO LOCAL (ZTECMMEM7)', 2480488, '7°MMO', 22, 'tarde'),
(243, 'INSTALACIONES DE ACONDICONAMIENTO DEL AIRE (ZTECMMIN7)', 2480490, '7°MMO', 22, 'mañana'),
(244, 'PROYECTO FINAL (PRF) GRUPO 2', 2625349, '7°MMO', 22, 'tarde'),
(245, 'EJERCICIO PROFESIONAL DE LA CONSTRUCCION (EPC) GRUPO 2', 2625353, '7°MMO', 22, 'tarde'),
(246, 'PRACTICAS PROFESIONALIZANTES DEL SECTOR CONSTRUCCIONES EDILICIAS (ZTECMMPP7) GRUPO 2', 2625355, '7°MMO', 22, 'mañana'),
(247, 'DIRECCION DE OBRA (TECMMDI7) GRUPO 2', 2625351, '7°MMO', 22, 'tarde'),
(248, 'Literatura (LIT)', 2459981, '6° 1° TECPR', 19, 'mañana'),
(249, 'Ingles (IGS)', 2459990, '6° 1° TECPR', 19, 'mañana'),
(250, 'Ed fisica (EFC)', 2459995, '6° 1° TECPR', 19, 'tarde'),
(251, 'Filosofia (FIA)', 2459999, '6° 1° TECPR', 19, 'mañana'),
(252, 'Arte (RTE)', 2460001, '6° 1° TECPR', 19, 'mañana'),
(253, 'Matematica Discreta (MDI)', 2460004, '6° 1° TECPR', 19, 'mañana'),
(254, 'Sistemas Digitales (SD)', 2460008, '6° 1° TECPR', 19, 'mañana'),
(255, 'Sistemas de Gestion y Autogestion (SGA)', 2460023, '6° 1° TECPR', 19, 'mañana'),
(256, 'Seguridad Informatica (INS)', 2460027, '6° 1° TECPR', 19, 'mañana'),
(257, 'Derecho del Trabajo (DET)', 2460031, '6° 1° TECPR', 19, 'mañana'),
(258, 'Laboratorio de Programacion 3 (LPR) GRUPO 1', 2460034, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(259, 'Laboratorio de Procesos Industriales (LPI) GRUPO 1', 2460038, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(260, 'Desarrollo de Aplicaciones WEB (Estatica) (DWE) GRUPO 1', 2460042, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(261, 'Desarrollo de aplicaciones WEB (Dinamicas) (DWD) GRUPO 1', 2460046, '6° 1° TECPR GRUPO 1', 19, 'tarde'),
(262, 'Laboratorio de Programacion 3 (LPR) GRUPO 2', 2625341, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(263, 'Laboratorio de Procesos Industriales (LPI) GRUPO 2', 2625344, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(264, 'Desarrollo de Aplicaciones WEB (Estatica) (DWE) GRUPO 2', 2625348, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(265, 'Desarrollo de aplicaciones WEB (Dinamicas) (DWD) GRUPO 2', 2625346, '6° 1° TECPR GRUPO 2', 19, 'tarde'),
(266, 'Literatura (LIT)', 2460050, '6° 1° MMO', 20, 'mañana'),
(267, 'Ingles (IGS)', 2460055, '6° 1° MMO', 20, 'mañana'),
(268, 'Ed fisica (EFC)', 2460057, '6° 1° MMO', 20, 'tarde'),
(269, 'Filosofia (FIA)', 2460061, '6° 1° MMO', 20, 'mañana'),
(270, 'Arte (RTE)', 2460065, '6° 1° MMO', 20, 'mañana'),
(271, 'Matematica aplicada (MAP)', 2460069, '6° 1° MMO', 20, 'mañana'),
(272, 'Instalaciones Sanitarias y de Gas (ISI)', 2460072, '6° 1° MMO', 20, 'mañana'),
(273, 'Estructuras (ESR)', 2460075, '6° 1° MMO', 20, 'mañana'),
(274, 'Derechos del trabajo (DET)', 2460080, '6° 1° MMO', 20, 'mañana'),
(275, 'Proyectos de Instalaciones (PIN) GRUPO 1', 2460083, '6° 1° MMO', 20, 'tarde'),
(276, 'Direccion de la ejecucion de instalaciones (DEJ) GRUPO 1', 2460087, '6° 1° MMO', 20, 'tarde'),
(277, 'Sistemas Constructivos (SCO) GRUPO 1', 2460453, '6° 1° MMO', 20, 'tarde'),
(278, 'Proyectos (ORP) GRUPO 1', 2460455, '6° 1° MMO', 20, 'tarde'),
(279, 'Proyectos de Instalaciones (PIN) GRUPO 2', 2554117, '6° 1° MMO', 20, 'tarde'),
(280, 'Direccion de la ejecucion de instalaciones (DEJ) GRUPO 2', 2554118, '6° 1° MMO', 20, 'tarde'),
(281, 'Sistemas Constructivos (SCO) GRUPO 2', 2554120, '6° 1° MMO', 20, 'tarde'),
(282, 'Proyectos (ORP) GRUPO 2', 2554121, '6° 1° MMO', 20, 'tarde'),
(283, 'POLITICA Y CIUDADANIA (PYC)', 2355764, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(284, 'ANALISIS MATEMATICO (AM)', 2355772, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(285, 'MODELOS Y SISTEMAS (MYS)', 2355773, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(286, 'GEOGRAFIA (GGF)', 2355775, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(287, 'INGLES (IGS)', 2355778, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(288, 'HISTORIA (HTR)', 2355780, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(289, 'LITERATURA (LIT)', 2355785, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(290, 'BASE DE DATOS (BDD)', 2355791, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(291, 'SISTEMAS DIGITALES (SD)', 2355797, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(292, 'EDUCACION FISICA EFC', 2355802, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(293, 'LAB. DE REDES INFORMATICAS (LRI) G1', 2355805, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(294, 'LAB DE PROGRAMACION (LPR) G1', 2355808, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(295, 'LAB DE DISEÑO WEB (LDW) G1', 2355812, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(296, 'LAB DE DISEÑO DE BASE DE DATOS (LDB) G1', 2355816, '5° CURSO: TECNICO PROGRAMADOR', 17, 'mañana'),
(297, 'LAB. DE REDES INFORMATICAS G2', 2554124, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(298, 'LAB DE PROGRAMACION G2', 2554123, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(299, 'LAB DE DISEÑO WEB G2', 2554127, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(300, 'LAB DE DISEÑO DE BASE DE DATOS G2', 2554128, '5° CURSO: TECNICO PROGRAMADOR', 17, 'tarde'),
(301, 'POLITICA Y CIUDADANIA (PYC)', 2355819, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(302, 'ANALISIS MATEMATICO (AM)', 2355821, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(303, 'GEOGRAFIA (GGF)', 2355823, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(304, 'INGLES (IGS)', 2355824, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(305, 'HISTORIA (HTR)', 2355825, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(306, 'LITERATURA (LIT)', 2355826, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(307, 'RESISTENCIA Y ENSAYO DE LOS MATERIALES (REM)', 2355827, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(308, 'INSTALACIONES ELECTRICAS (IE)', 2355828, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(309, 'EDUCACION FISICA EFC', 2355829, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(310, 'PROYECTO (ORP) G1', 2355830, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(311, 'SISTEMAS CONSTRUCTIVOS (SCO) G1', 2355831, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(312, 'MATERIALES DE OBRA (MAO) G1', 2355832, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(313, 'DOCUMENTACION TECNICA (DOT) G1', 2355833, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'mañana'),
(314, 'PROYECTO G2', 2554115, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(315, 'SISTEMAS CONSTRUCTIVOS G2', 2554114, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(316, 'MATERIALES DE OBRA G2', 2554112, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(317, 'DOCUMENTACION TECNICA G2', 2554109, '5° CURSO: MAESTRO MAYOR DE OBRAS', 18, 'tarde'),
(318, 'LITERATURA', 2273304, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(319, 'INGLES IGS', 2273787, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(320, 'ED. FISICA EFC', 2273801, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(321, 'SALUD Y ADOLESCENCIA SYA', 2273842, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(322, 'HISTORIA HTR', 2273812, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(323, 'GEOGRAFIA GGF', 2273826, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(324, 'MATEMATICA (MCS)', 2266313, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(325, 'FISICA (FIS)', 2273834, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(326, 'QUIMICA (QMC)', 2266311, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(327, 'TECNOLOGIAS ELECTRONICAS (TEE)', 2273852, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(328, 'LAB. DE PROGRAMACION (LPR)', 2273856, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(329, 'LAB. DE HARDWARE (LHW)', 2273859, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(330, 'LAB. DE SISTEMAS OPERATIVOS (LSO)', 2273863, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(331, 'LAB. DE APLICACIONES (LPA)', 2273867, '4° CURSO: TECNICO PROGRAMADOR', 15, 'mañana'),
(332, 'LITERATURA', 2265880, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(333, 'INGLES IGS', 2265886, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(334, 'ED. FISICA EFC', 2265887, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(335, 'SALUD Y ADOLESCENCIASY', 2265893, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(336, 'HISTORIA HTR', 2265889, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(337, 'GEOGRAFIA GGF', 2265891, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(338, 'MATEMATICA (MCS)', 2265879, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(339, 'FISICA (FIS)', 2269002, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(340, 'QUIMICA (QMC)', 2265877, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(341, 'CONOC. DE LOS MATERIALES (CMM)', 2265899, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(342, 'DIBUJO TECNOLOGICO (DTM)', 2266285, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(343, 'INTERP. DE ANTEPROYECTOS (IAN)', 2266287, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(344, 'PLANIFICACION DE OBRA (POB)', 2266288, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(345, 'SISTEMAS CONSTRUCTIVOS (SCO)', 2266292, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(346, 'PROYECTO (ORP)', 2266297, '4° CURSO: MAESTRO MAYOR DE OBRAS', 16, 'mañana'),
(347, 'BIOLOGIA', 2209455, '3° CURSO: 2°', 13, 'mañana'),
(348, 'FISICO QUIMICA', 2209457, '3° CURSO: 2°', 13, 'mañana'),
(349, 'GEOGRAFIA', 2209473, '3° CURSO: 2°', 13, 'mañana'),
(350, 'HISTORIA', 2209459, '3° CURSO: 2°', 13, 'mañana'),
(351, 'ED. ARTISTICA', 2209463, '3° CURSO: 2°', 13, 'mañana'),
(352, 'ED. FISICA', 2209461, '3° CURSO: 2°', 13, 'mañana'),
(353, 'INGLES', 2209465, '3° CURSO: 2°', 13, 'mañana'),
(354, 'MATEMATICA', 2209467, '3° CURSO: 2°', 13, 'mañana'),
(355, 'P. DEL LENGUAJE', 2209469, '3° CURSO: 2°', 13, 'mañana'),
(356, 'CONST. CIUDADANA', 2209471, '3° CURSO: 2°', 13, 'mañana'),
(357, 'LENGUAJES TECNOLOGICOS (LT)', 2209442, '3° CURSO: 2°', 13, 'mañana'),
(358, 'SISTEMAS TECNOLOGICOS (ST1)', 2209438, '3° CURSO: 2°', 13, 'mañana'),
(359, 'PROCEDIMIENTOS TECNOLOGICOS (PCS)', 2209446, '3° CURSO: 2°', 13, 'mañana'),
(360, 'BIOLOGIA', 2209454, '3° CURSO: 1°', 12, 'mañana'),
(361, 'FISICO QUIMICA', 2209456, '3° CURSO: 1°', 12, 'mañana'),
(362, 'GEOGRAFIA', 2209472, '3° CURSO: 1°', 12, 'mañana'),
(363, 'HISTORIA', 2209458, '3° CURSO: 1°', 12, 'mañana'),
(364, 'ED. ARTISTICA', 2209462, '3° CURSO: 1°', 12, 'mañana'),
(365, 'ED. FISICA', 2209460, '3° CURSO: 1°', 12, 'mañana'),
(366, 'INGLES', 2209464, '3° CURSO: 1°', 12, 'mañana'),
(367, 'MATEMATICA', 2209466, '3° CURSO: 1°', 12, 'mañana'),
(368, 'P. DEL LENGUAJE', 2209468, '3° CURSO: 1°', 12, 'mañana'),
(369, 'CONST. CIUDADANA', 2209470, '3° CURSO: 1°', 12, 'mañana'),
(370, 'LENGUAJES TECNOLOGICOS (LT)', 2209441, '3° CURSO: 1°', 12, 'mañana'),
(371, 'SISTEMAS TECNOLOGICOS (ST1)', 2209436, '3° CURSO: 1°', 12, 'mañana'),
(372, 'PROCEDIMIENTOS TECNOLOGICOS (PCS)', 2209444, '3° CURSO: 1°', 12, 'mañana'),
(373, 'BIOLOGIA (BLG)', 2745924, '2° 3°', 14, 'mañana'),
(374, 'FISICO QUIMICA (FQA)', 2745928, '2° 3°', 14, 'mañana'),
(375, 'GEOGRAFIA (GGF)', 2745929, '2° 3°', 14, 'mañana'),
(376, 'HISTORIA (HTR)', 2745930, '2° 3°', 14, 'mañana'),
(377, 'ED. ARTISTICA (APV)', 2745925, '2° 3°', 14, 'mañana'),
(378, 'ED. FISICA (EFC)', 2745926, '2° 3°', 14, 'mañana'),
(379, 'INGLES (IGS)', 2745931, '2° 3°', 14, 'tarde'),
(380, 'MATEMATICA (MTM)', 2745932, '2° 3°', 14, 'tarde'),
(381, 'P. DEL LENGUAJE (PLG)', 2745933, '2° 3°', 14, 'tarde'),
(382, 'CONST. CIUDADANA (CCD)', 2745934, '2° 3°', 14, 'tarde'),
(383, 'LENGUAJES TECNOLOGICOS (LTE)', 2745936, '2° 3°', 14, 'tarde'),
(384, 'SISTEMAS TECNOLOGICOS (ST2)', 2745935, '2° 3°', 14, 'tarde'),
(385, 'PROCEDIMIENTOS TECNOLOGICOS (PCE)', 2745937, '2° 3°', 14, 'tarde'),
(386, 'BIOLOGIA', 2139934, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(387, 'FISICO QUIMICA', 2139939, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(388, 'GEOGRAFIA', 2139935, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(389, 'HISTORIA', 2139937, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(390, 'ED. ARTISTICA', 2139942, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(391, 'ED. FISICA', 2139941, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(392, 'INGLES', 2139943, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(393, 'MATEMATICA', 2139944, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(394, 'P. DEL LENGUAJE', 2139945, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(395, 'CONST. CIUDADANA', 2139946, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(396, 'LENGUAJES TECNOLOGICOS (LTE)', 2139884, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(397, 'SISTEMAS TECNOLOGICOS (ST2)', 2139883, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(398, 'PROCEDIMIENTOS TECNOLOGICOS (PCE)', 2139902, 'AÑO: 2° CURSO: 2°', 11, 'mañana'),
(399, 'BIOLOGIA', 2139853, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(400, 'FISICO QUIMICA', 2139854, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(401, 'GEOGRAFIA GGF', 2139852, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(402, 'HISTORIA HTR', 2139843, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(403, 'ED. ARTISTICA ARTE', 2139849, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(404, 'ED. FISICA EFC', 2139841, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(405, 'INGLES IGS', 2139845, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(406, 'MATEMATICA MTM', 2139850, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(407, 'P. DEL LENGUAJE PLG', 2139855, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(408, 'CONST. CIUDADANA CCD', 2139839, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(409, 'LENGUAJES TECNOLOGICOS (LTE)', 2139822, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(410, 'LENGUAJES TECNOLOGICOS (LTE)', 2139872, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(411, 'SISTEMAS TECNOLOGICOS (ST2)', 2139832, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(412, 'SISTEMAS TECNOLOGICOS (ST2)', 2139874, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(413, 'PROCEDIMIENTOS TECNOLOGICOS (Adic)', 2139878, 'AÑO: 2° CURSO: 1°', 10, 'mañana'),
(414, 'CIENCIAS SOCIALES', 2087037, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(415, 'CIENCIAS NATURALES', 2087046, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(416, 'ED. ARTISTICA MUS', 2087058, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(417, 'ED. FISICA', 2087054, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(418, 'INGLES', 2087056, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(419, 'MATEMATICA', 2087049, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(420, 'P. DEL LENGUAJE', 2087051, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(421, 'CONST. CIUDADANA', 2087052, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(422, 'LENGUAJES TECNOLOGICOS', 2087069, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(423, 'LENGUAJES TECNOLOGICOS (Adic)', 2087072, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(424, 'SISTEMAS TECNOLOGICOS G1', 2087066, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(425, 'SISTEMAS TECNOLOGICOS G2', 2087067, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(426, 'PROCEDIMIENTOS TÉCNICOS G1', 2087060, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(427, 'PROCEDIMIENTOS TÉCNICOS G2', 2087064, 'AÑO: 1° CURSO: 3°', 9, 'mañana'),
(428, 'CIENCIAS SOCIALES', 2078222, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(429, 'CIENCIAS NATURALES', 2078195, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(430, 'ED. ARTISTICA', 2078217, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(431, 'ED. FISICA', 2078238, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(432, 'INGLES', 2078244, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(433, 'MATEMATICA', 2078230, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(434, 'P. DEL LENGUAJE', 2078236, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(435, 'CONST. CIUDADANA', 2078243, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(436, 'LENGUAJES TECNOLOGICOS LTS G1', 2078254, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(437, 'LENGUAJES TECNOLOGICOS LTS G2', 2078255, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(438, 'SISTEMAS TECNOLOGICOS STS G1', 2078257, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(439, 'SISTEMAS TECNOLOGICOS STS G2', 2078262, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(440, 'PROCEDIMIENTOS TECNICOS PCT G1', 2078251, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(441, 'PROCEDIMIENTOS TECNICOS PCT G2', 2078250, 'AÑO: 1° CURSO: 2°', 8, 'mañana'),
(442, 'CIENCIAS SOCIALES CSC', 2078225, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(443, 'CIENCIAS NATURALES CNC', 2078214, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(444, 'ED. ARTISTICA ARTE', 2078245, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(445, 'ED. FISICA EFC', 2078240, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(446, 'INGLES IGS', 2078267, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(447, 'MATEMATICA MTM', 2078227, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(448, 'P. DEL LENGUAJE PLG', 2078234, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(449, 'CONST. CIUDADANA CCD', 2078241, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(450, 'LENGUAJES TECNOLOGICOS LTS G1', 2078253, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(451, 'LENGUAJES TECNOLOGICOS LTS G2', 2078252, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(452, 'SISTEMAS TECNOLOGICOS STS G1', 2078260, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(453, 'SISTEMAS TECNOLOGICOS STS G2', 2078256, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(454, 'PROCEDIMIENTOS TECNICOS PCT G1', 2078246, 'AÑO: 1° CURSO: 1°', 7, 'mañana'),
(455, 'PROCEDIMIENTOS TECNICOS PCT G2', 2078248, 'AÑO: 1° CURSO: 1°', 7, 'mañana');

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;

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
