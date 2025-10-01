<?php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 ml-64">
  <main class="pt-20 p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Docentes</h1>
      <a href="javascript:void(0)" onclick="openModal('addTeacherModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Docente
      </a>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="teachersTable">
        <thead class="bg-gradient-to-r from-indigo-500 to-indigo-700 text-white">
          <tr>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">ID</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Nombre</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Apellido</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Usuario</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              $sql = "SELECT t.teacher_id, t.first_name, t.last_name, u.email AS user_email 
                      FROM teachers t 
                      LEFT JOIN users u ON t.user_id = u.user_id 
                      ORDER BY t.teacher_id ASC";
              $stmt = $conn->query($sql);
              $teachers = $stmt->fetchAll();

              if ($teachers) {
                  foreach ($teachers as $i => $teacher) {
                      $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                      echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$teacher['teacher_id']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$teacher['first_name']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$teacher['last_name']}</td>";
                      echo "<td class='px-6 py-4 border-r border-gray-300'>{$teacher['user_email']}</td>";
                      echo "<td class='px-6 py-4 flex space-x-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModalTeacher(".json_encode($teacher).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center'><i class='fa-solid fa-pen mr-1'></i>Editar</a>";
                      echo "<a href='teachers_back/delete_teacher.php?id={$teacher['teacher_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center' onclick=\"return confirm('¿Estás seguro de eliminar este docente?')\"><i class='fa-solid fa-trash mr-1'></i>Eliminar</a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='5' class='px-6 py-4 text-center text-gray-500'>No hay docentes registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='5' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<?php include 'includes/modals/modals_teachers.php'; ?>
