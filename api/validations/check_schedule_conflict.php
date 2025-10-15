<?php
require '../../includes/conn.php';

$classroom_id = $_GET['classroom_id'];
$weekday = $_GET['weekday'];
$start_time = $_GET['start_time'];
$end_time = $_GET['end_time'];

// Verificar conflictos
$stmt = $conn->prepare("
    SELECT COUNT(*) as total
    FROM schedules
    WHERE classroom_id = :classroom_id
      AND weekday = :weekday
      AND (
        (start_time <= :start_time AND end_time > :start_time) OR
        (start_time < :end_time AND end_time >= :end_time) OR
        (start_time >= :start_time AND end_time <= :end_time)
      )
");
$stmt->execute([
    ':classroom_id' => $classroom_id,
    ':weekday' => $weekday,
    ':start_time' => $start_time,
    ':end_time' => $end_time
]);
$result = $stmt->fetch();

echo json_encode(['conflict' => $result['total'] > 0]);
