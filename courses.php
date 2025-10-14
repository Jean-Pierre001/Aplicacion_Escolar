<?php
// index_courses.php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">

    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Cursos</h1>
      <a href="javascript:void(0)" onclick="openModal('addCourseModal')" 
         class="inline-flex items-center bg-blue-700 text-white px-5 py-2 rounded-md shadow hover:bg-blue-800 transition flex-shrink-0">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Curso
      </a>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterDescription" placeholder="Filtrar por Descripción" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterDegree" placeholder="Filtrar por Tecnicatura" class="px-3 py-2 border rounded w-48">
    </div>

    <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
      <table class="min-w-full text-sm text-gray-700 border-collapse" id="coursesTable">
        <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
          <tr>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Nombre</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Descripción</th>
            <th class="px-6 py-3 border-r border-gray-300 text-left">Tecnicatura</th>
            <th class="px-6 py-3 text-center">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              $sql = "SELECT * FROM courses ORDER BY course_id ASC";
              $stmt = $conn->query($sql);
              $courses = $stmt->fetchAll();

              if ($courses) {
                  foreach ($courses as $i => $course) {
                      $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                      echo "<tr class='hover:bg-gray-50 {$rowClass} border-b border-gray-200'>";
                      echo "<td class='px-6 py-3 border-r border-gray-300 font-medium'>{$course['name']}</td>";
                      echo "<td class='px-6 py-3 border-r border-gray-300'>{$course['description']}</td>";
                      echo "<td class='px-6 py-3 border-r border-gray-300'>{$course['technical_degree']}</td>";
                      echo "<td class='px-6 py-3 flex gap-2 justify-center'>";

                      echo "<a href='javascript:void(0)' 
                                 onclick='openEditModalCourse(".json_encode($course).")' 
                                 class='flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md transition w-24'>
                                 <i class='fa-solid fa-pen mr-1'></i>Editar
                              </a>";

                      echo "<a href='courses_back/delete_course.php?id={$course['course_id']}' 
                                 class='flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md transition w-24' 
                                 onclick=\"return confirm('¿Estás seguro de eliminar este curso?')\">
                                 <i class='fa-solid fa-trash mr-1'></i>Eliminar
                              </a>";

                      echo "<a href='javascript:void(0)' 
                                 onclick='openManageGroupsModal({$course['course_id']}, \"{$course['name']}\")' 
                                 class='flex items-center justify-center bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded-md transition w-32'>
                                 <i class='fa-solid fa-layer-group mr-1'></i>Grupos
                              </a>";      

                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='4' class='px-6 py-3 text-center text-gray-500'>No hay cursos registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='4' class='px-6 py-3 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>


<?php include 'includes/modals/modals_courses.php'; ?>

<!-- Script de filtros dinámicos -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterName = document.getElementById('filterName');
    const filterDescription = document.getElementById('filterDescription');
    const filterDegree = document.getElementById('filterDegree');
    const table = document.getElementById('coursesTable');

    function filterRows() {
        const nameVal = filterName.value.toLowerCase();
        const descriptionVal = filterDescription.value.toLowerCase();
        const degreeVal = filterDegree.value.toLowerCase();

        const rows = table.querySelectorAll('tbody tr');
        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            const name = cells[0].textContent.toLowerCase();
            const description = cells[1].textContent.toLowerCase();
            const degree = cells[2].textContent.toLowerCase();

            if (name.includes(nameVal) && description.includes(descriptionVal) && degree.includes(degreeVal)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    filterName.addEventListener('input', filterRows);
    filterDescription.addEventListener('input', filterRows);
    filterDegree.addEventListener('input', filterRows);
});
</script>
