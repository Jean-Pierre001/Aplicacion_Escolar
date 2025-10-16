<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $subject_id = $_POST['subject_id'];
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';
    $course_ids = $_POST['course_id'] ?? [];

    if (!$subject_id || !$name || !$turno || empty($course_ids)) {
        die('Datos incompletos para actualizar la materia.');
    }

    try {
        $conn->beginTransaction();

        // Eliminamos las materias anteriores con mismo nombre (según tu lógica)
        $conn->prepare("DELETE FROM subjects WHERE name = :name")->execute([':name' => $name]);

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
        die("Error al actualizar materia: " . $e->getMessage());
    }
}
?>
