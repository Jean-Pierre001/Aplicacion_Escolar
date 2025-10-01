<?php
// attendance_report.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 ml-64">
  <main class="pt-20 p-6">
    <h1 class="text-4xl font-bold text-gray-800 mb-6">Consulta de Reportes de Asistencia</h1>

    <div class="mb-6 flex flex-wrap items-center gap-4">
      <!-- Selección de Curso -->
      <select id="selectCourse" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500">
        <option value="">Seleccionar Curso</option>
        <?php
        $courses = $conn->query("SELECT course_id, name FROM courses")->fetchAll();
        foreach ($courses as $course) {
            echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
        }
        ?>
      </select>

      <!-- Selección de Materia -->
      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-green-500">
        <option value="">Seleccionar Materia</option>
        <?php
        $subjects = $conn->query("SELECT subject_id, name FROM subjects")->fetchAll();
        foreach ($subjects as $subject) {
            echo "<option value='{$subject['subject_id']}'>{$subject['name']}</option>";
        }
        ?>
      </select>

      <!-- Selección de Fecha -->
      <input type="date" id="selectDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-purple-500">

      <!-- Botón Cargar -->
      <button id="loadReport" class="ml-auto bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex items-center">
        <i class="fa-solid fa-table-list mr-2"></i> Cargar Reporte
      </button>
    </div>

    <div class="mb-4 flex space-x-2">
      <button id="exportPDF" class="bg-red-600 text-white px-5 py-2 rounded-lg shadow hover:bg-red-700 transition flex items-center">
        <i class="fa-solid fa-file-pdf mr-2"></i> Exportar PDF
      </button>

      <button id="exportExcel" class="bg-green-600 text-white px-5 py-2 rounded-lg shadow hover:bg-green-700 transition flex items-center">
        <i class="fa-solid fa-file-excel mr-2"></i> Exportar Excel
      </button>
    </div>

    <!-- Contenedor de la tabla -->
    <div id="reportTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<script>
const selectCourse = document.getElementById('selectCourse');
const selectSubject = document.getElementById('selectSubject');
const selectDate = document.getElementById('selectDate');
const loadReportBtn = document.getElementById('loadReport');
const tableContainer = document.getElementById('reportTableContainer');
const exportPDFBtn = document.getElementById('exportPDF');
const exportExcelBtn = document.getElementById('exportExcel');

// Cargar reporte en tabla
function loadReport() {
  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const date = selectDate.value;

  if (!courseId || !subjectId || !date) {
    alert('Seleccione curso, materia y fecha.');
    return;
  }

  fetch(`api/get_report.php?course_id=${courseId}&subject_id=${subjectId}&date=${date}`)
    .then(res => res.text())
    .then(html => tableContainer.innerHTML = html);
}

loadReportBtn.addEventListener('click', loadReport);

// Exportar PDF
exportPDFBtn.addEventListener('click', () => {
  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const date = selectDate.value;
  if (!courseId || !subjectId || !date) {
    alert('Seleccione curso, materia y fecha.');
    return;
  }
  window.open(`attendance_back/export_pdf.php?course_id=${courseId}&subject_id=${subjectId}&date=${date}`, '_blank');
});

// Exportar Excel
exportExcelBtn.addEventListener('click', () => {
  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const date = selectDate.value;
  if (!courseId || !subjectId || !date) {
    alert('Seleccione curso, materia y fecha.');
    return;
  }
  window.open(`attendance_back/export_excel.php?course_id=${courseId}&subject_id=${subjectId}&date=${date}`, '_blank');
});
</script>
