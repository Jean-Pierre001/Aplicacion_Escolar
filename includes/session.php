<?php
ini_set('session.cookie_httponly', 1);
ini_set('session.use_strict_mode', 1);
session_start();

require 'includes/conn.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = htmlspecialchars(trim($_POST['email'] ?? ''));
    $password = $_POST['password'] ?? '';

    if ($email !== '' && $password !== '') {
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            session_regenerate_id(true);

            // CORREGIDO: nombre de campo correcto
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['first_name'] = $user['first_name'];
            $_SESSION['last_name'] = $user['last_name'];
            $_SESSION['email'] = $user['email'];
            $_SESSION['role'] = $user['role'];

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
