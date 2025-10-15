<?php
// Obtener roles de la base de datos
try {
    $roleStmt = $conn->query("SELECT role_id, name FROM roles ORDER BY name ASC");
    $roles = $roleStmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $roles = [];
}
?>

<!-- Modal Agregar Usuario -->
<div id="addUserModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar Usuario</h2>
    <form id="addUserForm" action="users_back/add_user.php" method="POST" class="space-y-4">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" id="add_first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" id="add_last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Email</label>
        <input type="email" name="email" id="add_email" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Contraseña</label>
        <input type="password" name="password" id="add_password" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Rol</label>
        <select name="role" id="add_role" class="w-full border px-3 py-2 rounded" required>
          <option value="">Seleccione un rol</option>
          <?php foreach ($roles as $role): ?>
            <option value="<?= $role['role_id'] ?>"><?= htmlspecialchars($role['name']) ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('addUserModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-blue-600 text-white hover:bg-blue-700">Agregar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('addUserModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<!-- Modal Editar Usuario -->
<div id="editUserModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Editar Usuario</h2>
    <form id="editUserForm" action="users_back/edit_user.php" method="POST" class="space-y-4">
      <input type="hidden" name="user_id" id="edit_user_id">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" id="edit_first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" id="edit_last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Email</label>
        <input type="email" name="email" id="edit_email" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Contraseña <span class="text-sm text-gray-500">(Dejar vacío para no cambiar)</span></label>
        <input type="password" name="password" id="edit_password" class="w-full border px-3 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1 font-medium">Rol</label>
        <select name="role" id="edit_role" class="w-full border px-3 py-2 rounded" required>
          <option value="">Seleccione un rol</option>
          <?php foreach ($roles as $role): ?>
            <option value="<?= $role['role_id'] ?>"><?= htmlspecialchars($role['name']) ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('editUserModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-yellow-500 text-white hover:bg-yellow-600">Guardar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('editUserModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<script>
  function openModal(modalId){ document.getElementById(modalId).classList.remove('hidden'); }
  function closeModal(modalId){ document.getElementById(modalId).classList.add('hidden'); }

  function openEditModalUser(user){
    document.getElementById('edit_user_id').value = user.user_id;
    document.getElementById('edit_first_name').value = user.first_name;
    document.getElementById('edit_last_name').value = user.last_name;
    document.getElementById('edit_email').value = user.email;
    document.getElementById('edit_password').value = '';
    document.getElementById('edit_role').value = user.role;
    openModal('editUserModal');
  }

  // Validación duplicados emails
  async function checkDuplicateEmail(email, excludeId = null){
    const formData = new FormData();
    formData.append('email', email);
    if(excludeId) formData.append('user_id', excludeId);

    const res = await fetch('api/validations/check_duplicate_email.php', { method:'POST', body: formData });
    const data = await res.json();
    return data.exists;
  }

  const addUserForm = document.getElementById('addUserForm');
  if(addUserForm){
    addUserForm.addEventListener('submit', async e => {
      e.preventDefault();
      const email = document.getElementById('add_email').value.trim();
      if(await checkDuplicateEmail(email)){
        Swal.fire({icon:'error', title:'Email duplicado', text:'Ya existe un usuario con ese email.'});
        return;
      }
      e.target.submit();
    });
  }

  const editUserForm = document.getElementById('editUserForm');
  if(editUserForm){
    editUserForm.addEventListener('submit', async e => {
      e.preventDefault();
      const email = document.getElementById('edit_email').value.trim();
      const userId = document.getElementById('edit_user_id').value;
      if(await checkDuplicateEmail(email, userId)){
        Swal.fire({icon:'error', title:'Email duplicado', text:'Ya existe otro usuario con ese email.'});
        return;
      }
      e.target.submit();
    });
  }
</script>
