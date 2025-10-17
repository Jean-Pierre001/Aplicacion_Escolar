<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['subject_ids']) && is_array($_POST['subject_ids'])) {
    $subject_ids = array_map('intval', $_POST['subject_ids']); // Sanitizar IDs

    if (count($subject_ids) === 0) {
        die('No se seleccionaron materias para eliminar.');
    }

    try {
        $placeholders = implode(',', array_fill(0, count($subject_ids), '?'));
        $sql = "DELETE FROM subjects WHERE subject_id IN ($placeholders)";
        $stmt = $conn->prepare($sql);
        $stmt->execute($subject_ids);

        // Redirigir de vuelta a la página de materias
        header('Location: ../subjects.php');
        exit;
    } catch (PDOException $e) {
        die("Error al eliminar materias: " . $e->getMessage());
    }
} else {
    die('Solicitud inválida.');
}
?>
