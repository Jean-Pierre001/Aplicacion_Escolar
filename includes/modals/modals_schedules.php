<!-- Modal Agregar Horario -->
<div id="addScheduleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Horario</h2>
    <form action="schedules_back/add_schedule.php" method="POST" class="space-y-4">
      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Curso</label>
          <select name="course_id" class="w-full border px-2 py-1 rounded" required>
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
          <select name="group_id" class="w-full border px-2 py-1 rounded">
            <option value="">Todos los estudiantes</option>
            <?php
            $groups = $conn->query("SELECT group_id, name FROM groups")->fetchAll();
            foreach ($groups as $g) {
                echo "<option value='{$g['group_id']}'>{$g['name']}</option>";
            }
            ?>
          </select>
        </div>
      </div>
      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Materia</label>
          <select name="subject_id" class="w-full border px-2 py-1 rounded" required>
            <option value="">Seleccionar materia</option>
            <?php
            $subjects = $conn->query("SELECT subject_id, name FROM subjects")->fetchAll();
            foreach ($subjects as $s) {
                echo "<option value='{$s['subject_id']}'>{$s['name']}</option>";
            }
            ?>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Docente</label>
          <select name="teacher_id" class="w-full border px-2 py-1 rounded" required>
            <option value="">Seleccionar docente</option>
            <?php
            $teachers = $conn->query("SELECT teacher_id, first_name, last_name FROM teachers")->fetchAll();
            foreach ($teachers as $t) {
                echo "<option value='{$t['teacher_id']}'>{$t['first_name']} {$t['last_name']}</option>";
            }
            ?>
          </select>
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
            <?php foreach ($groups as $g) {
                echo "<option value='{$g['group_id']}'>{$g['name']}</option>";
            } ?>
          </select>
        </div>
      </div>

      <div class="flex space-x-4">
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Materia</label>
          <select name="subject_id" id="edit_subject_id" class="w-full border px-2 py-1 rounded" required>
            <?php foreach ($subjects as $s) {
                echo "<option value='{$s['subject_id']}'>{$s['name']}</option>";
            } ?>
          </select>
        </div>
        <div class="flex-1">
          <label class="block text-gray-700 mb-1">Docente</label>
          <select name="teacher_id" id="edit_teacher_id" class="w-full border px-2 py-1 rounded" required>
            <?php foreach ($teachers as $t) {
                echo "<option value='{$t['teacher_id']}'>{$t['first_name']} {$t['last_name']}</option>";
            } ?>
          </select>
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

<!-- Scripts para abrir/cerrar modals y pasar datos -->
<script>
  // Abrir modal
  function openModal(id) {
    document.getElementById(id).classList.remove('hidden');
  }

  // Cerrar modal
  function closeModal(id) {
    document.getElementById(id).classList.add('hidden');
  }

  // Abrir modal de edición con datos cargados
  function openEditModalSchedule(schedule) {
    document.getElementById('edit_schedule_id').value = schedule.schedule_id;
    document.getElementById('edit_course_id').value = schedule.course_id;
    document.getElementById('edit_group_id').value = schedule.group_id ?? '';
    document.getElementById('edit_subject_id').value = schedule.subject_id;
    document.getElementById('edit_teacher_id').value = schedule.teacher_id;
    document.getElementById('edit_weekday').value = schedule.weekday;
    document.getElementById('edit_start_time').value = schedule.start_time;
    document.getElementById('edit_end_time').value = schedule.end_time;

    openModal('editScheduleModal');
  }

    // Función para cargar grupos según curso
  function loadGroups(courseId, groupSelectId, selectedGroupId = null) {
    const select = document.getElementById(groupSelectId);
    select.innerHTML = '<option value="">Cargando...</option>';

    if (!courseId) {
      select.innerHTML = '<option value="">Seleccione un grupo</option>';
      return;
    }

    fetch('students_back/get_groups.php?course_id=' + courseId)
      .then(res => res.json())
      .then(data => {
        let options = '<option value="">Seleccione un grupo</option>';
        data.forEach(g => {
          let selected = selectedGroupId && selectedGroupId == g.group_id ? 'selected' : '';
          options += `<option value="${g.group_id}" ${selected}>${g.name}</option>`;
        });
        select.innerHTML = options;
      })
      .catch(err => {
        console.error(err);
        select.innerHTML = '<option value="">Error al cargar grupos</option>';
      });
  }
  
</script>
