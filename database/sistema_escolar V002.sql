-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2025 a las 04:30:36
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
-- Estructura de tabla para la tabla `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL COMMENT 'ID único de la asistencia',
  `student_id` int(11) NOT NULL COMMENT 'ID del estudiante',
  `course_id` int(11) NOT NULL COMMENT 'ID del curso',
  `subject_id` int(11) NOT NULL COMMENT 'ID de la materia',
  `status` enum('present','absent') NOT NULL COMMENT 'Estado de asistencia',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora de registro',
  `attendance_date` date NOT NULL DEFAULT curdate() COMMENT 'Fecha de la asistencia',
  `attendance_time` time NOT NULL DEFAULT curtime() COMMENT 'Hora de la asistencia',
  `justification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = no justificada, 1 = justificada',
  `justification_file` varchar(255) DEFAULT NULL COMMENT 'Ruta del archivo justificativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla de asistencias';

--
-- Volcado de datos para la tabla `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `student_id`, `course_id`, `subject_id`, `status`, `created_at`, `attendance_date`, `attendance_time`, `justification`, `justification_file`) VALUES
(10, 1, 1, 1, 'absent', '2025-10-01 20:16:50', '2025-10-01', '22:16:50', 1, NULL),
(11, 2, 1, 1, 'present', '2025-10-01 20:16:50', '2025-10-01', '22:16:50', 0, 'uploads/justifications/Reporte_Asistencia_2025-10-01.pdf'),
(12, 1, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(13, 2, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(14, 4, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(15, 5, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(16, 8, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(17, 9, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(18, 12, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(19, 13, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(20, 16, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(21, 17, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(22, 20, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(23, 21, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(24, 24, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(25, 25, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(26, 28, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(27, 29, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(28, 32, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(29, 33, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(30, 36, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(31, 37, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(32, 40, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(33, 41, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(34, 44, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(35, 45, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(36, 48, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(37, 49, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `year` int(11) NOT NULL,
  `shift` enum('morning','afternoon','night') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`course_id`, `name`, `description`, `year`, `shift`) VALUES
(1, 'First Year', 'Primer año de secundaria', 2025, 'morning'),
(2, 'Second Year', 'Segundo año de secundaria', 2025, 'afternoon');

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
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `course_id`, `subject_id`, `teacher_id`, `weekday`, `start_time`, `end_time`) VALUES
(1, 1, 1, 1, 'monday', '08:00:00', '09:30:00'),
(2, 1, 2, 2, 'tuesday', '09:45:00', '11:15:00'),
(3, 2, 3, 1, 'wednesday', '14:00:00', '15:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `course_id` int(11) NOT NULL,
  `DNI` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`student_id`, `last_name`, `first_name`, `course_id`, `DNI`) VALUES
(1, 'Martinez', 'Ana', 1, 40123456),
(2, 'Lopez', 'Juan', 1, 40123457),
(3, 'Gonzalez', 'Lucia', 2, 40123458),
(4, 'Fernandez', 'Sofia', 1, 40123459),
(5, 'Rodriguez', 'Matias', 1, 40123460),
(6, 'Gomez', 'Valentina', 2, 40123461),
(7, 'Sanchez', 'Diego', 2, 40123462),
(8, 'Diaz', 'Martina', 1, 40123463),
(9, 'Alvarez', 'Nicolas', 1, 40123464),
(10, 'Torres', 'Camila', 2, 40123465),
(11, 'Ramirez', 'Lucas', 2, 40123466),
(12, 'Flores', 'Julieta', 1, 40123467),
(13, 'Vega', 'Bruno', 1, 40123468),
(14, 'Cruz', 'Antonella', 2, 40123469),
(15, 'Morales', 'Facundo', 2, 40123470),
(16, 'Ortiz', 'Micaela', 1, 40123471),
(17, 'Rojas', 'Santiago', 1, 40123472),
(18, 'Gimenez', 'Agustina', 2, 40123473),
(19, 'Acosta', 'Emiliano', 2, 40123474),
(20, 'Mendoza', 'Isabella', 1, 40123475),
(21, 'Cabrera', 'Benjamín', 1, 40123476),
(22, 'Silva', 'Luciana', 2, 40123477),
(23, 'Paz', 'Thiago', 2, 40123478),
(24, 'Medina', 'Sofía', 1, 40123479),
(25, 'Benitez', 'Federico', 1, 40123480),
(26, 'Ibarra', 'Juana', 2, 40123481),
(27, 'Ojeda', 'Bruno', 2, 40123482),
(28, 'Salazar', 'Catalina', 1, 40123483),
(29, 'Luna', 'Mateo', 1, 40123484),
(30, 'Figueroa', 'Noelia', 2, 40123485),
(31, 'Bravo', 'Tomás', 2, 40123486),
(32, 'Cordero', 'Ana', 1, 40123487),
(33, 'Cabral', 'Martín', 1, 40123488),
(34, 'Villalba', 'Agustín', 2, 40123489),
(35, 'Ramos', 'Carla', 2, 40123490),
(36, 'Palacios', 'Diego', 1, 40123491),
(37, 'Castro', 'María', 1, 40123492),
(38, 'Gaitán', 'Lucas', 2, 40123493),
(39, 'Espinoza', 'Valentina', 2, 40123494),
(40, 'Peralta', 'Bruno', 1, 40123495),
(41, 'Aguirre', 'Sofía', 1, 40123496),
(42, 'Barrios', 'Emilio', 2, 40123497),
(43, 'Rincon', 'Camila', 2, 40123498),
(44, 'Vera', 'Matías', 1, 40123499),
(45, 'Salinas', 'Julieta', 1, 40123500),
(46, 'Quiroga', 'Lucas', 2, 40123501),
(47, 'Benavidez', 'Agustina', 2, 40123502),
(48, 'Rey', 'Martín', 1, 40123503),
(49, 'Cisneros', 'Ana', 1, 40123504),
(50, 'Espindola', 'Tomás', 2, 40123505),
(51, 'Ojeda', 'Isabella', 2, 40123506);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`subject_id`, `name`, `description`) VALUES
(1, 'Mathematics', 'Curso de Matemáticas'),
(2, 'Physics', 'Curso de Física'),
(3, 'Programming', 'Curso de Programación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `user_id`, `first_name`, `last_name`) VALUES
(1, 2, '', ''),
(2, 3, '', '');

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
-- Indices de la tabla `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `course_id` (`course_id`);

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
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único de la asistencia', AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
