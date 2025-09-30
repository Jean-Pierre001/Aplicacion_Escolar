<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $subject_id = $_POST['subject_id'];
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);

    if (!$subject_id || !$name) {
        die('Datos incompletos para actualizar la materia.');
    }

    try {
        $stmt = $conn->prepare("UPDATE subjects SET name = :name, description = :description WHERE subject_id = :subject_id");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':subject_id' => $subject_id
        ]);

        header('Location: ../index.php');
        exit;
    } catch (PDOException $e) {
        die("Error al actualizar materia: " . $e->getMessage());
    }
}
?>
