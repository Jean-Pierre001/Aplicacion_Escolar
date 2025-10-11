<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Roles</h1>
      <a href="javascript:void(0)" onclick="openModal('addRoleModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Rol
      </a>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="rolesTable">
        <thead class="bg-gradient-to-r from-purple-500 to-purple-700 text-white">
          <tr>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Nombre</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Descripción</th>
            <th class="px-4 md:px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              $sql = "SELECT * FROM roles ORDER BY role_id ASC";
              $stmt = $conn->query($sql);
              $roles = $stmt->fetchAll();

              if ($roles) {
                  foreach ($roles as $i => $role) {
                      $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                      echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$role['name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$role['description']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 flex flex-wrap gap-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModalRole(".json_encode($role).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center w-24'>
                              <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>";
                      echo "<a href='roles_back/delete_role.php?id={$role['role_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center w-24' onclick=\"return confirm('¿Estás seguro de eliminar este rol?')\">
                              <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>";
                      echo "<a href='javascript:void(0)' onclick='openPermissionsModal({$role['role_id']}, \"{$role['name']}\")' class='text-green-600 hover:text-green-800 bg-green-100 px-3 py-1 rounded flex items-center justify-center w-28'>
                              <i class='fa-solid fa-key mr-1'></i>Permisos
                            </a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='3' class='px-4 md:px-6 py-4 text-center text-gray-500'>No hay roles registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='3' class='px-4 md:px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<!-- Modales -->
<?php include 'includes/modals/modals_roles.php'; ?>

<!-- Scripts -->
<script>
// Modal permisos
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

// Checkbox padres/hijos
document.querySelectorAll('.parent-checkbox').forEach(parent => {
  parent.addEventListener('change', function() {
    const target = parent.dataset.target;
    document.querySelectorAll('.child-' + target).forEach(child => {
      child.checked = parent.checked;
    });
  });
});
</script>
