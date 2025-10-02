<?php
// move_students.php
include '../includes/conn.php'; // Conexión PDO

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fromCourseId = filter_input(INPUT_POST, 'from_course_id', FILTER_VALIDATE_INT);
    $toCourseId = filter_input(INPUT_POST, 'to_course_id', FILTER_VALIDATE_INT);

    if (!$fromCourseId || !$toCourseId) {
        die('Parámetros inválidos.');
    }

    if ($fromCourseId == $toCourseId) {
        die('El curso origen y destino son iguales.');
    }

    try {
        // Actualizamos todos los estudiantes del curso origen al curso destino
        $stmt = $conn->prepare("UPDATE students SET course_id = :to_course WHERE course_id = :from_course");
        $stmt->bindParam(':to_course', $toCourseId, PDO::PARAM_INT);
        $stmt->bindParam(':from_course', $fromCourseId, PDO::PARAM_INT);
        $stmt->execute();

        // Redirigimos de vuelta a la lista de estudiantes con mensaje opcional
        header("Location: ../students.php?moved=1");
        exit;
    } catch (PDOException $e) {
        die("Error al mover estudiantes: " . $e->getMessage());
    }
} else {
    die('Acceso no permitido.');
}
