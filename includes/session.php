<?php
include 'conn.php'; // Asegurate de que la conexión PDO esté aquí

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
$role_id    = $_SESSION['role_id']; // role_id ya guardado en sesión

// --- Verificar permisos de la página ---
$page = basename($_SERVER['PHP_SELF']); // nombre del archivo actual

try {
    $stmt = $conn->prepare("
        SELECT COUNT(*) 
        FROM role_permissions 
        WHERE role_id = :role_id AND page = :page AND action = 'view'
    ");
    $stmt->execute([
        ':role_id' => $role_id,
        ':page'    => $page
    ]);
    $canView = $stmt->fetchColumn();

    if (!$canView) {
        // Usuario no tiene permiso, redirigir al inicio
        header("Location: index.php");
        exit();
    }
} catch (PDOException $e) {
    // Si hay error en la consulta, opcional mostrar mensaje o log
    die("Error al verificar permisos: " . $e->getMessage());
}
