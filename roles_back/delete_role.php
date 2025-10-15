<?php
include '../includes/conn.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$current_role_id = $_SESSION['role_id'] ?? null; // Rol del usuario logueado
$user_id = $_SESSION['user_id'] ?? null;         // ID del usuario logueado

$role_id = $_GET['id'] ?? null;

if (!$role_id) {
    die("ID de rol inválido.");
}

// Evitar que un usuario borre el rol que está usando
if ($role_id == $current_role_id) {
    header("Location: ../roles.php?error=No puedes eliminar el rol que estás usando actualmente");
    exit();
}

try {
    $conn->beginTransaction();

    // 1. Poner a NULL el role_id de los usuarios que tenían este rol
    $stmt = $conn->prepare("UPDATE users SET role_id = NULL WHERE role_id = :role_id");
    $stmt->execute([':role_id' => $role_id]);

    // 2. Borrar el rol
    $stmt = $conn->prepare("DELETE FROM roles WHERE role_id = :role_id");
    $stmt->execute([':role_id' => $role_id]);

    $conn->commit();
    header("Location: ../roles.php?msg=Rol eliminado correctamente");
    exit();
} catch (PDOException $e) {
    $conn->rollBack();
    header("Location: ../roles.php?error=Error al eliminar el rol: " . $e->getMessage());
    exit();
}
?>
