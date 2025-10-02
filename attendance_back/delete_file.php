<?php
include '../includes/conn.php';

$attendance_id = $_POST['attendance_id'] ?? null;
$file_path = $_POST['file_path'] ?? null;

if (!$attendance_id || !$file_path) {
    echo json_encode(['success'=>false, 'error'=>'Faltan parámetros']);
    exit;
}

// Borrar físicamente el archivo
if(file_exists($file_path)){
    unlink($file_path);
}

// Actualizar DB
$stmt = $conn->prepare("UPDATE attendance SET justification_file = NULL WHERE attendance_id = ?");
if($stmt->execute([$attendance_id])){
    echo json_encode(['success'=>true]);
} else {
    echo json_encode(['success'=>false, 'error'=>'No se pudo actualizar la base de datos']);
}
