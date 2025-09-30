<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id    = $_POST['user_id'] ?? '';
    $first_name = $_POST['first_name'] ?? '';
    $last_name  = $_POST['last_name'] ?? '';
    $email      = $_POST['email'] ?? '';
    $password   = $_POST['password'] ?? '';
    $role       = $_POST['role'] ?? '';

    if ($user_id && $first_name && $last_name && $email && $role) {
        try {
            if (!empty($password)) {
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $conn->prepare("UPDATE users SET first_name=?, last_name=?, email=?, password=?, role=? WHERE user_id=?");
                $stmt->execute([$first_name, $last_name, $email, $hashed_password, $role, $user_id]);
            } else {
                $stmt = $conn->prepare("UPDATE users SET first_name=?, last_name=?, email=?, role=? WHERE user_id=?");
                $stmt->execute([$first_name, $last_name, $email, $role, $user_id]);
            }
            header("Location: ../index_users.php");
            exit;
        } catch (PDOException $e) {
            echo "Error al editar usuario: " . $e->getMessage();
        }
    }
}
?>
