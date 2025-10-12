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

    <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">Consulta De Profesor</h1>

    <div class="mb-6 flex flex-col md:flex-row flex-wrap items-start md:items-center gap-3 md:gap-4">
      <!-- 🔍 Campo Docente con búsqueda -->
      <div class="flex flex-col md:flex-row items-center gap-2 w-full md:w-auto">
        <input type="hidden" id="selected_teacher_id">
        <input type="text" id="selected_teacher_name" class="px-4 py-2 border rounded-lg shadow bg-gray-100 w-full md:w-64" placeholder="Seleccionar docente" readonly>
        <button type="button" onclick="openTeacherSearch()" class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
          Buscar
        </button>
      </div>

      <!-- Select de Materias -->
      <select id="selectSubject" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500 w-full md:w-auto">
        <option value="">Todas las materias</option>
      </select>

      <!-- Rangos de fecha -->
      <div class="flex items-center gap-2">
        <h2>Desde</h2>
        <input type="date" id="fromDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500">
        <h2>Hasta</h2>
        <input type="date" id="toDate" class="px-4 py-2 border rounded-lg shadow focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Checkbox de justificadas -->
      <label class="flex items-center gap-2">
        <input type="checkbox" id="justificationCheck" class="form-checkbox h-5 w-5 text-blue-600">
        Mostrar solo clases con justificación
      </label>
    </div>

    <div id="teacherAttendanceTableContainer" class="overflow-x-auto rounded-lg shadow-lg border border-gray-200"></div>
  </main>
</div>

<!-- 🔍 Modal Buscar Docente -->
<div id="teacherSearchModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-3xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Buscar Docente</h2>

    <div class="flex flex-wrap gap-3 mb-4">
      <input type="text" id="searchTeacherLast" placeholder="Apellido" class="px-3 py-2 border rounded flex-1">
      <input type="text" id="searchTeacherFirst" placeholder="Nombre" class="px-3 py-2 border rounded flex-1">
      <button id="btnSearchTeacher" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">
        <i class="fa-solid fa-magnifying-glass mr-1"></i> Buscar
      </button>
    </div>

    <div class="overflow-y-auto max-h-80 border rounded">
      <table class="min-w-full border-collapse">
        <thead class="bg-gray-100">
          <tr>
            <th class="px-4 py-2 border">Apellido</th>
            <th class="px-4 py-2 border">Nombre</th>
            <th class="px-4 py-2 border">Acción</th>
          </tr>
        </thead>
        <tbody id="teacherResults"></tbody>
      </table>
    </div>

    <div class="flex justify-end mt-4">
      <button type="button" onclick="closeModal('teacherSearchModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cerrar</button>
    </div>
  </div>
</div>

<script>
// 🔹 Abrir / cerrar modales
function openModal(id) {
  document.getElementById(id).classList.remove('hidden');
}
function closeModal(id) {
  document.getElementById(id).classList.add('hidden');
}

// 🔹 Abrir el modal de búsqueda de docentes
function openTeacherSearch() {
  openModal('teacherSearchModal');
}

// 🔹 Buscar docentes
document.getElementById('btnSearchTeacher').addEventListener('click', function() {
  const last = document.getElementById('searchTeacherLast').value;
  const first = document.getElementById('searchTeacherFirst').value;

  fetch(`schedules_back/search_teachers.php?first=${encodeURIComponent(first)}&last=${encodeURIComponent(last)}`)
    .then(res => res.json())
    .then(data => {
      const tbody = document.getElementById('teacherResults');
      tbody.innerHTML = '';

      if (data.length === 0) {
        tbody.innerHTML = `<tr><td colspan="3" class="text-center text-gray-500 py-3">No se encontraron docentes</td></tr>`;
        return;
      }

      data.forEach(t => {
        const row = document.createElement('tr');
        row.classList.add('hover:bg-gray-50');
        row.innerHTML = `
          <td class="px-4 py-2 border">${t.last_name}</td>
          <td class="px-4 py-2 border">${t.first_name}</td>
          <td class="px-4 py-2 border text-center">
            <button type="button" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded"
              onclick="selectTeacher(${t.teacher_id}, '${t.last_name} ${t.first_name}')">
              Seleccionar
            </button>
          </td>`;
        tbody.appendChild(row);
      });
    })
    .catch(err => console.error(err));
});

// 🔹 Seleccionar docente desde modal
function selectTeacher(id, name) {
  document.getElementById('selected_teacher_id').value = id;
  document.getElementById('selected_teacher_name').value = name;
  closeModal('teacherSearchModal');

  loadTeacherSubjects(id);
  loadTeacherAttendance();
}

// ------------------- FUNCIONES DE CARGA -------------------

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
  const teacherId = document.getElementById('selected_teacher_id').value;
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
selectSubject.addEventListener('change', loadTeacherAttendance);
fromDate.addEventListener('change', loadTeacherAttendance);
toDate.addEventListener('change', loadTeacherAttendance);
justificationCheck.addEventListener('change', loadTeacherAttendance);
</script>
