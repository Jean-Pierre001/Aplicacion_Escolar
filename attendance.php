<?php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-4 md:p-6">
    <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Asistencia de Alumnos</h1>

    <div class="mb-6 flex flex-col md:flex-row flex-wrap items-start md:items-center gap-3 md:gap-4">
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
      </select>

      <input type="date" id="attendanceDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-purple-500 w-full md:w-auto" />

      <button id="generateReport" class="bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex items-center ml-0 md:ml-auto w-full md:w-auto justify-center" disabled>
        <i class="fa-solid fa-file-lines mr-2"></i> Generar Informe
      </button>
    </div>

    <div id="attendanceTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<script>
const selectCourse = document.getElementById('selectCourse');
const selectSubject = document.getElementById('selectSubject');
const tableContainer = document.getElementById('attendanceTableContainer');
const generateReportBtn = document.getElementById('generateReport');
const attendanceDateInput = document.getElementById('attendanceDate');

function setGenerateReportDisabled(disabled) {
  generateReportBtn.disabled = disabled;
  if (disabled) {
    generateReportBtn.classList.add('opacity-50', 'cursor-not-allowed');
  } else {
    generateReportBtn.classList.remove('opacity-50', 'cursor-not-allowed');
  }
}

function loadAttendance() {
  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const attendanceDate = attendanceDateInput.value;

  if (!courseId || !subjectId || !attendanceDate) {
    tableContainer.innerHTML = '';
    setGenerateReportDisabled(true);
    return;
  }

  fetch(`api/get_attendance.php?course_id=${courseId}&subject_id=${subjectId}&attendance_date=${attendanceDate}`)
    .then(res => res.text())
    .then(html => {
      tableContainer.innerHTML = html;

      // Si la respuesta NO contiene una tabla, deshabilitamos el botón.
      const table = tableContainer.querySelector('table');
      if (!table) {
        setGenerateReportDisabled(true);
      } else {
        // Si hay tabla, habilitar el botón salvo que el texto indique que ya se tomó la asistencia
        if (tableContainer.textContent.includes("Ya se tomó la asistencia")) {
          setGenerateReportDisabled(true);
        } else {
          setGenerateReportDisabled(false);
        }
      }

      // Manejar "marcar todos presentes" sin duplicar listeners
      const checkAllPresent = document.getElementById('checkAllPresent');
      if (checkAllPresent) {
        // reasignar el handler para evitar múltiples listeners al recargar varias veces
        checkAllPresent.onchange = function() {
          const presentChecks = tableContainer.querySelectorAll('.present-checkbox');
          presentChecks.forEach(chk => chk.checked = this.checked);
        };
      }
    })
    .catch(err => {
      console.error('Error cargando asistencia:', err);
      tableContainer.innerHTML = '<p class="p-4 text-red-500">Error al cargar los datos.</p>';
      setGenerateReportDisabled(true);
    });
}

// Eventos de cambio
selectCourse.addEventListener('change', loadAttendance);
selectSubject.addEventListener('change', loadAttendance);
attendanceDateInput.addEventListener('change', loadAttendance);

// Generar informe
generateReportBtn.addEventListener('click', () => {
  if (generateReportBtn.disabled) return;

  const courseId = selectCourse.value;
  const subjectId = selectSubject.value;
  const attendanceDate = attendanceDateInput.value;

  if (!courseId || !subjectId || !attendanceDate) {
    alert('Seleccione curso, materia y fecha.');
    return;
  }

  const rows = document.querySelectorAll('#attendanceTableContainer tbody tr');
  if (!rows.length) {
    alert('No hay estudiantes para registrar.');
    return;
  }

  let formData = new FormData();
  formData.append('course_id', courseId);
  formData.append('subject_id', subjectId);
  formData.append('attendance_date', attendanceDate);

  rows.forEach((row, index) => {
    const studentId = row.dataset.studentId;
    const presentInput = row.querySelector('input[name="present"]');
    const status = presentInput && presentInput.checked ? 'present' : 'absent';
    const justification = row.querySelector('input[name="justification"]')?.checked ? 1 : 0;
    const fileInput = row.querySelector('input[name="justification_file"]');
    const file = fileInput?.files[0] ?? null;

    formData.append(`data[${index}][student_id]`, studentId);
    formData.append(`data[${index}][status]`, status);
    formData.append(`data[${index}][justification]`, justification);
    if (file) {
      // clave: data[0][justification_file], data[1][justification_file], ...
      formData.append(`data[${index}][justification_file]`, file);
    }
  });

  fetch('api/generate_report.php', {
    method: 'POST',
    body: formData
  })
  .then(res => res.json())
  .then(resp => {
    if (resp.success) {
      alert('Asistencia registrada correctamente.');
      loadAttendance();
    } else {
      alert('Error al registrar asistencia: ' + resp.error);
    }
  })
  .catch(err => {
    console.error('Error al enviar informe:', err);
    alert('Error al registrar asistencia.');
  });
});

selectCourse.addEventListener('change', () => {
  const courseId = selectCourse.value;

  // Vaciar select de materias
  selectSubject.innerHTML = '<option value="">Seleccionar Materia</option>';

  if (!courseId) return;

  // Traer materias por curso
  fetch(`api/get_subjects.php?course_id=${courseId}`)
    .then(res => res.json())
    .then(data => {
      data.forEach(subject => {
        const option = document.createElement('option');
        option.value = subject.subject_id;
        option.textContent = subject.name;
        selectSubject.appendChild(option);
      });
    })
    .catch(err => console.error('Error cargando materias:', err));

  // Cargar asistencia también
  loadAttendance();
});
</script>
