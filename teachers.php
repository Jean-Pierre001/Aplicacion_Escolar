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

    <!-- Encabezado y botón principal -->
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Docentes</h1>
      <a href="javascript:void(0)" onclick="openModal('addTeacherModal')" 
         class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-md shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Docente
      </a>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterTeacherLastName" placeholder="Filtrar por Apellido" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterTeacherName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterTeacherEmail" placeholder="Filtrar por Usuario" class="px-3 py-2 border rounded w-48">
    </div>

    <!-- Tabla de docentes -->
    <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
      <table class="min-w-full text-sm text-gray-700 border-collapse" id="teachersTable">
        <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
          <tr>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Apellido</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Nombre</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Usuario</th>
            <th class="px-6 py-3 border-r border-gray-300 text-center">Acciones</th>
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
                      $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                      echo "<tr class='{$rowClass} border-b border-gray-200 hover:bg-gray-50'>";
                      echo "<td class='px-6 py-3 border-r border-gray-300'>{$teacher['last_name']}</td>";
                      echo "<td class='px-6 py-3 border-r border-gray-300'>{$teacher['first_name']}</td>";
                      echo "<td class='px-6 py-3 border-r border-gray-300'>{$teacher['user_email']}</td>";
                      echo "<td class='px-6 py-3 border-r border-gray-300 text-center flex justify-center gap-2'>
                              <a href='javascript:void(0)' onclick='openEditModalTeacher(".json_encode($teacher).")' 
                                 class='flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md transition w-24'>
                                  <i class='fa-solid fa-pen mr-1'></i>Editar
                              </a>
                              <a href='teachers_back/delete_teacher.php?id={$teacher['teacher_id']}' 
                                 class='flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md transition w-24'
                                 onclick=\"return confirm('¿Estás seguro de eliminar este docente?')\">
                                  <i class='fa-solid fa-trash mr-1'></i>Eliminar
                              </a>
                            </td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='4' class='px-6 py-4 text-center text-gray-500'>No hay docentes registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='4' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
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
