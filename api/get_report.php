<?php
// get_report.php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    echo "<p class='p-4 text-red-600'>Faltan parámetros</p>";
    exit;
}

$stmt = $conn->prepare("SELECT a.attendance_id, s.first_name, s.last_name, a.status, a.attendance_date, a.attendance_time
                        FROM attendance a
                        JOIN students s ON a.student_id = s.student_id
                        WHERE a.course_id = ? AND a.subject_id = ? AND a.attendance_date = ?
                        ORDER BY s.last_name, s.first_name");
$stmt->execute([$course_id, $subject_id, $date]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$records) {
    echo "<p class='p-4'>No hay registros para esta fecha.</p>";
    exit;
}

echo "<table class='min-w-full divide-y divide-gray-200'>
        <thead class='bg-gray-800 text-white'>
        <tr>
          <th class='px-6 py-3'>#</th>
          <th class='px-6 py-3'>Alumno</th>
          <th class='px-6 py-3'>Estado</th>
          <th class='px-6 py-3'>Fecha</th>
          <th class='px-6 py-3'>Hora</th>
          <th class='px-6 py-3'>Acción</th>
        </tr>
        </thead>
        <tbody class='bg-white divide-y divide-gray-200'>";

foreach ($records as $i => $r) {
    echo "<tr class='hover:bg-gray-100'>
            <td class='px-6 py-4'>".($i+1)."</td>
            <td class='px-6 py-4'>{$r['first_name']} {$r['last_name']}</td>
            <td class='px-6 py-4'>
              <select class='status-select px-2 py-1 border rounded' data-attendance='{$r['attendance_id']}'>
                <option value='present' ".($r['status']=='present'?'selected':'').">Presente</option>
                <option value='absent' ".($r['status']=='absent'?'selected':'').">Ausente</option>
              </select>
            </td>
            <td class='px-6 py-4'>{$r['attendance_date']}</td>
            <td class='px-6 py-4'>{$r['attendance_time']}</td>
            <td class='px-6 py-4'>
              <button class='save-btn bg-blue-600 text-white px-3 py-1 rounded text-sm' data-attendance='{$r['attendance_id']}'>
                Guardar
              </button>
            </td>
          </tr>";
}

echo "</tbody></table>";
?>

<script>
// Guardar cambios de estado
document.querySelectorAll('.save-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const attendanceId = btn.dataset.attendance;
        const select = document.querySelector(`.status-select[data-attendance='${attendanceId}']`);
        const newStatus = select.value;

        fetch('update_attendance.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({attendance_id: attendanceId, status: newStatus})
        })
        .then(res => res.json())
        .then(data => {
            if(data.success){
                btn.innerText = 'Guardado ✅';
                setTimeout(() => btn.innerText = 'Guardar', 1500);
            } else {
                alert('Error al actualizar: ' + data.error);
            }
        })
        .catch(err => alert('Error de red: ' + err));
    });
});
</script>
