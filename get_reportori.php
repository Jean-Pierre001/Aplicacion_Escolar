<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    echo "<p class='p-4 text-red-600'>Faltan parámetros</p>";
    exit;
}

// Obtener estudiantes
$stmt = $conn->prepare("
    SELECT sa.id, s.student_id, s.first_name, s.last_name, sa.status, sa.justification, sa.justification_file
    FROM student_attendance sa
    JOIN students s ON sa.student_id = s.student_id
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    WHERE sc.course_id = ? AND sc.subject_id = ? AND sa.attendance_date = ?
    ORDER BY s.last_name, s.first_name
");
$stmt->execute([$course_id, $subject_id, $date]);
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obtener profesor (uno por clase)
$stmt = $conn->prepare("
    SELECT sa.id, t.teacher_id, t.first_name, t.last_name, sa.status, sa.justification, sa.justification_file
    FROM student_attendance sa
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    JOIN teachers t ON sc.teacher_id = t.teacher_id
    WHERE sc.course_id = ? AND sc.subject_id = ? AND sa.attendance_date = ?
    LIMIT 1
");
$stmt->execute([$course_id, $subject_id, $date]);
$teacher = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$students && !$teacher) {
    echo "<p class='p-4'>No hay registros para esta fecha.</p>";
    exit;
}

// Mostrar tabla
echo "<form id='attendanceForm' enctype='multipart/form-data'>
      <div class='overflow-x-auto rounded-lg shadow-lg border border-gray-200'>
        <table class='min-w-full border-collapse'>
        <thead class='bg-gradient-to-r from-gray-700 to-gray-900 text-white'>
        <tr>
          <th class='px-6 py-3 border-r border-gray-600'>Nombre</th>
          <th class='px-6 py-3 border-r border-gray-600 text-center'>Tipo</th>
          <th class='px-6 py-3 border-r border-gray-600 text-center'>Presente</th>
          <th class='px-6 py-3 border-r border-gray-600 text-center'>Justificado</th>
          <th class='px-6 py-3 border-r border-gray-600 text-center'>Archivo</th>
          <th class='px-6 py-3 border-r border-gray-600 text-center'>Fecha</th>
        </tr>
        </thead>
        <tbody>";

// Profesor
if ($teacher) {
    echo "<tr class='bg-yellow-200 text-black font-bold text-center'><td colspan='6'>Profesor</td></tr>";

    $statusSelect = "<select name='status[{$teacher['id']}]' class='border rounded px-2 py-1'>
                        <option value='present' ".($teacher['status']=='present'?'selected':'').">Presente</option>
                        <option value='absent' ".($teacher['status']=='absent'?'selected':'').">Ausente</option>
                     </select>";

    $fileInput = $teacher['justification_file'] ?
        "<button type='button' class='previewBtn bg-blue-600 text-white px-3 py-1 rounded shadow hover:bg-blue-700 transition mr-2'
                data-file='{$teacher['justification_file']}'>
                <i class='fa-solid fa-eye mr-1'></i> Ver archivo
            </button>
            <button type='button' class='deleteFileBtn bg-red-600 text-white px-3 py-1 rounded shadow hover:bg-red-700 transition'
                data-id='{$teacher['id']}' data-file='{$teacher['justification_file']}'>
                <i class='fa-solid fa-trash mr-1'></i> Eliminar
            </button>" :
        "<input type='file' name='file[{$teacher['id']}]' />";

    echo "<tr class='bg-gray-100'>
            <td class='px-6 py-4 border-r border-gray-300'>{$teacher['first_name']} {$teacher['last_name']}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>Profesor</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$statusSelect}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>
                <input type='checkbox' name='justification[{$teacher['id']}]' value='1' ".($teacher['justification'] ? 'checked' : '')." />
            </td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$fileInput}</td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>{$date}</td>
          </tr>";
}

// Alumnos
if ($students) {
    echo "<tr class='bg-green-200 text-black font-bold text-center'><td colspan='6'>Alumnos</td></tr>";

    foreach ($students as $i => $r) {
        $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';

        $statusSelect = "<select name='status[{$r['id']}]' class='border rounded px-2 py-1'>
                            <option value='present' ".($r['status']=='present'?'selected':'').">Presente</option>
                            <option value='absent' ".($r['status']=='absent'?'selected':'').">Ausente</option>
                         </select>";

        $fileInput = $r['justification_file'] ?
            "<button type='button' class='previewBtn bg-blue-600 text-white px-3 py-1 rounded shadow hover:bg-blue-700 transition mr-2'
                    data-file='{$r['justification_file']}'>
                    <i class='fa-solid fa-eye mr-1'></i> Ver archivo
                </button>
                <button type='button' class='deleteFileBtn bg-red-600 text-white px-3 py-1 rounded shadow hover:bg-red-700 transition'
                    data-id='{$r['id']}' data-file='{$r['justification_file']}'>
                    <i class='fa-solid fa-trash mr-1'></i> Eliminar
                </button>" :
            "<input type='file' name='file[{$r['id']}]' />";

        echo "<tr class='{$rowClass}'>
                <td class='px-6 py-4 border-r border-gray-300'>{$r['first_name']} {$r['last_name']}</td>
                <td class='px-6 py-4 border-r border-gray-300 text-center'>Alumno</td>
                <td class='px-6 py-4 border-r border-gray-300 text-center'>{$statusSelect}</td>
                <td class='px-6 py-4 border-r border-gray-300 text-center'>
                    <input type='checkbox' name='justification[{$r['id']}]' value='1' ".($r['justification'] ? 'checked' : '')." />
                </td>
                <td class='px-6 py-4 border-r border-gray-300 text-center'>{$fileInput}</td>
                <td class='px-6 py-4 border-r border-gray-300 text-center'>{$date}</td>
              </tr>";
    }
}

echo "</tbody></table>
      <div class='mt-4 text-right'>
        <button type='button' id='saveAttendanceBtn' class='bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex items-center'>
          <i class='fa-solid fa-floppy-disk mr-2'></i> Guardar cambios
        </button>
      </div>
      </div>
      </form>";
?>
