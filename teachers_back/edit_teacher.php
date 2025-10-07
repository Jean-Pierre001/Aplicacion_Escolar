<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $teacher_id = $_POST['teacher_id'] ?? null;
    $first_name = trim($_POST['first_name'] ?? '');
    $last_name  = trim($_POST['last_name'] ?? '');
    $user_id    = $_POST['user_id'] ?? null;

    // Si user_id está vacío, lo convertimos a NULL
    if ($user_id === '') {
        $user_id = null;
    }

    try {
        $sql = "UPDATE teachers SET first_name = :first_name, last_name = :last_name, user_id = :user_id WHERE teacher_id = :teacher_id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':first_name', $first_name);
        $stmt->bindParam(':last_name', $last_name);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->bindParam(':teacher_id', $teacher_id, PDO::PARAM_INT);
        $stmt->execute();

        header('Location: ../teachers.php?success=2');
        exit();
    } catch (PDOException $e) {
        echo "Error al editar docente: " . $e->getMessage();
    }
} else {
    header('Location: ../teachers.php');
    exit();
}
