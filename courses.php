<?php
// index_courses.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Cursos</h1>
      <a href="javascript:void(0)" onclick="openModal('addCourseModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex-shrink-0">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Curso
      </a>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse">
        <thead class="bg-gradient-to-r from-indigo-500 to-indigo-700 text-white">
          <tr>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase text-sm md:text-base">ID</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase text-sm md:text-base">Nombre</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase text-sm md:text-base">Descripción</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase text-sm md:text-base">Año</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase text-sm md:text-base">Turno</th>
            <th class="px-4 md:px-6 py-3 text-left font-medium uppercase text-sm md:text-base">Acciones</th>
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
                      $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                      echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$course['course_id']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$course['name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$course['description']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$course['year']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$course['shift']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 flex flex-wrap gap-2'>";
                      echo "<a href='javascript:void(0)' 
                              onclick='openEditModalCourse(".json_encode($course).")' 
                              class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center w-24 text-sm md:text-base'>
                              <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>";
                      echo "<a href='courses_back/delete_course.php?id={$course['course_id']}' 
                              class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center w-24 text-sm md:text-base' 
                              onclick=\"return confirm('¿Estás seguro de eliminar este curso?')\">
                              <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='6' class='px-4 md:px-6 py-4 text-center text-gray-500'>No hay cursos registrados</td></tr>";
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

<?php include 'includes/modals/modals_courses.php'; ?>
