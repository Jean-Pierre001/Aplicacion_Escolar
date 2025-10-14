<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-4 md:p-6">

    <br><br><br>

    <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Asistencia de Clase</h1>

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

      <select id="selectGroup" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-indigo-500 w-full md:w-auto">
        <option value="">Seleccionar Grupo</option>
      </select>

      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-green-500 w-full md:w-auto">
        <option value="">Seleccionar Materia</option>
      </select>

      <input type="date" id="attendanceDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-purple-500 w-full md:w-auto" />

      <button id="generateReport" class="bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex items-center ml-0 md:ml-auto w-full md:w-auto justify-center" disabled>
        <i class="fa-solid fa-file-lines mr-2"></i> Registrar Asistencia
      </button>
    </div>

    <div id="attendanceTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<script>
const selectCourse = document.getElementById('selectCourse');
const selectGroup = document.getElementById('selectGroup');
const selectSubject = document.getElementById('selectSubject');
const attendanceDateInput = document.getElementById('attendanceDate');
const tableContainer = document.getElementById('attendanceTableContainer');
const generateReportBtn = document.getElementById('generateReport');

function setGenerateReportDisabled(disabled) {
  generateReportBtn.disabled = disabled;
  if (disabled) {
    generateReportBtn.classList.add('opacity-50', 'cursor-not-allowed');
  } else {
    generateReportBtn.classList.remove('opacity-50', 'cursor-not-allowed');
  }
}

function loadGroups() {
  const courseId = selectCourse.value;
  selectGroup.innerHTML = '<option value="">Seleccionar Grupo</option>';
  if (!courseId) return;

  fetch(`api/get_groups.php?course_id=${courseId}`)
    .then(res => res.json())
    .then(data => {
      data.forEach(group => {
        const opt = document.createElement('option');
        opt.value = group.group_id;
        opt.textContent = group.name;
        selectGroup.appendChild(opt);
      });
    })
    .catch(err => console.error('Error cargando grupos:', err));
}

function loadSubjects() {
  const courseId = selectCourse.value;
  const groupId = selectGroup.value;
  selectSubject.innerHTML = '<option value="">Seleccionar Materia</option>';
  if (!courseId) return;

  fetch(`api/get_subjects.php?course_id=${courseId}&group_id=${groupId}`)
    .then(res => res.json())
    .then(data => {
      data.forEach(subject => {
        const opt = document.createElement('option');
        opt.value = subject.subject_id;
        opt.textContent = subject.subject_name;

        // Colores según estado
        if (subject.status === 'done') {
          opt.style.backgroundColor = '#d1fae5';
          opt.style.color = '#065f46';
        } else if (subject.status === 'pending') {
          opt.style.backgroundColor = '#fee2e2';
          opt.style.color = '#991b1b';
        } else if (subject.status === 'no_class') {
          opt.style.backgroundColor = '#f3f4f6';
          opt.style.color = '#374151';
        }

        selectSubject.appendChild(opt);
      });
    })
    .catch(err => console.error('Error cargando materias:', err));
}

function loadAttendance() {
  const courseId = selectCourse.value;
  const groupId = selectGroup.value;
  const subjectId = selectSubject.value;
  const attendanceDate = attendanceDateInput.value;

  if (!courseId || !subjectId || !attendanceDate) {
    tableContainer.innerHTML = '';
    setGenerateReportDisabled(true);
    return;
  }

  fetch(`api/get_attendance.php?course_id=${courseId}&group_id=${groupId}&subject_id=${subjectId}&attendance_date=${attendanceDate}`)
    .then(res => res.text())
    .then(html => {
      tableContainer.innerHTML = html;

      const hasTable = tableContainer.querySelector('table');
      if (!hasTable || tableContainer.textContent.includes("Ya se tomó la asistencia")) {
        setGenerateReportDisabled(true);
      } else {
        setGenerateReportDisabled(false);
      }

      const checkAllPresent = document.getElementById('checkAllPresent');
      if (checkAllPresent) {
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

selectCourse.addEventListener('change', () => {
  loadGroups();
  loadSubjects();
  loadAttendance();
});

selectGroup.addEventListener('change', () => {
  loadSubjects();
  loadAttendance();
});

selectSubject.addEventListener('change', loadAttendance);
attendanceDateInput.addEventListener('change', loadAttendance);

generateReportBtn.addEventListener('click', () => {
  if (generateReportBtn.disabled) return;

  const courseId = selectCourse.value;
  const groupId = selectGroup.value;
  const subjectId = selectSubject.value;
  const attendanceDate = attendanceDateInput.value;
  const rows = document.querySelectorAll('#attendanceTableContainer tbody tr');

  let formData = new FormData();
  formData.append('course_id', courseId);
  formData.append('group_id', groupId);
  formData.append('subject_id', subjectId);
  formData.append('attendance_date', attendanceDate);

  rows.forEach((row, index) => {
    const type = row.dataset.type;
    const id = row.dataset.id;
    const present = row.querySelector('.present-checkbox')?.checked ? 'present' : 'absent';
    const justification = row.querySelector('.justification-checkbox')?.checked ? 1 : 0;
    const file = row.querySelector('input[name="justification_file"]')?.files[0] ?? null;

    formData.append(`data[${index}][type]`, type);
    formData.append(`data[${index}][id]`, id);
    formData.append(`data[${index}][status]`, present);
    formData.append(`data[${index}][justification]`, justification);
    if (file) formData.append(`data[${index}][justification_file]`, file);
  });

  fetch('api/generate_report.php', { method: 'POST', body: formData })
    .then(res => res.json())
    .then(resp => {
      if (resp.success) {
        alert('Asistencia registrada correctamente.');
        loadAttendance();
      } else {
        alert('Error: ' + resp.error);
      }
    })
    .catch(err => {
      console.error('Error al registrar:', err);
      alert('Error al registrar asistencia.');
    });
});
</script>
