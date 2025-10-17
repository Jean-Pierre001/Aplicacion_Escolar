<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';
    $course_id = $_POST['course_id'] ?? '';
    $cupof = trim($_POST['cupof'] ?? ''); // nuevo campo

    if (!$name) {
        die('El nombre de la materia es obligatorio.');
    }

    if (!$turno) {
        die('El turno es obligatorio.');
    }

    if (!$course_id) {
        die('Debes seleccionar un curso.');
    }

    if (!$cupof) {
        die('El campo CUPOF es obligatorio.');
    }

    try {
        $stmt = $conn->prepare("
            INSERT INTO subjects (name, description, turno, course_id, CUPOF)
            VALUES (:name, :description, :turno, :course_id, :cupof)
        ");

        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':turno' => $turno,
            ':course_id' => $course_id,
            ':cupof' => $cupof
        ]);

        header('Location: ../subjects.php');
        exit;
    } catch (PDOException $e) {
        die("Error al agregar materia: " . $e->getMessage());
    }
}
?>
