<?php
// index_schedules.php
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
      <h1 class="text-3xl font-bold text-gray-800">Lista de Horarios</h1>
      <a href="javascript:void(0)" onclick="openModal('addScheduleModal')" 
         class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-md shadow hover:bg-blue-700 transition w-full md:w-auto justify-center">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Horario
      </a>
    </div>

    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterSubject" placeholder="Filtrar por Materia" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterTeacher" placeholder="Filtrar por Docente" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterWeekday" placeholder="Filtrar por Día" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterShift" placeholder="Filtrar por Turno" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterClassroom" placeholder="Filtrar por Aula" class="px-3 py-2 border rounded w-48">
    </div>

    <!-- Secciones de Exportación (Mañana / Tarde) -->
    <div class="p-4 bg-white shadow-md rounded-lg mb-4">
      <h2 class="text-2xl font-bold text-gray-700 mb-3">📅 Exportar Horarios (Turno Mañana)</h2>
      <button onclick="document.getElementById('modalExportarManiana').classList.remove('hidden')" 
              class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors">
        Exportar Distribucion del Día
      </button>
    </div>

    <div class="p-4 bg-white shadow-md rounded-lg mb-4">
      <h2 class="text-2xl font-bold text-gray-700 mb-3">📅 Exportar Horarios del Día (Turno Tarde)</h2>
      <button onclick="document.getElementById('modalExportar').classList.remove('hidden')" 
              class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors">
        Exportar Distribucion del Día
      </button>
    </div>

    <?php
    try {
        $sql = "SELECT sch.schedule_id, 
                       c.course_id, c.name AS course_name, 
                       g.group_id, g.name AS group_name,
                       sub.subject_id, sub.name AS subject_name, sub.turno AS subject_shift,
                       t.teacher_id, t.first_name AS teacher_first, t.last_name AS teacher_last,
                       tsub.teacher_id AS sub_teacher_id, tsub.first_name AS sub_teacher_first, tsub.last_name AS sub_teacher_last,
                       cl.classroom_id, cl.name AS classroom_name,
                       sch.weekday, sch.start_time, sch.end_time
                FROM schedules sch
                LEFT JOIN courses c ON sch.course_id = c.course_id
                LEFT JOIN groups g ON sch.group_id = g.group_id
                LEFT JOIN subjects sub ON sch.subject_id = sub.subject_id
                LEFT JOIN teachers t ON sch.teacher_id = t.teacher_id
                LEFT JOIN teachers tsub ON sch.substitute_teacher_id = tsub.teacher_id
                LEFT JOIN classrooms cl ON sch.classroom_id = cl.classroom_id
                WHERE sch.weekday != 'Saturday'
                ORDER BY c.course_id, g.group_id, sch.weekday, sch.start_time";

        $stmt = $conn->query($sql);
        $schedules = $stmt->fetchAll();

        if ($schedules) {
            $grouped = [];
            foreach ($schedules as $sch) {
                $course = $sch['course_name'];
                $group = $sch['group_name'] ?? 'general';
                $grouped[$course][$group][] = $sch;
            }

            $weekdays_es = [
                'monday'    => 'Lunes',
                'tuesday'   => 'Martes',
                'wednesday' => 'Miércoles',
                'thursday'  => 'Jueves',
                'friday'    => 'Viernes'
            ];

            foreach ($grouped as $course => $groups) {
                echo "<div class='course-container mb-6 border rounded-lg shadow-lg overflow-hidden'>";

                // Encabezado curso + Exportar Excel
                echo "<div class='bg-indigo-500 text-white px-4 py-2 font-bold text-lg flex justify-between items-center'>";
                echo "<span>{$course}</span>";
                echo "<a href='export_schedule.php?course_id={$groups[array_key_first($groups)][0]['course_id']}' 
                        class='bg-green-500 hover:bg-green-700 text-white px-3 py-1 rounded-md flex items-center justify-center w-36 transition'>
                        <i class='fa-solid fa-file-excel mr-1'></i> Exportar
                      </a>";
                echo "</div>";

                foreach ($groups as $group_name => $courseSchedules) {
                    echo "<div class='group-container'>";
                    if ($group_name !== 'general') {
                        echo "<div class='bg-gray-200 px-4 py-1 font-semibold text-gray-700'>Grupo: {$group_name}</div>";
                    }

                    echo "<div class='overflow-x-auto'>";
                    echo "<table class='min-w-full text-sm text-gray-700 border-collapse schedulesTable'>";
                    echo "<thead class='bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300'>
                            <tr>
                              <th class='px-6 py-3 border'>Materia</th>
                              <th class='px-6 py-3 border'>Turno</th>
                              <th class='px-6 py-3 border'>Docente</th>
                              <th class='px-6 py-3 border'>Docente Suplente</th>
                              <th class='px-6 py-3 border'>Aula</th>
                              <th class='px-6 py-3 border'>Día</th>
                              <th class='px-6 py-3 border'>Hora Inicio</th>
                              <th class='px-6 py-3 border'>Hora Fin</th>
                              <th class='px-6 py-3 border text-center'>Acciones</th>
                            </tr>
                          </thead>";
                    echo "<tbody>";

                    foreach ($courseSchedules as $i => $sch) {
                        $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                        $weekday_es = $weekdays_es[strtolower($sch['weekday'])] ?? ucfirst($sch['weekday']);
                        $sub_teacher_name = $sch['sub_teacher_id'] ? "{$sch['sub_teacher_last']} {$sch['sub_teacher_first']}" : '-';
                        $classroom_name = $sch['classroom_name'] ?? '-';

                        echo "<tr class='hover:bg-gray-50 {$rowClass}'>";
                        echo "<td class='px-6 py-3 border'>{$sch['subject_name']}</td>";
                        echo "<td class='px-6 py-3 border'>{$sch['subject_shift']}</td>";
                        echo "<td class='px-6 py-3 border'>{$sch['teacher_last']} {$sch['teacher_first']}</td>";
                        echo "<td class='px-6 py-3 border'>{$sub_teacher_name}</td>";
                        echo "<td class='px-6 py-3 border'>{$classroom_name}</td>";
                        echo "<td class='px-6 py-3 border'>{$weekday_es}</td>";
                        echo "<td class='px-6 py-3 border'>{$sch['start_time']}</td>";
                        echo "<td class='px-6 py-3 border'>{$sch['end_time']}</td>";
                        echo "<td class='px-6 py-3 border text-center flex justify-center gap-2'>
                                <a href='javascript:void(0)' 
                                   onclick='openEditModalSchedule(".json_encode($sch).")' 
                                   class='flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md w-24 transition'>
                                   <i class='fa-solid fa-pen mr-1'></i>Editar
                                </a>
                                <a href='schedules_back/delete_schedule.php?id={$sch['schedule_id']}' 
                                   class='flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md w-24 transition' 
                                   onclick=\"return confirm('¿Estás seguro de eliminar este horario?')\">
                                   <i class='fa-solid fa-trash mr-1'></i>Eliminar
                                </a>
                              </td>";
                        echo "</tr>";
                    }

                    echo "</tbody></table></div>";
                    echo "</div>"; // cierre grupo-container
                }

                echo "</div>"; // cierre course-container
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
    const filterShift = document.getElementById('filterShift');
    const filterClassroom = document.getElementById('filterClassroom');

    function filterSchedules() {
        const subjectVal = filterSubject.value.toLowerCase();
        const teacherVal = filterTeacher.value.toLowerCase();
        const weekdayVal = filterWeekday.value.toLowerCase();
        const shiftVal = filterShift.value.toLowerCase();
        const classroomVal = filterClassroom.value.toLowerCase();

        const courseContainers = document.querySelectorAll('.course-container');

        courseContainers.forEach(course => {
            let anyGroupVisible = false;
            const groupContainers = course.querySelectorAll('.group-container');

            groupContainers.forEach(group => {
                let anyRowVisible = false;
                const rows = group.querySelectorAll('tbody tr');

                rows.forEach(row => {
                    const cells = row.querySelectorAll('td');
                    const subject = cells[0].textContent.toLowerCase();
                    const shift = cells[1].textContent.toLowerCase();
                    const teacher = cells[2].textContent.toLowerCase();
                    const weekday = cells[5].textContent.toLowerCase();
                    const classroom = cells[4].textContent.toLowerCase();

                    if (
                        subject.includes(subjectVal) &&
                        teacher.includes(teacherVal) &&
                        weekday.includes(weekdayVal) &&
                        shift.includes(shiftVal) &&
                        classroom.includes(classroomVal)
                    ) {
                        row.style.display = '';
                        anyRowVisible = true;
                    } else {
                        row.style.display = 'none';
                    }
                });

                // Ocultar grupo si no tiene filas visibles
                group.style.display = anyRowVisible ? '' : 'none';
                if (anyRowVisible) anyGroupVisible = true;
            });

            // Ocultar curso si no tiene grupos visibles
            course.style.display = anyGroupVisible ? '' : 'none';
        });
    }

    filterSubject.addEventListener('input', filterSchedules);
    filterTeacher.addEventListener('input', filterSchedules);
    filterWeekday.addEventListener('input', filterSchedules);
    filterShift.addEventListener('input', filterSchedules);
    filterClassroom.addEventListener('input', filterSchedules);
});
</script>
