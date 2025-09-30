<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    $subject_id = $_GET['id'];

    try {
        $stmt = $conn->prepare("DELETE FROM subjects WHERE subject_id = :subject_id");
        $stmt->execute([':subject_id' => $subject_id]);

        header('Location: ../subject.php');
        exit;
    } catch (PDOException $e) {
        die("Error al eliminar materia: " . $e->getMessage());
    }
} else {
    die('ID de materia no proporcionado.');
}
?>
