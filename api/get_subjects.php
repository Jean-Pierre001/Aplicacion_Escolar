<?php
include '../includes/conn.php';
date_default_timezone_set('America/Argentina/Salta');

$course_id = $_GET['course_id'] ?? null;
if (!$course_id) {
  echo json_encode([]);
  exit;
}

$today = (new DateTime())->format('Y-m-d');
$weekday = strtolower((new DateTime())->format('l'));

// Traemos las materias del curso que tengan clase hoy
$sql = "
    SELECT 
        s.subject_id,
        s.name AS subject_name,
        t.teacher_id,
        t.first_name AS teacher_fname,
        t.last_name AS teacher_lname,
        CASE 
            WHEN sa.id IS NOT NULL THEN 'done'
            ELSE 'pending'
        END AS status
    FROM schedules sch
    JOIN subjects s 
        ON s.subject_id = sch.subject_id
    JOIN teachers t 
        ON t.teacher_id = sch.teacher_id
    LEFT JOIN student_attendance sa
        ON sa.schedule_id = sch.schedule_id
        AND sa.attendance_date = :today
    WHERE sch.course_id = :course_id
      AND sch.weekday = :weekday
    GROUP BY s.subject_id
    ORDER BY s.name
";

$stmt = $conn->prepare($sql);
$stmt->bindValue(':today', $today);
$stmt->bindValue(':weekday', $weekday);
$stmt->bindValue(':course_id', $course_id);
$stmt->execute();

$subjects = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Si no hay clases hoy, devolvemos "no_class"
if (empty($subjects)) {
    $allSubjects = $conn->query("SELECT subject_id, name FROM subjects WHERE course_id = $course_id ORDER BY name")->fetchAll(PDO::FETCH_ASSOC);
    foreach ($allSubjects as &$subj) {
        $subj['status'] = 'no_class';
        $subj['teacher_id'] = null;
        $subj['teacher_fname'] = null;
        $subj['teacher_lname'] = null;
    }
    $subjects = $allSubjects;
}

echo json_encode($subjects);
?>
