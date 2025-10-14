<!-- Modal Agregar / Editar Aula -->
<div id="addClassroomModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-md p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar / Editar Aula</h2>
    <form id="classroomForm" action="classrooms_back/save_classroom.php" method="POST" class="space-y-4">
      <input type="hidden" name="classroom_id" id="classroom_id">
      
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" id="name" class="w-full border px-3 py-2 rounded" required>
      </div>

      <div>
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" id="description" class="w-full border px-3 py-2 rounded"></textarea>
      </div>

      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('addClassroomModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-blue-600 text-white hover:bg-blue-700">Guardar</button>
      </div>
    </form>

    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('addClassroomModal')">
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
  function openEditModalClassroom(classroom){
    document.getElementById('classroom_id').value = classroom.classroom_id;
    document.getElementById('name').value = classroom.name;
    document.getElementById('description').value = classroom.description || '';
    openModal('addClassroomModal');
  }
</script>
