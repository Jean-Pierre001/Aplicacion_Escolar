<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);

    if (!$name) {
        die('El nombre de la materia es obligatorio.');
    }

    try {
        $stmt = $conn->prepare("INSERT INTO subjects (name, description) VALUES (:name, :description)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description
        ]);

        header('Location: ../index.php'); // Redirige a la lista de materias
        exit;
    } catch (PDOException $e) {
        die("Error al agregar materia: " . $e->getMessage());
    }
}
?>
