<?php
include '../includes/conn.php';

$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? null;
$technical_degree = $_POST['technical_degree'] ?? null;

try {
    $sql = "INSERT INTO courses (name, description, technical_degree) VALUES (:name, :description, :technical_degree)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':description' => $description,
        ':technical_degree' => $technical_degree
    ]);
    header("Location: ../courses.php");
    exit();
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
