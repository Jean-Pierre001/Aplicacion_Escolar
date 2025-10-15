-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2025 a las 01:00:13
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
(3, '7 TP', 'Los excelentísimos estudiantes de séptimo TP', 'Programacion'),
(4, '1Ro Primera', '', '');

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
(3, 4, 'Grupo 1', ''),
(4, 4, 'Grupo 2', '');

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
(7, 3, 5, 7, NULL, 'monday', '09:40:00', '11:40:00', NULL, 16),
(8, 3, 6, 4, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, 16),
(9, 3, 7, 5, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, 16),
(10, 3, 7, 5, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, 16),
(11, 3, 8, 10, NULL, 'thursday', '07:30:00', '09:30:00', NULL, 16),
(12, 3, 6, 4, NULL, 'friday', '07:30:00', '09:30:00', NULL, 16),
(13, 3, 7, 5, NULL, 'friday', '09:40:00', '11:40:00', NULL, 16),
(14, 3, 9, 8, NULL, 'monday', '15:30:00', '17:30:00', NULL, 16),
(15, 3, 10, 8, NULL, 'tuesday', '15:30:00', '17:30:00', NULL, 16),
(16, 3, 11, 9, NULL, 'wednesday', '13:20:00', '15:20:00', NULL, 16),
(17, 3, 10, 8, NULL, 'thursday', '15:30:00', '17:30:00', NULL, 16),
(26, 4, 12, 11, NULL, 'monday', '07:30:00', '09:30:00', NULL, 6),
(27, 4, 13, 12, NULL, 'monday', '09:40:00', '11:40:00', NULL, 7),
(28, 4, 14, 13, NULL, 'tuesday', '07:30:00', '09:30:00', NULL, 14),
(29, 4, 13, 12, NULL, 'tuesday', '09:40:00', '11:40:00', NULL, 13),
(30, 4, 15, 14, NULL, 'wednesday', '07:30:00', '11:40:00', NULL, 13),
(31, 4, 21, 15, NULL, 'wednesday', '09:40:00', '11:40:00', NULL, 14),
(32, 4, 15, 14, NULL, 'thursday', '07:30:00', '09:30:00', NULL, 7),
(33, 4, 21, 15, NULL, 'thursday', '09:40:00', '11:40:00', NULL, 14),
(34, 4, 14, 13, NULL, 'friday', '07:30:00', '11:40:00', NULL, 11),
(35, 4, 16, 16, NULL, 'friday', '09:40:00', '11:40:00', NULL, 12),
(36, 4, 17, 17, NULL, 'monday', '13:20:00', '15:20:00', 3, 7),
(38, 4, 22, 19, NULL, 'tuesday', '15:30:00', '17:30:00', 3, 12),
(39, 4, 19, 23, NULL, 'wednesday', '13:20:00', '15:20:00', 3, 15),
(40, 4, 20, 18, NULL, 'friday', '13:20:00', '15:20:00', 3, 16),
(41, 4, 20, 18, NULL, 'monday', '15:30:00', '17:30:00', 4, 16),
(42, 4, 22, 19, NULL, 'tuesday', '15:30:00', '17:30:00', 4, 17),
(43, 4, 17, 20, NULL, 'wednesday', '15:30:00', '17:30:00', 4, 15),
(44, 4, 19, 21, NULL, 'friday', '15:30:00', '17:30:00', 4, 13),
(48, 3, 4, 6, NULL, 'monday', '07:30:00', '09:30:00', NULL, 16);

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

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`student_id`, `last_name`, `first_name`, `course_id`, `DNI`, `group_id`) VALUES
(52, 'Lobos', 'Jean Pierre', 3, 48843819, NULL),
(53, 'Epul', 'Benjamin', 3, 45865484, NULL),
(54, 'Apelhanz', 'Santiago', 3, 46587654, NULL),
(55, 'Vega', 'Amparo', 3, 43534234, NULL),
(56, 'San Martin', 'Yamila', 3, 45436546, NULL),
(57, 'Schepesi', 'Jeremias', 3, 40650476, NULL),
(58, 'Badia', 'Marco', 3, 48854934, NULL),
(59, 'Morales', 'Agustin', 3, 40654667, NULL),
(60, 'Martinez', 'Santiago', 3, 48854565, NULL),
(62, 'Mulet', 'Sebastian', 3, 48543654, NULL),
(63, 'jere', 'Hermano', 4, 38428543, 3),
(64, 'fdsfsd', 'dfsfsd', 4, 21312312, 4);

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

--
-- Volcado de datos para la tabla `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `student_id`, `schedule_id`, `attendance_date`, `status`, `justification`, `justification_file`, `updated_at`) VALUES
(11, 52, 7, '2025-10-13 00:00:00', 'present', 0, NULL, '2025-10-13 20:18:30'),
(12, 53, 7, '2025-10-13 00:00:00', 'present', 0, NULL, '2025-10-13 20:21:10'),
(13, 54, 7, '2025-10-13 00:00:00', 'absent', 1, NULL, NULL),
(14, 55, 7, '2025-10-13 00:00:00', 'absent', 1, NULL, NULL),
(15, 56, 7, '2025-10-13 00:00:00', 'present', 0, NULL, '2025-10-13 20:16:55'),
(16, 57, 7, '2025-10-13 00:00:00', 'present', 0, NULL, '2025-10-13 20:21:10'),
(17, 58, 7, '2025-10-13 00:00:00', 'present', 0, NULL, '2025-10-13 20:18:30'),
(18, 59, 7, '2025-10-13 00:00:00', 'present', 0, NULL, '2025-10-13 20:16:55'),
(19, 60, 7, '2025-10-13 00:00:00', 'absent', 0, NULL, NULL),
(20, 62, 7, '2025-10-13 00:00:00', 'absent', 0, NULL, NULL),
(21, 52, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(22, 53, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(23, 54, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(24, 55, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(25, 56, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(26, 57, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(27, 58, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(28, 59, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(29, 60, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(30, 62, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(31, 64, 41, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(32, 52, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(33, 53, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(34, 54, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(35, 55, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(36, 56, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(37, 57, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(38, 58, 9, '2025-10-14 00:00:00', 'absent', 0, NULL, '2025-10-14 13:22:49'),
(39, 59, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(40, 60, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(41, 62, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(42, 52, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(43, 53, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(44, 54, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(45, 55, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(46, 56, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(47, 57, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(48, 58, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(49, 59, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(50, 60, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL),
(51, 62, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL);

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
(4, 'Emprendimientos Productivos', '', 3, 'mañana'),
(5, 'Organizacion y Metodos', '', 3, 'mañana'),
(6, 'Proyecto de desarrollo de software para plataformas moviles', '', 3, 'mañana'),
(7, 'Practicas Profesionalizantes', '', 3, 'mañana'),
(8, 'Modelos Y Sistemas', '', 3, 'mañana'),
(9, 'Proyecto de implementacion de sitios web dinamicos', '', 3, 'tarde'),
(10, 'proyecto, diseño e implementacion de sistemas computacionales', '', 3, 'tarde'),
(11, 'Evaluacion de proyectos', '', 3, 'tarde'),
(12, 'Musica', '', 4, 'mañana'),
(13, 'Ciencia Naturales', '', 4, 'mañana'),
(14, 'Matematicas', '', 4, 'mañana'),
(15, 'Practica Del Lenguaje', '', 4, 'mañana'),
(16, 'Ingles', '', 4, 'mañana'),
(17, 'Procedimientos Tecnicos', '', 4, 'tarde'),
(18, 'Educacion Fisica', '', 4, 'tarde'),
(19, 'Lenguaje Tecnologico', '', 4, 'tarde'),
(20, 'Sistemas Tecnologicos', '', 4, 'tarde'),
(21, 'Ciencia Sociales', '', 4, 'mañana'),
(22, 'Contruccion De La Ciudadania', '', 4, 'tarde');

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
(4, NULL, 'Mario', 'Rosas'),
(5, NULL, 'Alejandro', 'Mezquita'),
(6, NULL, 'Veronica', 'Ezcurra'),
(7, NULL, 'Maria', 'Surin'),
(8, NULL, 'Natalia', 'Benitez'),
(9, NULL, 'Manuel', 'Moure'),
(10, NULL, 'Javier', 'Chevarria'),
(11, NULL, 'Lazaro', 'Artolo'),
(12, NULL, 'Glenda', 'Morales Rios'),
(13, NULL, 'Paulina', 'Ledesma'),
(14, NULL, 'Cleria', 'Olivares'),
(15, NULL, 'Flavia', 'Ilgner'),
(16, NULL, 'Daina', 'Cañueguir'),
(17, NULL, 'Nicolas', 'Recchi'),
(18, NULL, 'Maria Laura', 'Elfi'),
(19, NULL, 'Natalia', 'Etcharren'),
(20, NULL, 'Natali', 'Ursino'),
(21, NULL, 'Ernesto', 'Guidi'),
(23, NULL, 'Sergio', 'Pizarro'),
(24, NULL, 'Miguel', 'Gimenez'),
(26, NULL, 'Glenda', 'Morales Rios'),
(27, NULL, 'Alfonsina', 'Coonstantino'),
(28, NULL, 'Dahiana', 'Coñoguir');

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

--
-- Volcado de datos para la tabla `teacher_attendance`
--

INSERT INTO `teacher_attendance` (`id`, `teacher_id`, `schedule_id`, `attendance_date`, `status`, `justification`, `justification_file`, `updated_at`) VALUES
(2, 7, 7, '2025-10-13 00:00:00', 'absent', 0, NULL, NULL),
(3, 8, 14, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(4, 18, 41, '2025-10-13 00:00:00', 'present', 0, NULL, NULL),
(5, 5, 9, '2025-10-14 00:00:00', 'present', 0, NULL, NULL),
(6, 5, 10, '2025-10-15 00:00:00', 'present', 0, NULL, NULL);

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
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
