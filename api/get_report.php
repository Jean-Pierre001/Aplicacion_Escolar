<?php
// get_report.php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    echo "<p class='p-4 text-red-600'>Faltan parámetros</p>";
    exit;
}

$stmt = $conn->prepare("
    SELECT a.attendance_id, s.first_name, s.last_name, a.status, a.attendance_date, a.attendance_time,
           a.justification, a.justification_file
    FROM attendance a
    JOIN students s ON a.student_id = s.student_id
    WHERE a.course_id = ? AND a.subject_id = ? AND a.attendance_date = ?
    ORDER BY s.last_name, s.first_name
");
$stmt->execute([$course_id, $subject_id, $date]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$records) {
    echo "<p class='p-4'>No hay registros para esta fecha.</p>";
    exit;
}

// Mostrar tabla
echo "<table class='min-w-full divide-y divide-gray-200'>
        <thead class='bg-gray-800 text-white'>
        <tr>
          <th class='px-6 py-3'>#</th>
          <th class='px-6 py-3'>Alumno</th>
          <th class='px-6 py-3'>Estado</th>
          <th class='px-6 py-3'>Justificado</th>
          <th class='px-6 py-3'>Archivo</th>
          <th class='px-6 py-3'>Fecha</th>
          <th class='px-6 py-3'>Hora</th>
        </tr>
        </thead>
        <tbody class='bg-white divide-y divide-gray-200'>";

foreach ($records as $i => $r) {
    $justifiedText = $r['justification'] ? 'Sí' : 'No';
    $fileLink = $r['justification_file'] ? "<a href='../{$r['justification_file']}' target='_blank' class='text-blue-600 hover:underline'>Ver</a>" : '—';

    echo "<tr class='hover:bg-gray-100'>
            <td class='px-6 py-4'>".($i+1)."</td>
            <td class='px-6 py-4'>{$r['first_name']} {$r['last_name']}</td>
            <td class='px-6 py-4'>".ucfirst($r['status'])."</td>
            <td class='px-6 py-4 text-center'>{$justifiedText}</td>
            <td class='px-6 py-4 text-center'>{$fileLink}</td>
            <td class='px-6 py-4'>{$r['attendance_date']}</td>
            <td class='px-6 py-4'>{$r['attendance_time']}</td>
          </tr>";
}

echo "</tbody></table>";
