<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
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

      <select id="selectGroup" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-indigo-500 w-full md:w-auto">
        <option value="">Seleccionar Grupo (opcional)</option>
      </select>

      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-green-500 w-full md:w-auto">
        <option value="">Seleccionar Materia</option>
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

<script>
document.addEventListener('DOMContentLoaded', function() {
    const selectCourse = document.getElementById('selectCourse');
    const selectGroup = document.getElementById('selectGroup');
    const selectSubject = document.getElementById('selectSubject');
    const selectDate = document.getElementById('selectDate');
    const loadReportBtn = document.getElementById('loadReport');
    const tableContainer = document.getElementById('reportTableContainer');

    function loadSubjects() {
        const courseId = selectCourse.value;
        const groupId = selectGroup.value || '';
        selectSubject.innerHTML = '<option value="">Seleccionar Materia</option>';
        if (!courseId) return;

        fetch(`api/get_subjects_report.php?course_id=${courseId}&group_id=${groupId}`)
            .then(res => res.json())
            .then(data => {
                data.forEach(subject => {
                    const option = document.createElement('option');
                    option.value = subject.subject_id;
                    option.textContent = subject.name;
                    selectSubject.appendChild(option);
                });

                if (window.subjectParam) {
                    selectSubject.value = window.subjectParam;
                    loadReport();
                }
            });
    }

    selectCourse.addEventListener('change', () => {
        const courseId = selectCourse.value;
        selectGroup.innerHTML = '<option value="">Seleccionar Grupo (opcional)</option>';
        selectSubject.innerHTML = '<option value="">Seleccionar Materia</option>';
        if (!courseId) return;

        fetch(`api/get_groups.php?course_id=${courseId}`)
            .then(res => res.json())
            .then(data => {
                data.forEach(group => {
                    const option = document.createElement('option');
                    option.value = group.group_id;
                    option.textContent = group.name;
                    selectGroup.appendChild(option);
                });

                if (window.groupParam) selectGroup.value = window.groupParam;
                loadSubjects();
            });
    });

    selectGroup.addEventListener('change', loadSubjects);

    function loadReport() {
      const courseId = selectCourse.value;
      const groupId = selectGroup.value || '';
      const subjectId = selectSubject.value;
      const date = selectDate.value;

      if (!courseId || !subjectId || !date) return;

      fetch(`api/get_report.php?course_id=${courseId}&group_id=${groupId}&subject_id=${subjectId}&date=${date}`)
          .then(res => res.text())
          .then(html => {
              tableContainer.innerHTML = html;

              const saveBtn = document.getElementById('saveAttendanceBtn');

              if (saveBtn) {
                  // 🔹 Comparamos la fecha seleccionada con la fecha actual
                  const selectedDate = new Date(date);
                  const today = new Date();
                  today.setHours(0,0,0,0); // ignorar horas, minutos y segundos
                  if (selectedDate < today) {
                      saveBtn.disabled = true;
                      saveBtn.classList.add('opacity-50', 'cursor-not-allowed'); // opcional: efecto visual
                      saveBtn.title = "No se puede modificar asistencias de días anteriores";
                      return; // no agregamos el evento
                  }

                  // Si la fecha es hoy o futura, habilitamos
                  saveBtn.disabled = false;
                  saveBtn.classList.remove('opacity-50', 'cursor-not-allowed');
                  saveBtn.title = "";

                  saveBtn.addEventListener('click', function() {
                      const form = document.getElementById('attendanceForm');
                      const formData = new FormData(form);

                      fetch('attendance_back/update_attendance_bulk.php', {
                          method: 'POST',
                          body: formData
                      })
                      .then(res => res.json())
                      .then(data => {
                          if (data.success) {
                              alert('✅ Cambios guardados correctamente');
                              loadReport(); // recarga el reporte actualizado
                          } else {
                              alert('❌ Error: ' + (data.error || 'No se pudieron guardar los cambios'));
                          }
                      })
                      .catch(err => {
                          alert('⚠️ Error en la conexión con el servidor');
                          console.error(err);
                      });
                  });
              }
          });
    }

    loadReportBtn.addEventListener('click', loadReport);

    // --- Inicialización desde URL ---
    const params = new URLSearchParams(window.location.search);
    const courseParam = params.get('course_id');
    const groupParam = params.get('group_id');
    const subjectParam = params.get('subject_id');
    const dateParam = params.get('date');

    window.groupParam = groupParam;
    window.subjectParam = subjectParam;

    if (courseParam) selectCourse.value = courseParam;
    if (dateParam) selectDate.value = dateParam;

    if (courseParam) {
        const event = new Event('change');
        selectCourse.dispatchEvent(event);
    }
});
</script>
