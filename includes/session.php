<?php
// --- Inicia sesión solo si no está activa ---
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Redirigir al login si no hay usuario logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Definir variables locales para facilitar uso
$user_id    = $_SESSION['user_id'];
$first_name = $_SESSION['first_name'];
$last_name  = $_SESSION['last_name'];
$email      = $_SESSION['email'];
$role_id    = $_SESSION['role_id']; // corregido: usar role_id
