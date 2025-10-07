<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $course_id  = $_POST['course_id'] ?? null;
    $subject_id = $_POST['subject_id'] ?? null;
    $teacher_id = $_POST['teacher_id'] ?? null;
    $weekday    = $_POST['weekday'] ?? null;
    $start_time = $_POST['start_time'] ?? null;
    $end_time   = $_POST['end_time'] ?? null;
    $group_id   = !empty($_POST['group_id']) ? $_POST['group_id'] : null; // ✅ si está vacío, será NULL

    // Verificar solo los campos obligatorios
    if ($course_id && $subject_id && $teacher_id && $weekday && $start_time && $end_time) {
        try {
            $sql = "INSERT INTO schedules (course_id, subject_id, teacher_id, weekday, start_time, end_time, group_id)
                    VALUES (:course_id, :subject_id, :teacher_id, :weekday, :start_time, :end_time, :group_id)";

            $stmt = $conn->prepare($sql);
            $stmt->execute([
                ':course_id'  => $course_id,
                ':subject_id' => $subject_id,
                ':teacher_id' => $teacher_id,
                ':weekday'    => $weekday,
                ':start_time' => $start_time,
                ':end_time'   => $end_time,
                ':group_id'   => $group_id // puede ser NULL
            ]);
        } catch (PDOException $e) {
            die("❌ Error al agregar horario: " . $e->getMessage());
        }
    }
}

header('Location: ../schedules.php');
exit;
?>
