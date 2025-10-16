<?php
// index_students.php
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
      <h1 class="text-3xl font-bold text-gray-800">Lista de Estudiantes</h1>
      <a href="javascript:void(0)" onclick="openModal('addStudentModal')" 
         class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-md shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Estudiante
      </a>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterLastName" placeholder="Filtrar por Apellido" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterFirstName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterDNI" placeholder="Filtrar por DNI" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterGroup" placeholder="Filtrar por Grupo" class="px-3 py-2 border rounded w-48">
    </div>

    <?php
    try {
        $sql = "SELECT s.student_id, s.last_name, s.first_name, s.DNI, c.course_id, c.name AS course_name, g.group_id, g.name AS group_name
                FROM students s
                LEFT JOIN courses c ON s.course_id = c.course_id
                LEFT JOIN groups g ON s.group_id = g.group_id
                ORDER BY c.name, g.name, s.last_name, s.first_name";
        $stmt = $conn->query($sql);
        $students = $stmt->fetchAll();

        if ($students) {
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
                        class='bg-purple-500 hover:bg-purple-700 text-white px-3 py-1 rounded-md flex items-center justify-center transition w-36'>
                        <i class='fa-solid fa-arrows-right-left mr-1'></i> Promoveer
                      </a>";
                echo "</div>";

                echo "<div class='overflow-x-auto'>";
                echo "<table class='min-w-full text-sm text-gray-700 border-collapse studentsTable'>";
                echo "<thead class='bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300'>
                        <tr>
                          <th class='px-6 py-3 border'>Apellido</th>
                          <th class='px-6 py-3 border'>Nombre</th>
                          <th class='px-6 py-3 border'>DNI</th>
                          <th class='px-6 py-3 border'>Grupo</th>
                          <th class='px-6 py-3 border text-center'>Acciones</th>
                        </tr>
                      </thead>";
                echo "<tbody>";

                foreach ($courseStudents as $i => $student) {
                    $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                    $groupDisplay = $student['group_name'] ?? '-';
                    echo "<tr class='hover:bg-gray-50 {$rowClass}'>";
                    echo "<td class='px-6 py-3 border'>{$student['last_name']}</td>";
                    echo "<td class='px-6 py-3 border'>{$student['first_name']}</td>";
                    echo "<td class='px-6 py-3 border'>{$student['DNI']}</td>";
                    echo "<td class='px-6 py-3 border'>{$groupDisplay}</td>";
                    echo "<td class='px-6 py-3 border text-center flex justify-center gap-2'>
                            <a href='javascript:void(0)' 
                               onclick='openEditModal(".json_encode($student).")' 
                               class='flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md w-24 transition'>
                               <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>
                            <a href='students_back/delete_student.php?id={$student['student_id']}' 
                               class='flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md w-24 transition'
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

<!-- Script de filtros dinámicos -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterLastName = document.getElementById('filterLastName');
    const filterFirstName = document.getElementById('filterFirstName');
    const filterDNI = document.getElementById('filterDNI');
    const filterGroup = document.getElementById('filterGroup');

    // Seleccionamos todas las tablas de estudiantes por su clase
    const tables = document.querySelectorAll('.studentsTable');

    function filterRows() {
        const lastNameVal = filterLastName.value.toLowerCase();
        const firstNameVal = filterFirstName.value.toLowerCase();
        const dniVal = filterDNI.value.toLowerCase();
        const groupVal = filterGroup.value.toLowerCase();

        tables.forEach(table => {
            const rows = table.querySelectorAll('tbody tr');
            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                const lastName = cells[0].textContent.toLowerCase();
                const firstName = cells[1].textContent.toLowerCase();
                const dni = cells[2].textContent.toLowerCase();
                const group = cells[3].textContent.toLowerCase();

                // Mostramos u ocultamos la fila según el filtro
                if (lastName.includes(lastNameVal) &&
                    firstName.includes(firstNameVal) &&
                    dni.includes(dniVal) &&
                    group.includes(groupVal)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    }

    // Asignamos el evento input a todos los filtros
    [filterLastName, filterFirstName, filterDNI, filterGroup].forEach(input => {
        input.addEventListener('input', filterRows);
    });
});
</script>

