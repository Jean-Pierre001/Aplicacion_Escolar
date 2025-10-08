-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2025 a las 14:54:10
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
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `weekday` enum('monday','tuesday','wednesday','thursday','friday','saturday') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `course_id`, `subject_id`, `teacher_id`, `weekday`, `start_time`, `end_time`, `group_id`) VALUES
(6, 3, 4, 6, 'monday', '07:30:00', '09:30:00', NULL),
(7, 3, 5, 7, 'monday', '09:40:00', '11:40:00', NULL),
(8, 3, 6, 4, 'tuesday', '07:30:00', '09:30:00', NULL),
(9, 3, 7, 5, 'tuesday', '09:40:00', '11:40:00', NULL),
(10, 3, 7, 5, 'wednesday', '09:40:00', '11:40:00', NULL),
(11, 3, 8, 10, 'thursday', '07:30:00', '09:30:00', NULL),
(12, 3, 6, 4, 'friday', '07:30:00', '09:30:00', NULL),
(13, 3, 7, 5, 'friday', '09:40:00', '11:40:00', NULL),
(14, 3, 9, 8, 'monday', '15:30:00', '17:30:00', NULL),
(15, 3, 10, 8, 'tuesday', '15:30:00', '17:30:00', NULL),
(16, 3, 11, 9, 'wednesday', '13:20:00', '15:20:00', NULL),
(17, 3, 10, 8, 'thursday', '15:30:00', '17:30:00', NULL),
(20, 3, 5, 5, 'tuesday', '16:51:00', '15:51:00', NULL),
(26, 4, 12, 11, 'monday', '07:30:00', '09:30:00', NULL),
(27, 4, 13, 12, 'monday', '09:40:00', '11:40:00', NULL),
(28, 4, 14, 13, 'tuesday', '07:30:00', '09:30:00', NULL),
(29, 4, 13, 12, 'tuesday', '09:40:00', '11:40:00', NULL),
(30, 4, 15, 14, 'wednesday', '07:30:00', '11:40:00', NULL),
(31, 4, 21, 15, 'wednesday', '09:40:00', '11:40:00', NULL),
(32, 4, 15, 14, 'thursday', '07:30:00', '09:30:00', NULL),
(33, 4, 21, 15, 'thursday', '09:40:00', '11:40:00', NULL),
(34, 4, 14, 13, 'friday', '07:30:00', '11:40:00', NULL),
(35, 4, 16, 16, 'friday', '09:40:00', '11:40:00', NULL),
(36, 4, 17, 17, 'monday', '13:20:00', '15:20:00', 3),
(38, 4, 22, 19, 'tuesday', '15:30:00', '17:30:00', 3),
(39, 4, 19, 23, 'wednesday', '13:20:00', '15:20:00', 3),
(40, 4, 20, 18, 'friday', '13:20:00', '15:20:00', 3),
(41, 4, 20, 18, 'monday', '15:30:00', '17:30:00', 4),
(42, 4, 22, 19, 'tuesday', '15:30:00', '17:30:00', 4),
(43, 4, 17, 20, 'wednesday', '15:30:00', '17:30:00', 4),
(44, 4, 19, 21, 'friday', '15:30:00', '17:30:00', 4);

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
(63, 'jere', 'Hermano', 4, 38428543, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student_attendance`
--

CREATE TABLE `student_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `student_id`, `schedule_id`, `attendance_date`, `status`, `justification`, `justification_file`) VALUES
(11, 52, 9, '2025-10-07', 'present', 0, NULL),
(12, 53, 9, '2025-10-07', 'absent', 0, NULL),
(13, 54, 9, '2025-10-07', 'absent', 0, NULL),
(14, 55, 9, '2025-10-07', 'present', 0, NULL),
(15, 56, 9, '2025-10-07', 'present', 0, NULL),
(16, 57, 9, '2025-10-07', 'present', 0, NULL),
(17, 58, 9, '2025-10-07', 'present', 0, NULL),
(18, 59, 9, '2025-10-07', 'present', 0, NULL),
(19, 60, 9, '2025-10-07', 'present', 0, NULL),
(20, 62, 9, '2025-10-07', 'present', 0, NULL),
(21, 52, 8, '2025-10-07', 'present', 0, NULL),
(22, 53, 8, '2025-10-07', 'present', 0, NULL),
(23, 54, 8, '2025-10-07', 'present', 0, NULL),
(24, 55, 8, '2025-10-07', 'present', 0, NULL),
(25, 56, 8, '2025-10-07', 'absent', 0, NULL),
(26, 57, 8, '2025-10-07', 'absent', 0, NULL),
(27, 58, 8, '2025-10-07', 'present', 0, NULL),
(28, 59, 8, '2025-10-07', 'absent', 1, NULL),
(29, 60, 8, '2025-10-07', 'present', 0, NULL),
(30, 62, 8, '2025-10-07', 'present', 0, NULL),
(31, 52, 20, '2025-10-07', 'present', 0, NULL),
(32, 53, 20, '2025-10-07', 'present', 0, NULL),
(33, 54, 20, '2025-10-07', 'absent', 0, NULL),
(34, 55, 20, '2025-10-07', 'absent', 0, NULL),
(35, 56, 20, '2025-10-07', 'absent', 1, NULL),
(36, 57, 20, '2025-10-07', 'present', 0, NULL),
(37, 58, 20, '2025-10-07', 'present', 0, NULL),
(38, 59, 20, '2025-10-07', 'present', 0, NULL),
(39, 60, 20, '2025-10-07', 'present', 0, NULL),
(40, 62, 20, '2025-10-07', 'present', 0, NULL),
(41, 63, 29, '2025-10-07', 'present', 0, NULL),
(42, 63, 38, '2025-10-07', 'present', 0, NULL),
(43, 63, 28, '2025-10-07', 'present', 0, NULL),
(44, 52, 15, '2025-10-07', '', 0, NULL),
(45, 53, 15, '2025-10-07', '', 1, NULL),
(46, 54, 15, '2025-10-07', '', 0, NULL),
(47, 55, 15, '2025-10-07', '', 0, NULL),
(48, 56, 15, '2025-10-07', '', 0, NULL),
(49, 57, 15, '2025-10-07', '', 0, NULL),
(50, 58, 15, '2025-10-07', '', 0, NULL),
(51, 59, 15, '2025-10-07', '', 0, NULL),
(52, 60, 15, '2025-10-07', '', 0, NULL),
(53, 62, 15, '2025-10-07', '', 0, NULL),
(54, 52, 10, '2025-10-08', 'present', 0, NULL),
(55, 53, 10, '2025-10-08', 'present', 0, NULL),
(56, 54, 10, '2025-10-08', 'present', 0, NULL),
(57, 55, 10, '2025-10-08', 'absent', 0, NULL),
(58, 56, 10, '2025-10-08', 'absent', 0, NULL),
(59, 57, 10, '2025-10-08', 'present', 0, NULL),
(60, 58, 10, '2025-10-08', 'absent', 0, NULL),
(61, 59, 10, '2025-10-08', 'absent', 0, NULL),
(62, 60, 10, '2025-10-08', 'absent', 0, NULL),
(63, 62, 10, '2025-10-08', 'present', 0, NULL),
(64, 63, 31, '2025-10-08', 'present', 0, NULL),
(65, 63, 39, '2025-10-08', '', 0, NULL),
(66, 63, 30, '2025-10-08', '', 0, NULL),
(67, 63, 43, '2025-10-08', 'absent', 1, NULL),
(68, 52, 16, '2025-10-08', 'present', 0, NULL),
(69, 53, 16, '2025-10-08', 'present', 0, NULL),
(70, 54, 16, '2025-10-08', 'present', 0, NULL),
(71, 55, 16, '2025-10-08', 'absent', 0, NULL),
(72, 56, 16, '2025-10-08', 'absent', 1, NULL),
(73, 57, 16, '2025-10-08', 'present', 0, NULL),
(74, 58, 16, '2025-10-08', 'present', 0, NULL),
(75, 59, 16, '2025-10-08', 'present', 0, NULL),
(76, 60, 16, '2025-10-08', 'present', 0, NULL),
(77, 62, 16, '2025-10-08', 'present', 0, NULL);

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
(24, NULL, 'Miguel', 'Gimenez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher_attendance`
--

CREATE TABLE `teacher_attendance` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `justification` tinyint(1) DEFAULT 0,
  `justification_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teacher_attendance`
--

INSERT INTO `teacher_attendance` (`id`, `teacher_id`, `schedule_id`, `attendance_date`, `status`, `justification`, `justification_file`) VALUES
(2, 5, 9, '2025-10-07', 'present', 0, NULL),
(3, 4, 8, '2025-10-07', 'present', 0, NULL),
(4, 5, 20, '2025-10-07', 'present', 0, NULL),
(5, 12, 29, '2025-10-07', 'present', 0, NULL),
(6, 19, 38, '2025-10-07', 'present', 0, NULL),
(7, 13, 28, '2025-10-07', 'present', 0, NULL),
(8, 8, 15, '2025-10-07', 'absent', 1, NULL),
(9, 5, 10, '2025-10-08', 'present', 0, NULL),
(10, 15, 31, '2025-10-08', 'present', 0, NULL),
(11, 23, 39, '2025-10-08', 'absent', 0, NULL),
(12, 14, 30, '2025-10-08', 'absent', 0, NULL),
(13, 20, 43, '2025-10-08', 'present', 0, NULL),
(14, 9, 16, '2025-10-08', 'present', 0, NULL);

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
  `role` enum('admin','teacher','student') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'Principal', 'admin@school.com', 'admin123', 'admin', '2025-10-01 18:47:31'),
(2, 'Laura', 'Gomez', 'lgomez@school.com', 'teacher123', 'teacher', '2025-10-01 18:47:31'),
(3, 'Carlos', 'Perez', 'cperez@school.com', 'teacher123', 'teacher', '2025-10-01 18:47:31'),
(4, 'Ana', 'Martinez', 'amartinez@school.com', 'student123', 'student', '2025-10-01 18:47:31'),
(5, 'Juan', 'Lopez', 'jlopez@school.com', 'student123', 'student', '2025-10-01 18:47:31');

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `fk_schedules_groups` (`group_id`);

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
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `student_attendance`
--
ALTER TABLE `student_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedules_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
