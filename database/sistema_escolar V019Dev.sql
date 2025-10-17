-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2025 a las 17:42:35
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
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

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
