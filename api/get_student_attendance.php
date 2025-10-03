<?php
include '../includes/conn.php';

$student_id = $_GET['student_id'] ?? null;

if (!$student_id) {
    echo '<p class="p-4 text-gray-500">No se seleccionó ningún alumno.</p>';
    exit;
}

// Traemos todas las asistencias de ese alumno con JOIN a cursos y materias
$stmt = $conn->prepare("
    SELECT a.attendance_date, a.status, a.justification, a.justification_file,
           c.name AS course_name, s.name AS subject_name
    FROM attendance a
    INNER JOIN courses c ON a.course_id = c.course_id
    INNER JOIN subjects s ON a.subject_id = s.subject_id
    WHERE a.student_id = ?
    ORDER BY a.attendance_date DESC
");
$stmt->execute([$student_id]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$records) {
    echo '<p class="p-4 text-gray-500">Este alumno no tiene registros de asistencia.</p>';
    exit;
}

// Tabla
echo "<div class='overflow-x-auto rounded-lg shadow-lg border border-gray-200'>
        <table class='min-w-full border-collapse'>
        <thead class='text-white bg-gray-800'>
        <tr>
          <th class='px-6 py-3 border-r border-gray-300 text-left'>Fecha</th>
          <th class='px-6 py-3 border-r border-gray-300 text-left'>Curso</th>
          <th class='px-6 py-3 border-r border-gray-300 text-left'>Materia</th>
          <th class='px-6 py-3 border-r border-gray-300 text-center'>Estado</th>
          <th class='px-6 py-3 border-r border-gray-300 text-center'>Justificación</th>
          <th class='px-6 py-3 text-center'>Archivo</th>
        </tr>
        </thead>
        <tbody>";

foreach ($records as $i => $r) {
    $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
    $statusColor = $r['status'] === 'Presente' ? 'text-green-600 font-semibold' : 'text-red-600 font-semibold';
    $justText = $r['justification'] ? 'Sí' : 'No';
    $fileLink = $r['justification_file'] ? "<a href='{$r['justification_file']}' target='_blank' class='text-blue-600 underline'>Ver</a>" : "-";

    echo "<tr class='hover:bg-gray-100 {$rowClass}'>
            <td class='px-6 py-4 border-r border-gray-300'>".date('d/m/Y', strtotime($r['attendance_date']))."</td>
            <td class='px-6 py-4 border-r border-gray-300'>{$r['course_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300'>{$r['subject_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center {$statusColor}'>{$r['status']}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$justText}</td>
            <td class='px-6 py-4 text-center'>{$fileLink}</td>
          </tr>";
}

echo "</tbody></table></div>";
