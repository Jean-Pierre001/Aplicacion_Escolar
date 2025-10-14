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
      <h1 class="text-3xl font-bold text-gray-800">Lista de Aulas</h1>
      <a href="javascript:void(0)" onclick="openModal('addClassroomModal')" 
         class="inline-flex items-center bg-green-700 text-white px-5 py-2 rounded-md shadow hover:bg-green-800 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Aula
      </a>
    </div>

    <!-- Filtro dinámico -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
    </div>

    <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
      <table class="min-w-full text-sm text-gray-700 border-collapse" id="classroomsTable">
        <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
          <tr>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Nombre</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Descripción</th>
            <th class="px-6 py-3 text-center">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              $stmt = $conn->query("SELECT * FROM classrooms ORDER BY classroom_id ASC");
              $classrooms = $stmt->fetchAll();

              if ($classrooms) {
                  foreach ($classrooms as $i => $classroom) {
                      $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                      echo "<tr class='hover:bg-gray-50 {$rowClass} border-b border-gray-200'>";
                      echo "<td class='px-6 py-3 border-r border-gray-300 font-medium'>{$classroom['name']}</td>";
                      echo "<td class='px-6 py-3 border-r border-gray-300'>{$classroom['description']}</td>";
                      echo "<td class='px-6 py-3 flex gap-2 justify-center'>";

                      echo "<a href='javascript:void(0)' onclick='openEditModalClassroom(".json_encode($classroom).")' 
                                 class='flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md transition w-24'>
                                 <i class='fa-solid fa-pen mr-1'></i>Editar
                              </a>";

                      echo "<a href='classrooms_back/delete_classroom.php?id={$classroom['classroom_id']}' 
                                 class='flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md transition w-24' 
                                 onclick=\"return confirm('¿Estás seguro de eliminar esta aula?')\">
                                 <i class='fa-solid fa-trash mr-1'></i>Eliminar
                              </a>";

                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='3' class='px-6 py-3 text-center text-gray-500'>No hay aulas registradas</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='3' class='px-6 py-3 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>


<?php include 'includes/modals/modals_classrooms.php'; ?>

<!-- Script de filtro dinámico -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterName = document.getElementById('filterName');
    const table = document.getElementById('classroomsTable');
    const rows = table.querySelectorAll('tbody tr');

    filterName.addEventListener('input', () => {
        const val = filterName.value.toLowerCase();
        rows.forEach(row => {
            const name = row.querySelectorAll('td')[0].textContent.toLowerCase();
            row.style.display = name.includes(val) ? '' : 'none';
        });
    });
});

// Funciones para abrir modales
function openModal(modalId) {
    document.getElementById(modalId).classList.remove('hidden');
}
function closeModal(modalId) {
    document.getElementById(modalId).classList.add('hidden');
}
function openEditModalClassroom(classroom) {
    openModal('addClassroomModal');
    document.getElementById('classroom_id').value = classroom.classroom_id;
    document.getElementById('name').value = classroom.name;
    document.getElementById('description').value = classroom.description;
}
</script>
