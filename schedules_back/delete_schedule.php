<?php
include '../includes/conn.php';

$schedule_id = $_GET['id'] ?? null;

if ($schedule_id) {
    $sql = "DELETE FROM schedules WHERE schedule_id = :schedule_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute([':schedule_id' => $schedule_id]);
}

header('Location: ../index_schedules.php');
exit;
?>
