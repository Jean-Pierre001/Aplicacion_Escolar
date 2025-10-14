<?php
include '../includes/conn.php';

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $classroom_id = intval($_GET['id']);

    try {
        $stmt = $conn->prepare("DELETE FROM classrooms WHERE classroom_id = :id");
        $stmt->bindParam(':id', $classroom_id);
        $stmt->execute();
        header("Location: ../classrooms.php?success=delete");
        exit;
    } catch (PDOException $e) {
        die("❌ Error al eliminar el aula: " . $e->getMessage());
    }
} else {
    header("Location: ../classrooms.php");
    exit;
}
