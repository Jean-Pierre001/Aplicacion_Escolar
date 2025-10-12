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

</script>
