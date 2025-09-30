<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $first_name = $_POST['first_name'] ?? '';
    $last_name  = $_POST['last_name'] ?? '';
    $email      = $_POST['email'] ?? '';
    $password   = $_POST['password'] ?? '';
    $role       = $_POST['role'] ?? '';

    if ($first_name && $last_name && $email && $password && $role) {
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);

        try {
            $stmt = $conn->prepare("INSERT INTO users (first_name, last_name, email, password, role) VALUES (?, ?, ?, ?, ?)");
            $stmt->execute([$first_name, $last_name, $email, $hashed_password, $role]);
            header("Location: ../index_users.php");
            exit;
        } catch (PDOException $e) {
            echo "Error al agregar usuario: " . $e->getMessage();
        }
    }
}
?>
