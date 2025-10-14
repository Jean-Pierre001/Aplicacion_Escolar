<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $course_id           = $_POST['course_id'] ?? null;
    $subject_id          = $_POST['subject_id'] ?? null;
    $teacher_id          = $_POST['teacher_id'] ?? null;
    $substitute_teacher  = !empty($_POST['substitute_teacher_id']) ? $_POST['substitute_teacher_id'] : null;
    $classroom_id        = !empty($_POST['classroom_id']) ? $_POST['classroom_id'] : null;
    $weekday             = $_POST['weekday'] ?? null;
    $start_time          = $_POST['start_time'] ?? null;
    $end_time            = $_POST['end_time'] ?? null;
    $group_id            = !empty($_POST['group_id']) ? $_POST['group_id'] : null;

    // Verificar campos obligatorios
    if ($course_id && $subject_id && $teacher_id && $weekday && $start_time && $end_time) {
        try {
            $sql = "INSERT INTO schedules 
                    (course_id, subject_id, teacher_id, substitute_teacher_id, classroom_id, weekday, start_time, end_time, group_id)
                    VALUES (:course_id, :subject_id, :teacher_id, :substitute_teacher_id, :classroom_id, :weekday, :start_time, :end_time, :group_id)";

            $stmt = $conn->prepare($sql);
            $stmt->execute([
                ':course_id'          => $course_id,
                ':subject_id'         => $subject_id,
                ':teacher_id'         => $teacher_id,
                ':substitute_teacher_id' => $substitute_teacher,
                ':classroom_id'       => $classroom_id,
                ':weekday'            => $weekday,
                ':start_time'         => $start_time,
                ':end_time'           => $end_time,
                ':group_id'           => $group_id
            ]);
        } catch (PDOException $e) {
            die("❌ Error al agregar horario: " . $e->getMessage());
        }
    }
}

header('Location: ../schedules.php');
exit;
?>
