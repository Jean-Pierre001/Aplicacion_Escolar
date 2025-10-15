<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $role_id = $_POST['role_id'] ?? null;
    $permissions = $_POST['permissions'] ?? [];

    if (!$role_id) {
        header("Location: ../roles.php?error=Rol inválido");
        exit();
    }

    try {
        // --- Verificar si es Administrador ---
        $stmtRole = $conn->prepare("SELECT name FROM roles WHERE role_id = :role_id");
        $stmtRole->execute([':role_id' => $role_id]);
        $roleName = $stmtRole->fetchColumn();

        if (strtolower($roleName) === 'administrador') {
            // Si no tiene el permiso "roles.php:view", bloquear
            $hasRolesPermission = in_array('roles.php:view', $permissions);
            if (!$hasRolesPermission) {
                // Redirigir con error
                header("Location: ../roles.php?error=No se puede quitar el permiso 'Roles' del Administrador");
                exit();
            }
        }

        $conn->beginTransaction();

        // 1. Borrar permisos existentes
        $stmt = $conn->prepare("DELETE FROM role_permissions WHERE role_id = :role_id");
        $stmt->execute([':role_id' => $role_id]);

        // 2. Insertar los nuevos permisos
        $stmtInsert = $conn->prepare("INSERT INTO role_permissions (role_id, page, action) VALUES (:role_id, :page, :action)");

        foreach ($permissions as $perm) {
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
        header("Location: ../roles.php?error=Error al guardar permisos: " . urlencode($e->getMessage()));
        exit();
    }
}
?>
