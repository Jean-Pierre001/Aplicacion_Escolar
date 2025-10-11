<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $role_id = $_POST['role_id'] ?? null;
    $permissions = $_POST['permissions'] ?? [];

    if (!$role_id) {
        die("Rol inválido.");
    }

    try {
        $conn->beginTransaction();

        // 1. Borrar permisos existentes
        $stmt = $conn->prepare("DELETE FROM role_permissions WHERE role_id = :role_id");
        $stmt->execute([':role_id' => $role_id]);

        // 2. Insertar los nuevos permisos
        $stmtInsert = $conn->prepare("INSERT INTO role_permissions (role_id, page, action) VALUES (:role_id, :page, :action)");

        foreach ($permissions as $perm) {
            // Cada permiso viene en formato page:action (ej: users.php:view)
            list($page, $action) = explode(':', $perm);
            $stmtInsert->execute([
                ':role_id' => $role_id,
                ':page' => $page,
                ':action' => $action
            ]);
        }

        $conn->commit();
        header("Location: ../roles.php?msg=Permisos actualizados correctamente");
        exit();
    } catch (PDOException $e) {
        $conn->rollBack();
        die("Error al guardar permisos: " . $e->getMessage());
    }
}
?>
