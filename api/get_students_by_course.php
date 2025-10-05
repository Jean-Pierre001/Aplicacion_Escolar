<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;

if (!$course_id) {
    echo json_encode([]);
    exit;
}

try {
    $stmt = $conn->prepare("SELECT student_id, first_name, last_name FROM students WHERE course_id = :course_id ORDER BY last_name, first_name ASC");
    $stmt->execute([':course_id' => $course_id]);
    $students = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($students);
} catch (PDOException $e) {
    echo json_encode([]);
}
?>
