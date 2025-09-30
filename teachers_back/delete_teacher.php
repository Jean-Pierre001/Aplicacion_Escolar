<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    $teacher_id = $_GET['id'];

    $stmt = $conn->prepare("DELETE FROM teachers WHERE teacher_id = :teacher_id");
    $stmt->bindParam(':teacher_id', $teacher_id);

    if ($stmt->execute()) {
        header('Location: ../teachers.php');
        exit;
    } else {
        echo "Error al eliminar docente.";
    }
} else {
    echo "ID de docente no especificado.";
}
?>
