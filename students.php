<?php
// index.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 ml-64">
  <main class="pt-20 p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Estudiantes</h1>
      <a href="javascript:void(0)" onclick="openModal('addStudentModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Estudiante
      </a>
    </div>

    <div class="overflow-x-auto bg-white rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gradient-to-r from-blue-500 to-blue-700 text-white">
          <tr>
            <th class="px-6 py-3 text-left font-medium uppercase">ID</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Apellido</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Nombre</th>
            <th class="px-6 py-3 text-left font-medium uppercase">DNI</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Curso</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php
          try {
              $sql = "SELECT s.student_id, s.last_name, s.first_name, s.DNI, c.name AS course_name
                      FROM students s
                      LEFT JOIN courses c ON s.course_id = c.course_id
                      ORDER BY s.student_id ASC";
              $stmt = $conn->query($sql);
              $students = $stmt->fetchAll();

              if ($students) {
                  foreach ($students as $student) {
                      echo "<tr class='hover:bg-gray-50'>";
                      echo "<td class='px-6 py-4'>{$student['student_id']}</td>";
                      echo "<td class='px-6 py-4'>{$student['last_name']}</td>";
                      echo "<td class='px-6 py-4'>{$student['first_name']}</td>";
                      echo "<td class='px-6 py-4'>{$student['DNI']}</td>";
                      echo "<td class='px-6 py-4'>{$student['course_name']}</td>";
                      echo "<td class='px-6 py-4 flex space-x-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModal(".json_encode($student).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center'><i class='fa-solid fa-pen mr-1'></i>Editar</a>";
                      echo "<a href='students_back/delete_student.php?id={$student['student_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center' onclick=\"return confirm('¿Estás seguro de eliminar este estudiante?')\"><i class='fa-solid fa-trash mr-1'></i>Eliminar</a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='6' class='px-6 py-4 text-center text-gray-500'>No hay estudiantes registrados</td></tr>";
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

<?php include 'includes/modals/modals_students.php'?>


