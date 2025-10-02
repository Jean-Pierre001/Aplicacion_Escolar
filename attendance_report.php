<?php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br>
  <br>
  <br>
  <main class="pt-20 p-4 md:p-6">
    <h1 class="text-4xl font-bold text-gray-800 mb-6">Consulta de Reportes de Asistencia</h1>

    <!-- Filtros -->
    <div class="flex flex-col md:flex-row flex-wrap items-start md:items-center gap-3 mb-4">
      <select id="selectCourse" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Seleccionar Curso</option>
        <?php
        $courses = $conn->query("SELECT course_id, name FROM courses")->fetchAll();
        foreach ($courses as $course) {
            echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
        }
        ?>
      </select>

      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-green-500 w-full md:w-auto">
        <option value="">Seleccionar Materia</option>
        <?php
        $subjects = $conn->query("SELECT subject_id, name FROM subjects")->fetchAll();
        foreach ($subjects as $subject) {
            echo "<option value='{$subject['subject_id']}'>{$subject['name']}</option>";
        }
        ?>
      </select>

      <input type="date" id="selectDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-purple-500 w-full md:w-auto">

      <button id="loadReport" class="bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex items-center w-full md:w-auto justify-center">
        <i class="fa-solid fa-table-list mr-2"></i> Cargar Reporte
      </button>
    </div>

    <!-- Exportaciones -->
    <div class="flex flex-col md:flex-row flex-wrap gap-2 mb-4">
      <button id="exportPDF" class="bg-red-600 text-white px-5 py-2 rounded-lg shadow hover:bg-red-700 transition flex items-center w-full md:w-auto justify-center">
        <i class="fa-solid fa-file-pdf mr-2"></i> Exportar PDF
      </button>

      <button id="exportExcel" class="bg-green-600 text-white px-5 py-2 rounded-lg shadow hover:bg-green-700 transition flex items-center w-full md:w-auto justify-center">
        <i class="fa-solid fa-file-excel mr-2"></i> Exportar Excel
      </button>
    </div>

    <!-- Tabla -->
    <div id="reportTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<!-- Modal de vista previa -->
<div id="fileModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
  <div class="bg-white rounded-lg w-11/12 md:w-4/5 h-4/5 p-4 relative">
      <button id="closeModal" class="absolute top-2 right-2 bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">Cerrar</button>
      <div id="modalContent" class="w-full h-full flex items-center justify-center"></div>
  </div>
</div>

<script>
const selectCourse = document.getElementById('selectCourse');
const selectSubject = document.getElementById('selectSubject');
const selectDate = document.getElementById('selectDate');
const loadReportBtn = document.getElementById('loadReport');
const tableContainer = document.getElementById('reportTableContainer');

// Cargar reporte
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
document.getElementById('exportPDF').addEventListener('click', () => {
  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const date = selectDate.value;
  if (!courseId || !subjectId || !date) { alert('Seleccione curso, materia y fecha.'); return; }
  window.open(`attendance_back/export_pdf.php?course_id=${courseId}&subject_id=${subjectId}&date=${date}`, '_blank');
});

// Exportar Excel
document.getElementById('exportExcel').addEventListener('click', () => {
  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const date = selectDate.value;
  if (!courseId || !subjectId || !date) { alert('Seleccione curso, materia y fecha.'); return; }
  window.open(`attendance_back/export_excel.php?course_id=${courseId}&subject_id=${subjectId}&date=${date}`, '_blank');
});

// Guardar cambios
tableContainer.addEventListener('click', function(e) {
    if(e.target && e.target.id === 'saveAttendanceBtn') {
        const form = document.getElementById('attendanceForm');
        if(!form) { alert('No hay formulario cargado'); return; }

        const formData = new FormData(form);

        fetch('attendance_back/update_attendance_bulk.php', {
            method: 'POST',
            body: formData
        })
        .then(res => res.json())
        .then(response => {
            if(response.success) {
                alert('Cambios guardados correctamente.');
                response.updated.forEach(u => {
                    const row = document.querySelector(`select[name='status[${u.attendance_id}]']`).closest('tr');
                    row.querySelector('td:last-child').textContent = u.updated_at;
                });
            } else { alert('Error: ' + response.error); }
        });
    }
});

// Vista previa archivos
const modal = document.getElementById('fileModal');
const modalContent = document.getElementById('modalContent');
const closeModal = document.getElementById('closeModal');

tableContainer.addEventListener('click', function(e) {
    if(e.target && e.target.classList.contains('previewBtn')){
        const file = e.target.getAttribute('data-file');
        const ext = file.split('.').pop().toLowerCase();
        modalContent.innerHTML = '';

        if(ext === 'pdf'){
            const iframe = document.createElement('iframe');
            iframe.src = file;
            iframe.className = 'w-full h-full';
            modalContent.appendChild(iframe);
        } else if(['jpg','jpeg','png','gif','webp'].includes(ext)){
            const img = document.createElement('img');
            img.src = file;
            img.className = 'max-w-full max-h-full object-contain';
            modalContent.appendChild(img);
        } else {
            modalContent.innerHTML = "<p class='text-center text-red-600'>Archivo no visualizable</p>";
        }

        modal.classList.remove('hidden');
        modal.classList.add('flex');
    }
});

closeModal.addEventListener('click', () => {
    modal.classList.add('hidden');
    modal.classList.remove('flex');
    modalContent.innerHTML = '';
});
</script>
