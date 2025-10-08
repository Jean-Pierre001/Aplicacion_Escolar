<?php

include '../includes/conn.php'; // conexión PDO

header('Content-Type: application/json; charset=utf-8');

try {
    // Validar parámetro
    $course_id = isset($_GET['course_id']) ? intval($_GET['course_id']) : 0;

    if ($course_id <= 0) {
        echo json_encode([]);
        exit;
    }

    // Consulta de materias asociadas al curso
    $stmt = $conn->prepare("
        SELECT subject_id, name
        FROM subjects
        WHERE course_id = :course_id
        ORDER BY name ASC
    ");
    $stmt->bindParam(':course_id', $course_id, PDO::PARAM_INT);
    $stmt->execute();

    $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($subjects);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
