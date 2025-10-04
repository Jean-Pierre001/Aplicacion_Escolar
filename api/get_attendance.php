<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$attendance_date = $_GET['attendance_date'] ?? date('Y-m-d');

if (!$course_id || !$subject_id) {
  echo '<p class="p-4 text-gray-500">Faltan parámetros.</p>';
  exit;
}

// Verificar si ya se tomó asistencia para alumnos o profesor
$stmtCheck = $conn->prepare("
  SELECT 
    (SELECT COUNT(*) FROM student_attendance sa 
     JOIN schedules sc ON sa.schedule_id = sc.schedule_id
     WHERE sc.course_id = ? AND sc.subject_id = ? AND sa.attendance_date = ?) AS student_count,
    (SELECT COUNT(*) FROM teacher_attendance ta
     JOIN schedules sc2 ON ta.schedule_id = sc2.schedule_id
     WHERE sc2.course_id = ? AND sc2.subject_id = ? AND ta.attendance_date = ?) AS teacher_count
");
$stmtCheck->execute([$course_id, $subject_id, $attendance_date, $course_id, $subject_id, $attendance_date]);
$exists = $stmtCheck->fetch(PDO::FETCH_ASSOC);

if ($exists['student_count'] > 0 || $exists['teacher_count'] > 0) {
  echo '<div class="p-8 text-center">
          <h2 class="text-3xl md:text-4xl font-bold text-red-600">
            Ya se tomó la asistencia de esta clase en la fecha seleccionada.
          </h2>
        </div>';
  exit;
}

$weekday = strtolower(date('l', strtotime($attendance_date)));
$stmtHorario = $conn->prepare("SELECT * FROM schedules WHERE course_id=? AND subject_id=? AND weekday=? LIMIT 1");
$stmtHorario->execute([$course_id, $subject_id, $weekday]);
$schedule = $stmtHorario->fetch();

if (!$schedule) {
  echo '<div class="p-8 text-center"><h2 class="text-2xl md:text-3xl font-bold text-gray-600">La clase no se dicta en la fecha seleccionada.</h2></div>';
  exit;
}

echo "<div class='overflow-x-auto rounded-lg shadow-lg border border-gray-200'>
      <table class='min-w-full border-collapse'>
      <thead class='text-white bg-gray-800'>
        <tr>
          <th class='px-6 py-3 border-r'>Tipo</th>
          <th class='px-6 py-3 border-r'>Nombre</th>
          <th class='px-6 py-3 border-r'>Apellido</th>
          <th class='px-6 py-3 border-r text-center'>Presente <br><input type='checkbox' id='checkAllPresent'></th>
          <th class='px-6 py-3 border-r text-center'>Justificación</th>
          <th class='px-6 py-3 text-center'>Archivo</th>
        </tr>
      </thead>
      <tbody>";

/* Profesor */
$stmtTeacher = $conn->prepare("SELECT t.teacher_id, t.first_name, t.last_name FROM teachers t WHERE t.teacher_id = ?");
$stmtTeacher->execute([$schedule['teacher_id']]);
$teacher = $stmtTeacher->fetch();
if ($teacher) {
  echo "<tr class='bg-yellow-50' data-type='teacher' data-id='{$teacher['teacher_id']}'>
          <td class='px-6 py-4 border-r text-center font-bold text-yellow-700'>Profesor</td>
          <td class='px-6 py-4 border-r'>{$teacher['first_name']}</td>
          <td class='px-6 py-4 border-r'>{$teacher['last_name']}</td>
          <td class='px-6 py-4 border-r text-center'><input type='checkbox' class='present-checkbox'></td>
          <td class='px-6 py-4 border-r text-center'><input type='checkbox' class='justification-checkbox'></td>
          <td class='px-6 py-4 text-center'><input type='file' name='justification_file'></td>
        </tr>";
}

/* Alumnos */
$stmtStudents = $conn->prepare("SELECT student_id, first_name, last_name FROM students WHERE course_id = ?");
$stmtStudents->execute([$course_id]);
$students = $stmtStudents->fetchAll();

foreach ($students as $i => $student) {
  $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
  echo "<tr class='{$rowClass}' data-type='student' data-id='{$student['student_id']}'>
          <td class='px-6 py-4 border-r text-center'>Alumno</td>
          <td class='px-6 py-4 border-r'>{$student['first_name']}</td>
          <td class='px-6 py-4 border-r'>{$student['last_name']}</td>
          <td class='px-6 py-4 border-r text-center'><input type='checkbox' class='present-checkbox'></td>
          <td class='px-6 py-4 border-r text-center'><input type='checkbox' class='justification-checkbox'></td>
          <td class='px-6 py-4 text-center'><input type='file' name='justification_file'></td>
        </tr>";
}

echo "</tbody></table></div>";
