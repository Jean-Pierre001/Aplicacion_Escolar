<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? 0;

$stmt = $conn->prepare("SELECT * FROM groups WHERE course_id = ? ORDER BY group_id ASC");
$stmt->execute([$course_id]);
$groups = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($groups);
