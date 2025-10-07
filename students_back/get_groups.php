<?php
include '../includes/conn.php'; // tu conexión PDO

$course_id = $_GET['course_id'] ?? 0;

$stmt = $conn->prepare("SELECT group_id, name FROM groups WHERE course_id = ?");
$stmt->execute([$course_id]);
$groups = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($groups);
