<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$attendance_date = $_GET['attendance_date'] ?? date('Y-m-d'); // Por defecto hoy

if (!$course_id || !$subject_id) {
    echo '<p class="p-4 text-gray-500">Faltan parámetros.</p>';
    exit;
}

// Verificar si ya se tomó asistencia para este curso, materia y fecha
$stmtCheck = $conn->prepare("SELECT COUNT(*) FROM attendance WHERE course_id = ? AND subject_id = ? AND attendance_date = ?");
$stmtCheck->execute([$course_id, $subject_id, $attendance_date]);
$exists = (int)$stmtCheck->fetchColumn();

if ($exists > 0) {
    echo '<div class="p-8 text-center">
            <h2 class="text-3xl md:text-4xl font-bold text-red-600">
                Ya se tomó la asistencia de esta clase en la fecha seleccionada.
            </h2>
          </div>';
    exit;
}

// ---- Aquí usamos TU tabla `schedules` ----
// Comprobamos si existe un schedule para el día seleccionado (weekday).
// La tabla `schedules` tiene `weekday` = 'monday','tuesday',... así que generamos el weekday en minúsculas en inglés.
$weekday = strtolower(date('l', strtotime($attendance_date))); // 'monday', 'tuesday', ...

$stmtHorario = $conn->prepare("SELECT COUNT(*) FROM schedules WHERE course_id = ? AND subject_id = ? AND weekday = ?");
$stmtHorario->execute([$course_id, $subject_id, $weekday]);
$hasSchedule = (int)$stmtHorario->fetchColumn();

if ($hasSchedule === 0) {
    echo '<div class="p-8 text-center">
            <h2 class="text-2xl md:text-3xl font-bold text-gray-600">
                La clase no se dicta en la fecha seleccionada.
            </h2>
          </div>';
    exit;
}

// Si hay schedule (en ese día), traemos alumnos del curso
$stmt = $conn->prepare("SELECT student_id, first_name, last_name FROM students WHERE course_id = ?");
$stmt->execute([$course_id]);
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$students) {
    echo '<p class="p-4 text-gray-500">No hay estudiantes en este curso.</p>';
    exit;
}

// Mostrar tabla
echo "<div class='overflow-x-auto rounded-lg shadow-lg border border-gray-200'>
        <table class='min-w-full border-collapse'>
        <thead class='text-white bg-gray-800'>
        <tr>
          <th class='px-6 py-3 border-r border-gray-300 text-left'>ID</th>
          <th class='px-6 py-3 border-r border-gray-300 text-left'>Nombre</th>
          <th class='px-6 py-3 border-r border-gray-300 text-left'>Apellido</th>
          <th class='px-6 py-3 border-r border-gray-300 text-center'>
            Presente<br>
            <input type='checkbox' id='checkAllPresent' class='form-checkbox'>
          </th>
          <th class='px-6 py-3 border-r border-gray-300 text-center'>
            Justificación<br>
          </th>
          <th class='px-6 py-3 text-center'>Archivo</th>
        </tr>
        </thead>
        <tbody>";

foreach ($students as $i => $student) {
    $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
    echo "<tr class='hover:bg-gray-100 {$rowClass}' data-student-id='{$student['student_id']}'>
            <td class='px-6 py-4 border-r border-gray-300'>{$student['student_id']}</td>
            <td class='px-6 py-4 border-r border-gray-300'>{$student['first_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300'>{$student['last_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>
                <input type='checkbox' name='present' class='present-checkbox form-checkbox' />
            </td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>
                <input type='checkbox' name='justification' class='justification-checkbox form-checkbox' />
            </td>
            <td class='px-6 py-4 text-center'>
                <input type='file' name='justification_file' class='form-input' />
            </td>
          </tr>";
}

echo "</tbody></table></div>";
