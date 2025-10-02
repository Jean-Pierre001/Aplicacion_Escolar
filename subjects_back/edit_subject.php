<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $subject_id = $_POST['subject_id'];
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';

    if (!$subject_id || !$name || !$turno) {
        die('Datos incompletos para actualizar la materia.');
    }

    try {
        $stmt = $conn->prepare("UPDATE subjects SET name = :name, description = :description, turno = :turno WHERE subject_id = :subject_id");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':turno' => $turno,
            ':subject_id' => $subject_id
        ]);

        header('Location: ../subjects.php');
        exit;
    } catch (PDOException $e) {
        die("Error al actualizar materia: " . $e->getMessage());
    }
}
?>
