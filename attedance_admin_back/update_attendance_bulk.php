<?php
include '../includes/conn.php';

$updated = [];

try {
    foreach ($_POST['status'] as $attendance_id => $status) {

        // Manejo de justificación (checkbox)
        $justified = isset($_POST['justification'][$attendance_id]) ? 1 : 0;

        // Manejo de archivo
        $filePath = null;
        if (isset($_FILES['file']['name'][$attendance_id]) && $_FILES['file']['name'][$attendance_id] !== '') {
            $filename = time() . "_" . basename($_FILES['file']['name'][$attendance_id]);
            $targetDir = '../uploads/';
            if (!is_dir($targetDir)) mkdir($targetDir, 0777, true);
            move_uploaded_file($_FILES['file']['tmp_name'][$attendance_id], $targetDir.$filename);
            $filePath = 'uploads/'.$filename;
        }

        // Buscar registro primero en student_attendance, luego en teacher_attendance
        $stmtStudent = $conn->prepare("SELECT * FROM student_attendance WHERE id = ? LIMIT 1");
        $stmtStudent->execute([$attendance_id]);
        $record = $stmtStudent->fetch(PDO::FETCH_ASSOC);

        if ($record) {
            $table = 'student_attendance';
        } else {
            $stmtTeacher = $conn->prepare("SELECT * FROM teacher_attendance WHERE id = ? LIMIT 1");
            $stmtTeacher->execute([$attendance_id]);
            $record = $stmtTeacher->fetch(PDO::FETCH_ASSOC);
            if ($record) {
                $table = 'teacher_attendance';
            } else {
                // No existe registro, saltamos
                continue;
            }
        }

        // Preparar actualización
        $updateFields = [];
        $updateValues = [];

        // Solo actualizamos el status y updated_at si cambia
        if ($record['status'] != $status) {
            $updateFields[] = "status = ?";
            $updateValues[] = $status;
            $updateFields[] = "updated_at = NOW()";
        }

        // Actualizar justificación siempre
        if ($record['justification'] != $justified) {
            $updateFields[] = "justification = ?";
            $updateValues[] = $justified;
        }

        // Actualizar archivo si se subió uno nuevo
        if ($filePath) {
            $updateFields[] = "justification_file = ?";
            $updateValues[] = $filePath;
        }

        // Ejecutar actualización
        if (!empty($updateFields)) {
            $sql = "UPDATE $table SET " . implode(', ', $updateFields) . " WHERE id = ?";
            $updateValues[] = $attendance_id;
            $stmtUpdate = $conn->prepare($sql);
            $stmtUpdate->execute($updateValues);
            $updated[] = ['attendance_id' => $attendance_id];
        }
    }

    echo json_encode(['success' => true, 'updated' => $updated]);

} catch(PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>
