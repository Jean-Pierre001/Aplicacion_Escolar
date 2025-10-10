<?php
// Configuración segura de sesión
ini_set('session.cookie_httponly', 1);
ini_set('session.use_strict_mode', 1);
session_start();

// Redirigir al login si no hay usuario logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Opcional: definir variables locales para facilitar uso
$user_id    = $_SESSION['user_id'];
$first_name = $_SESSION['first_name'];
$last_name  = $_SESSION['last_name'];
$email      = $_SESSION['email'];
$role       = $_SESSION['role'];