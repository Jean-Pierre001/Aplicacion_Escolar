<?php
// index_schedules.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Horarios</h1>
      <a href="javascript:void(0)" onclick="openModal('addScheduleModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Horario
      </a>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterSubject" placeholder="Filtrar por Materia" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterTeacher" placeholder="Filtrar por Docente" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterWeekday" placeholder="Filtrar por Día" class="px-3 py-2 border rounded w-48">
    </div>

    <?php
    try {
        // Consulta incluyendo grupo
        $sql = "SELECT sch.schedule_id, 
                       c.course_id, c.name AS course_name, 
                       g.group_id, g.name AS group_name,
                       sub.subject_id, sub.name AS subject_name, 
                       t.teacher_id, t.first_name AS teacher_first, t.last_name AS teacher_last,
                       sch.weekday, sch.start_time, sch.end_time
                FROM schedules sch
                LEFT JOIN courses c ON sch.course_id = c.course_id
                LEFT JOIN groups g ON sch.group_id = g.group_id
                LEFT JOIN subjects sub ON sch.subject_id = sub.subject_id
                LEFT JOIN teachers t ON sch.teacher_id = t.teacher_id
                WHERE sch.weekday != 'Saturday'
                ORDER BY c.course_id, g.group_id, sch.weekday, sch.start_time";

        $stmt = $conn->query($sql);
        $schedules = $stmt->fetchAll();

        if ($schedules) {
            // Agrupar por curso y grupo
            $grouped = [];
            foreach ($schedules as $sch) {
                $course = $sch['course_name'];
                $group = $sch['group_name'] ?? 'general';
                $grouped[$course][$group][] = $sch;
            }

            // Array para traducir días
            $weekdays_es = [
                'monday'    => 'Lunes',
                'tuesday'   => 'Martes',
                'wednesday' => 'Miércoles',
                'thursday'  => 'Jueves',
                'friday'    => 'Viernes'
            ];

            foreach ($grouped as $course => $groups) {
                echo "<div class='mb-6 border rounded-lg shadow-lg overflow-hidden'>";
                echo "<div class='bg-indigo-500 text-white px-4 py-2 font-bold text-lg flex justify-between items-center'>";
                echo "<span>{$course}</span>";
                echo "<a href='export_schedule.php?course_id={$groups[array_key_first($groups)][0]['course_id']}' 
                        class='bg-green-500 hover:bg-green-700 text-white px-3 py-1 rounded flex items-center'>
                        <i class='fa-solid fa-file-excel mr-1'></i> Exportar Excel
                      </a>";
                echo "</div>";

                foreach ($groups as $group_name => $courseSchedules) {
                    if ($group_name !== 'general') {
                        echo "<div class='bg-gray-200 px-4 py-1 font-semibold text-gray-700'>Grupo: {$group_name}</div>";
                    }

                    echo "<div class='overflow-x-auto'>";
                    echo "<table class='min-w-full border-collapse' id='schedulesTable'>";
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
                        $weekday_es = $weekdays_es[strtolower($sch['weekday'])] ?? ucfirst($sch['weekday']);

                        echo "<tr class='hover:bg-gray-100 {$rowClass}'>";
                        echo "<td class='px-4 py-2 border'>{$sch['subject_name']}</td>";
                        echo "<td class='px-4 py-2 border'>{$sch['teacher_first']} {$sch['teacher_last']}</td>";
                        echo "<td class='px-4 py-2 border'>{$weekday_es}</td>";
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
                    echo "</tbody></table></div>";
                }

                echo "</div>"; // cierre div curso
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

<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterSubject = document.getElementById('filterSubject');
    const filterTeacher = document.getElementById('filterTeacher');
    const filterWeekday = document.getElementById('filterWeekday');
    const tables = document.querySelectorAll('#schedulesTable');

    function filterRows() {
        const subjectVal = filterSubject.value.toLowerCase();
        const teacherVal = filterTeacher.value.toLowerCase();
        const weekdayVal = filterWeekday.value.toLowerCase();

        tables.forEach(table => {
            const rows = table.querySelectorAll('tbody tr');
            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                const subject = cells[0].textContent.toLowerCase();
                const teacher = cells[1].textContent.toLowerCase();
                const weekday = cells[2].textContent.toLowerCase();

                if (subject.includes(subjectVal) && teacher.includes(teacherVal) && weekday.includes(weekdayVal)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    }

    filterSubject.addEventListener('input', filterRows);
    filterTeacher.addEventListener('input', filterRows);
    filterWeekday.addEventListener('input', filterRows);
});
</script>
