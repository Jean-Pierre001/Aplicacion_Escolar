<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $schedule_id          = $_POST['schedule_id'];
    $course_id            = $_POST['course_id'];
    $subject_id           = $_POST['subject_id'];
    $teacher_id           = $_POST['teacher_id'];
    $substitute_teacher   = !empty($_POST['substitute_teacher_id']) ? $_POST['substitute_teacher_id'] : null;
    $classroom_id         = !empty($_POST['classroom_id']) ? $_POST['classroom_id'] : null;
    $weekday              = $_POST['weekday'];
    $start_time           = $_POST['start_time'];
    $end_time             = $_POST['end_time'];
    $group_id             = !empty($_POST['group_id']) ? $_POST['group_id'] : null;

    try {
        $sql = "UPDATE schedules 
                SET course_id = :course_id,
                    subject_id = :subject_id,
                    teacher_id = :teacher_id,
                    substitute_teacher_id = :substitute_teacher_id,
                    classroom_id = :classroom_id,
                    weekday = :weekday,
                    start_time = :start_time,
                    end_time = :end_time,
                    group_id = :group_id
                WHERE schedule_id = :schedule_id";

        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ':course_id'           => $course_id,
            ':subject_id'          => $subject_id,
            ':teacher_id'          => $teacher_id,
            ':substitute_teacher_id' => $substitute_teacher,
            ':classroom_id'        => $classroom_id,
            ':weekday'             => $weekday,
            ':start_time'          => $start_time,
            ':end_time'            => $end_time,
            ':group_id'            => $group_id,
            ':schedule_id'         => $schedule_id
        ]);

        header("Location: ../schedules.php");
        exit;

    } catch (PDOException $e) {
        die("❌ Error al editar horario: " . $e->getMessage());
    }
} else {
    header("Location: ../schedules.php");
    exit;
}
?>
