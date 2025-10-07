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

<!-- Modal Gestionar Grupos -->
<div id="manageGroupsModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 overflow-auto">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-3xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center" id="manageGroupsTitle">Gestionar Grupos</h2>

    <!-- Formulario Agregar Grupo -->
    <form id="addGroupForm" action="courses_back/add_group.php" method="POST" class="mb-6">
      <input type="hidden" name="course_id" id="groupCourseId">
      <div class="flex flex-col md:flex-row gap-3 mb-3">
        <input type="text" name="name" placeholder="Nombre del grupo" class="flex-1 px-3 py-2 border rounded" required>
        <input type="text" name="description" placeholder="Descripción (opcional)" class="flex-1 px-3 py-2 border rounded">
        <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700">Agregar Grupo</button>
      </div>
    </form>

    <!-- Tabla Grupos -->
    <div class="overflow-x-auto rounded-lg border border-gray-200">
      <table class="min-w-full border-collapse" id="groupsTable">
        <thead class="bg-gradient-to-r from-indigo-500 to-indigo-700 text-white">
          <tr>
            <th class="px-4 py-3 text-left font-medium uppercase text-sm md:text-base">Nombre</th>
            <th class="px-4 py-3 text-left font-medium uppercase text-sm md:text-base">Descripción</th>
            <th class="px-4 py-3 text-left font-medium uppercase text-sm md:text-base">Acciones</th>
          </tr>
        </thead>
        <tbody id="groupsTableBody">
          <!-- Contenido dinámico desde PHP -->
        </tbody>
      </table>
    </div>

    <div class="flex justify-end mt-4">
      <button type="button" onclick="closeModal('manageGroupsModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cerrar</button>
    </div>
  </div>
</div>

<!-- Modal Editar Grupo -->
<div id="editGroupModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-lg relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Grupo</h2>
    <form action="courses_back/edit_group.php" method="POST">
      <input type="hidden" name="group_id" id="editGroupId">
      <div class="mb-4">
        <label for="editGroupName" class="block text-gray-700">Nombre</label>
        <input type="text" name="name" id="editGroupName" class="w-full px-3 py-2 border rounded" required>
      </div>
      <div class="mb-4">
        <label for="editGroupDescription" class="block text-gray-700">Descripción</label>
        <input type="text" name="description" id="editGroupDescription" class="w-full px-3 py-2 border rounded">
      </div>
      <div class="flex justify-end space-x-2">
        <button type="button" onclick="closeModal('editGroupModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600">Guardar Cambios</button>
      </div>
    </form>
  </div>
</div>

<script>
function openEditGroupModal(groupId, name, description){
    document.getElementById('editGroupId').value = groupId;
    document.getElementById('editGroupName').value = name;
    document.getElementById('editGroupDescription').value = description;
    openModal('editGroupModal');
}
</script>


<script>

function openManageGroupsModal(courseId, courseName) {
    document.getElementById('groupCourseId').value = courseId;
    document.getElementById('manageGroupsTitle').innerText = "Gestionar Grupos del curso: " + courseName;

    // Abrir modal
    openModal('manageGroupsModal');

    // Cargar grupos por AJAX
    fetch('api/get_groups.php?course_id=' + courseId)
      .then(response => response.json())
      .then(data => {
          const tbody = document.getElementById('groupsTableBody');
          tbody.innerHTML = '';
          if(data.length > 0){
              data.forEach(group => {
                  tbody.innerHTML += `
                    <tr class="hover:bg-gray-100">
                      <td class="px-4 py-2 border-r border-gray-300">${group.name}</td>
                      <td class="px-4 py-2 border-r border-gray-300">${group.description ?? ''}</td>
                      <td class="px-4 py-2 flex gap-2">
                        <a href="javascript:void(0)" onclick="openEditGroupModal(${group.group_id}, '${group.name}', '${group.description}')" class="text-yellow-500 hover:text-yellow-700 bg-yellow-100 px-3 py-1 rounded flex items-center justify-center text-sm">Editar</a>
                        <a href="courses_back/delete_group.php?id=${group.group_id}" onclick="return confirm('¿Seguro de eliminar este grupo?')" class="text-red-600 hover:text-red-800 bg-red-100 px-3 py-1 rounded flex items-center justify-center text-sm">Eliminar</a>
                      </td>
                    </tr>
                  `;
              });
          } else {
              tbody.innerHTML = `<tr><td colspan="3" class="px-4 py-2 text-center text-gray-500">No hay grupos registrados</td></tr>`;
          }
      });
}

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
