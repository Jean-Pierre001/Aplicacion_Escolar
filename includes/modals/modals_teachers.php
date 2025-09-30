<!-- Modal Agregar Docente -->
<div id="addTeacherModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar Docente</h2>
    <form id="addTeacherForm" action="teachers_back/add_teacher.php" method="POST" class="space-y-4">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Usuario</label>
        <select name="user_id" class="w-full border px-3 py-2 rounded" required>
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
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" id="edit_first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" id="edit_last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Usuario</label>
        <select name="user_id" id="edit_user_id" class="w-full border px-3 py-2 rounded" required>
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

<!-- Scripts para abrir/cerrar modals y pasar datos al modal de editar -->
<script>
  function openModal(modalId){
    document.getElementById(modalId).classList.remove('hidden');
  }

  function closeModal(modalId){
    document.getElementById(modalId).classList.add('hidden');
  }

  function openEditModalTeacher(teacher){
    document.getElementById('edit_teacher_id').value = teacher.teacher_id;
    document.getElementById('edit_first_name').value = teacher.first_name;
    document.getElementById('edit_last_name').value = teacher.last_name;
    document.getElementById('edit_user_id').value = teacher.user_id;
    openModal('editTeacherModal');
  }
</script>
