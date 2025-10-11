<?php
include 'includes/session.php';
include 'includes/conn.php'; 

$role_id = $_SESSION['role_id'];
$permissions = [];

// Traer permisos del rol
try {
    $stmt = $conn->prepare("SELECT page, action FROM role_permissions WHERE role_id = ?");
    $stmt->execute([$role_id]);
    $perms = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($perms as $perm) {
        $permissions[$perm['page']][] = $perm['action'];
    }
} catch (PDOException $e) {
    echo "Error al cargar permisos: " . $e->getMessage();
}
?>

<aside id="sidebar" class="fixed top-0 left-0 h-screen w-64 bg-gradient-to-b from-blue-800 to-blue-900 text-white shadow-2xl flex flex-col transform -translate-x-full md:translate-x-0 transition-transform duration-300 ease-in-out z-50">
  <!-- Header -->
  <div class="p-5 text-2xl font-bold border-b border-blue-700 flex justify-between items-center">
    <span class="flex items-center"><i class="fas fa-layer-group mr-2 text-yellow-400"></i> SIA</span>
    <button id="close-sidebar" class="md:hidden text-white text-xl hover:text-yellow-400 transition-colors">
      <i class="fas fa-times"></i>
    </button>
  </div>

  <!-- Navegación -->
  <nav class="flex-1 p-4 overflow-y-auto">
    <ul class="space-y-3">

      <!-- Dashboard -->
      <?php if(isset($permissions['index.php']) && in_array('view', $permissions['index.php'])): ?>
      <li>
        <a href="index.php" class="flex items-center p-3 rounded-lg hover:bg-blue-700 transition-all relative">
          <i class="fas fa-home mr-3 text-lg text-yellow-400"></i>
          <span class="font-medium">Inicio</span>
        </a>
      </li>
      <?php endif; ?>

      <!-- Asistencias -->
      <?php 
      $attendance_pages = ['attendance.php','attendance_report.php','student_attendance.php','teachers_attendance.php'];
      $has_attendance = false;
      foreach($attendance_pages as $page) {
          if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_attendance = true; break; }
      }
      ?>
      <?php if($has_attendance): ?>
      <li>
        <button class="flex items-center justify-between w-full p-3 rounded-lg hover:bg-blue-700 focus:outline-none transition-all relative" 
                onclick="this.nextElementSibling.classList.toggle('max-h-0'); this.nextElementSibling.classList.toggle('max-h-96');">
          <span class="flex items-center">
            <i class="fas fa-clipboard-check mr-3 text-lg text-yellow-400"></i>
            <span class="font-medium">Asistencias</span>
          </span>
          <i class="fas fa-chevron-down transition-transform duration-300"></i>
        </button>
        <ul class="pl-6 mt-2 space-y-2 overflow-hidden max-h-0 transition-all duration-500">
          <?php if(isset($permissions['attendance.php']) && in_array('view', $permissions['attendance.php'])): ?>
          <li><a href="attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-pen mr-2 text-yellow-400"></i> Toma de Asistencia</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['attendance_report.php']) && in_array('view', $permissions['attendance_report.php'])): ?>
          <li><a href="attendance_report.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-file-alt mr-2 text-yellow-400"></i> Consulta de Asistencia</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['student_attendance.php']) && in_array('view', $permissions['student_attendance.php'])): ?>
          <li><a href="student_attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-user-graduate mr-2 text-yellow-400"></i> Consulta Estudiante</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['teachers_attendance.php']) && in_array('view', $permissions['teachers_attendance.php'])): ?>
          <li><a href="teachers_attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-chalkboard-teacher mr-2 text-yellow-400"></i> Consulta Docentes</a></li>
          <?php endif; ?>
        </ul>
      </li>
      <?php endif; ?>

      <!-- Gestión -->
      <?php 
      $gestion_pages = ['teachers.php','students.php','courses.php','subjects.php','schedules.php'];
      $has_gestion = false;
      foreach($gestion_pages as $page) {
          if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_gestion = true; break; }
      }
      ?>
      <?php if($has_gestion): ?>
      <li>
        <button class="flex items-center justify-between w-full p-3 rounded-lg hover:bg-blue-700 focus:outline-none transition-all relative" 
                onclick="this.nextElementSibling.classList.toggle('max-h-0'); this.nextElementSibling.classList.toggle('max-h-96');">
          <span class="flex items-center">
            <i class="fas fa-cogs mr-3 text-lg text-yellow-400"></i>
            <span class="font-medium">Gestión</span>
          </span>
          <i class="fas fa-chevron-down transition-transform duration-300"></i>
        </button>
        <ul class="pl-6 mt-2 space-y-2 overflow-hidden max-h-0 transition-all duration-500">
          <?php if(isset($permissions['teachers.php']) && in_array('view', $permissions['teachers.php'])): ?>
          <li><a href="teachers.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-chalkboard-teacher mr-2 text-yellow-400"></i> Docentes</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['courses.php']) && in_array('view', $permissions['courses.php'])): ?>
          <li><a href="courses.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-book mr-2 text-yellow-400"></i> Cursos</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['subjects.php']) && in_array('view', $permissions['subjects.php'])): ?>
          <li><a href="subjects.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-book-reader mr-2 text-yellow-400"></i> Materias</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['students.php']) && in_array('view', $permissions['students.php'])): ?>
          <li><a href="students.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-user-graduate mr-2 text-yellow-400"></i> Alumnos</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['schedules.php']) && in_array('view', $permissions['schedules.php'])): ?>
          <li><a href="schedules.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-calendar-alt mr-2 text-yellow-400"></i> Horarios</a></li>
          <?php endif; ?>
        </ul>
      </li>
      <?php endif; ?>

      <!-- Administrador -->
      <?php 
      $admin_pages = ['users.php','roles.php'];
      $has_admin = false;
      foreach($admin_pages as $page) {
          if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_admin = true; break; }
      }
      ?>
      <?php if($has_admin): ?>
      <li>
        <button class="flex items-center justify-between w-full p-3 rounded-lg hover:bg-blue-700 focus:outline-none transition-all relative" 
                onclick="this.nextElementSibling.classList.toggle('max-h-0'); this.nextElementSibling.classList.toggle('max-h-96');">
          <span class="flex items-center">
            <i class="fas fa-user-shield mr-3 text-lg text-yellow-400"></i>
            <span class="font-medium">Administrador</span>
          </span>
          <i class="fas fa-chevron-down transition-transform duration-300"></i>
        </button>
        <ul class="pl-6 mt-2 space-y-2 overflow-hidden max-h-0 transition-all duration-500">
          <?php if(isset($permissions['users.php']) && in_array('view', $permissions['users.php'])): ?>
          <li><a href="users.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-users mr-2 text-yellow-400"></i> Usuarios</a></li>
          <?php endif; ?>
          <?php if(isset($permissions['roles.php']) && in_array('view', $permissions['roles.php'])): ?>
          <li><a href="roles.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all"><i class="fas fa-id-badge mr-2 text-yellow-400"></i> Roles</a></li>
          <?php endif; ?>
        </ul>
      </li>
      <?php endif; ?>

    </ul>
  </nav>

  <!-- Logout -->
  <li class="mt-6 mb-4 px-4">
    <a href="logout.php" class="flex items-center p-3 rounded-lg hover:bg-red-600 transition-all relative">
      <i class="fas fa-sign-out-alt mr-3 text-lg text-yellow-400"></i>
      <span class="font-medium">Cerrar Sesión</span>
    </a>
  </li>
</aside>

<!-- Overlay para móvil -->
<div id="sidebar-overlay" class="fixed inset-0 bg-black bg-opacity-50 hidden z-40 md:hidden"></div>
