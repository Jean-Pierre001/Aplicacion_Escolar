<!-- sidebar.php -->
<aside id="sidebar" class="fixed top-0 left-0 h-screen w-64 bg-blue-800 text-white shadow-lg flex flex-col transform -translate-x-full md:translate-x-0 transition-transform duration-300 ease-in-out z-50">
  <div class="p-4 text-2xl font-bold border-b border-blue-700 flex justify-between items-center">
    <span><i class="fas fa-school mr-2"></i> ADA</span>
    <!-- Botón de cerrar solo visible en móvil -->
    <button id="close-sidebar" class="md:hidden text-white text-xl">
      <i class="fas fa-times"></i>
    </button>
  </div>
  <nav class="flex-1 p-4 overflow-y-auto">
    <ul class="space-y-2">
      <li>
        <a href="index.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-tachometer-alt mr-3"></i> Dashboard
        </a>
      </li>
      <li>
        <a href="attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-clipboard-check mr-3"></i> Asistencias
        </a>
      </li>
      <li>
        <a href="users.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-user-cog mr-3"></i> Usuarios
        </a>
      </li>
      <li>
        <a href="teachers.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-chalkboard-teacher mr-3"></i> Docentes
        </a>
      </li>
      <li>
        <a href="schedules.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-calendar-alt mr-3"></i> Horarios
        </a>
      </li>
      <li>
        <a href="students.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-user-graduate mr-3"></i> Alumnos
        </a>
      </li>
      <li>
        <a href="courses.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-book mr-3"></i> Cursos
        </a>
      </li>
      <li>
        <a href="subjects.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-book-reader mr-3"></i> Materias
        </a>
      </li>
      <li>
        <a href="attendance_report.php" class="flex items-center p-2 rounded hover:bg-blue-700">
          <i class="fas fa-file-alt mr-3"></i> Reportes
        </a>
      </li>
    </ul>
  </nav>
</aside>

<!-- Overlay para móvil -->
<div id="sidebar-overlay" class="fixed inset-0 bg-black bg-opacity-50 hidden z-40 md:hidden"></div>
