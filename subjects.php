<?php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Materias</h1>
      <a href="javascript:void(0)" onclick="openModal('addSubjectModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Materia
      </a>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="subjectsTable">
        <thead class="bg-gradient-to-r from-green-500 to-green-700 text-white">
          <tr>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Nombre</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Descripción</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Curso</th>
            <th class="px-4 md:px-6 py-3 border-r border-gray-300 text-left font-medium uppercase">Turno</th>
            <th class="px-4 md:px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php
          try {
              $sql = "SELECT s.*, c.name AS course_name 
                      FROM subjects s 
                      LEFT JOIN courses c ON s.course_id = c.course_id
                      ORDER BY s.subject_id ASC";
              $stmt = $conn->query($sql);
              $subjects = $stmt->fetchAll();

              if ($subjects) {
                  foreach ($subjects as $i => $subject) {
                      $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                      echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$subject['name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$subject['description']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$subject['course_name']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 border-r border-gray-300'>{$subject['turno']}</td>";
                      echo "<td class='px-4 md:px-6 py-4 flex flex-wrap gap-2'>";
                      echo "<a href='javascript:void(0)' 
                              onclick='openEditModalSubject(".json_encode($subject).")' 
                              class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center w-24'>
                              <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>";
                      echo "<a href='subjects_back/delete_subject.php?id={$subject['subject_id']}' 
                              class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center w-24' 
                              onclick=\"return confirm('¿Estás seguro de eliminar esta materia?')\">
                              <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='6' class='px-4 md:px-6 py-4 text-center text-gray-500'>No hay materias registradas</td></tr>";
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

<?php include 'includes/modals/modals_subjects.php'; ?>
