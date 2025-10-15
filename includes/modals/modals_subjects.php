<!-- Modal Agregar Materia -->
<div id="addSubjectModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar Materia</h2>
    <form id="addSubjectForm" action="subjects_back/add_subject.php" method="POST" class="space-y-4">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" class="w-full border px-3 py-2 rounded" rows="3"></textarea>
      </div>
      <div>
        <label class="block mb-1 font-medium">Curso</label>
        <select name="course_id" class="w-full border px-3 py-2 rounded" required>
          <option value="">Selecciona un curso</option>
          <?php
          $courses = $conn->query("SELECT * FROM courses ORDER BY name")->fetchAll();
          foreach ($courses as $course) {
              echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
          }
          ?>
        </select>
      </div>
      <div>
        <label class="block mb-1 font-medium">Turno</label>
        <select name="turno" class="w-full border px-3 py-2 rounded" required>
          <option value="mañana">Mañana</option>
          <option value="tarde">Tarde</option>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('addSubjectModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-blue-600 text-white hover:bg-blue-700">Agregar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('addSubjectModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<!-- Modal Editar Materia -->
<div id="editSubjectModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Editar Materia</h2>
    <form id="editSubjectForm" action="subjects_back/edit_subject.php" method="POST" class="space-y-4">
      <input type="hidden" name="subject_id" id="edit_subject_id">
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" id="edit_name" class="w-full border px-3 py-2 rounded" required>
      </div>
      <div>
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" id="edit_description" class="w-full border px-3 py-2 rounded" rows="3"></textarea>
      </div>
      <div>
        <label class="block mb-1 font-medium">Curso</label>
        <select name="course_id" id="edit_course_id" class="w-full border px-3 py-2 rounded" required>
          <option value="">Selecciona un curso</option>
          <?php
          $courses = $conn->query("SELECT * FROM courses ORDER BY name")->fetchAll();
          foreach ($courses as $course) {
              echo "<option value='{$course['course_id']}'>{$course['name']}</option>";
          }
          ?>
        </select>
      </div>
      <div>
        <label class="block mb-1 font-medium">Turno</label>
        <select name="turno" id="edit_turno" class="w-full border px-3 py-2 rounded" required>
          <option value="mañana">Mañana</option>
          <option value="tarde">Tarde</option>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" class="px-4 py-2 rounded bg-gray-300 hover:bg-gray-400" onclick="closeModal('editSubjectModal')">Cancelar</button>
        <button type="submit" class="px-4 py-2 rounded bg-yellow-500 text-white hover:bg-yellow-600">Guardar</button>
      </div>
    </form>
    <button class="absolute top-3 right-3 text-gray-500 hover:text-gray-700" onclick="closeModal('editSubjectModal')">
      <i class="fa-solid fa-xmark"></i>
    </button>
  </div>
</div>

<script>
// Abrir / cerrar modal
function openModal(modalId) { document.getElementById(modalId).classList.remove('hidden'); }
function closeModal(modalId) { document.getElementById(modalId).classList.add('hidden'); }

function openEditModalSubject(subject){
  document.getElementById('edit_subject_id').value = subject.subject_id;
  document.getElementById('edit_name').value = subject.name;
  document.getElementById('edit_description').value = subject.description;
  document.getElementById('edit_turno').value = subject.turno;
  document.getElementById('edit_course_id').value = subject.course_id;
  openModal('editSubjectModal');
}

// Validación duplicados vía AJAX
async function checkDuplicateSubject(name, course_id, subject_id = null){
    const fd = new FormData();
    fd.append('name', name);
    fd.append('course_id', course_id);
    if(subject_id) fd.append('subject_id', subject_id);

    const res = await fetch('api/validations/check_duplicate_subject.php', { method:'POST', body: fd });
    const data = await res.json();
    return data.exists;
}

// --- Formulario Agregar Materia ---
document.getElementById('addSubjectForm').addEventListener('submit', async e => {
    e.preventDefault();
    const name = e.target.name.value.trim();
    const course_id = e.target.course_id.value;

    if(!name) return Swal.fire('Error', 'Debe ingresar un nombre de materia.', 'warning');

    const exists = await checkDuplicateSubject(name, course_id);
    if(exists) return Swal.fire('Duplicado', 'Ya existe una materia con este nombre en el curso seleccionado.', 'error');

    e.target.submit();
});

// --- Formulario Editar Materia ---
document.getElementById('editSubjectForm').addEventListener('submit', async e => {
    e.preventDefault();
    const name = e.target.name.value.trim();
    const course_id = e.target.course_id.value;
    const subject_id = e.target.subject_id.value;

    if(!name) return Swal.fire('Error', 'Debe ingresar un nombre de materia.', 'warning');

    const exists = await checkDuplicateSubject(name, course_id, subject_id);
    if(exists) return Swal.fire('Duplicado', 'Ya existe otra materia con este nombre en el curso seleccionado.', 'error');

    e.target.submit();
});
</script>

