<!-- Modal Agregar Materia -->
<div id="addSubjectModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6 relative">
    <h2 class="text-xl font-semibold mb-4">Agregar Materia</h2>
    <form id="addSubjectForm" action="subjects_back/add_subject.php" method="POST" class="space-y-4">
      
      <!-- Nombre -->
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" class="w-full border px-3 py-2 rounded" required>
      </div>

      <!-- Descripción -->
      <div>
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" class="w-full border px-3 py-2 rounded" rows="3"></textarea>
      </div>

      <!-- Curso (único) -->
      <div>
        <label class="block mb-1 font-medium">Curso</label>
        <select name="course_id" class="w-full border px-3 py-2 rounded" required>
          <option value="">Seleccione un curso</option>
          <?php
          $stmt = $conn->query("SELECT course_id, name FROM courses ORDER BY name ASC");
          while ($row = $stmt->fetch(PDO::FETCH_ASSOC)): ?>
            <option value="<?= htmlspecialchars($row['course_id']) ?>">
              <?= htmlspecialchars($row['name']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </div>

      <!-- CUPOF -->
      <div>
        <label class="block mb-1 font-medium">CUPOF</label>
        <input type="number" name="cupof" class="w-full border px-3 py-2 rounded" required>
      </div>

      <!-- Turno -->
      <div>
        <label class="block mb-1 font-medium">Turno</label>
        <select name="turno" class="w-full border px-3 py-2 rounded" required>
          <option value="mañana">Mañana</option>
          <option value="tarde">Tarde</option>
        </select>
      </div>

      <!-- Botones -->
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

      <!-- Nombre -->
      <div>
        <label class="block mb-1 font-medium">Nombre</label>
        <input type="text" name="name" id="edit_name" class="w-full border px-3 py-2 rounded" required>
      </div>

      <!-- Descripción -->
      <div>
        <label class="block mb-1 font-medium">Descripción</label>
        <textarea name="description" id="edit_description" class="w-full border px-3 py-2 rounded" rows="3"></textarea>
      </div>

      <!-- Curso -->
      <div>
        <label class="block mb-1 font-medium">Curso</label>
        <select name="course_id" id="edit_course_id" class="w-full border px-3 py-2 rounded" required>
          <option value="">Seleccione un curso</option>
          <?php
          $stmt = $conn->query("SELECT course_id, name FROM courses ORDER BY name ASC");
          while ($row = $stmt->fetch(PDO::FETCH_ASSOC)): ?>
            <option value="<?= htmlspecialchars($row['course_id']) ?>">
              <?= htmlspecialchars($row['name']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </div>

      <!-- CUPOF -->
      <div>
        <label class="block mb-1 font-medium">CUPOF</label>
        <input type="number" name="cupof" id="edit_cupof" class="w-full border px-3 py-2 rounded" required>
      </div>

      <!-- Turno -->
      <div>
        <label class="block mb-1 font-medium">Turno</label>
        <select name="turno" id="edit_turno" class="w-full border px-3 py-2 rounded" required>
          <option value="mañana">Mañana</option>
          <option value="tarde">Tarde</option>
        </select>
      </div>

      <!-- Botones -->
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
// === Abrir / cerrar modal ===
function openModal(modalId) { document.getElementById(modalId).classList.remove('hidden'); }
function closeModal(modalId) { document.getElementById(modalId).classList.add('hidden'); }

// === Llenar modal Editar ===
function openEditModalSubject(subject){
  document.getElementById('edit_subject_id').value = subject.subject_id;
  document.getElementById('edit_name').value = subject.name;
  document.getElementById('edit_description').value = subject.description;
  document.getElementById('edit_turno').value = subject.turno;
  document.getElementById('edit_course_id').value = subject.course_id || '';
  document.getElementById('edit_cupof').value = subject.CUPOF || '';
  openModal('editSubjectModal');
}

// === Verificación AJAX duplicados ===
async function checkDuplicateSubject(name, course_id, subject_id = null){
  const fd = new FormData();
  fd.append('name', name);
  fd.append('course_ids', JSON.stringify([course_id]));
  if(subject_id) fd.append('subject_id', subject_id);

  const res = await fetch('api/validations/check_duplicate_subject.php', { method: 'POST', body: fd });
  const data = await res.json();
  return data.exists;
}

// === Verificación AJAX CUPOF ===
async function checkDuplicateCUPOF(cupof, subject_id = null){
  const fd = new FormData();
  fd.append('cupof', cupof);
  if(subject_id) fd.append('subject_id', subject_id);

  const res = await fetch('api/validations/check_duplicate_cupof.php', { method: 'POST', body: fd });
  const data = await res.json();
  return data.exists;
}

// === Validación AGREGAR ===
document.getElementById('addSubjectForm').addEventListener('submit', async e => {
  e.preventDefault();
  const name = e.target.name.value.trim();
  const course_id = e.target.course_id.value;
  const cupof = e.target.cupof.value.trim();

  if(!name || !course_id || !cupof){
    Swal.fire({ icon: 'warning', title: 'Campos incompletos', text: 'Complete todos los campos.', confirmButtonColor: '#3085d6' });
    return;
  }

  const duplicateName = await checkDuplicateSubject(name, course_id);
  const duplicateCUPOF = await checkDuplicateCUPOF(cupof);
  if(duplicateName){
    Swal.fire({ icon: 'error', title: 'Duplicado', text: 'Ya existe una materia con este nombre en ese curso.', confirmButtonColor: '#d33' });
    return;
  }
  if(duplicateCUPOF){
    Swal.fire({ icon: 'error', title: 'Duplicado', text: 'El CUPOF ya está asignado a otra materia.', confirmButtonColor: '#d33' });
    return;
  }
  e.target.submit();
});

// === Validación EDITAR ===
document.getElementById('editSubjectForm').addEventListener('submit', async e => {
  e.preventDefault();
  const subject_id = e.target.subject_id.value;
  const name = e.target.name.value.trim();
  const course_id = e.target.course_id.value;
  const cupof = e.target.cupof.value.trim();

  if(!name || !course_id || !cupof){
    Swal.fire({ icon: 'warning', title: 'Campos incompletos', text: 'Complete todos los campos.', confirmButtonColor: '#3085d6' });
    return;
  }

  const duplicateName = await checkDuplicateSubject(name, course_id, subject_id);
  const duplicateCUPOF = await checkDuplicateCUPOF(cupof, subject_id);
  if(duplicateName){
    Swal.fire({ icon: 'error', title: 'Duplicado', text: 'Ya existe otra materia con este nombre en ese curso.', confirmButtonColor: '#d33' });
    return;
  }
  if(duplicateCUPOF){
    Swal.fire({ icon: 'error', title: 'Duplicado', text: 'El CUPOF ya está asignado a otra materia.', confirmButtonColor: '#d33' });
    return;
  }
  e.target.submit();
});
</script>
