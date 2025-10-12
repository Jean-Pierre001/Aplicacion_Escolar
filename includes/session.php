<?php
include 'conn.php'; // Asegurate de que la conexión PDO esté aquí

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id    = $_SESSION['user_id'];
$first_name = $_SESSION['first_name'];
$last_name  = $_SESSION['last_name'];
$email      = $_SESSION['email'];
$role_id    = $_SESSION['role_id']; 

//--- Verificar permisos de la página ---
$page = basename($_SERVER['PHP_SELF']); 

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
        header("Location: index.php");
        exit();
    }
} catch (PDOException $e) {
    die("Error al verificar permisos: " . $e->getMessage());
}

