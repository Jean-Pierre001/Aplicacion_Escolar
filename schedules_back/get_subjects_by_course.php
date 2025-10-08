<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
if (!$course_id) {
    echo json_encode([]);
    exit;
}

try {
    // Filtra materias que pertenecen al curso recibido
    $stmt = $conn->prepare("
        SELECT subject_id, name
        FROM subjects
        WHERE course_id = ?
    ");
    $stmt->execute([$course_id]);
    
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
