<!-- Modal Agregar Horario -->
<div id="addScheduleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Horario</h2>
    <form action="schedules_back/add_schedule.php" method="POST" class="space-y-4">
      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Curso</label>
          <select name="course_id" id="add_course_id" class="w-full border px-2 py-1 rounded" required>
            <option value="">Seleccionar curso</option>
            <?php
            $courses = $conn->query("SELECT course_id, name FROM courses")->fetchAll();
            foreach ($courses as $c) {
                echo "<option value='{$c['course_id']}'>{$c['name']}</option>";
            }
            ?>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Grupo (Opcional)</label>
          <select name="group_id" id="add_group_id" class="w-full border px-2 py-1 rounded">
            <option value="">Todos los estudiantes</option>
          </select>
        </div>
      </div>

      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Materia</label>
          <select name="subject_id" id="add_subject_id" class="w-full border px-2 py-1 rounded" required>
            <option value="">Seleccionar materia</option>
          </select>
        </div>

        <!-- Campo Docente con búsqueda -->
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Docente</label>
          <div class="flex gap-2">
            <input type="hidden" name="teacher_id" id="selected_teacher_id">
            <input type="text" id="selected_teacher_name" class="w-full border px-2 py-1 rounded bg-gray-100" placeholder="Seleccionar docente" readonly>
            <button type="button" onclick="openModal('teacherSearchModal')" class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700">
              Buscar
            </button>
          </div>
        </div>
      </div>

      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Día</label>
          <select name="weekday" class="w-full border px-2 py-1 rounded" required>
            <option value="">Seleccionar día</option>
            <option value="monday">Lunes</option>
            <option value="tuesday">Martes</option>
            <option value="wednesday">Miércoles</option>
            <option value="thursday">Jueves</option>
            <option value="friday">Viernes</option>
            <option value="saturday">Sábado</option>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Hora Inicio</label>
          <input type="time" name="start_time" class="w-full border px-2 py-1 rounded" required>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Hora Fin</label>
          <input type="time" name="end_time" class="w-full border px-2 py-1 rounded" required>
        </div>
      </div>

      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" onclick="closeModal('addScheduleModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">Agregar</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Editar Horario -->
<div id="editScheduleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Horario</h2>
    <form action="schedules_back/edit_schedule.php" method="POST" class="space-y-4">
      <input type="hidden" name="schedule_id" id="edit_schedule_id">

      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Curso</label>
          <select name="course_id" id="edit_course_id" class="w-full border px-2 py-1 rounded" required>
            <?php foreach ($courses as $c) {
                echo "<option value='{$c['course_id']}'>{$c['name']}</option>";
            } ?>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Grupo (Opcional)</label>
          <select name="group_id" id="edit_group_id" class="w-full border px-2 py-1 rounded">
            <option value="">Todos los estudiantes</option>
          </select>
        </div>
      </div>

      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Materia</label>
          <select name="subject_id" id="edit_subject_id" class="w-full border px-2 py-1 rounded" required>
            <option value="">Seleccionar materia</option>
          </select>
        </div>

        <!-- Campo Docente con búsqueda -->
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Docente</label>
          <div class="flex gap-2">
            <input type="hidden" name="teacher_id" id="edit_selected_teacher_id">
            <input type="text" id="edit_selected_teacher_name" class="w-full border px-2 py-1 rounded bg-gray-100" placeholder="Seleccionar docente" readonly>
            <button type="button" onclick="openModal('teacherSearchModal')" class="px-3 py-1 bg-blue-600 text-white rounded hover:bg-blue-700">
              Buscar
            </button>
          </div>
        </div>
      </div>

      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Día</label>
          <select name="weekday" id="edit_weekday" class="w-full border px-2 py-1 rounded" required>
            <option value="monday">Lunes</option>
            <option value="tuesday">Martes</option>
            <option value="wednesday">Miércoles</option>
            <option value="thursday">Jueves</option>
            <option value="friday">Viernes</option>
            <option value="saturday">Sábado</option>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Hora Inicio</label>
          <input type="time" name="start_time" id="edit_start_time" class="w-full border px-2 py-1 rounded" required>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Hora Fin</label>
          <input type="time" name="end_time" id="edit_end_time" class="w-full border px-2 py-1 rounded" required>
        </div>
      </div>

      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" onclick="closeModal('editScheduleModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600">Actualizar</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Buscar Docente -->
<div id="teacherSearchModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-3xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Buscar Docente</h2>

    <div class="flex flex-wrap gap-3 mb-4">
      <input type="text" id="searchTeacherFirst" placeholder="Nombre" class="px-3 py-2 border rounded flex-1">
      <input type="text" id="searchTeacherLast" placeholder="Apellido" class="px-3 py-2 border rounded flex-1">
      <button id="btnSearchTeacher" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">
        <i class="fa-solid fa-magnifying-glass mr-1"></i> Buscar
      </button>
    </div>

    <div class="overflow-y-auto max-h-80 border rounded">
      <table class="min-w-full border-collapse">
        <thead class="bg-gray-100">
          <tr>
            <th class="px-4 py-2 border">Nombre</th>
            <th class="px-4 py-2 border">Apellido</th>
            <th class="px-4 py-2 border">Acción</th>
          </tr>
        </thead>
        <tbody id="teacherResults"></tbody>
      </table>
    </div>

    <div class="flex justify-end mt-4">
      <button type="button" onclick="closeModal('teacherSearchModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cerrar</button>
    </div>
  </div>
</div>

<script>
    // Abrir / cerrar modals
    function openModal(id) {
      document.getElementById(id).classList.remove('hidden');
    }
    function closeModal(id) {
      document.getElementById(id).classList.add('hidden');
    }

    // Modal edición con datos cargados
    function openEditModalSchedule(schedule) {
    document.getElementById('edit_schedule_id').value = schedule.schedule_id;
    document.getElementById('edit_course_id').value = schedule.course_id;
    document.getElementById('edit_weekday').value = schedule.weekday;
    document.getElementById('edit_start_time').value = schedule.start_time;
    document.getElementById('edit_end_time').value = schedule.end_time;
    document.getElementById('edit_selected_teacher_id').value = schedule.teacher_id;
    document.getElementById('edit_selected_teacher_name').value = schedule.teacher_first + ' ' + schedule.teacher_last;

    // Cargar grupos y materias y luego seleccionar los correctos
    loadGroupsAndSubjects(schedule.course_id, 'edit_group_id', 'edit_subject_id', schedule.group_id, schedule.subject_id);

    openModal('editScheduleModal');
  }

  // Función para cargar grupos y materias según curso
  function loadGroupsAndSubjects(courseId, groupSelectId, subjectSelectId, selectedGroupId = null, selectedSubjectId = null) {
    // Grupos
    fetch('schedules_back/get_groups.php?course_id=' + courseId)
      .then(res => res.json())
      .then(data => {
        let options = '<option value="">Todos los estudiantes</option>';
        data.forEach(g => {
          let selected = selectedGroupId && selectedGroupId == g.group_id ? 'selected' : '';
          options += `<option value="${g.group_id}" ${selected}>${g.name}</option>`;
        });
        document.getElementById(groupSelectId).innerHTML = options;
      });

    // Materias
    fetch('schedules_back/get_subjects_by_course.php?course_id=' + courseId)
      .then(res => res.json())
      .then(data => {
        let options = '<option value="">Seleccionar materia</option>';
        data.forEach(s => {
          let selected = selectedSubjectId && selectedSubjectId == s.subject_id ? 'selected' : '';
          options += `<option value="${s.subject_id}" ${selected}>${s.name}</option>`;
        });
        document.getElementById(subjectSelectId).innerHTML = options;
      });
  }

  // Eventos para selects de curso
  document.getElementById('add_course_id').addEventListener('change', function() {
    loadGroupsAndSubjects(this.value, 'add_group_id', 'add_subject_id');
  });

  document.getElementById('edit_course_id').addEventListener('change', function() {
    loadGroupsAndSubjects(this.value, 'edit_group_id', 'edit_subject_id');
  });

  // Búsqueda dinámica de docentes
  document.getElementById('btnSearchTeacher').addEventListener('click', function() {
    const first = document.getElementById('searchTeacherFirst').value;
    const last = document.getElementById('searchTeacherLast').value;

    fetch(`schedules_back/search_teachers.php?first=${encodeURIComponent(first)}&last=${encodeURIComponent(last)}`)
      .then(res => res.json())
      .then(data => {
        const tbody = document.getElementById('teacherResults');
        tbody.innerHTML = '';

        if (data.length === 0) {
          tbody.innerHTML = `<tr><td colspan="3" class="text-center text-gray-500 py-3">No se encontraron docentes</td></tr>`;
          return;
        }

        data.forEach(t => {
          const row = document.createElement('tr');
          row.classList.add('hover:bg-gray-50');
          row.innerHTML = `
            <td class="px-4 py-2 border">${t.first_name}</td>
            <td class="px-4 py-2 border">${t.last_name}</td>
            <td class="px-4 py-2 border text-center">
              <button type="button" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded"
                onclick="selectTeacher(${t.teacher_id}, '${t.first_name} ${t.last_name}')">
                Seleccionar
              </button>
            </td>`;
          tbody.appendChild(row);
        });
      })
      .catch(err => console.error(err));
  });

  function selectTeacher(id, name) {
    document.getElementById('selected_teacher_id').value = id;
    document.getElementById('selected_teacher_name').value = name;
    closeModal('teacherSearchModal');
  }
</script>
