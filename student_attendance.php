<?php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-4 md:p-6">
    <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Historial de Asistencia por Alumno</h1>

    <div class="mb-6 flex flex-col md:flex-row flex-wrap items-start md:items-center gap-3 md:gap-4">
      <select id="selectStudent" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Seleccionar Alumno</option>
        <?php
        $students = $conn->query("SELECT student_id, first_name, last_name FROM students ORDER BY last_name, first_name")->fetchAll();
        foreach ($students as $student) {
            echo "<option value='{$student['student_id']}'>{$student['last_name']}, {$student['first_name']}</option>";
        }
        ?>
      </select>
    </div>

    <div id="studentAttendanceTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<script>
const selectStudent = document.getElementById('selectStudent');
const tableContainer = document.getElementById('studentAttendanceTableContainer');

function loadStudentAttendance() {
  const studentId = selectStudent.value;

  if (!studentId) {
    tableContainer.innerHTML = '';
    return;
  }

  fetch(`api/get_student_attendance.php?student_id=${studentId}`)
    .then(res => res.text())
    .then(html => {
      tableContainer.innerHTML = html;
    })
    .catch(err => {
      console.error('Error cargando historial:', err);
      tableContainer.innerHTML = '<p class="p-4 text-red-500">Error al cargar los datos.</p>';
    });
}

selectStudent.addEventListener('change', loadStudentAttendance);
</script>
    