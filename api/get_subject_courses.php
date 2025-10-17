<?php
include '../includes/conn.php';

if (!isset($_GET['subject_id'])) {
    echo json_encode([]);
    exit;
}

$subject_id = intval($_GET['subject_id']);

$stmt = $conn->prepare("SELECT course_id FROM subject_courses WHERE subject_id = ?");
$stmt->execute([$subject_id]);

echo json_encode($stmt->fetchAll(PDO::FETCH_COLUMN));
?>
