<?php
include '../includes/conn.php';

$course_id = $_POST['course_id'] ?? 0;
$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? null;
$year = $_POST['year'] ?? 0;
$shift = $_POST['shift'] ?? '';

try {
    $sql = "UPDATE courses SET name = :name, description = :description, year = :year, shift = :shift WHERE course_id = :course_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':description' => $description,
        ':year' => $year,
        ':shift' => $shift,
        ':course_id' => $course_id
    ]);
    header("Location: ../index_courses.php");
    exit();
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
