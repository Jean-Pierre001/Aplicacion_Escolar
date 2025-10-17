<?php
include '../includes/conn.php';
header('Content-Type: application/json; charset=utf-8');

$course_id = isset($_GET['course_id']) ? intval($_GET['course_id']) : 0;
$group_id  = isset($_GET['group_id']) ? intval($_GET['group_id']) : null;

if ($course_id <= 0) {
    echo json_encode([]);
    exit;
}

try {
    if ($group_id) {
        // Materias asociadas al curso y grupo
        $stmt = $conn->prepare("
            SELECT DISTINCT s.subject_id, s.name
            FROM subjects s
            JOIN subject_courses sc ON s.subject_id = sc.subject_id
            JOIN schedules sch ON sch.subject_id = s.subject_id
            WHERE sc.course_id = :course_id AND sch.group_id = :group_id
            ORDER BY s.name ASC
        ");
        $stmt->bindParam(':course_id', $course_id, PDO::PARAM_INT);
        $stmt->bindParam(':group_id', $group_id, PDO::PARAM_INT);
    } else {
        // Materias asociadas al curso, sin importar el grupo
        $stmt = $conn->prepare("
            SELECT DISTINCT s.subject_id, s.name
            FROM subjects s
            JOIN subject_courses sc ON s.subject_id = sc.subject_id
            LEFT JOIN schedules sch ON sch.subject_id = s.subject_id
            WHERE sc.course_id = :course_id
            ORDER BY s.name ASC
        ");
        $stmt->bindParam(':course_id', $course_id, PDO::PARAM_INT);
    }

    $stmt->execute();
    $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($subjects);

} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
