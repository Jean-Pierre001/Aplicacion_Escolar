<?php
include '../includes/conn.php';

$course_id = $_GET['id'] ?? 0;

try {
    $sql = "DELETE FROM courses WHERE course_id = :course_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute([':course_id' => $course_id]);
    header("Location: ../index_courses.php");
    exit();
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
