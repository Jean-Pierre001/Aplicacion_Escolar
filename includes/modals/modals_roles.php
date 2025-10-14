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
<div id="permissionsModal" class="fixed inset-0 hidden items-center justify-center bg-black bg-opacity-60 z-50">
  <div class="bg-white rounded-2xl w-11/12 max-w-6xl shadow-2xl overflow-hidden flex flex-col border border-gray-200">

    <!-- Encabezado -->
    <div class="bg-gradient-to-r from-blue-800 to-blue-900 text-white px-6 py-4 flex justify-between items-center">
      <h2 class="text-2xl font-semibold tracking-wide">
        Permisos del Rol: <span id="roleNamePermissions" class="font-bold text-yellow-300"></span>
      </h2>
      <button onclick="closeModal('permissionsModal')" class="text-white hover:text-yellow-400 transition text-2xl">&times;</button>
    </div>

    <!-- Cuerpo -->
    <div class="flex flex-col h-[600px] bg-gradient-to-b from-blue-800 to-blue-900 text-white overflow-y-auto p-5">
      <form id="permissionsForm" method="POST" action="roles_back/save_permissions.php" class="space-y-4">
        <input type="hidden" name="role_id" id="permissionsRoleId">

        <!-- Dashboard -->
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-blue-700 transition">
            <div class="flex items-center">
              <i class="fas fa-home mr-3 text-yellow-400"></i>
              <span class="font-medium">Dashboard</span>
            </div>
            <input type="checkbox" class="accent-yellow-400 parent-checkbox" data-target="dashboard">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-200">
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="index.php:view" class="child-dashboard accent-yellow-400"> Ver
            </label>
          </div>
        </div>

        <!-- Asistencias -->
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-blue-700 transition">
            <div class="flex items-center">
              <i class="fas fa-clipboard-check mr-3 text-yellow-400"></i>
              <span class="font-medium">Asistencias</span>
            </div>
            <input type="checkbox" class="accent-yellow-400 parent-checkbox" data-target="attendance">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-200">
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="attendance.php:view" class="child-attendance accent-yellow-400"> Toma de Asistencia</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="attendance_report.php:view" class="child-attendance accent-yellow-400"> Consulta de Asistencia</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="attendance_reports_list.php:view" class="child-attendance accent-yellow-400"> Lista de Reportes</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="student_attendance.php:view" class="child-attendance accent-yellow-400"> Consulta Estudiante</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="teachers_attendance.php:view" class="child-attendance accent-yellow-400"> Consulta Docentes</label>
          </div>
        </div>

        <!-- Gestión -->
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-blue-700 transition">
            <div class="flex items-center">
              <i class="fas fa-cogs mr-3 text-yellow-400"></i>
              <span class="font-medium">Gestión</span>
            </div>
            <input type="checkbox" class="accent-yellow-400 parent-checkbox" data-target="management">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-200">
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="teachers.php:view" class="child-management accent-yellow-400"> Docentes</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="students.php:view" class="child-management accent-yellow-400"> Alumnos</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="courses.php:view" class="child-management accent-yellow-400"> Cursos</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="subjects.php:view" class="child-management accent-yellow-400"> Materias</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="schedules.php:view" class="child-management accent-yellow-400"> Horarios</label>
          </div>
        </div>

        <!-- Administrador -->
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-blue-700 transition">
            <div class="flex items-center">
              <i class="fas fa-user-shield mr-3 text-yellow-400"></i>
              <span class="font-medium">Administrador</span>
            </div>
            <input type="checkbox" class="accent-yellow-400 parent-checkbox" data-target="admin">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-200">
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="users.php:view" class="child-admin accent-yellow-400"> Usuarios</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="roles.php:view" class="child-admin accent-yellow-400"> Roles</label>
            <label class="flex items-center gap-2"><input type="checkbox" name="permissions[]" value="attendance_report_admin.php:view" class="child-admin accent-yellow-400"> Consulta Admin</label> 
          </div>
        </div>
      </form>
    </div>

    <!-- Pie de acciones -->
    <div class="bg-gray-100 border-t px-6 py-4 flex justify-end gap-3">
      <button type="button" onclick="closeModal('permissionsModal')" class="px-5 py-2 bg-gray-300 text-gray-800 font-medium rounded-lg hover:bg-gray-400 transition">Cancelar</button>
      <button type="submit" form="permissionsForm" class="px-5 py-2 bg-green-600 text-white font-medium rounded-lg hover:bg-green-700 transition">Guardar Permisos</button>
    </div>
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
