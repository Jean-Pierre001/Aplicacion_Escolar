<?php
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

    <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Consulta De Estudiante</h1>

    <div class="mb-6 flex flex-col md:flex-row flex-wrap items-start md:items-center gap-3 md:gap-4">

      <!-- Seleccionar curso -->
      <select id="selectCourse" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Seleccionar Curso</option>
        <?php
        $courses = $conn->query("SELECT course_id, name FROM courses ORDER BY name ASC")->fetchAll();
        foreach ($courses as $course) {
            echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
        }
        ?>
      </select>

      <!-- Seleccionar alumno (se carga dinámicamente) -->
      <select id="selectStudent" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto" disabled>
        <option value="">Seleccionar Alumno</option>
      </select>

      <!-- Seleccionar materia (se carga dinámicamente según curso) -->
      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Todas las materias</option>
      </select>

      <!-- Fechas -->
      <h1>Desde</h1>
      <input type="date" id="fromDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Desde">
      <h1>Hasta</h1>
      <input type="date" id="toDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Hasta">

      <!-- Checkbox de justificación -->
      <label class="flex items-center gap-2">
        <input type="checkbox" id="justificationCheck" class="form-checkbox h-5 w-5 text-blue-600">
        Mostrar solo clases con justificación
      </label>

    </div>

    <!-- Contenedor de la tabla -->
    <div id="studentAttendanceTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>

  </main>
</div>

<script>
const selectCourse = document.getElementById('selectCourse');
const selectStudent = document.getElementById('selectStudent');
const selectSubject = document.getElementById('selectSubject');
const fromDate = document.getElementById('fromDate');
const toDate = document.getElementById('toDate');
const justificationCheck = document.getElementById('justificationCheck');
const tableContainer = document.getElementById('studentAttendanceTableContainer');

// 🔹 Cargar alumnos según curso seleccionado
function loadCourseStudents(courseId) {
  selectStudent.innerHTML = '<option value="">Seleccionar Alumno</option>';
  selectStudent.disabled = true;
  if (!courseId) return;

  fetch(`api/get_students_by_course.php?course_id=${courseId}`)
    .then(res => res.json())
    .then(data => {
      if (data.length > 0) {
        data.forEach(st => {
          const opt = document.createElement('option');
          opt.value = st.student_id;
          opt.textContent = `${st.last_name}, ${st.first_name}`;
          selectStudent.appendChild(opt);
        });
        selectStudent.disabled = false;
      } else {
        selectStudent.innerHTML = '<option value="">No hay alumnos en este curso</option>';
      }
    })
    .catch(err => console.error('Error cargando alumnos:', err));
}

// 🔹 Cargar materias según curso seleccionado
function loadCourseSubjects(courseId) {
  selectSubject.innerHTML = '<option value="">Todas las materias</option>';
  if (!courseId) return;

  fetch(`api/get_course_subjects.php?course_id=${courseId}`)
    .then(res => res.json())
    .then(data => {
      if (data.length === 0) {
        selectSubject.innerHTML += '<option disabled>No hay materias asignadas</option>';
        return;
      }
      data.forEach(sub => {
        const opt = document.createElement('option');
        opt.value = sub.subject_id;
        opt.textContent = sub.name;
        selectSubject.appendChild(opt);
      });
    })
    .catch(err => console.error('Error cargando materias:', err));
}

// 🔹 Evento al cambiar curso
selectCourse.addEventListener('change', () => {
  const courseId = selectCourse.value;
  loadCourseStudents(courseId);
  loadCourseSubjects(courseId);
});

// 🔹 Cargar asistencia del alumno seleccionado
function loadStudentAttendance() {
  const studentId = selectStudent.value;
  const subjectId = selectSubject.value;
  const from = fromDate.value;
  const to = toDate.value;
  const just = justificationCheck.checked ? 1 : 0;

  if (!studentId) {
    tableContainer.innerHTML = '';
    return;
  }

  fetch(`api/get_student_attendance.php?student_id=${studentId}&subject_id=${subjectId}&from=${from}&to=${to}&just=${just}`)
    .then(res => res.text())
    .then(html => {
      tableContainer.innerHTML = html;
    })
    .catch(err => {
      console.error('Error cargando historial:', err);
      tableContainer.innerHTML = '<p class="p-4 text-red-500">Error al cargar los datos.</p>';
    });
}

// 🔹 Eventos para filtrar asistencia
selectStudent.addEventListener('change', loadStudentAttendance);
selectSubject.addEventListener('change', loadStudentAttendance);
fromDate.addEventListener('change', loadStudentAttendance);
toDate.addEventListener('change', loadStudentAttendance);
justificationCheck.addEventListener('change', loadStudentAttendance);
</script>
