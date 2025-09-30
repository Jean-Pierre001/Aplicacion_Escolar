<?php
// index_schedules.php
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 ml-64">
  <main class="pt-20 p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Horarios</h1>
      <a href="javascript:void(0)" onclick="openModal('addScheduleModal')" class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition">
        <i class="fa-solid fa-plus mr-2"></i> Agregar Horario
      </a>
    </div>

    <div class="overflow-x-auto bg-white rounded-lg shadow-lg border border-gray-200">
      <table class="min-w-full divide-y divide-gray-200" id="schedulesTable">
        <thead class="bg-gradient-to-r from-indigo-500 to-indigo-700 text-white">
          <tr>
            <th class="px-6 py-3 text-left font-medium uppercase">ID</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Curso</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Materia</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Docente</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Día</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Hora Inicio</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Hora Fin</th>
            <th class="px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php
          try {
              $sql = "SELECT sch.schedule_id, c.name AS course_name, sub.name AS subject_name, 
                             t.first_name AS teacher_first, t.last_name AS teacher_last,
                             sch.weekday, sch.start_time, sch.end_time
                      FROM schedules sch
                      LEFT JOIN courses c ON sch.course_id = c.course_id
                      LEFT JOIN subjects sub ON sch.subject_id = sub.subject_id
                      LEFT JOIN teachers t ON sch.teacher_id = t.teacher_id
                      ORDER BY sch.schedule_id ASC";
              $stmt = $conn->query($sql);
              $schedules = $stmt->fetchAll();

              if ($schedules) {
                  foreach ($schedules as $sch) {
                      echo "<tr class='hover:bg-gray-50'>";
                      echo "<td class='px-6 py-4'>{$sch['schedule_id']}</td>";
                      echo "<td class='px-6 py-4'>{$sch['course_name']}</td>";
                      echo "<td class='px-6 py-4'>{$sch['subject_name']}</td>";
                      echo "<td class='px-6 py-4'>{$sch['teacher_first']} {$sch['teacher_last']}</td>";
                      echo "<td class='px-6 py-4'>{$sch['weekday']}</td>";
                      echo "<td class='px-6 py-4'>{$sch['start_time']}</td>";
                      echo "<td class='px-6 py-4'>{$sch['end_time']}</td>";
                      echo "<td class='px-6 py-4 flex space-x-2'>";
                      echo "<a href='javascript:void(0)' onclick='openEditModalSchedule(".json_encode($sch).")' class='text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center'><i class='fa-solid fa-pen mr-1'></i>Editar</a>";
                      echo "<a href='schedules_back/delete_schedule.php?id={$sch['schedule_id']}' class='text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center' onclick=\"return confirm('¿Estás seguro de eliminar este horario?')\"><i class='fa-solid fa-trash mr-1'></i>Eliminar</a>";
                      echo "</td>";
                      echo "</tr>";
                  }
              } else {
                  echo "<tr><td colspan='8' class='px-6 py-4 text-center text-gray-500'>No hay horarios registrados</td></tr>";
              }
          } catch (PDOException $e) {
              echo "<tr><td colspan='8' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<?php include 'includes/modals/modals_schedules.php'; ?>
