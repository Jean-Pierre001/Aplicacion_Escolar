<?php
include '../includes/conn.php';

$group_id = $_GET['id'] ?? 0;

$stmt = $conn->prepare("DELETE FROM groups WHERE group_id = ?");
$stmt->execute([$group_id]);

header("Location: ../courses.php");
exit;
