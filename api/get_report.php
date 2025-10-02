<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    echo "<p class='p-4 text-red-600'>Faltan parámetros</p>";
    exit;
}

$stmt = $conn->prepare("
    SELECT a.attendance_id, s.student_id, s.first_name, s.last_name, a.status, a.attendance_date, a.attendance_time,
           a.justification, a.justification_file
    FROM attendance a
    JOIN students s ON a.student_id = s.student_id
    WHERE a.course_id = ? AND a.subject_id = ? AND a.attendance_date = ?
    ORDER BY s.last_name, s.first_name
");
$stmt->execute([$course_id, $subject_id, $date]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$records) {
    echo "<p class='p-4'>No hay registros para esta fecha.</p>";
    exit;
}
?>

<form id="attendanceForm" enctype="multipart/form-data">
  <div class="overflow-x-auto rounded-lg shadow-lg border border-gray-200">
    <table class="min-w-full border-collapse table-auto">
      <thead class="bg-gradient-to-r from-gray-700 to-gray-900 text-white">
        <tr>
          <th class="px-4 py-3 text-left border-r border-gray-600">#</th>
          <th class="px-4 py-3 text-left border-r border-gray-600">Alumno</th>
          <th class="px-4 py-3 text-center border-r border-gray-600">Presente</th>
          <th class="px-4 py-3 text-center border-r border-gray-600">Justificado</th>
          <th class="px-4 py-3 text-center border-r border-gray-600">Archivo</th>
          <th class="px-4 py-3 text-center border-r border-gray-600">Fecha</th>
          <th class="px-4 py-3 text-center">Última Modificación</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($records as $i => $r): 
          $rowClass = $i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
        ?>
        <tr class="hover:bg-gray-100 <?= $rowClass ?>">
          <td class="px-4 py-3 border-r border-gray-300"><?= $i+1 ?></td>
          <td class="px-4 py-3 border-r border-gray-300"><?= $r['first_name'] ?> <?= $r['last_name'] ?></td>
          <td class="px-4 py-3 border-r border-gray-300 text-center">
            <select name="status[<?= $r['attendance_id'] ?>]" class="border rounded px-2 py-1 w-full md:w-auto">
              <option value="present" <?= $r['status']=='present'?'selected':'' ?>>Presente</option>
              <option value="absent" <?= $r['status']=='absent'?'selected':'' ?>>Ausente</option>
            </select>
          </td>
          <td class="px-4 py-3 border-r border-gray-300 text-center">
            <input type="checkbox" name="justification[<?= $r['attendance_id'] ?>]" value="1" <?= $r['justification']?'checked':'' ?> class="form-checkbox h-5 w-5 text-yellow-500"/>
          </td>
          <td class="px-4 py-3 border-r border-gray-300 text-center">
            <?php if($r['justification_file']): ?>
              <button type="button" class="previewBtn bg-blue-600 text-white px-3 py-1 rounded shadow hover:bg-blue-700 transition flex justify-center items-center"
                      data-file="<?= $r['justification_file'] ?>">
                <i class="fa-solid fa-eye mr-1"></i> Ver
              </button>
            <?php else: ?>
              <input type="file" name="file[<?= $r['attendance_id'] ?>]" class="form-input w-full md:w-auto"/>
            <?php endif; ?>
          </td>
          <td class="px-4 py-3 border-r border-gray-300 text-center"><?= $r['attendance_date'] ?></td>
          <td class="px-4 py-3 text-center"><?= $r['attendance_time'] ?></td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

  <div class="mt-4 text-right">
    <button type="button" id="saveAttendanceBtn" class="bg-blue-600 text-white px-5 py-2 rounded-lg shadow hover:bg-blue-700 transition flex items-center justify-center">
      <i class="fa-solid fa-floppy-disk mr-2"></i> Guardar cambios
    </button>
  </div>
</form>

<!-- Modal vista previa responsive -->
<div id="previewModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
  <div class="bg-white w-full md:w-4/5 h-4/5 rounded shadow-lg relative">
    <button id="closePreview" class="absolute top-2 right-2 text-white bg-red-600 px-3 py-1 rounded hover:bg-red-700"><i class="fa-solid fa-xmark"></i></button>
    <iframe id="previewFrame" class="w-full h-full rounded" src=""></iframe>
  </div>
</div>

<script>
// Guardar cambios
document.getElementById('saveAttendanceBtn').addEventListener('click', function() {
    const form = document.getElementById('attendanceForm');
    const formData = new FormData(form);

    fetch('attendance_back/update_attendance_bulk.php', {
        method: 'POST',
        body: formData
    })
    .then(res => res.json())
    .then(response => {
        if(response.success) {
            alert('Cambios guardados correctamente.');
            response.updated.forEach(u => {
                const row = document.querySelector(`select[name='status[${u.attendance_id}]']`).closest('tr');
                row.querySelector('td:last-child').textContent = u.attendance_time;
            });
        } else {
            alert('Error: ' + response.error);
        }
    });
});

// Vista previa de archivo
document.querySelectorAll('.previewBtn').forEach(btn => {
    btn.addEventListener('click', () => {
        const file = btn.getAttribute('data-file');
        document.getElementById('previewFrame').src = file;
        document.getElementById('previewModal').classList.remove('hidden');
        document.getElementById('previewModal').classList.add('flex');
    });
});

document.getElementById('closePreview').addEventListener('click', () => {
    document.getElementById('previewModal').classList.add('hidden');
    document.getElementById('previewModal').classList.remove('flex');
    document.getElementById('previewFrame').src = '';
});
</script>
