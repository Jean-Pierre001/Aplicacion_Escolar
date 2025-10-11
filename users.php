<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Usuarios</h1>
      <a href="javascript:void(0)" onclick="openModal('addUserModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Usuario
      </a>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterLastName" placeholder="Filtrar por Apellido" class="px-3 py-2 border rounded w-48">
      <select id="filterRole" class="px-3 py-2 border rounded w-48">
        <option value="">Filtrar por Rol</option>
        <?php
        // Traemos roles desde la tabla roles
        try {
            $roleStmt = $conn->query("SELECT role_id, name FROM roles ORDER BY name ASC");
            $roles = $roleStmt->fetchAll();
            foreach ($roles as $role) {
                echo "<option value='{$role['name']}'>{$role['name']}</option>";
            }
        } catch (PDOException $e) {
            // Opcional: manejar error
        }
        ?>
      </select>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="usersTable">
        <thead class="bg-gradient-to-r from-purple-500 to-purple-700 text-white">
          <tr>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Nombre</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Apellido</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Email</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Rol</th>
            <th class="px-4 md:px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              // Traemos usuarios con el nombre del rol usando role_id
              $sql = "SELECT u.user_id, u.first_name, u.last_name, u.email, r.name AS role_name
                      FROM users u
                      LEFT JOIN roles r ON u.role_id = r.role_id
                      ORDER BY u.user_id ASC";
              $stmt = $conn->query($sql);
              $users = $stmt->fetchAll();

              if ($users) {
                  foreach ($users as $i => $user) {
                      $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                      echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$user['first_name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$user['last_name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$user['email']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$user['role_name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 flex flex-wrap gap-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModalUser(".json_encode($user).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center w-24'>
                              <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>";
                      echo "<a href='users_back/delete_user.php?id={$user['user_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center w-24' onclick=\"return confirm('¿Estás seguro de eliminar este usuario?')\">
                              <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='6' class='px-4 md:px-6 py-4 text-center text-gray-500'>No hay usuarios registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='6' class='px-4 md:px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<?php include 'includes/modals/modals_users.php'; ?>

<!-- Script de filtros dinámicos -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterName = document.getElementById('filterName');
    const filterLastName = document.getElementById('filterLastName');
    const filterRole = document.getElementById('filterRole');
    const table = document.getElementById('usersTable');
    const rows = table.querySelectorAll('tbody tr');

    function filterRows() {
        const nameVal = filterName.value.toLowerCase();
        const lastVal = filterLastName.value.toLowerCase();
        const roleVal = filterRole.value.toLowerCase();

        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            const firstName = cells[0].textContent.toLowerCase();
            const lastName = cells[1].textContent.toLowerCase();
            const role = cells[3].textContent.toLowerCase();

            if (firstName.includes(nameVal) && lastName.includes(lastVal) && (roleVal === '' || role === roleVal)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    filterName.addEventListener('input', filterRows);
    filterLastName.addEventListener('input', filterRows);
    filterRole.addEventListener('change', filterRows);
});
</script>
