<!-- Modal Agregar Curso -->
<div id="addCourseModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-lg relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Curso</h2>
    <form action="courses_back/add_course.php" method="POST">
      <div class="mb-4">
        <label for="courseName" class="block text-gray-700">Nombre</label>
        <input type="text" name="name" id="courseName" class="w-full px-3 py-2 border rounded" required>
      </div>
      <div class="mb-4">
        <label for="courseDescription" class="block text-gray-700">Descripción</label>
        <textarea name="description" id="courseDescription" class="w-full px-3 py-2 border rounded"></textarea>
      </div>
      <div class="mb-4">
        <label for="courseTechDegree" class="block text-gray-700">Tecnicatura</label>
        <input type="text" name="technical_degree" id="courseTechDegree" class="w-full px-3 py-2 border rounded" placeholder="Opcional">
      </div>
      <div class="flex justify-end space-x-2">
        <button type="button" onclick="closeModal('addCourseModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">Agregar</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Editar Curso -->
<div id="editCourseModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-lg relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Curso</h2>
    <form action="courses_back/edit_course.php" method="POST">
      <input type="hidden" name="course_id" id="editCourseId">
      <div class="mb-4">
        <label for="editCourseName" class="block text-gray-700">Nombre</label>
        <input type="text" name="name" id="editCourseName" class="w-full px-3 py-2 border rounded" required>
      </div>
      <div class="mb-4">
        <label for="editCourseDescription" class="block text-gray-700">Descripción</label>
        <textarea name="description" id="editCourseDescription" class="w-full px-3 py-2 border rounded"></textarea>
      </div>
      <div class="mb-4">
        <label for="editCourseTechDegree" class="block text-gray-700">Tecnicatura</label>
        <input type="text" name="technical_degree" id="editCourseTechDegree" class="w-full px-3 py-2 border rounded" placeholder="Opcional">
      </div>
      <div class="flex justify-end space-x-2">
        <button type="button" onclick="closeModal('editCourseModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600">Guardar Cambios</button>
      </div>
    </form>
  </div>
</div>

<script>
  function openModal(id) {
    document.getElementById(id).classList.remove('hidden');
  }

  function closeModal(id) {
    document.getElementById(id).classList.add('hidden');
  }

  function openEditModalCourse(course) {
    document.getElementById('editCourseId').value = course.course_id;
    document.getElementById('editCourseName').value = course.name;
    document.getElementById('editCourseDescription').value = course.description;
    document.getElementById('editCourseTechDegree').value = course.technical_degree;
    openModal('editCourseModal');
  }
</script>
