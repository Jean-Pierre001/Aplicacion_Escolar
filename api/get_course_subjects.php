<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
if (!$course_id) {
    echo json_encode([]);
    exit;
}

// Materias asignadas a ese curso según horarios
$stmt = $conn->prepare("
    SELECT DISTINCT sub.subject_id, sub.name
    FROM schedules sc
    INNER JOIN subjects sub ON sc.subject_id = sub.subject_id
    WHERE sc.course_id = ?
    ORDER BY sub.name
");
$stmt->execute([$course_id]);
$subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($subjects);
