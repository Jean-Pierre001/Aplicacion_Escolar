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
echo '<table class="min-w-full divide-y divide-gray-200">';
echo '<thead class="bg-gradient-to-r from-green-500 to-green-700 text-white">
<tr>
<th class="px-6 py-3">ID</th>
<th class="px-6 py-3">Nombre</th>
<th class="px-6 py-3">Apellido</th>
<th class="px-6 py-3">Presente</th>
<th class="px-6 py-3">Justificación</th>
<th class="px-6 py-3">Archivo</th>
</tr></thead>';
echo '<tbody>';
foreach ($students as $student) {
    echo "<tr data-student-id='{$student['student_id']}' class='hover:bg-gray-50'>";
    echo "<td class='px-6 py-4'>{$student['student_id']}</td>";
    echo "<td class='px-6 py-4'>{$student['first_name']}</td>";
    echo "<td class='px-6 py-4'>{$student['last_name']}</td>";
    echo "<td class='px-6 py-4 text-center'><input type='checkbox' name='present' /></td>";
    echo "<td class='px-6 py-4 text-center'><input type='checkbox' name='justification' /></td>";
    echo "<td class='px-6 py-4 text-center'><input type='file' name='justification_file' /></td>";
    echo "</tr>";
}
echo '</tbody></table>';
