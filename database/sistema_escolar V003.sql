-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2025 a las 17:32:13
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
(37, 49, 1, 1, 'present', '2025-10-02 02:20:22', '2025-10-01', '04:20:22', 0, NULL),
(38, 1, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(39, 2, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(40, 4, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(41, 5, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(42, 8, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(43, 9, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(44, 12, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(45, 13, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(46, 16, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(47, 17, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(48, 20, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(49, 21, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(50, 24, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(51, 25, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(52, 28, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(53, 29, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(54, 32, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(55, 33, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(56, 36, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(57, 37, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(58, 40, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(59, 41, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(60, 44, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(61, 45, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(62, 48, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL),
(63, 49, 1, 1, 'present', '2025-10-02 02:39:22', '2025-10-01', '04:39:22', 0, NULL);

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
(3, '7 TP', 'Los excelentísimos estudiantes de séptimo TP', 'Programacion');

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
(6, 3, 4, 6, 'monday', '07:30:00', '09:40:00'),
(7, 3, 5, 7, 'monday', '09:40:00', '11:40:00'),
(8, 3, 6, 4, 'tuesday', '07:30:00', '09:40:00'),
(9, 3, 7, 5, 'tuesday', '09:40:00', '11:40:00'),
(10, 3, 7, 5, 'wednesday', '09:40:00', '11:40:00'),
(11, 3, 8, 10, 'thursday', '07:30:00', '10:40:00'),
(12, 3, 6, 4, 'friday', '07:30:00', '09:40:00'),
(13, 3, 7, 5, 'friday', '09:40:00', '11:40:00'),
(14, 3, 9, 8, 'monday', '13:20:00', '15:30:00'),
(15, 3, 10, 8, 'tuesday', '15:30:00', '17:30:00'),
(16, 3, 11, 9, 'wednesday', '13:20:00', '15:20:00'),
(17, 3, 10, 8, 'thursday', '15:30:00', '17:30:00'),
(18, 3, 9, 8, 'friday', '15:30:00', '17:30:00');

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
(52, 'Lobos', 'Jean Pierre', 3, 48843819),
(53, 'Epul', 'Benjamin', 3, 45865484),
(54, 'Apelhanz', 'Santiago', 3, 46587654),
(55, 'Vega', 'Amparo', 3, 43534234),
(56, 'San Martin', 'Yamila', 3, 45436546),
(57, 'Schepesi', 'Jeremias', 3, 40650476),
(58, 'Badia', 'Marco', 3, 48854934),
(59, 'Morales', 'Agustin', 3, 40654667),
(60, 'Martinez', 'Santiago', 3, 48854565),
(62, 'Mulet', 'Sebastian', 3, 48543654);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `turno` enum('mañana','tarde') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subjects`
--

INSERT INTO `subjects` (`subject_id`, `name`, `description`, `turno`) VALUES
(4, 'Emprendimientos Productivos', '', 'mañana'),
(5, 'Organizacion y Metodos', '', 'mañana'),
(6, 'Proyecto de desarrollo de software para plataformas moviles', '', 'mañana'),
(7, 'Practicas Profesionalizantes', '', 'mañana'),
(8, 'Modelos Y Sistemas', '', 'mañana'),
(9, 'Proyecto de implementacion de sitios web dinamicos', '', 'tarde'),
(10, 'proyecto, diseño e implementacion de sistemas computacionales', '', 'tarde'),
(11, 'Evaluacion de proyectos', '', 'tarde');

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
(4, 4, 'Mario ', 'Rosas'),
(5, 1, 'Mezquita', 'Alejandro'),
(6, 3, 'Veronica', 'Ezcurra'),
(7, 2, 'Maria', 'Surin'),
(8, 1, 'Natalia', 'Benitez'),
(9, 3, 'Manuel', 'Moure'),
(10, 3, 'Javier', 'Chevarria');

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
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único de la asistencia', AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
