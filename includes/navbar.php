<!-- navbar.php -->
<header class="fixed top-0 left-0 md:left-64 right-0 bg-white shadow flex justify-between items-center p-6 z-30 transition-all duration-300">
  <!-- Botón hamburguesa en móvil -->
  <button id="menu-toggle" class="md:hidden text-gray-700">
    <i class="fas fa-bars text-xl"></i>
  </button>

  <div class="flex items-center space-x-4">
    <div class="flex items-center space-x-2">
      <span class="font-medium">Sistema Integral De Asistencia</span>
    </div>
  </div>
</header>

<script>
  const sidebar = document.getElementById('sidebar');
  const overlay = document.getElementById('sidebar-overlay');
  const menuToggle = document.getElementById('menu-toggle');
  const closeSidebar = document.getElementById('close-sidebar');

  // Abrir sidebar
  menuToggle.addEventListener('click', () => {
    sidebar.classList.remove('-translate-x-full');
    overlay.classList.remove('hidden');
  });

  // Cerrar sidebar con botón
  closeSidebar.addEventListener('click', () => {
    sidebar.classList.add('-translate-x-full');
    overlay.classList.add('hidden');
  });

  // Cerrar sidebar al hacer click fuera
  overlay.addEventListener('click', () => {
    sidebar.classList.add('-translate-x-full');
    overlay.classList.add('hidden');
  });
</script>
