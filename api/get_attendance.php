<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'];
$subject_id = $_GET['subject_id'];

// Traer alumnos del curso
$stmt = $conn->prepare("SELECT student_id, first_name, last_name FROM students WHERE course_id = ?");
$stmt->execute([$course_id]);
$students = $stmt->fetchAll();

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
          <th class='px-6 py-3 border-r border-gray-300 text-center'>Presente</th>
          <th class='px-6 py-3 border-r border-gray-300 text-center'>Justificación</th>
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
                <input type='checkbox' name='present' class='form-checkbox' />
            </td>
            <td class='px-6 py-4 border-r border-gray-300 text-center'>
                <input type='checkbox' name='justification' class='form-checkbox' />
            </td>
            <td class='px-6 py-4 text-center'>
                <input type='file' name='justification_file' class='form-input' />
            </td>
          </tr>";
}

echo "</tbody></table></div>";
?>
