<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $first_name = trim($_POST['first_name'] ?? '');
    $last_name  = trim($_POST['last_name'] ?? '');
    $user_id    = $_POST['user_id'] ?? null;

    // Si user_id está vacío, lo convertimos a NULL
    if ($user_id === '') {
        $user_id = null;
    }

    try {
        $sql = "INSERT INTO teachers (first_name, last_name, user_id) VALUES (:first_name, :last_name, :user_id)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name', $last_name);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->execute();

        header('Location: ../teachers.php?success=1');
        exit();
    } catch (PDOException $e) {
        echo "Error al agregar docente: " . $e->getMessage();
    }
} else {
    header('Location: ../teachers.php');
    exit();
}
