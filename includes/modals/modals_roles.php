<!-- MODAL AGREGAR ROL -->
<div id="addRoleModal" class="fixed inset-0 hidden items-center justify-center bg-black bg-opacity-50 z-50">
  <div class="bg-white rounded-lg w-96 p-6 relative">
    <h2 class="text-2xl font-bold mb-4">Agregar Rol</h2>
    <form action="roles_back/add_role.php" method="POST">
      <div class="mb-4">
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" class="w-full px-3 py-2 border rounded" required>
      </div>
      <div class="mb-4">
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" class="w-full px-3 py-2 border rounded"></textarea>
      </div>
      <div class="flex justify-end gap-2">
        <button type="button" onclick="closeModal('addRoleModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">Guardar</button>
      </div>
    </form>
  </div>
</div>

<!-- MODAL EDITAR ROL -->
<div id="editRoleModal" class="fixed inset-0 hidden items-center justify-center bg-black bg-opacity-50 z-50">
  <div class="bg-white rounded-lg w-96 p-6 relative">
    <h2 class="text-2xl font-bold mb-4">Editar Rol</h2>
    <form action="roles_back/edit_role.php" method="POST">
      <input type="hidden" name="role_id" id="editRoleId">
      <div class="mb-4">
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" id="editRoleName" class="w-full px-3 py-2 border rounded" required>
      </div>
      <div class="mb-4">
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" id="editRoleDescription" class="w-full px-3 py-2 border rounded"></textarea>
      </div>
      <div class="flex justify-end gap-2">
        <button type="button" onclick="closeModal('editRoleModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600">Actualizar</button>
      </div>
    </form>
  </div>
</div>

<!-- MODAL PERMISOS -->
<div id="permissionsModal" class="fixed inset-0 hidden items-center justify-center bg-black bg-opacity-50 z-50">
  <div class="bg-white rounded-lg w-2/3 max-w-4xl p-6 relative">
    <h2 class="text-2xl font-bold mb-4">Permisos del Rol: <span id="roleNamePermissions"></span></h2>
    <form id="permissionsForm" method="POST" action="roles_back/save_permissions.php">
      <input type="hidden" name="role_id" id="permissionsRoleId">

      <div class="max-h-96 overflow-y-auto border p-4 rounded space-y-4">
        <!-- Dashboard -->
        <div>
          <label class="font-medium"><input type="checkbox" class="parent-checkbox" data-target="dashboard" /> Dashboard</label>
          <div class="pl-6 mt-2 space-y-2">
            <label><input type="checkbox" name="permissions[]" value="index.php:view" class="child-dashboard" /> Ver</label>
          </div>
        </div>

        <!-- Asistencias -->
        <div>
          <label class="font-medium"><input type="checkbox" class="parent-checkbox" data-target="attendance" /> Asistencias</label>
          <div class="pl-6 mt-2 space-y-2">
            <label><input type="checkbox" name="permissions[]" value="attendance.php:view" class="child-attendance" /> Toma de Asistencia</label><br>
            <label><input type="checkbox" name="permissions[]" value="attendance_report.php:view" class="child-attendance" /> Consulta de Asistencia</label><br>
            <label><input type="checkbox" name="permissions[]" value="student_attendance.php:view" class="child-attendance" /> Consulta Estudiante</label><br>
            <label><input type="checkbox" name="permissions[]" value="teachers_attendance.php:view" class="child-attendance" /> Consulta Docentes</label>
          </div>
        </div>

        <!-- Gestión -->
        <div>
          <label class="font-medium"><input type="checkbox" class="parent-checkbox" data-target="management" /> Gestión</label>
          <div class="pl-6 mt-2 space-y-2">
            <label><input type="checkbox" name="permissions[]" value="users.php:view" class="child-management" /> Usuarios</label><br>
            <label><input type="checkbox" name="permissions[]" value="teachers.php:view" class="child-management" /> Docentes</label><br>
            <label><input type="checkbox" name="permissions[]" value="students.php:view" class="child-management" /> Alumnos</label><br>
            <label><input type="checkbox" name="permissions[]" value="courses.php:view" class="child-management" /> Cursos</label><br>
            <label><input type="checkbox" name="permissions[]" value="subjects.php:view" class="child-management" /> Materias</label><br>
            <label><input type="checkbox" name="permissions[]" value="schedules.php:view" class="child-management" /> Horarios</label><br>
            <label><input type="checkbox" name="permissions[]" value="roles.php:view" class="child-management" /> Roles</label>
          </div>
        </div>
      </div>

      <div class="flex justify-end gap-2 mt-6">
        <button type="button" onclick="closeModal('permissionsModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700">Guardar Permisos</button>
      </div>
    </form>
  </div>
</div>

<script>
// Abrir modal de permisos
function openPermissionsModal(roleId, roleName = '') {
  document.getElementById('permissionsRoleId').value = roleId;
  document.getElementById('roleNamePermissions').innerText = roleName;
  openModal('permissionsModal');

  // Limpiar checkboxes
  document.querySelectorAll('#permissionsModal input[type=checkbox]').forEach(cb => cb.checked = false);

  // Cargar permisos existentes desde BD
  fetch(`roles_back/get_permissions.php?role_id=${roleId}`)
    .then(res => res.json())
    .then(data => {
      data.forEach(perm => {
        const checkbox = document.querySelector(`#permissionsModal input[value="${perm.page}:${perm.action}"]`);
        if (checkbox) checkbox.checked = true;
      });

      // Ajustar padres según hijos
      document.querySelectorAll('.parent-checkbox').forEach(parent => {
        const target = parent.dataset.target;
        const children = document.querySelectorAll('.child-' + target);
        parent.checked = Array.from(children).every(child => child.checked);
      });
    });
}
</script>


<!-- SCRIPTS PARA MODALES -->
<script>
function openModal(modalId) {
  document.getElementById(modalId).classList.remove('hidden');
  document.getElementById(modalId).classList.add('flex');
}

function closeModal(modalId) {
  document.getElementById(modalId).classList.add('hidden');
  document.getElementById(modalId).classList.remove('flex');
}

// Llenar modal de edición con los datos del rol
function openEditModalRole(role) {
  document.getElementById('editRoleId').value = role.role_id;
  document.getElementById('editRoleName').value = role.name;
  document.getElementById('editRoleDescription').value = role.description;
  openModal('editRoleModal');
}

// Placeholder para abrir modal de permisos (después lo implementamos)
function openPermissionsModal(roleId) {
  alert("Aquí se abrirá el modal dinámico de permisos para el rol ID: " + roleId);
}
</script>
