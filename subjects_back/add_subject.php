<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';
    $course_id = $_POST['course_id'] ?? null;

    if (!$name) {
        die('El nombre de la materia es obligatorio.');
    }

    if (!$turno) {
        die('El turno es obligatorio.');
    }

    if (!$course_id) {
        die('El curso es obligatorio.');
    }

    try {
        $stmt = $conn->prepare("INSERT INTO subjects (name, description, turno, course_id) VALUES (:name, :description, :turno, :course_id)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':turno' => $turno,
            ':course_id' => $course_id
        ]);

        header('Location: ../subjects.php'); // Redirige a la lista de materias
        exit;
    } catch (PDOException $e) {
        die("Error al agregar materia: " . $e->getMessage());
    }
}
?>
