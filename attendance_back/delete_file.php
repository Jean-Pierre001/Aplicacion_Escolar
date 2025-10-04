<?php
include '../includes/conn.php';

if($_SERVER['REQUEST_METHOD'] !== 'POST'){
    echo json_encode(['success'=>false,'error'=>'Método no permitido']);
    exit;
}

$attendance_id = $_POST['attendance_id'] ?? null;
$justification_file = $_POST['justification_file'] ?? null;

if(!$attendance_id || !$justification_file){
    echo json_encode(['success'=>false,'error'=>'Faltan parámetros']);
    exit;
}

// Ruta absoluta para eliminar el archivo
$full_path = __DIR__ . '/../' . $justification_file;

if(file_exists($full_path)){
    if(!unlink($full_path)){
        echo json_encode(['success'=>false,'error'=>'No se pudo eliminar el archivo físico']);
        exit;
    }
}

// Actualizar la DB (ahora se puede aplicar a alumnos y profesores)
$stmt = $conn->prepare("UPDATE student_attendance SET justification_file = NULL WHERE id = ?");
if($stmt->execute([$attendance_id])){
    echo json_encode(['success'=>true]);
} else {
    echo json_encode(['success'=>false,'error'=>'No se pudo actualizar la base de datos']);
}
