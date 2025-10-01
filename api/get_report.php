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
echo "<div class='overflow-x-auto rounded-lg shadow-lg border border-gray-200'>
        <table class='min-w-full border-collapse'>
        <thead class='bg-gradient-to-r from-gray-700 to-gray-900 text-white'>
        <tr>
          <th class='px-6 py-3 text-left border-r border-gray-600'>#</th>
          <th class='px-6 py-3 text-left border-r border-gray-600'>Alumno</th>
          <th class='px-6 py-3 text-center border-r border-gray-600'>Estado</th>
          <th class='px-6 py-3 text-center border-r border-gray-600'>Justificado</th>
          <th class='px-6 py-3 text-center border-r border-gray-600'>Archivo</th>
          <th class='px-6 py-3 text-center border-r border-gray-600'>Fecha</th>
          <th class='px-6 py-3 text-center'>Hora</th>
        </tr>
        </thead>
        <tbody>";

$colColors = ['bg-gray-50', 'bg-gray-100']; // Alternar color de columna
foreach ($records as $i => $r) {
    // Badge Estado
    $statusBadge = $r['status'] === 'present' 
        ? "<span class='px-3 py-1 text-sm font-semibold text-green-900 bg-green-200 rounded-full shadow-sm'>Presente</span>"
        : "<span class='px-3 py-1 text-sm font-semibold text-red-900 bg-red-200 rounded-full shadow-sm'>Ausente</span>";

    // Badge Justificado
    $justifiedBadge = $r['justification']
        ? "<span class='px-3 py-1 text-sm font-semibold text-blue-900 bg-blue-200 rounded-full shadow-sm'>Sí</span>"
        : "<span class='px-3 py-1 text-sm font-semibold text-gray-600 bg-gray-200 rounded-full shadow-sm'>No</span>";

    // Archivo
    $fileLink = $r['justification_file'] 
        ? "<a href='../{$r['justification_file']}' target='_blank' class='inline-flex items-center text-blue-600 hover:underline'>
             <i class='fa-solid fa-file-pdf mr-1'></i> Ver
           </a>" 
        : "<span class='text-gray-400'>—</span>";

    // Fondo de fila alternado
    $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';

    echo "<tr class='hover:bg-gray-200 {$rowClass}'>
            <td class='px-6 py-4 border-r border-gray-300 text-left'>".($i+1)."</td>
            <td class='px-6 py-4 border-r border-gray-300 text-left'>{$r['first_name']} {$r['last_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$statusBadge}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$justifiedBadge}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$fileLink}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$r['attendance_date']}</td>
            <td class='px-6 py-4 text-center'>{$r['attendance_time']}</td>
          </tr>";
}

echo "</tbody></table></div>";
?>
