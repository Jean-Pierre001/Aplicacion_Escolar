<?php
include '../includes/conn.php';

try {
    if (empty($_POST['course_id']) || empty($_POST['subject_id']) || empty($_POST['attendance_date']) || empty($_POST['data'])) {
        throw new Exception('Faltan datos requeridos.');
    }

    $course_id = $_POST['course_id'];
    $subject_id = $_POST['subject_id'];
    $attendance_date = $_POST['attendance_date'];
    $data = $_POST['data'];

    $stmt = $conn->prepare("INSERT INTO attendance (student_id, course_id, subject_id, status, attendance_date, attendance_time, justification, justification_file) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

    foreach ($data as $item) {
        $student_id = $item['student_id'];
        $status = $item['status'];
        $justification = $item['justification'] ?? 0;

        // Manejo del archivo
        $justification_file_path = null;
        if (isset($_FILES['data']) && isset($_FILES['data']['name'])) {
            $fileKey = array_search($student_id, array_column($data, 'student_id'));
            if ($fileKey !== false && !empty($_FILES['data']['name'][$fileKey]['justification_file'])) {
                $tmpName = $_FILES['data']['tmp_name'][$fileKey]['justification_file'];
                $filename = basename($_FILES['data']['name'][$fileKey]['justification_file']);
                $uploadDir = '../uploads/justifications/';
                if (!is_dir($uploadDir)) mkdir($uploadDir, 0777, true);
                move_uploaded_file($tmpName, $uploadDir . $filename);
                $justification_file_path = 'uploads/justifications/' . $filename;
            }
        }

        $stmt->execute([
            $student_id,
            $course_id,
            $subject_id,
            $status,
            $attendance_date,
            date('H:i:s'),
            $justification,
            $justification_file_path
        ]);
    }

    echo json_encode(['success' => true]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
