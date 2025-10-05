<?php
// index.php
include 'includes/header.php'; 
include 'includes/sidebar.php'; 
include 'includes/navbar.php'; 
include 'includes/conn.php'; 

date_default_timezone_set('America/Argentina/Salta');

$today = (new DateTime())->format('Y-m-d');
$displayDate = (new DateTime())->format('d/m/Y');
$weekday = strtolower((new DateTime())->format('l'));

$sql = "
    SELECT 
        c.course_id, c.name AS course_name,
        s.subject_id, s.name AS subject_name,
        t.teacher_id, t.first_name AS teacher_fname, t.last_name AS teacher_lname
    FROM courses c
    JOIN schedules sch 
        ON sch.course_id = c.course_id
        AND sch.weekday = :weekday
    JOIN subjects s
        ON s.subject_id = sch.subject_id
    JOIN teachers t
        ON t.teacher_id = sch.teacher_id
    LEFT JOIN student_attendance sa
        ON sa.schedule_id = sch.schedule_id
        AND sa.attendance_date = :today
    WHERE sa.id IS NULL
    GROUP BY c.course_id, s.subject_id
    ORDER BY c.name, s.name
";

$stmt = $conn->prepare($sql);
$stmt->bindValue(':today', $today);
$stmt->bindValue(':weekday', $weekday);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <main class="pt-20 p-6">
    <!-- Header -->
    <div class="flex flex-col md:flex-row items-start md:items-center justify-between mb-6 gap-3">
      <h1 class="text-3xl font-bold text-gray-800">Notificaciones</h1>
      <span class="px-4 py-2 text-sm font-semibold bg-blue-100 text-blue-800 rounded-full shadow">
        <?php echo count($rows); ?> pendientes
      </span>
    </div>

    <!-- Notificaciones -->
    <?php if (count($rows) > 0): ?>
      <div class="grid gap-5 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
        <?php foreach ($rows as $row): ?>
          <div class="flex items-start p-5 bg-red-50 border-l-4 border-red-500 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
            <i class="fa-solid fa-triangle-exclamation text-red-600 text-3xl mr-4 mt-1"></i>
            <div>
              <p class="font-semibold text-red-800 text-lg">
                Falta de asistencia registrada
              </p>
              <p class="text-gray-700 mt-2 leading-relaxed">
                Hoy <strong><?php echo $displayDate; ?></strong> no se registró asistencia 
                para <strong><?php echo htmlspecialchars($row['course_name']); ?></strong> — 
                <strong><?php echo htmlspecialchars($row['subject_name']); ?></strong>, 
                a cargo de <strong><?php echo htmlspecialchars($row['teacher_fname'].' '.$row['teacher_lname']); ?></strong>.
              </p>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    <?php else: ?>
      <div class="flex items-center p-5 bg-green-50 border-l-4 border-green-500 rounded-lg shadow-md">
        <i class="fa-solid fa-circle-check text-green-600 text-3xl mr-4"></i>
        <p class="text-green-800 text-lg leading-relaxed">
          ✅ Todas las materias y cursos tienen asistencia registrada hoy 
          (<strong><?php echo $displayDate; ?></strong>).
        </p>
      </div>
    <?php endif; ?>
  </main>
</div>
