<?php
include '../includes/conn.php';

$teacher_id = $_GET['teacher_id'] ?? null;

if (!$teacher_id) {
    echo json_encode([]);
    exit;
}

// 🔹 Obtener materias asignadas al profesor en la tabla schedules
$stmt = $conn->prepare("
    SELECT DISTINCT s.subject_id, sub.name
    FROM schedules s
    INNER JOIN subjects sub ON s.subject_id = sub.subject_id
    WHERE s.teacher_id = ?
    ORDER BY sub.name
");
$stmt->execute([$teacher_id]);
$subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($subjects);
