<?php
include '../includes/conn.php';

$input = json_decode(file_get_contents('php://input'), true);

// Verificar si hay datos
if (!$input) {
    echo json_encode(['success' => false, 'error' => 'No se recibieron datos.']);
    exit;
}

$course_id = $input['course_id'] ?? null;
$subject_id = $input['subject_id'] ?? null;
$attendance_date = $input['attendance_date'] ?? date('Y-m-d');
$data = $input['data'] ?? [];

if (!$course_id || !$subject_id || empty($data)) {
    echo json_encode(['success' => false, 'error' => 'Faltan datos requeridos.']);
    exit;
}

try {
    $stmt = $conn->prepare("INSERT INTO attendance (student_id, course_id, subject_id, status, attendance_date, attendance_time) VALUES (?, ?, ?, ?, ?, ?)");
    foreach ($data as $item) {
        $stmt->execute([
            $item['student_id'],
            $course_id,
            $subject_id,
            $item['status'],
            $attendance_date,
            date('H:i:s')
        ]);
    }
    echo json_encode(['success' => true]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
