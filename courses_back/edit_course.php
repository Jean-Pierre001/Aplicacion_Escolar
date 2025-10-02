<?php
include '../includes/conn.php';

$course_id = $_POST['course_id'] ?? 0;
$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? null;
$technical_degree = $_POST['technical_degree'] ?? null;

try {
    $sql = "UPDATE courses SET name = :name, description = :description, technical_degree = :technical_degree WHERE course_id = :course_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':description' => $description,
        ':technical_degree' => $technical_degree,
        ':course_id' => $course_id
    ]);
    header("Location: ../courses.php");
    exit();
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
