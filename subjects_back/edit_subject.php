<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $subject_id = $_POST['subject_id'];
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';
    $course_id = $_POST['course_id'] ?? '';
    $cupof = trim($_POST['cupof'] ?? ''); // nuevo campo

    if (!$subject_id || !$name || !$turno || !$course_id || !$cupof) {
        die('Datos incompletos para actualizar la materia.');
    }

    try {
        $stmt = $conn->prepare("
            UPDATE subjects
            SET name = :name,
                description = :description,
                turno = :turno,
                course_id = :course_id,
                CUPOF = :cupof
            WHERE subject_id = :subject_id
        ");

        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':turno' => $turno,
            ':course_id' => $course_id,
            ':cupof' => $cupof,
            ':subject_id' => $subject_id
        ]);

        header('Location: ../subjects.php');
        exit;
    } catch (PDOException $e) {
        die("Error al actualizar materia: " . $e->getMessage());
    }
}
?>
