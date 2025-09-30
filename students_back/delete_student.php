<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    $student_id = $_GET['id'];

    try {
        $sql = "DELETE FROM students WHERE student_id = :student_id";
        $stmt = $conn->prepare($sql);
        $stmt->execute([':student_id' => $student_id]);

        header("Location: ../students.php");
        exit;

    } catch (PDOException $e) {
        die("Error al eliminar estudiante: " . $e->getMessage());
    }
} else {
    header("Location: ../students.php");
    exit;
}
