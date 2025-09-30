<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Asistencia Preceptores</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-RXf+QSDCUQs5myxMFvZ+K+8Aj6V+n6YYZQ8gqv3E0ppfY6R/fm4k0b6YcF+1+e/6Q0q6Wj5oz8F4hXl+6M4hZg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#1D4ED8',
            secondary: '#10B981',
            background: '#F8FAFC',
            sidebar: '#1E293B',
          }
        }
      }
    };
  </script>
  <style>
    html { scroll-behavior: smooth; }
    .sidebar { transition: all 0.3s; }
    @media (max-width: 768px) {
      .sidebar { transform: translateX(-100%); }
      .sidebar.active { transform: translateX(0); }
    }
  </style>
</head>

<body class="bg-background dark:bg-gray-900 text-gray-800 dark:text-white">

  <!-- SIDEBAR -->
  <aside class="sidebar fixed inset-y-0 left-0 z-50 w-64 bg-sidebar text-white shadow-lg">
    <div class="p-4 flex items-center border-b border-gray-700">
      <i class="fas fa-book text-white mr-2"></i>
      <h1 class="text-xl font-bold">Asistencia Preceptores</h1>
    </div>
    <nav class="p-4">
      <ul class="space-y-2">
        <li><a href="#inicio" class="flex items-center p-2 hover:bg-gray-700 rounded-lg"><i class="fas fa-home mr-3"></i> Inicio</a></li>
        <li><a href="#asistencias" class="flex items-center p-2 hover:bg-gray-700 rounded-lg"><i class="fas fa-check-square mr-3"></i> Asistencias</a></li>
        <li><a href="#alumnos" class="flex items-center p-2 hover:bg-gray-700 rounded-lg"><i class="fas fa-users mr-3"></i> Alumnos</a></li>
        <li><a href="#materias-horarios" class="flex items-center p-2 hover:bg-gray-700 rounded-lg"><i class="fas fa-calendar-alt mr-3"></i> Materias y Horarios</a></li>
        <li><a href="#reportes" class="flex items-center p-2 hover:bg-gray-700 rounded-lg"><i class="fas fa-file-alt mr-3"></i> Reportes</a></li>
      </ul>
    </nav>
  </aside>

  <!-- MAIN -->
  <main class="ml-0 md:ml-64 transition-all">
    <!-- HEADER -->
    <header class="bg-white dark:bg-gray-800 shadow-sm sticky top-0 z-40">
      <div class="flex justify-between items-center p-4">
        <button id="menu-toggle" class="md:hidden text-gray-700 dark:text-gray-200">
          <i class="fas fa-bars"></i>
        </button>
        <div class="flex items-center space-x-4">
          <button class="p-2 bg-gray-100 dark:bg-gray-700 rounded-full">
            <i class="fas fa-bell"></i>
          </button>
          <div class="flex items-center">
            <img src="https://via.placeholder.com/40" alt="Usuario" class="w-8 h-8 rounded-full" />
            <span class="ml-2">Preceptor</span>
          </div>
        </div>
      </div>
    </header>

    <!-- SECCIONES -->

    <!-- INICIO -->
    <section id="inicio" class="p-6">
      <h2 class="text-2xl font-bold mb-2">Bienvenido</h2>
      <p class="text-gray-600 dark:text-gray-400">Sistema de registro y gestión de asistencias escolares.</p>
    </section>

    <!-- ASISTENCIAS -->
    <section id="asistencias" class="p-6 bg-white dark:bg-gray-800 shadow rounded-lg m-4">
      <h2 class="text-xl font-semibold mb-4">Registrar Asistencias</h2>
      <form>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
          <div>
            <label class="block mb-1">Materia</label>
            <select name="materia" class="w-full p-2 rounded border dark:border-gray-600 bg-white dark:bg-gray-700">
              <option value="">Seleccione una materia</option>
              <option>Matemática</option>
              <option>Lengua</option>
              <option>Historia</option>
              <option>Geografía</option>
            </select>
          </div>
          <div>
            <label class="block mb-1">Filtrar por Curso</label>
            <select id="filtro-curso" class="w-full p-2 rounded border dark:border-gray-600 bg-white dark:bg-gray-700">
              <option value="">Todos los cursos</option>
              <option>1° A</option>
              <option>1° B</option>
              <option>2° A</option>
              <option>2° B</option>
            </select>
          </div>
        </div>

        <div class="overflow-x-auto mb-4">
          <table class="min-w-full text-sm">
            <thead class="bg-gray-100 dark:bg-gray-700">
              <tr>
                <th class="p-2 text-left">Nombre</th>
                <th class="p-2">Asistencia</th>
                <th class="p-2">Observaciones</th>
              </tr>
            </thead>
            <tbody>
              <!-- Filas de alumnos dinámicas -->
            </tbody>
          </table>
        </div>

        <div class="flex gap-4">
          <button type="submit" class="bg-primary text-white px-4 py-2 rounded hover:bg-blue-700">
            <i class="fas fa-save mr-1"></i> Guardar
          </button>
          <button type="button" class="bg-secondary text-white px-4 py-2 rounded hover:bg-green-700">
            <i class="fas fa-check mr-1"></i> Validar
          </button>
        </div>
      </form>
    </section>

    <!-- ALUMNOS -->
    <section id="alumnos" class="p-6 bg-white dark:bg-gray-800 shadow rounded-lg m-4">
      <h2 class="text-xl font-semibold mb-4">Listado de Alumnos</h2>
      <form id="form-agregar-alumno" class="mb-4 space-y-2">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <input type="text" id="nombre-alumno" placeholder="Nombre del alumno" class="p-2 rounded border dark:border-gray-600 bg-white dark:bg-gray-700" required>
          <select id="curso-alumno" class="p-2 rounded border dark:border-gray-600 bg-white dark:bg-gray-700" required>
            <option value="">Selecciona un curso</option>
            <option>1° A</option>
            <option>1° B</option>
            <option>2° A</option>
            <option>2° B</option>
          </select>
        </div>
        <button type="submit" class="mt-2 bg-primary text-white px-4 py-2 rounded hover:bg-blue-700">
          <i class="fas fa-user-plus mr-1"></i> Agregar Alumno
        </button>
      </form>
      <ul id="lista-alumnos" class="list-disc ml-6 space-y-1">
        <!-- Alumnos serán agregados dinámicamente -->
      </ul>
    </section>

    <!-- MATERIAS Y HORARIOS -->
    <section id="materias-horarios" class="p-6 bg-white dark:bg-gray-800 shadow rounded-lg m-4">
      <h2 class="text-xl font-semibold mb-4">Materias y Horarios</h2>
      <div class="mb-4">
        <label class="block mb-1">Seleccionar Curso</label>
        <select id="selector-horario-curso" class="w-full p-2 rounded border dark:border-gray-600 bg-white dark:bg-gray-700">
          <option value="">Seleccione un curso</option>
          <option>1° A</option>
          <option>2° B</option>
        </select>
      </div>
      <div class="overflow-x-auto">
        <table class="min-w-full text-sm">
          <thead class="bg-gray-100 dark:bg-gray-700">
            <tr>
              <th class="p-2">Hora</th>
              <th class="p-2">Lunes</th>
              <th class="p-2">Martes</th>
              <th class="p-2">Miércoles</th>
              <th class="p-2">Jueves</th>
              <th class="p-2">Viernes</th>
            </tr>
          </thead>
          <tbody>
            <!-- Horarios dinámicos -->
          </tbody>
        </table>
      </div>
    </section>

    <!-- REPORTES -->
    <section id="reportes" class="p-6 bg-white dark:bg-gray-800 shadow rounded-lg m-4">
      <h2 class="text-xl font-semibold mb-4">Reportes</h2>
      <p>Puedes exportar los reportes en formato digital:</p>
      <button class="mt-3 bg-gray-300 dark:bg-gray-700 text-black dark:text-white px-4 py-2 rounded hover:bg-gray-400 dark:hover:bg-gray-600">
        <i class="fas fa-download mr-1"></i> Exportar Reporte
      </button>
    </section>
  </main>

  <script>
    const alumnos = [];

    const formAgregar = document.getElementById('form-agregar-alumno');
    const listaAlumnos = document.getElementById('lista-alumnos');

    formAgregar.addEventListener('submit', function(e) {
      e.preventDefault();
      const nombre = document.getElementById('nombre-alumno').value.trim();
      const curso = document.getElementById('curso-alumno').value;
      if (!nombre || !curso) return;
      alumnos.push({ nombre, curso });
      formAgregar.reset();
      mostrarAlumnos();
    });

    function mostrarAlumnos() {
      const filtroCurso = document.getElementById('filtro-curso').value;
      const lista = document.getElementById('lista-alumnos');
      const tbody = document.querySelector('#asistencias tbody');
      lista.innerHTML = '';
      tbody.innerHTML = '';

      alumnos
        .filter(a => !filtroCurso || a.curso === filtroCurso)
        .forEach(alumno => {
          const li = document.createElement('li');
          li.textContent = `${alumno.nombre} (${alumno.curso})`;
          lista.appendChild(li);

          const tr = document.createElement('tr');
          tr.innerHTML = `
            <td class="p-2">${alumno.nombre} (${alumno.curso})</td>
            <td class="p-2">
              <select class="p-1 rounded bg-white dark:bg-gray-800 border">
                <option>Presente</option>
                <option>Ausente</option>
                <option>Justificado</option>
              </select>
            </td>
            <td class="p-2">
              <input type="text" class="w-full p-1 rounded bg-white dark:bg-gray-800 border" />
            </td>
          `;
          tbody.appendChild(tr);
        });
    }

    document.getElementById('menu-toggle').addEventListener('click', () => {
      document.querySelector('.sidebar').classList.toggle('active');
    });

    document.getElementById('filtro-curso').addEventListener('change', mostrarAlumnos);

    const horariosPorCurso = {
      "1° A": [
        { hora: "08:00 - 09:30", lunes: "Matemática - Prof. Gómez", martes: "Lengua - Prof. Pérez", miercoles: "Historia - Prof. López", jueves: "Lengua - Prof. Pérez", viernes: "Geografía - Prof. Sosa" },
        { hora: "09:30 - 11:00", lunes: "Lengua - Prof. Pérez", martes: "Historia - Prof. López", miercoles: "Matemática - Prof. Gómez", jueves: "Geografía - Prof. Sosa", viernes: "Lengua - Prof. Pérez" }
      ],
      "2° B": [
        { hora: "08:00 - 09:30", lunes: "Física - Prof. Acuña", martes: "Química - Prof. Torres", miercoles: "Biología - Prof. Rey", jueves: "Física - Prof. Acuña", viernes: "Química - Prof. Torres" },
        { hora: "09:30 - 11:00", lunes: "Matemática - Prof. Díaz", martes: "Historia - Prof. Ríos", miercoles: "Geografía - Prof. Gómez", jueves: "Lengua - Prof. Suárez", viernes: "Historia - Prof. Ríos" }
      ]
    };

    function renderHorario(curso) {
      const tbody = document.querySelector('#materias-horarios table tbody');
      tbody.innerHTML = '';
      const horario = horariosPorCurso[curso] || [];

      horario.forEach(bloque => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
          <td class="p-2">${bloque.hora}</td>
          <td class="p-2">${bloque.lunes}</td>
          <td class="p-2">${bloque.martes}</td>
          <td class="p-2">${bloque.miercoles}</td>
          <td class="p-2">${bloque.jueves}</td>
          <td class="p-2">${bloque.viernes}</td>
        `;
        tbody.appendChild(tr);
      });
    }

    document.getElementById('selector-horario-curso').addEventListener('change', function () {
      renderHorario(this.value);
    });
  </script>

</body>
</html>
