<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
if (!$course_id) {
    echo json_encode([]);
    exit;
}

// Asumiendo que hay tabla course_subject que relaciona cursos y materias
$stmt = $conn->prepare("
    SELECT s.subject_id, s.name 
    FROM subjects s
    JOIN courses c ON s.subject_id = s.subject_id
    WHERE c.course_id = ?
");
$stmt->execute([$course_id]);
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
