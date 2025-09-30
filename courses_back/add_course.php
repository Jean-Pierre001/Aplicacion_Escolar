<?php
include '../includes/conn.php';

$name = $_POST['name'] ?? '';
$description = $_POST['description'] ?? null;
$year = $_POST['year'] ?? 0;
$shift = $_POST['shift'] ?? '';

try {
    $sql = "INSERT INTO courses (name, description, year, shift) VALUES (:name, :description, :year, :shift)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':description' => $description,
        ':year' => $year,
        ':shift' => $shift
    ]);
    header("Location: ../courses.php");
    exit();
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
