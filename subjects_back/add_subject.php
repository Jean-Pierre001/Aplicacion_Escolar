<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';
    $course_ids = $_POST['course_id'] ?? [];

    if (!$name) {
        die('El nombre de la materia es obligatorio.');
    }

    if (!$turno) {
        die('El turno es obligatorio.');
    }

    if (empty($course_ids)) {
        die('Debes seleccionar al menos un curso.');
    }

    try {
        $conn->beginTransaction();

        $stmt = $conn->prepare("
            INSERT INTO subjects (name, description, turno, course_id)
            VALUES (:name, :description, :turno, :course_id)
        ");

        foreach ($course_ids as $course_id) {
            $stmt->execute([
                ':name' => $name,
                ':description' => $description,
                ':turno' => $turno,
                ':course_id' => $course_id
            ]);
        }

        $conn->commit();
        header('Location: ../subjects.php');
        exit;
    } catch (PDOException $e) {
        $conn->rollBack();
        die("Error al agregar materia: " . $e->getMessage());
    }
}
?>
