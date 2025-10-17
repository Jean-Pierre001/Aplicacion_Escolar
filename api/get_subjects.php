<?php
include '../includes/conn.php';
header('Content-Type: application/json; charset=utf-8');

$course_id = isset($_GET['course_id']) ? intval($_GET['course_id']) : 0;
if ($course_id <= 0) {
    echo json_encode([]);
    exit;
}

try {
    $stmt = $conn->prepare("
        SELECT DISTINCT s.subject_id, s.name
        FROM subjects s
        JOIN subject_courses sc ON s.subject_id = sc.subject_id
        WHERE sc.course_id = :course_id
        ORDER BY s.name ASC
    ");
    $stmt->bindParam(':course_id', $course_id, PDO::PARAM_INT);
    $stmt->execute();
    $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($subjects);

} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
