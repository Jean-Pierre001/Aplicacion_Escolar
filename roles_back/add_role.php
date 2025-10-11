<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $description = trim($_POST['description'] ?? '');

    if ($name === '') {
        die("El nombre del rol es obligatorio.");
    }

    try {
        $stmt = $conn->prepare("INSERT INTO roles (name, description) VALUES (:name, :description)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description
        ]);
        header("Location: ../roles.php?msg=Rol agregado correctamente");
        exit();
    } catch (PDOException $e) {
        die("Error al agregar el rol: " . $e->getMessage());
    }
}
?>
