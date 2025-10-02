<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';

    if (!$name) {
        die('El nombre de la materia es obligatorio.');
    }

    if (!$turno) {
        die('El turno es obligatorio.');
    }

    try {
        $stmt = $conn->prepare("INSERT INTO subjects (name, description, turno) VALUES (:name, :description, :turno)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':turno' => $turno
        ]);

        header('Location: ../subjects.php'); // Redirige a la lista de materias
        exit;
    } catch (PDOException $e) {
        die("Error al agregar materia: " . $e->getMessage());
    }
}
?>
