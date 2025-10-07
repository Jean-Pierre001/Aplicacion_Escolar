<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $course_id = $_POST['course_id'];
    $name = $_POST['name'];
    $description = $_POST['description'] ?? null;

    $stmt = $conn->prepare("INSERT INTO groups (course_id, name, description) VALUES (?, ?, ?)");
    $stmt->execute([$course_id, $name, $description]);

    header("Location: ../courses.php");
    exit;
}
