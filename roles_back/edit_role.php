<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $role_id = $_POST['role_id'] ?? null;
    $name = trim($_POST['name'] ?? '');
    $description = trim($_POST['description'] ?? '');

    if (!$role_id || $name === '') {
        die("Datos inválidos.");
    }

    try {
        $stmt = $conn->prepare("UPDATE roles SET name = :name, description = :description WHERE role_id = :role_id");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':role_id' => $role_id
        ]);
        header("Location: ../roles.php?msg=Rol actualizado correctamente");
        exit();
    } catch (PDOException $e) {
        die("Error al actualizar el rol: " . $e->getMessage());
    }
}
?>
