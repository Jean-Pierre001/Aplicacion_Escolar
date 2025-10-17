<?php
include 'includes/session.php';
include 'includes/header.php';
include 'includes/sidebar.php';
include 'includes/navbar.php';
include 'includes/conn.php'; // Conexión PDO
?>

<div class="flex-1 md:ml-64 transition-all duration-300">
  <br><br><br>
  <main class="pt-20 p-4 md:p-6">

    <!-- Encabezado y botones principales -->
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
      <h1 class="text-3xl font-bold text-gray-800">Lista de Materias</h1>
      <div class="flex flex-col md:flex-row gap-2 w-full md:w-auto">
        <a href="javascript:void(0)" onclick="openModal('addSubjectModal')" 
           class="inline-flex items-center bg-blue-600 text-white px-5 py-2 rounded-md shadow hover:bg-blue-700 transition justify-center">
          <i class="fa-solid fa-plus mr-2"></i> Agregar Materia
        </a>
        <button id="deleteSelectedBtn" 
           class="inline-flex items-center bg-red-600 text-white px-5 py-2 rounded-md shadow hover:bg-red-700 transition justify-center">
           <i class="fa-solid fa-trash mr-2"></i> Eliminar Seleccionadas
        </button>
        <button id="changeTurnoBtn" 
           class="inline-flex items-center bg-green-600 text-white px-5 py-2 rounded-md shadow hover:bg-green-700 transition justify-center">
           <i class="fa-solid fa-sync mr-2"></i> Cambiar Turno
        </button>
      </div>
    </div>

    <!-- Filtros dinámicos -->
    <div class="flex flex-wrap gap-2 mb-4">
      <input type="text" id="filterSubjectName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterSubjectDesc" placeholder="Filtrar por Descripción" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterSubjectCourse" placeholder="Filtrar por Curso" class="px-3 py-2 border rounded w-48">
      <input type="text" id="filterSubjectTurno" placeholder="Filtrar por Turno" class="px-3 py-2 border rounded w-48">
    </div>

    <!-- Tabla de materias -->
    <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
      <form id="subjectsTableForm" method="POST">
        <table class="min-w-full text-sm text-gray-700 border-collapse" id="subjectsTable">
          <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
            <tr>
              <th class="px-6 py-3 border-r border-gray-300 text-left">
                <input type="checkbox" id="selectAll">
              </th>
              <th class="px-6 py-3 border-r border-gray-300 text-left">Nombre</th>
              <th class="px-6 py-3 border-r border-gray-300 text-left">Descripción</th>
              <th class="px-6 py-3 border-r border-gray-300 text-left">Curso</th>
              <th class="px-6 py-3 border-r border-gray-300 text-left">Turno</th>
              <th class="px-6 py-3 border-r border-gray-300 text-center">Acciones</th>
            </tr>
          </thead>
          <tbody>
            <?php
            try {
                $sql = "SELECT s.*, c.name AS course_name 
                        FROM subjects s 
                        LEFT JOIN courses c ON s.course_id = c.course_id
                        ORDER BY s.subject_id ASC";
                $stmt = $conn->query($sql);
                $subjects = $stmt->fetchAll();

                if ($subjects) {
                    foreach ($subjects as $i => $subject) {
                        $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                        echo "<tr class='{$rowClass} border-b border-gray-200 hover:bg-gray-50'>";
                        echo "<td class='px-6 py-3 border-r border-gray-300'>
                                <input type='checkbox' name='subject_ids[]' value='{$subject['subject_id']}' class='rowCheckbox'>
                              </td>";
                        echo "<td class='px-6 py-3 border-r border-gray-300'>{$subject['name']}</td>";
                        echo "<td class='px-6 py-3 border-r border-gray-300'>{$subject['description']}</td>";
                        echo "<td class='px-6 py-3 border-r border-gray-300'>{$subject['course_name']}</td>";
                        echo "<td class='px-6 py-3 border-r border-gray-300 turnoCell'>{$subject['turno']}</td>";
                        echo "<td class='px-6 py-3 border-r border-gray-300 text-center flex justify-center gap-2'>
                                <a href='javascript:void(0)' onclick='openEditModalSubject(".json_encode($subject).")' 
                                   class='flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md transition w-24'>
                                    <i class='fa-solid fa-pen mr-1'></i>Editar
                                </a>
                                <a href='subjects_back/delete_subject.php?id={$subject['subject_id']}' 
                                   class='flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md transition w-24'
                                   onclick=\"return confirm('¿Estás seguro de eliminar esta materia?')\">
                                    <i class='fa-solid fa-trash mr-1'></i>Eliminar
                                </a>
                              </td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='6' class='px-6 py-4 text-center text-gray-500'>No hay materias registradas</td></tr>";
                }
            } catch (PDOException $e) {
                echo "<tr><td colspan='6' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
            }
            ?>
          </tbody>
        </table>
      </form>
    </div>

  </main>
</div>

<?php include 'includes/modals/modals_subjects.php'; ?>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('subjectsTable');
    const rows = table.querySelectorAll('tbody tr');

    // === Filtros ===
    const filterName = document.getElementById('filterSubjectName');
    const filterDesc = document.getElementById('filterSubjectDesc');
    const filterCourse = document.getElementById('filterSubjectCourse');
    const filterTurno = document.getElementById('filterSubjectTurno');

    function filterRows() {
        const nameVal = filterName.value.toLowerCase();
        const descVal = filterDesc.value.toLowerCase();
        const courseVal = filterCourse.value.toLowerCase();
        const turnoVal = filterTurno.value.toLowerCase();

        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            if(cells.length < 6) return;
            const name = cells[1].textContent.toLowerCase();
            const desc = cells[2].textContent.toLowerCase();
            const course = cells[3].textContent.toLowerCase();
            const turno = cells[4].textContent.toLowerCase();

            row.style.display = (name.includes(nameVal) && desc.includes(descVal) && course.includes(courseVal) && turno.includes(turnoVal)) ? '' : 'none';
        });
    }

    filterName.addEventListener('input', filterRows);
    filterDesc.addEventListener('input', filterRows);
    filterCourse.addEventListener('input', filterRows);
    filterTurno.addEventListener('input', filterRows);

    // === Selección múltiple ===
    const selectAll = document.getElementById('selectAll');
    const rowCheckboxes = document.querySelectorAll('.rowCheckbox');

    selectAll.addEventListener('change', () => rowCheckboxes.forEach(cb => cb.checked = selectAll.checked));
    rowCheckboxes.forEach(cb => cb.addEventListener('change', () => {
        selectAll.checked = Array.from(rowCheckboxes).every(c => c.checked);
    }));

    // === Eliminar seleccionadas ===
    document.getElementById('deleteSelectedBtn').addEventListener('click', () => {
        const selected = Array.from(rowCheckboxes).filter(cb => cb.checked);
        if(selected.length === 0) { alert('Seleccione al menos una materia.'); return; }
        if(confirm(`¿Eliminar ${selected.length} materias seleccionadas?`)) {
            const form = document.getElementById('subjectsTableForm');
            form.action = 'subjects_back/delete_selected_subjects.php';
            form.submit();
        }
    });

    // === Cambiar turno seleccionadas ===
    document.getElementById('changeTurnoBtn').addEventListener('click', () => {
        const selected = Array.from(rowCheckboxes).filter(cb => cb.checked);
        if(selected.length === 0) { alert('Seleccione al menos una materia.'); return; }
        if(confirm(`¿Cambiar el turno de ${selected.length} materias seleccionadas?`)) {
            const form = document.getElementById('subjectsTableForm');
            form.action = 'subjects_back/change_selected_turno.php';
            form.submit();
        }
    });
});
</script>
