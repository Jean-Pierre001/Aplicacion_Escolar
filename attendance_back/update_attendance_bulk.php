<?php
include '../includes/conn.php';

$updated = [];

try {
    foreach ($_POST['status'] as $attendance_id => $status) {
        $justified = isset($_POST['justification'][$attendance_id]) ? 1 : 0;
        $time = date('H:i:s');

        // Archivo
        $filePath = null;
        if(isset($_FILES['file']['name'][$attendance_id]) && $_FILES['file']['name'][$attendance_id] !== '') {
            $filename = time() . "_" . basename($_FILES['file']['name'][$attendance_id]);
            $targetDir = '../uploads/';
            if(!is_dir($targetDir)) mkdir($targetDir, 0777, true);
            move_uploaded_file($_FILES['file']['tmp_name'][$attendance_id], $targetDir.$filename);
            $filePath = 'uploads/'.$filename;
        }

        // Actualizar DB
        if($filePath) {
            $stmt = $conn->prepare("UPDATE attendance SET status = ?, attendance_time = ?, justification = ?, justification_file = ? WHERE attendance_id = ?");
            $stmt->execute([$status, $time, $justified, $filePath, $attendance_id]);
        } else {
            $stmt = $conn->prepare("UPDATE attendance SET status = ?, attendance_time = ?, justification = ? WHERE attendance_id = ?");
            $stmt->execute([$status, $time, $justified, $attendance_id]);
        }

        $updated[] = ['attendance_id'=>$attendance_id, 'attendance_time'=>$time];
    }

    echo json_encode(['success'=>true, 'updated'=>$updated]);

} catch(PDOException $e) {
    echo json_encode(['success'=>false, 'error'=>$e->getMessage()]);
}
