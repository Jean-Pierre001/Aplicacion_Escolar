<?php
include '../includes/conn.php';
session_start();

$user_id_to_delete = $_GET['id'] ?? null;

if (!$user_id_to_delete) {
    header("Location: ../users.php?error=ID de usuario inválido");
    exit();
}

// Validar que no sea el mismo usuario que tiene la sesión activa
if ($user_id_to_delete == $_SESSION['user_id']) {
    header("Location: ../users.php?error=No puedes eliminar tu propio usuario");
    exit();
}

try {
    $stmt = $conn->prepare("DELETE FROM users WHERE user_id = ?");
    $stmt->execute([$user_id_to_delete]);
    header("Location: ../users.php?msg=Usuario eliminado correctamente");
    exit();
} catch (PDOException $e) {
    header("Location: ../users.php?error=Error al eliminar usuario: " . $e->getMessage());
    exit();
}
?>
