<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $first_name = $_POST['first_name'] ?? '';
    $last_name = $_POST['last_name'] ?? '';
    $user_id = $_POST['user_id'] ?? '';

    if ($first_name && $last_name && $user_id) {
        $stmt = $conn->prepare("INSERT INTO teachers (first_name, last_name, user_id) VALUES (:first_name, :last_name, :user_id)");
        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name', $last_name);
        $stmt->bindParam(':user_id', $user_id);

        if ($stmt->execute()) {
            header('Location: ../teachers.php');
            exit;
        } else {
            echo "Error al agregar docente.";
        }
    } else {
        echo "Todos los campos son obligatorios.";
    }
}
?>
