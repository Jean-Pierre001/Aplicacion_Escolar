<?php
include '../includes/conn.php';

$student_id = $_GET['student_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$from = $_GET['from'] ?? null;
$to = $_GET['to'] ?? null;
$just = $_GET['just'] ?? 0;

if (!$student_id) {
    echo '<p class="p-4 text-gray-500">No se seleccionó ningún alumno.</p>';
    exit;
}

try {
    $filters = "sa.student_id = ?";
    $params = [$student_id];

    if ($subject_id) {
        $filters .= " AND sub.subject_id = ?";
        $params[] = $subject_id;
    }
    if ($from) {
        $filters .= " AND sa.attendance_date >= ?";
        $params[] = $from;
    }
    if ($to) {
        $filters .= " AND sa.attendance_date <= ?";
        $params[] = $to;
    }
    if ($just == 1) {
        $filters .= " AND sa.justification = 1";
    }

    $stmt = $conn->prepare("
        SELECT sa.id AS attendance_id, sa.attendance_date, sa.status, sa.justification, sa.justification_file,
               c.name AS course_name, sub.name AS subject_name, sub.turno,
               t.teacher_id, t.first_name AS teacher_first, t.last_name AS teacher_last,
               ta.status AS teacher_status
        FROM student_attendance sa
        INNER JOIN schedules sc ON sa.schedule_id = sc.schedule_id
        INNER JOIN courses c ON sc.course_id = c.course_id
        INNER JOIN subjects sub ON sc.subject_id = sub.subject_id
        INNER JOIN teachers t ON sc.teacher_id = t.teacher_id
        LEFT JOIN teacher_attendance ta 
            ON ta.schedule_id = sc.schedule_id 
            AND ta.attendance_date = sa.attendance_date 
            AND ta.teacher_id = t.teacher_id
        WHERE $filters
        ORDER BY sa.attendance_date DESC
    ");
    $stmt->execute($params);
    $records = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$records) {
        echo '<p class="p-4 text-gray-500">Este alumno no tiene registros de asistencia con los filtros aplicados.</p>';
        exit;
    }

    // 🔹 Calcular asistencia considerando turnos (mañana/tarde)
    $attendance_by_day = []; // Fecha => ['mañana' => false, 'tarde' => false]

    foreach ($records as $r) {
        $date = $r['attendance_date'];
        $turno = $r['turno']; // viene de subjects
        if (!isset($attendance_by_day[$date])) {
            $attendance_by_day[$date] = ['mañana' => false, 'tarde' => false];
        }
        if ($r['status'] === 'present' || $r['justification']) {
            $attendance_by_day[$date][$turno] = true;
        }
    }

    // Calcular totales
    $total_classes = 0;
    $total_attended = 0;
    foreach ($attendance_by_day as $day => $turns) {
        $total_classes += 2; // mañana + tarde
        $total_attended += ($turns['mañana'] ? 1 : 0) + ($turns['tarde'] ? 1 : 0);
    }

    $percentage = $total_classes > 0 ? round(($total_attended / $total_classes) * 100, 2) : 0;

    // 🔹 Mostrar resumen
    echo "<div class='mb-4 p-4 bg-gray-100 rounded-lg shadow'>
            <p class='font-semibold'>Resumen de asistencia:</p>
            <p>Clases totales (mañana + tarde): {$total_classes}</p>
            <p>Asistencias del alumno (incluye inasistencias justificadas): {$total_attended}</p>
            <p>Porcentaje de asistencia: {$percentage}%</p>
          </div>";

    // 🔹 Mostrar tabla de registros
    echo "<div class='overflow-x-auto rounded-lg shadow-lg border border-gray-200'>
            <table class='min-w-full border-collapse'>
            <thead class='text-white bg-gray-800'>
            <tr>
              <th class='px-6 py-3 border-r border-gray-300 text-left'>Fecha</th>
              <th class='px-6 py-3 border-r border-gray-300 text-left'>Curso</th>
              <th class='px-6 py-3 border-r border-gray-300 text-left'>Materia</th>
              <th class='px-6 py-3 border-r border-gray-300 text-left'>Turno</th>
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
        $fileLink = $r['justification_file']
            ? "<a href='{$r['justification_file']}' target='_blank' class='text-blue-600 underline'>Ver</a>"
            : "-";

        echo "<tr class='hover:bg-gray-100 {$rowClass}'>
                <td class='px-6 py-4 border-r border-gray-300'>" . date('d/m/Y', strtotime($r['attendance_date'])) . "</td>
                <td class='px-6 py-4 border-r border-gray-300'>{$r['course_name']}</td>
                <td class='px-6 py-4 border-r border-gray-300'>{$r['subject_name']}</td>
                <td class='px-6 py-4 border-r border-gray-300'>{$r['turno']}</td>
                <td class='px-6 py-4 border-r border-gray-300 text-center {$statusColor}'>" . ($r['status'] === 'present' ? 'Presente' : 'Ausente') . "</td>
                <td class='px-6 py-4 border-r border-gray-300 text-center'>{$justText}</td>
                <td class='px-6 py-4 text-center'>{$fileLink}</td>
              </tr>";
    }

    echo "</tbody></table></div>";

} catch (PDOException $e) {
    echo '<p class="p-4 text-red-500">Error al obtener los datos de asistencia.</p>';
}
?>
