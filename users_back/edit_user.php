<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id    = $_POST['user_id'] ?? '';
    $first_name = trim($_POST['first_name'] ?? '');
    $last_name  = trim($_POST['last_name'] ?? '');
    $email      = trim($_POST['email'] ?? '');
    $password   = $_POST['password'] ?? '';
    $role_id    = $_POST['role'] ?? '';

    if ($user_id && $first_name && $last_name && $email && $role_id) {
        try {
            if (!empty($password)) {
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $conn->prepare("UPDATE users SET first_name=?, last_name=?, email=?, password=?, role_id=? WHERE user_id=?");
                $stmt->execute([$first_name, $last_name, $email, $hashed_password, $role_id, $user_id]);
            } else {
                $stmt = $conn->prepare("UPDATE users SET first_name=?, last_name=?, email=?, role_id=? WHERE user_id=?");
                $stmt->execute([$first_name, $last_name, $email, $role_id, $user_id]);
            }
            header("Location: ../users.php");
            exit;
        } catch (PDOException $e) {
            echo "Error al editar usuario: " . $e->getMessage();
        }
    } else {
        echo "Todos los campos son obligatorios.";
    }
}
?>
