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
      <h1 class="text-3xl font-bold text-gray-800">Lista de Docentes</h1>
      <a href="javascript:void(0)" onclick="openModal('addTeacherModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Docente
      </a>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterTeacherLastName" placeholder="Filtrar por Apellido" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterTeacherName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterTeacherEmail" placeholder="Filtrar por Usuario" class="px-3 py-2 border rounded w-48">
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="teachersTable">
        <thead class="bg-gradient-to-r from-indigo-500 to-indigo-700 text-white">
          <tr>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Apellido</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Nombre</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Usuario</th>
            <th class="px-4 md:px-6 py-3 text-left font-medium uppercase">Acciones</th>
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
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$teacher['last_name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$teacher['first_name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$teacher['user_email']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 flex flex-wrap gap-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModalTeacher(".json_encode($teacher).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center w-24'>
                              <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>";
                      echo "<a href='teachers_back/delete_teacher.php?id={$teacher['teacher_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center w-24' onclick=\"return confirm('¿Estás seguro de eliminar este docente?')\">
                              <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='4' class='px-4 md:px-6 py-4 text-center text-gray-500'>No hay docentes registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='4' class='px-4 md:px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<?php include 'includes/modals/modals_teachers.php'; ?>

<!-- Script de filtros dinámicos -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterName = document.getElementById('filterTeacherName');
    const filterLastName = document.getElementById('filterTeacherLastName');
    const filterEmail = document.getElementById('filterTeacherEmail');
    const table = document.getElementById('teachersTable');
    const rows = table.querySelectorAll('tbody tr');

    function filterRows() {
        const nameVal = filterName.value.toLowerCase();
        const lastVal = filterLastName.value.toLowerCase();
        const emailVal = filterEmail.value.toLowerCase();

        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            const lastName = cells[0].textContent.toLowerCase(); // Apellido
            const firstName = cells[1].textContent.toLowerCase(); // Nombre
            const email = cells[2].textContent.toLowerCase(); // Usuario

            if (firstName.includes(nameVal) && lastName.includes(lastVal) && email.includes(emailVal)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    filterName.addEventListener('input', filterRows);
    filterLastName.addEventListener('input', filterRows);
    filterEmail.addEventListener('input', filterRows);
});
</script>
