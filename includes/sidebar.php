<!-- sidebar.php -->
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
      <li>
        <a href="index.php" class="flex items-center p-3 rounded-lg hover:bg-blue-700 transition-all relative">
          <i class="fas fa-home mr-3 text-lg text-yellow-400"></i>
          <span class="font-medium">Inicio</span>
          <span class="absolute left-0 top-0 h-full w-1 bg-yellow-400 rounded-r opacity-0 transition-opacity duration-300"></span>
        </a>
      </li>

      <!-- Asistencias -->
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
          <li>
            <a href="attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-pen mr-2 text-yellow-400"></i> Toma de Asistencia
            </a>
          </li>
          <li>
            <a href="attendance_report.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-file-alt mr-2 text-yellow-400"></i> Consulta de Asistencia
            </a>
          </li>
          <li>
            <a href="student_attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-user-graduate mr-2 text-yellow-400"></i> Consulta Estudiante
            </a>
          </li>
          <li>
            <a href="teachers_attendance.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-chalkboard-teacher mr-2 text-yellow-400"></i> Consulta Docentes
            </a>
          </li>
        </ul>
      </li>

      <!-- Gestión -->
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
          <li>
            <a href="users.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-user-cog mr-2 text-yellow-400"></i> Usuarios
            </a>
          </li>
          <li>
            <a href="teachers.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-chalkboard-teacher mr-2 text-yellow-400"></i> Docentes
            </a>
          </li>
          <li>
            <a href="students.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-user-graduate mr-2 text-yellow-400"></i> Alumnos
            </a>
          </li>
          <li>
            <a href="courses.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-book mr-2 text-yellow-400"></i> Cursos
            </a>
          </li>
          <li>
            <a href="subjects.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-book-reader mr-2 text-yellow-400"></i> Materias
            </a>
          </li>
          <li>
            <a href="schedules.php" class="flex items-center p-2 rounded hover:bg-blue-700 transition-all">
              <i class="fas fa-calendar-alt mr-2 text-yellow-400"></i> Horarios
            </a>
          </li>
        </ul>
      </li>

    </ul>
  </nav>
</aside>

<!-- Overlay para móvil -->
<div id="sidebar-overlay" class="fixed inset-0 bg-black bg-opacity-50 hidden z-40 md:hidden"></div>
