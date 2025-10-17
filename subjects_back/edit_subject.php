<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $subject_id = $_POST['subject_id'] ?? 0;
    $name = trim($_POST['name']);
    $description = trim($_POST['description']);
    $turno = $_POST['turno'] ?? '';
    $course_ids = $_POST['course_id'] ?? [];

    if (!$subject_id || !$name || !$turno || empty($course_ids)) {
        die('Datos incompletos para actualizar la materia.');
    }

    try {
        $conn->beginTransaction();

        // 1️⃣ Actualizar datos principales
        $stmt = $conn->prepare("
            UPDATE subjects
            SET name = :name,
                description = :description,
                turno = :turno
            WHERE subject_id = :subject_id
        ");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':turno' => $turno,
            ':subject_id' => $subject_id
        ]);

        // 2️⃣ Eliminar asociaciones anteriores
        $conn->prepare("DELETE FROM subject_courses WHERE subject_id = ?")
             ->execute([$subject_id]);

        // 3️⃣ Insertar las nuevas asociaciones
        $stmtAssoc = $conn->prepare("
            INSERT INTO subject_courses (subject_id, course_id)
            VALUES (:subject_id, :course_id)
        ");
        foreach ($course_ids as $course_id) {
            $stmtAssoc->execute([
                ':subject_id' => $subject_id,
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
