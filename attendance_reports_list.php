<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php';

// Traer todos los reportes únicos existentes según la nueva DB
$stmt = $conn->prepare("
    SELECT 
        sa.attendance_date,
        c.course_id,
        c.name AS course_name,
        s.subject_id,
        s.name AS subject_name,
        sch.start_time,
        sch.end_time
    FROM student_attendance sa
    JOIN schedules sch ON sa.schedule_id = sch.schedule_id
    JOIN courses c ON sch.course_id = c.course_id
    JOIN subjects s ON sch.subject_id = s.subject_id
    GROUP BY sa.attendance_date, c.course_id, s.subject_id, sch.start_time, sch.end_time
    ORDER BY sa.attendance_date DESC
");
$stmt->execute();
$reports = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">
    <h1 class="text-4xl font-bold text-gray-800 mb-6">📅 Reportes de Asistencia Registrados</h1>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-3 mb-4">
      <input type="date" id="filterDate" class="px-3 py-2 border rounded w-48">

      <select id="filterCourse" class="px-3 py-2 border rounded w-48">
        <option value="">Filtrar por Curso</option>
        <?php
        $courses = $conn->query("SELECT DISTINCT course_id, name FROM courses ORDER BY name ASC")->fetchAll();
        foreach ($courses as $course) {
            echo "<option value='".htmlspecialchars($course['course_id'])."'>".htmlspecialchars($course['name'])."</option>";
        }
        ?>
      </select>

      <select id="filterSubject" class="px-3 py-2 border rounded w-48">
        <option value="">Filtrar por Materia</option>
      </select>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200 bg-white">
      <table class="min-w-full border-collapse text-gray-800 text-sm" id="reportsTable">
        <thead class="bg-gradient-to-r from-blue-600 to-blue-800 text-white">
          <tr>
            <th class="px-4 md:px-6 py-3 border-r border-blue-500 text-left font-medium uppercase">Fecha</th>
            <th class="px-4 md:px-6 py-3 border-r border-blue-500 text-left font-medium uppercase">Curso</th>
            <th class="px-4 md:px-6 py-3 border-r border-blue-500 text-left font-medium uppercase">Materia</th>
            <th class="px-4 md:px-6 py-3 border-r border-blue-500 text-left font-medium uppercase">Turno</th>
            <th class="px-4 md:px-6 py-3 text-left font-medium uppercase">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <?php if (count($reports) > 0): ?>
            <?php foreach ($reports as $i => $report): 
              $turno = (strtotime($report['start_time']) < strtotime("12:00:00")) ? "Mañana" : "Tarde";
              $fecha = date("d/m/Y", strtotime($report['attendance_date']));
              $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
            ?>
            <tr class="hover:bg-gray-100 transition <?php echo $rowClass; ?>" 
                data-course="<?php echo $report['course_id']; ?>" 
                data-subject="<?php echo $report['subject_id']; ?>">
              <td class="px-4 md:px-6 py-4 border-r border-gray-200" 
                  data-raw="<?php echo $report['attendance_date']; ?>">
                  <?php echo $fecha; ?>
              </td>
              <td class="px-4 md:px-6 py-4 border-r border-gray-200"><?php echo htmlspecialchars($report['course_name']); ?></td>
              <td class="px-4 md:px-6 py-4 border-r border-gray-200"><?php echo htmlspecialchars($report['subject_name']); ?></td>
              <td class="px-4 md:px-6 py-4 border-r border-gray-200"><?php echo $turno; ?></td>
              <td class="px-4 md:px-6 py-4 flex flex-wrap gap-2">
                  <form method="GET" action="attendance_report.php" class="inline">
                      <input type="hidden" name="course_id" value="<?php echo $report['course_id']; ?>">
                      <input type="hidden" name="subject_id" value="<?php echo $report['subject_id']; ?>">
                      <input type="hidden" name="date" value="<?php echo date('Y-m-d', strtotime($report['attendance_date'])); ?>">
                      <button type="submit" class="text-white bg-blue-600 hover:bg-blue-700 px-3 py-1 rounded flex items-center justify-center">
                          <i class="fa-solid fa-eye mr-1"></i> Ver Reporte
                      </button>
                  </form>
              </td>
            </tr>
            <?php endforeach; ?>
          <?php else: ?>
            <tr>
              <td colspan="5" class="text-center text-gray-500 py-4">No hay reportes registrados aún.</td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const filterDate = document.getElementById('filterDate');
    const filterCourse = document.getElementById('filterCourse');
    const filterSubject = document.getElementById('filterSubject');
    const table = document.getElementById('reportsTable');
    const rows = table.querySelectorAll('tbody tr');

    function filterRows() {
        const dateVal = filterDate.value; 
        const courseVal = filterCourse.value;
        const subjectVal = filterSubject.value;

        rows.forEach(row => {
            const rowDate = row.querySelector('td').getAttribute('data-raw'); 
            const cursoId = row.getAttribute('data-course');
            const subjectId = row.getAttribute('data-subject');

            if (
                (rowDate === dateVal || dateVal === '') &&
                (cursoId === courseVal || courseVal === '') &&
                (subjectId === subjectVal || subjectVal === '')
            ) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    filterDate.addEventListener('input', filterRows);

    filterCourse.addEventListener('change', function() {
        const courseId = this.value;
        filterSubject.innerHTML = '<option value="">Filtrar por Materia</option>';

        if (!courseId) {
            filterRows();
            return;
        }

        fetch(`api/get_subjects.php?course_id=${courseId}`)
            .then(res => res.json())
            .then(data => {
                data.forEach(subj => {
                    const option = document.createElement('option');
                    option.value = subj.subject_id;
                    option.textContent = subj.name;
                    filterSubject.appendChild(option);
                });
                filterRows();
            });
        filterRows();
    });

    filterSubject.addEventListener('change', filterRows);
});
</script>
