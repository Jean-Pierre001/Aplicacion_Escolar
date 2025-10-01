<?php
include '../includes/conn.php';

$data = json_decode(file_get_contents('php://input'), true);

$attendance_id = $data['attendance_id'] ?? null;
$status = $data['status'] ?? null;

if(!$attendance_id || !in_array($status, ['present','absent'])){
    echo json_encode(['success'=>false, 'error'=>'Datos inválidos']);
    exit;
}

$stmt = $conn->prepare("UPDATE attendance SET status=? WHERE attendance_id=?");
$success = $stmt->execute([$status, $attendance_id]);

echo json_encode(['success'=>$success]);
