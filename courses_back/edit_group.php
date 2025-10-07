<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $group_id = $_POST['group_id'];
    $name = $_POST['name'];
    $description = $_POST['description'] ?? null;

    $stmt = $conn->prepare("UPDATE groups SET name = ?, description = ? WHERE group_id = ?");
    $stmt->execute([$name, $description, $group_id]);

    header("Location: ../courses.php");
    exit;
}
