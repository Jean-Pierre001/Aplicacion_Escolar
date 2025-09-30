<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    $user_id = $_GET['id'];

    try {
        $stmt = $conn->prepare("DELETE FROM users WHERE user_id=?");
        $stmt->execute([$user_id]);
        header("Location: ../index_users.php");
        exit;
    } catch (PDOException $e) {
        echo "Error al eliminar usuario: " . $e->getMessage();
    }
}
?>
