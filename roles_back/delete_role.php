<?php
include '../includes/conn.php';

$role_id = $_GET['id'] ?? null;

if (!$role_id) {
    die("ID de rol inválido.");
}

try {
    $stmt = $conn->prepare("DELETE FROM roles WHERE role_id = :role_id");
    $stmt->execute([':role_id' => $role_id]);
    header("Location: ../roles.php?msg=Rol eliminado correctamente");
    exit();
} catch (PDOException $e) {
    die("Error al eliminar el rol: " . $e->getMessage());
}
?>
