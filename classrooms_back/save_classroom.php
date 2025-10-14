<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $classroom_id = !empty($_POST['classroom_id']) ? intval($_POST['classroom_id']) : null;
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);

    try {
        if ($classroom_id) {
            // Actualizar aula existente
            $stmt = $conn->prepare("UPDATE classrooms SET name = :name, description = :description WHERE classroom_id = :id");
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':id', $classroom_id);
            $stmt->execute();
            header("Location: ../classrooms.php?success=edit");
            exit;
        } else {
            // Agregar nueva aula
            $stmt = $conn->prepare("INSERT INTO classrooms (name, description) VALUES (:name, :description)");
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':description', $description);
            $stmt->execute();
            header("Location: ../classrooms.php?success=add");
            exit;
        }
    } catch (PDOException $e) {
        die("❌ Error al guardar el aula: " . $e->getMessage());
    }
} else {
    header("Location: ../classrooms.php");
    exit;
}
