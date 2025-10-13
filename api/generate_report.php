<?php
include '../includes/conn.php';

try {
    if (empty($_POST['course_id']) || empty($_POST['subject_id']) || empty($_POST['attendance_date']) || empty($_POST['data'])) {
        throw new Exception('Faltan datos requeridos.');
    }

    $course_id = $_POST['course_id'];
    $subject_id = $_POST['subject_id'];
    $attendance_date = $_POST['attendance_date']; // Ahora puede ser DATETIME
    $data = $_POST['data'];

    // Buscar schedule correspondiente
    $weekday = strtolower(date('l', strtotime($attendance_date)));
    $stmt = $conn->prepare("SELECT schedule_id FROM schedules WHERE course_id=? AND subject_id=? AND weekday=? LIMIT 1");
    $stmt->execute([$course_id, $subject_id, $weekday]);
    $schedule = $stmt->fetch();

    if (!$schedule) throw new Exception('No existe horario para esa fecha.');

    $schedule_id = $schedule['schedule_id'];

    foreach ($data as $index => $item) {
        $type = $item['type']; // teacher o student
        $id = $item['id'];
        $status = $item['status']; // Tomamos directamente el estado del checkbox
        $justification = $item['justification'] ?? 0;

        $uploadPath = null;
        if (isset($_FILES['data']['name'][$index]['justification_file']) && $_FILES['data']['name'][$index]['justification_file'] != '') {
            $filename = time() . "_" . basename($_FILES['data']['name'][$index]['justification_file']);
            $uploadDir = '../uploads/justifications/';
            if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);
            $tmpName = $_FILES['data']['tmp_name'][$index]['justification_file'];
            move_uploaded_file($tmpName, $uploadDir . $filename);
            $uploadPath = 'uploads/justifications/' . $filename;
        }

        if ($type === 'teacher') {
            $stmtInsert = $conn->prepare("
                INSERT INTO teacher_attendance 
                (teacher_id, schedule_id, attendance_date, status, justification, justification_file) 
                VALUES (?, ?, ?, ?, ?, ?)
            ");
            $stmtInsert->execute([$id, $schedule_id, $attendance_date, $status, $justification, $uploadPath]);
        } else {
            $stmtInsert = $conn->prepare("
                INSERT INTO student_attendance 
                (student_id, schedule_id, attendance_date, status, justification, justification_file) 
                VALUES (?, ?, ?, ?, ?, ?)
            ");
            $stmtInsert->execute([$id, $schedule_id, $attendance_date, $status, $justification, $uploadPath]);
        }
    }

    echo json_encode(['success' => true]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
