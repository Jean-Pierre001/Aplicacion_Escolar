<?php
include '../includes/conn.php';

$teacher_id = $_GET['teacher_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$from = $_GET['from'] ?? null;
$to = $_GET['to'] ?? null;
$just = $_GET['just'] ?? 0;

if (!$teacher_id) {
    echo '<p class="p-4 text-gray-500">No se seleccionó ningún docente.</p>';
    exit;
}

// Construir filtros dinámicos
$filters = "ta.teacher_id = ?";
$params = [$teacher_id];

if ($subject_id) {
    $filters .= " AND sub.subject_id = ?";
    $params[] = $subject_id;
}

if ($from) {
    $filters .= " AND ta.attendance_date >= ?";
    $params[] = $from;
}

if ($to) {
    $filters .= " AND ta.attendance_date <= ?";
    $params[] = $to;
}

if ($just == 1) {
    $filters .= " AND ta.justification = 1";
}

// Consulta
$stmt = $conn->prepare("
    SELECT ta.id AS attendance_id, ta.attendance_date, ta.status, ta.justification, ta.justification_file,
           c.name AS course_name, sub.name AS subject_name,
           t.first_name AS teacher_first, t.last_name AS teacher_last
    FROM teacher_attendance ta
    INNER JOIN schedules sc ON ta.schedule_id = sc.schedule_id
    INNER JOIN courses c ON sc.course_id = c.course_id
    INNER JOIN subjects sub ON sc.subject_id = sub.subject_id
    INNER JOIN teachers t ON ta.teacher_id = t.teacher_id
    WHERE $filters
    ORDER BY ta.attendance_date DESC
");
$stmt->execute($params);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$records) {
    echo '<p class="p-4 text-gray-500">Este docente no tiene registros de asistencia con los filtros aplicados.</p>';
    exit;
}

// Resumen de asistencia
$total_classes = count($records);
$total_attended = 0;
foreach ($records as $r) {
    if ($r['status'] === 'present' || $r['justification']) {
        $total_attended++;
    }
}

echo "<div class='mb-4 p-4 bg-gray-100 rounded-lg shadow'>
        <p class='font-semibold'>Resumen de asistencia del docente:</p>
        <p>Total de clases: {$total_classes}</p>
        <p>Clases asistidas (incluye justificadas): {$total_attended}</p>
        <p>Porcentaje de asistencia: ".($total_classes > 0 ? round(($total_attended / $total_classes) * 100, 2) : 0)."%</p>
      </div>";

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
    $statusColor = $r['status'] === 'present' ? 'text-green-600 font-semibold' : 'text-red-600 font-semibold';
    $justText = $r['justification'] ? 'Sí' : 'No';
    $fileLink = $r['justification_file'] ? "<a href='{$r['justification_file']}' target='_blank' class='text-blue-600 underline'>Ver</a>" : "-";

    echo "<tr class='hover:bg-gray-100 {$rowClass}'>
            <td class='px-6 py-4 border-r border-gray-300'>".date('d/m/Y', strtotime($r['attendance_date']))."</td>
            <td class='px-6 py-4 border-r border-gray-300'>{$r['course_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300'>{$r['subject_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center {$statusColor}'>".($r['status'] === 'present' ? 'Presente' : 'Ausente')."</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$justText}</td>
            <td class='px-6 py-4 text-center'>{$fileLink}</td>
          </tr>";
}

echo "</tbody></table></div>";
