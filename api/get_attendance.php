<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$attendance_date = $_GET['attendance_date'] ?? date('Y-m-d');
$group_id = $_GET['group_id'] ?? null;

if (!$course_id || !$subject_id) {
    echo '<p class="p-4 text-red-600">Faltan parámetros.</p>';
    exit;
}

// Verificar si ya se tomó asistencia
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

echo "<div class='overflow-x-auto rounded-lg shadow border border-gray-200 bg-white'>
        <table class='min-w-full text-sm text-gray-700 border-collapse'>
          <thead class='bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300'>
            <tr>
              <th class='px-6 py-3 border-r text-center'>Tipo</th>
              <th class='px-6 py-3 border-r text-left'>Nombre</th>
              <th class='px-6 py-3 border-r text-left'>Apellido</th>
              <th class='px-6 py-3 border-r text-center'>Presente <br><input type='checkbox' id='checkAllPresent' class='accent-blue-600'></th>
              <th class='px-6 py-3 border-r text-center'>Justificación</th>
              <th class='px-6 py-3 text-center'>Archivo</th>
            </tr>
          </thead>
          <tbody>";

// ----- Profesor -----
$stmtTeacher = $conn->prepare("SELECT teacher_id, first_name, last_name FROM teachers WHERE teacher_id = ?");
$stmtTeacher->execute([$schedule['teacher_id']]);
$teacher = $stmtTeacher->fetch();
if ($teacher) {
    echo "<tr class='bg-gray-50 hover:bg-gray-100 font-medium' data-type='teacher' data-id='{$teacher['teacher_id']}'>
            <td class='px-6 py-3 border-r text-center text-yellow-700 font-bold'>Profesor</td>
            <td class='px-6 py-3 border-r'>{$teacher['first_name']}</td>
            <td class='px-6 py-3 border-r'>{$teacher['last_name']}</td>
            <td class='px-6 py-3 border-r text-center'><input type='checkbox' class='present-checkbox w-5 h-5 accent-blue-600'></td>
            <td class='px-6 py-3 border-r text-center'><input type='checkbox' class='justification-checkbox w-5 h-5 accent-blue-600'></td>
            <td class='px-6 py-3 text-center'><input type='file' name='justification_file' class='block w-full text-sm text-gray-700 border border-gray-300 rounded-md cursor-pointer bg-gray-50 focus:ring-1 focus:ring-blue-300'></td>
          </tr>";
}

// ----- Alumnos -----
$sqlStudents = "SELECT student_id, first_name, last_name FROM students WHERE course_id = ?";
$params = [$course_id];
if ($group_id) {
    $sqlStudents .= " AND group_id = ?";
    $params[] = $group_id;
}
$stmtStudents = $conn->prepare($sqlStudents);
$stmtStudents->execute($params);
$students = $stmtStudents->fetchAll();

foreach ($students as $i => $student) {
    $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
    echo "<tr class='{$rowClass} hover:bg-gray-100 font-medium' data-type='student' data-id='{$student['student_id']}'>
            <td class='px-6 py-3 border-r text-center'>Alumno</td>
            <td class='px-6 py-3 border-r'>{$student['first_name']}</td>
            <td class='px-6 py-3 border-r'>{$student['last_name']}</td>
            <td class='px-6 py-3 border-r text-center'><input type='checkbox' class='present-checkbox w-5 h-5 accent-blue-600'></td>
            <td class='px-6 py-3 border-r text-center'><input type='checkbox' class='justification-checkbox w-5 h-5 accent-blue-600'></td>
            <td class='px-6 py-3 text-center'><input type='file' name='justification_file' class='block w-full text-sm text-gray-700 border border-gray-300 rounded-md cursor-pointer bg-gray-50 focus:ring-1 focus:ring-blue-300'></td>
          </tr>";
}

echo "  </tbody>
        </table>
      </div>";
?>
