<?php
include '../includes/conn.php';
header('Content-Type: application/json; charset=utf-8');

$course_id = isset($_GET['course_id']) ? intval($_GET['course_id']) : 0;
$group_id = isset($_GET['group_id']) ? intval($_GET['group_id']) : null;

if ($course_id <= 0) {
    echo json_encode([]);
    exit;
}

// Si se pasa group_id, traer solo materias que tengan ese grupo, sin duplicados
if ($group_id) {
    $stmt = $conn->prepare("
        SELECT DISTINCT s.subject_id, s.name
        FROM subjects s
        JOIN schedules sch ON sch.subject_id = s.subject_id
        WHERE s.course_id = :course_id AND sch.group_id = :group_id
        ORDER BY s.name ASC
    ");
    $stmt->bindParam(':course_id', $course_id, PDO::PARAM_INT);
    $stmt->bindParam(':group_id', $group_id, PDO::PARAM_INT);
} else {
    // Si no se pasa group_id, traer solo materias sin grupo asignado, sin duplicados
    $stmt = $conn->prepare("
        SELECT DISTINCT s.subject_id, s.name
        FROM subjects s
        LEFT JOIN schedules sch ON sch.subject_id = s.subject_id
        WHERE s.course_id = :course_id AND (sch.group_id IS NULL OR sch.group_id = 0)
        ORDER BY s.name ASC
    ");
    $stmt->bindParam(':course_id', $course_id, PDO::PARAM_INT);
}

$stmt->execute();
$subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($subjects);
