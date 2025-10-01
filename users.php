<?php
// index_users.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 ml-64">
  <main class="pt-20 p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Usuarios</h1>
      <a href="javascript:void(0)" onclick="openModal('addUserModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Usuario
      </a>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="usersTable">
        <thead class="bg-gradient-to-r from-purple-500 to-purple-700 text-white">
          <tr>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">ID</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Nombre</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Apellido</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Email</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Rol</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              $sql = "SELECT user_id, first_name, last_name, email, role FROM users ORDER BY user_id ASC";
              $stmt = $conn->query($sql);
              $users = $stmt->fetchAll();

              if ($users) {
                  foreach ($users as $i => $user) {
                      $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                      echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$user['user_id']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$user['first_name']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$user['last_name']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$user['email']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$user['role']}</td>";
                      echo "<td class='px-6 py-4 flex space-x-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModalUser(".json_encode($user).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center'><i class='fa-solid fa-pen mr-1'></i>Editar</a>";
                      echo "<a href='users_back/delete_user.php?id={$user['user_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center' onclick=\"return confirm('¿Estás seguro de eliminar este usuario?')\"><i class='fa-solid fa-trash mr-1'></i>Eliminar</a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='6' class='px-6 py-4 text-center text-gray-500'>No hay usuarios registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='6' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<?php include 'includes/modals/modals_users.php'; ?>
