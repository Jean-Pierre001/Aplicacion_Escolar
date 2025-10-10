<?php
// Configuraciones de seguridad para la sesión
ini_set('session.cookie_httponly', 1); // Bloquea acceso vía JS a la cookie de sesión
ini_set('session.use_strict_mode', 1); // No permite reuse de IDs de sesión inválidos
session_start();

require 'includes/conn.php'; // Conexión PDO
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = htmlspecialchars(trim($_POST['email'] ?? ''));
    $password = $_POST['password'] ?? '';

    if ($email !== '' && $password !== '') {
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            session_start(); // Inicia sesión si no estaba iniciada
            session_regenerate_id(true); // Evita session fixation

            // Guardar datos en la sesión
            $_SESSION['user_id']    = $user['user_id'];
            $_SESSION['first_name'] = $user['first_name'];
            $_SESSION['last_name']  = $user['last_name'];
            $_SESSION['email']      = $user['email'];
            $_SESSION['role']       = $user['role'];

            header("Location: index.php");
            exit();
        } else {
            $error = "Correo electrónico o contraseña incorrectos.";
        }
    } else {
        $error = "Todos los campos son obligatorios.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Login - SIA</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body, html {
      height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden;
    }
    .background-image {
      position: fixed;
      top: 0; left: 0; right: 0; bottom: 0;
      background: url('assets/images/patagones.jfif') no-repeat center center/cover;
      filter: blur(0px);
      z-index: -1;
      user-select: none;
      -webkit-user-select: none;
    }
    .login-container {
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      z-index: 1;
    }
  </style>
</head>
<body>
  <div class="background-image"></div>

  <div class="login-container">
    <form method="post" class="bg-white p-4 rounded shadow" style="width: 320px;">
      <h4 class="text-center mb-3">Iniciar Sesión</h4>
      <?php if ($error): ?>
        <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
      <?php endif; ?>
      <div class="mb-3">
        <label for="email">Correo Electrónico</label>
        <input type="text" id="email" name="email" class="form-control" required autofocus />
      </div>
      <div class="mb-3">
        <label for="password">Contraseña</label>
        <input type="password" id="password" name="password" class="form-control" required />
      </div>
      <button class="btn btn-primary w-100">Ingresar</button>
    </form>
  </div>
</body>
</html>
