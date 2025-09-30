<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $teacher_id = $_POST['teacher_id'] ?? '';
    $first_name = $_POST['first_name'] ?? '';
    $last_name = $_POST['last_name'] ?? '';
    $user_id = $_POST['user_id'] ?? '';

    if ($teacher_id && $first_name && $last_name && $user_id) {
        $stmt = $conn->prepare("UPDATE teachers SET first_name = :first_name, last_name = :last_name, user_id = :user_id WHERE teacher_id = :teacher_id");
        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name', $last_name);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':teacher_id', $teacher_id);

        if ($stmt->execute()) {
            header('Location: ../index_teachers.php');
            exit;
        } else {
            echo "Error al actualizar docente.";
        }
    } else {
        echo "Todos los campos son obligatorios.";
    }
}
?>
