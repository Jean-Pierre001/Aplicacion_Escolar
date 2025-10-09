<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-4 md:p-6">

    <br>
    <br>
    <br>

    <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Consulta De Profesor</h1>

    <div class="mb-6 flex flex-col md:flex-row flex-wrap items-start md:items-center gap-3 md:gap-4">
      <!-- Select de Docentes -->
      <select id="selectTeacher" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Seleccionar Docente</option>
        <?php
        $teachers = $conn->query("SELECT teacher_id, first_name, last_name FROM teachers ORDER BY last_name, first_name")->fetchAll();
        foreach ($teachers as $teacher) {
            echo "<option value='{$teacher['teacher_id']}'>{$teacher['last_name']}, {$teacher['first_name']}</option>";
        }
        ?>
      </select>

      <!-- Select de Materias -->
      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Todas las materias</option>
      </select>

      <!-- Rangos de fecha -->
      <h2>Desde</h2>
      <input type="date" id="fromDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500">
      <h2>Hasta</h2>
      <input type="date" id="toDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500">

      <!-- Checkbox de justificadas -->
      <label class="flex items-center gap-2">
        <input type="checkbox" id="justificationCheck" class="form-checkbox h-5 w-5 text-blue-600">
        Mostrar solo clases con justificación
      </label>
    </div>

    <div id="teacherAttendanceTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<script>
const selectTeacher = document.getElementById('selectTeacher');
const selectSubject = document.getElementById('selectSubject');
const fromDate = document.getElementById('fromDate');
const toDate = document.getElementById('toDate');
const justificationCheck = document.getElementById('justificationCheck');
const tableContainer = document.getElementById('teacherAttendanceTableContainer');

// 🔹 Cargar materias según el profesor seleccionado
function loadTeacherSubjects(teacherId) {
  if (!teacherId) {
    selectSubject.innerHTML = '<option value="">Todas las materias</option>';
    tableContainer.innerHTML = '';
    return;
  }

  fetch(`api/get_teacher_subjects.php?teacher_id=${teacherId}`)
    .then(res => res.json())
    .then(subjects => {
      selectSubject.innerHTML = '<option value="">Todas las materias</option>';
      if (subjects.length === 0) {
        selectSubject.innerHTML += '<option disabled>No tiene materias asignadas</option>';
        return;
      }
      subjects.forEach(sub => {
        selectSubject.innerHTML += `<option value="${sub.subject_id}">${sub.name}</option>`;
      });
    })
    .catch(err => console.error('Error cargando materias:', err));
}

// 🔹 Cargar asistencias del profesor
function loadTeacherAttendance() {
  const teacherId = selectTeacher.value;
  const subjectId = selectSubject.value;
  const from = fromDate.value;
  const to = toDate.value;
  const just = justificationCheck.checked ? 1 : 0;

  if (!teacherId) {
    tableContainer.innerHTML = '';
    return;
  }

  fetch(`api/get_teacher_attendance.php?teacher_id=${teacherId}&subject_id=${subjectId}&from=${from}&to=${to}&just=${just}`)
    .then(res => res.text())
    .then(html => tableContainer.innerHTML = html)
    .catch(err => {
      console.error('Error cargando historial:', err);
      tableContainer.innerHTML = '<p class="p-4 text-red-500">Error al cargar los datos.</p>';
    });
}

// Eventos
selectTeacher.addEventListener('change', () => {
  const teacherId = selectTeacher.value;
  loadTeacherSubjects(teacherId);
  loadTeacherAttendance();
});
selectSubject.addEventListener('change', loadTeacherAttendance);
fromDate.addEventListener('change', loadTeacherAttendance);
toDate.addEventListener('change', loadTeacherAttendance);
justificationCheck.addEventListener('change', loadTeacherAttendance);
</script>
