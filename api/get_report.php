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
    SELECT sa.id, s.student_id, s.first_name, s.last_name, sa.status, sa.justification, sa.justification_file, sa.updated_at
    FROM student_attendance sa
    JOIN students s ON sa.student_id = s.student_id
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    WHERE sc.course_id = ? AND sc.subject_id = ? AND DATE(sa.attendance_date) = ?
    ORDER BY s.last_name, s.first_name
");
$stmt->execute([$course_id, $subject_id, $date]);
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Obtener profesor
$stmt = $conn->prepare("
    SELECT ta.id, t.teacher_id, t.first_name, t.last_name, ta.status, ta.justification, ta.justification_file, ta.updated_at
    FROM teacher_attendance ta
    JOIN schedules sc ON ta.schedule_id = sc.schedule_id
    JOIN teachers t ON ta.teacher_id = t.teacher_id
    WHERE sc.course_id = ? AND sc.subject_id = ? AND DATE(ta.attendance_date) = ?
    LIMIT 1
");
$stmt->execute([$course_id, $subject_id, $date]);
$teacher = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$students && !$teacher) {
    echo "<p class='p-4 text-gray-600 text-center bg-gray-50 rounded-lg border border-gray-200 shadow-sm'>
            No hay registros para esta fecha.
          </p>";
    exit;
}

// Función para formatear datetime
function formatDateTime($dt) {
    return $dt ? date('d/m/Y H:i', strtotime($dt)) : '-';
}

echo "<form id='attendanceForm' enctype='multipart/form-data' class='p-6'>
        <div class='overflow-x-auto rounded-lg shadow border border-gray-200 bg-white'>";


// ----- SECCIÓN PROFESOR -----
echo "<div class='px-6 py-3 bg-gray-100 border-b border-gray-300'>
        <h2 class='text-lg font-semibold text-gray-700'>Profesor</h2>
      </div>
      <table class='min-w-full text-sm text-gray-700 border-collapse'>
        <thead class='bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300'>
            <tr>
                <th class='px-6 py-3 border-r border-gray-300 text-left'>Nombre</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Tipo</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Presente</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Justificado</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Archivo</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Última actualización</th>
            </tr>
        </thead>
        <tbody>";

if ($teacher) {
    $statusSelect = "<select name='status[{$teacher['id']}]' class='border border-gray-300 rounded-md px-3 py-1 bg-white focus:ring-2 focus:ring-blue-400 focus:outline-none'>
                        <option value='present' ".($teacher['status']=='present'?'selected':'').">Presente</option>
                        <option value='absent' ".($teacher['status']=='absent'?'selected':'').">Ausente</option>
                     </select>";

    $fileInput = $teacher['justification_file'] ?
        "<div class='flex justify-center space-x-2'>
            <button type='button' class='previewBtn bg-blue-600 text-white px-3 py-1 rounded-md hover:bg-blue-700 transition' data-file='{$teacher['justification_file']}'>
                <i class='fa-solid fa-eye'></i>
            </button>
            <button type='button' class='deleteFileBtn bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700 transition'
                data-id='{$teacher['id']}' data-file='{$teacher['justification_file']}'>
                <i class='fa-solid fa-trash'></i>
            </button>
        </div>" :
        "<input type='file' name='file[{$teacher['id']}]' class='block w-full text-sm text-gray-700 border border-gray-300 rounded-md cursor-pointer bg-gray-50 focus:ring-1 focus:ring-blue-300' />";

    echo "<tr class='border-b border-gray-200 hover:bg-gray-50'>
            <td class='px-6 py-3 font-medium border-r border-gray-300'>{$teacher['first_name']} {$teacher['last_name']}</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>Profesor</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>{$statusSelect}</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>
                <input type='checkbox' name='justification[{$teacher['id']}]' value='1' ".($teacher['justification'] ? 'checked' : '')." class='w-5 h-5 accent-blue-600'>
            </td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>{$fileInput}</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>".formatDateTime($teacher['updated_at'])."</td>
          </tr>";
}


// ----- SECCIÓN ALUMNOS -----
echo "</tbody></table>
      <div class='px-6 py-3 bg-gray-100 border-t border-b border-gray-300 mt-6'>
        <h2 class='text-lg font-semibold text-gray-700'>Alumnos</h2>
      </div>
      <table class='min-w-full text-sm text-gray-700 border-collapse'>
        <thead class='bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300'>
            <tr>
                <th class='px-6 py-3 border-r border-gray-300 text-left'>Nombre</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Tipo</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Presente</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Justificado</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Archivo</th>
                <th class='px-6 py-3 border-r border-gray-300 text-center'>Última actualización</th>
            </tr>
        </thead>
        <tbody>";

foreach ($students as $i => $r) {
    $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';

    $statusSelect = "<select name='status[{$r['id']}]' class='border border-gray-300 rounded-md px-3 py-1 bg-white focus:ring-2 focus:ring-blue-400 focus:outline-none'>
                        <option value='present' ".($r['status']=='present'?'selected':'').">Presente</option>
                        <option value='absent' ".($r['status']=='absent'?'selected':'').">Ausente</option>
                     </select>";

    $fileInput = $r['justification_file'] ?
        "<div class='flex justify-center space-x-2'>
            <button type='button' class='previewBtn bg-blue-600 text-white px-3 py-1 rounded-md hover:bg-blue-700 transition' data-file='{$r['justification_file']}'>
                <i class='fa-solid fa-eye'></i>
            </button>
            <button type='button' class='deleteFileBtn bg-red-600 text-white px-3 py-1 rounded-md hover:bg-red-700 transition'
                data-id='{$r['id']}' data-file='{$r['justification_file']}'>
                <i class='fa-solid fa-trash'></i>
            </button>
        </div>" :
        "<input type='file' name='file[{$r['id']}]' class='block w-full text-sm text-gray-700 border border-gray-300 rounded-md cursor-pointer bg-gray-50 focus:ring-1 focus:ring-blue-300' />";

    echo "<tr class='{$rowClass} border-b border-gray-200 hover:bg-gray-50'>
            <td class='px-6 py-3 font-medium border-r border-gray-300'>{$r['first_name']} {$r['last_name']}</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>Alumno</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>{$statusSelect}</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>
                <input type='checkbox' name='justification[{$r['id']}]' value='1' ".($r['justification'] ? 'checked' : '')." class='w-5 h-5 accent-blue-600'>
            </td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>{$fileInput}</td>
            <td class='px-6 py-3 text-center border-r border-gray-300'>".formatDateTime($r['updated_at'])."</td>
          </tr>";
}

echo "      </tbody>
        </table>
    </div>

    <div class='mt-6 flex justify-end'>
        <button type='button' id='saveAttendanceBtn'
            class='bg-blue-700 text-white font-medium px-6 py-2 rounded-md shadow-sm hover:bg-blue-800 transition flex items-center'>
            <i class='fa-solid fa-floppy-disk mr-2'></i> Guardar cambios
        </button>
    </div>
  </form>";
?>
