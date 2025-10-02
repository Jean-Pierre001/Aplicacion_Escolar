<?php
// index_students.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Estudiantes</h1>
      <a href="javascript:void(0)" onclick="openModal('addStudentModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Estudiante
      </a>
    </div>

    <?php
    try {
        // Traemos todos los estudiantes con el nombre y ID del curso
        $sql = "SELECT s.student_id, s.last_name, s.first_name, s.DNI, c.course_id, c.name AS course_name
                FROM students s
                LEFT JOIN courses c ON s.course_id = c.course_id
                ORDER BY c.name, s.last_name, s.first_name";
        $stmt = $conn->query($sql);
        $students = $stmt->fetchAll();

        if ($students) {
            // Agrupar por curso
            $grouped = [];
            foreach ($students as $student) {
                $grouped[$student['course_name']][] = $student;
            }

            foreach ($grouped as $course => $courseStudents) {
                echo "<div class='mb-6 border rounded-lg shadow-lg overflow-hidden'>";
                
                // Título del curso + botón Mover Estudiantes
                echo "<div class='bg-gradient-to-r from-blue-500 to-blue-700 text-white px-4 py-2 font-bold text-lg flex justify-between items-center'>";
                echo "<span>{$course}</span>";
                echo "<a href='javascript:void(0)' 
                        onclick=\"openModalMoveStudents({$courseStudents[0]['course_id']}, '{$course}')\" 
                        class='bg-purple-500 hover:bg-purple-700 text-white px-3 py-1 rounded flex items-center'>
                        <i class='fa-solid fa-arrows-right-left mr-1'></i> Mover Estudiantes
                      </a>";
                echo "</div>";
                
                echo "<div class='overflow-x-auto'>";
                echo "<table class='min-w-full border-collapse'>";
                echo "<thead class='bg-gray-100'>
                        <tr>
                          <th class='px-4 py-2 border'>ID</th>
                          <th class='px-4 py-2 border'>Apellido</th>
                          <th class='px-4 py-2 border'>Nombre</th>
                          <th class='px-4 py-2 border'>DNI</th>
                          <th class='px-4 py-2 border'>Acciones</th>
                        </tr>
                      </thead>";
                echo "<tbody>";
                
                foreach ($courseStudents as $i => $student) {
                    $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                    echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                    echo "<td class='px-4 py-2 border'>{$student['student_id']}</td>";
                    echo "<td class='px-4 py-2 border'>{$student['last_name']}</td>";
                    echo "<td class='px-4 py-2 border'>{$student['first_name']}</td>";
                    echo "<td class='px-4 py-2 border'>{$student['DNI']}</td>";
                    echo "<td class='px-4 py-2 border flex gap-2 justify-start'>
                            <a href='javascript:void(0)' 
                               onclick='openEditModal(".json_encode($student).")' 
                               class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center'>
                               <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>
                            <a href='students_back/delete_student.php?id={$student['student_id']}' 
                               class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center'
                               onclick=\"return confirm('¿Estás seguro de eliminar este estudiante?')\">
                               <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>
                          </td>";
                    echo "</tr>";
                }

                echo "</tbody></table></div></div>";
            }

        } else {
            echo "<p class='text-center text-gray-500'>No hay estudiantes registrados</p>";
        }
    } catch (PDOException $e) {
        echo "<p class='text-center text-red-600'>Error: {$e->getMessage()}</p>";
    }
    ?>
  </main>
</div>

<?php include 'includes/modals/modals_students.php' ?>
