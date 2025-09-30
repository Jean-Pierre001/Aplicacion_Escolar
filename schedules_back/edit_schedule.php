<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $schedule_id = $_POST['schedule_id'] ?? null;
    $course_id = $_POST['course_id'] ?? null;
    $subject_id = $_POST['subject_id'] ?? null;
    $teacher_id = $_POST['teacher_id'] ?? null;
    $weekday = $_POST['weekday'] ?? null;
    $start_time = $_POST['start_time'] ?? null;
    $end_time = $_POST['end_time'] ?? null;

    if ($schedule_id && $course_id && $subject_id && $teacher_id && $weekday && $start_time && $end_time) {
        $sql = "UPDATE schedules SET course_id = :course_id, subject_id = :subject_id, teacher_id = :teacher_id,
                weekday = :weekday, start_time = :start_time, end_time = :end_time
                WHERE schedule_id = :schedule_id";
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ':course_id' => $course_id,
            ':subject_id' => $subject_id,
            ':teacher_id' => $teacher_id,
            ':weekday' => $weekday,
            ':start_time' => $start_time,
            ':end_time' => $end_time,
            ':schedule_id' => $schedule_id
        ]);
    }
}

header('Location: ../index_schedules.php');
exit;
?>
