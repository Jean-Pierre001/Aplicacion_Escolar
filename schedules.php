<?php
// index_schedules.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br>
  <br>
  <br>
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Horarios</h1>
      <a href="javascript:void(0)" onclick="openModal('addScheduleModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Horario
      </a>
    </div>

    <?php
    try {
        // 🔹 IMPORTANTE: Ahora sí traemos subject_id y teacher_id
        $sql = "SELECT sch.schedule_id, 
                       c.course_id, c.name AS course_name, 
                       sub.subject_id, sub.name AS subject_name, 
                       t.teacher_id, t.first_name AS teacher_first, t.last_name AS teacher_last,
                       sch.weekday, sch.start_time, sch.end_time
                FROM schedules sch
                LEFT JOIN courses c ON sch.course_id = c.course_id
                LEFT JOIN subjects sub ON sch.subject_id = sub.subject_id
                LEFT JOIN teachers t ON sch.teacher_id = t.teacher_id
                ORDER BY c.course_id, sch.weekday, sch.start_time";

        $stmt = $conn->query($sql);
        $schedules = $stmt->fetchAll();

        if ($schedules) {
            // Agrupar por curso
            $grouped = [];
            foreach ($schedules as $sch) {
                $grouped[$sch['course_name']][] = $sch;
            }

            foreach ($grouped as $course => $courseSchedules) {
                echo "<div class='mb-6 border rounded-lg shadow-lg overflow-hidden'>";

                // 👉 Título del curso con botón Exportar Excel
                echo "<div class='bg-indigo-500 text-white px-4 py-2 font-bold text-lg flex justify-between items-center'>";
                echo "<span>{$course}</span>";
                echo "<a href='export_schedule.php?course_id={$courseSchedules[0]['course_id']}' 
                        class='bg-green-500 hover:bg-green-700 text-white px-3 py-1 rounded flex items-center'>
                        <i class='fa-solid fa-file-excel mr-1'></i> Exportar Excel
                      </a>";
                echo "</div>";

                echo "<div class='overflow-x-auto'>";
                echo "<table class='min-w-full border-collapse'>";
                echo "<thead class='bg-gray-100'>
                        <tr>
                          <th class='px-4 py-2 border'>Materia</th>
                          <th class='px-4 py-2 border'>Docente</th>
                          <th class='px-4 py-2 border'>Día</th>
                          <th class='px-4 py-2 border'>Hora Inicio</th>
                          <th class='px-4 py-2 border'>Hora Fin</th>
                          <th class='px-4 py-2 border'>Acciones</th>
                        </tr>
                      </thead>";
                echo "<tbody>";
                foreach ($courseSchedules as $i => $sch) {
                    $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
                    echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                    echo "<td class='px-4 py-2 border'>{$sch['subject_name']}</td>";
                    echo "<td class='px-4 py-2 border'>{$sch['teacher_first']} {$sch['teacher_last']}</td>";
                    echo "<td class='px-4 py-2 border'>{$sch['weekday']}</td>";
                    echo "<td class='px-4 py-2 border'>{$sch['start_time']}</td>";
                    echo "<td class='px-4 py-2 border'>{$sch['end_time']}</td>";
                    echo "<td class='px-4 py-2 border flex flex-wrap gap-2'>
                            <a href='javascript:void(0)' 
                               onclick='openEditModalSchedule(".json_encode($sch).")' 
                               class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center w-24'>
                               <i class='fa-solid fa-pen mr-1'></i>Editar
                            </a>
                            <a href='schedules_back/delete_schedule.php?id={$sch['schedule_id']}' 
                               class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center w-24' 
                               onclick=\"return confirm('¿Estás seguro de eliminar este horario?')\">
                               <i class='fa-solid fa-trash mr-1'></i>Eliminar
                            </a>
                          </td>";
                    echo "</tr>";
                }
                echo "</tbody></table></div></div>";
            }

        } else {
            echo "<p class='text-center text-gray-500'>No hay horarios registrados</p>";
        }
    } catch (PDOException $e) {
        echo "<p class='text-center text-red-600'>Error: {$e->getMessage()}</p>";
    }
    ?>

  </main>
</div>

<?php include 'includes/modals/modals_schedules.php'; ?>
