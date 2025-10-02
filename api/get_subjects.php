<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;

if (!$course_id) {
    echo json_encode([]);
    exit;
}

try {
    $stmt = $conn->prepare("SELECT subject_id, name FROM subjects WHERE course_id = :course_id ORDER BY name ASC");
    $stmt->execute([':course_id' => $course_id]);
    $subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($subjects);
} catch (PDOException $e) {
    echo json_encode([]);
}
?>
