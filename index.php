<?php
// index.php
include 'includes/header.php'; 
include 'includes/sidebar.php'; 
include 'includes/navbar.php'; 
include 'includes/conn.php'; // conexión PDO

// Forzar zona horaria local (Salta, Argentina)
date_default_timezone_set('America/Argentina/Salta');

// Fecha actual
$today = (new DateTime())->format('Y-m-d');
$displayDate = (new DateTime())->format('d/m/Y');

// Día de la semana en inglés (porque schedules.weekday está en enum inglés)
$weekday = strtolower((new DateTime())->format('l')); // ej: "monday"

// Consulta: materias + cursos que TIENEN clase hoy y no tienen asistencia registrada
$sql = "
  SELECT 
    c.course_id, c.name AS course_name, 
    s.subject_id, s.name AS subject_name
  FROM courses c
  JOIN schedules sch 
    ON sch.course_id = c.course_id
    AND sch.weekday = :weekday
  JOIN subjects s 
    ON s.subject_id = sch.subject_id
  LEFT JOIN attendance a 
    ON a.course_id = c.course_id 
    AND a.subject_id = s.subject_id
    AND a.attendance_date = :today
    AND a.status = 'present'
  WHERE a.attendance_id IS NULL
  GROUP BY c.course_id, s.subject_id
";

$stmt = $conn->prepare($sql);
$stmt->bindValue(':today', $today);
$stmt->bindValue(':weekday', $weekday);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>


<!-- Contenedor principal -->
<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-4 md:p-6">
    <div class="flex flex-col md:flex-row items-start md:items-center justify-between mb-6 gap-3">
      <h1 class="text-2xl font-bold">Notificaciones</h1>
      <span class="px-3 py-1 text-sm bg-blue-100 text-blue-800 rounded-full">
        <?php echo count($rows); ?> pendientes
      </span>
    </div>

    <?php if (count($rows) > 0): ?>
      <div class="grid gap-4 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
        <?php foreach ($rows as $row): ?>
          <div class="flex items-start p-4 bg-red-50 border-l-4 border-red-500 rounded shadow-sm">
            <i class="fa-solid fa-triangle-exclamation text-red-600 text-xl mr-3 mt-1"></i>
            <div>
              <p class="font-semibold text-red-800">
                Falta de asistencia registrada
              </p>
              <p class="text-sm text-gray-700 mt-1">
                Hoy <strong><?php echo $displayDate; ?></strong> no se marcó asistencia 
                <span class="font-semibold">'present'</span> en 
                <strong><?php echo htmlspecialchars($row['course_name']); ?></strong> — 
                <strong><?php echo htmlspecialchars($row['subject_name']); ?></strong>.
              </p>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    <?php else: ?>
      <div class="flex items-center p-4 bg-green-50 border-l-4 border-green-500 rounded shadow-sm">
        <i class="fa-solid fa-circle-check text-green-600 text-xl mr-3"></i>
        <p class="text-green-800">
          ✅ Todas las materias y cursos tienen asistencia registrada hoy 
          (<strong><?php echo $displayDate; ?></strong>).
        </p>
      </div>
    <?php endif; ?>
  </main>
</div>
