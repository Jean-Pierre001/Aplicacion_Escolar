<!-- Modal Agregar Docente -->
<div id="addTeacherModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar Docente</h2>
    <form id="addTeacherForm" action="teachers_back/add_teacher.php" method="POST" class="space-y-4">
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Usuario (Opcional)</label>
        <select name="user_id" class="w-full border px-3 py-2 rounded">
          <option value="">Seleccione un usuario</option>
          <?php
          $users = $conn->query("SELECT user_id, email FROM users")->fetchAll();
          foreach($users as $user){
              echo "<option value='{$user['user_id']}'>{$user['email']}</option>";
          }
          ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('addTeacherModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-blue-600 text-white hover:bg-blue-700">Agregar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('addTeacherModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<!-- Modal Editar Docente -->
<div id="editTeacherModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Editar Docente</h2>
    <form id="editTeacherForm" action="teachers_back/edit_teacher.php" method="POST" class="space-y-4">
      <input type="hidden" name="teacher_id" id="edit_teacher_id">
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" id="edit_last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" id="edit_first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Usuario (Opcional)</label>
        <select name="user_id" id="edit_user_id" class="w-full border px-3 py-2 rounded">
          <option value="">Seleccione un usuario</option>
          <?php
          foreach($users as $user){
              echo "<option value='{$user['user_id']}'>{$user['email']}</option>";
          }
          ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('editTeacherModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-yellow-500 text-white hover:bg-yellow-600">Guardar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('editTeacherModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
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


<!-- Scripts para abrir/cerrar modals y pasar datos al modal de editar -->
<script>
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

  function openModal(modalId){
    document.getElementById(modalId).classList.remove('hidden');
  }

  function closeModal(modalId){
    document.getElementById(modalId).classList.add('hidden');
  }

  function openEditModalTeacher(teacher){
    document.getElementById('edit_teacher_id').value = teacher.teacher_id;
    document.getElementById('edit_last_name').value = teacher.last_name;
    document.getElementById('edit_first_name').value = teacher.first_name;
    document.getElementById('edit_user_id').value = teacher.user_id;
    openModal('editTeacherModal');
  }
</script>
