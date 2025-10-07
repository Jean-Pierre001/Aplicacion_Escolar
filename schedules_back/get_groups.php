<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
if (!$course_id) {
    echo json_encode([]);
    exit;
}

$stmt = $conn->prepare("SELECT group_id, name FROM groups WHERE course_id = ?");
$stmt->execute([$course_id]);
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
