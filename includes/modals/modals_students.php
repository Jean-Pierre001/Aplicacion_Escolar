<!-- Modal Agregar Estudiante -->
<div id="addStudentModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar Estudiante</h2>
    <form id="addStudentForm" action="students_back/add_student.php" method="POST" class="space-y-4">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">DNI</label>
        <input type="number" name="DNI" class="w-full border px-3 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1 font-medium">Curso</label>
        <select name="course_id" class="w-full border px-3 py-2 rounded" required>
          <option value="">Seleccione un curso</option>
          <?php
          $courses = $conn->query("SELECT course_id, name FROM courses")->fetchAll();
          foreach($courses as $course){
              echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
          }
          ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('addStudentModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-blue-600 text-white hover:bg-blue-700">Agregar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('addStudentModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<!-- Modal Editar Estudiante -->
<div id="editStudentModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Editar Estudiante</h2>
    <form id="editStudentForm" action="students_back/edit_student.php" method="POST" class="space-y-4">
      <input type="hidden" name="student_id" id="edit_student_id">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="first_name" id="edit_first_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Apellido</label>
        <input type="text" name="last_name" id="edit_last_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">DNI</label>
        <input type="number" name="DNI" id="edit_DNI" class="w-full border px-3 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1 font-medium">Curso</label>
        <select name="course_id" id="edit_course_id" class="w-full border px-3 py-2 rounded" required>
          <option value="">Seleccione un curso</option>
          <?php
          foreach($courses as $course){
              echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
          }
          ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('editStudentModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-yellow-500 text-white hover:bg-yellow-600">Guardar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('editStudentModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<script>
  // Abrir modal
  function openModal(modalId){
    document.getElementById(modalId).classList.remove('hidden');
  }

  // Cerrar modal
  function closeModal(modalId){
    document.getElementById(modalId).classList.add('hidden');
  }

  // Abrir modal Editar con datos
  function openEditModal(student){
    document.getElementById('edit_student_id').value = student.student_id;
    document.getElementById('edit_first_name').value = student.first_name;
    document.getElementById('edit_last_name').value = student.last_name;
    document.getElementById('edit_DNI').value = student.DNI;

    // Seleccionar el curso correcto
    const select = document.getElementById('edit_course_id');
    for (let i = 0; i < select.options.length; i++) {
        if (select.options[i].value == student.course_id) {
            select.options[i].selected = true;
            break;
        }
    }

    openModal('editStudentModal');
  }
</script>

<!-- Modal Mover Estudiantes -->
<div id="moveStudentsModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg w-96 p-6">
    <h2 class="text-xl font-bold mb-4">Mover Estudiantes</h2>
    <form id="moveStudentsForm" action="students_back/move_students.php" method="POST">
      <input type="hidden" name="from_course_id" id="from_course_id">

      <label for="to_course_id" class="block mb-2 font-medium">Seleccionar Curso Destino</label>
      <select name="to_course_id" id="to_course_id" class="w-full border rounded px-3 py-2 mb-4">
        <?php
        // Traemos todos los cursos
        $courses = $conn->query("SELECT course_id, name FROM courses ORDER BY name")->fetchAll();
        foreach ($courses as $c) {
            echo "<option value='{$c['course_id']}'>{$c['name']}</option>";
        }
        ?>
      </select>

      <div class="flex justify-end gap-2">
        <button type="button" onclick="closeMoveModal()" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-purple-500 text-white rounded hover:bg-purple-700">Mover</button>
      </div>
    </form>
  </div>
</div>

<script>
  function openModalMoveStudents(fromCourseId, courseName) {
    document.getElementById('from_course_id').value = fromCourseId;
    document.getElementById('moveStudentsModal').classList.remove('hidden');
  }

  function closeMoveModal() {
    document.getElementById('moveStudentsModal').classList.add('hidden');
  }
</script>
