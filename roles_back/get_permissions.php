<?php
include '../includes/conn.php';

$role_id = $_GET['role_id'] ?? null;
if (!$role_id) {
    echo json_encode([]);
    exit();
}

try {
    $stmt = $conn->prepare("SELECT page, action FROM role_permissions WHERE role_id = :role_id");
    $stmt->execute([':role_id' => $role_id]);
    $permissions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($permissions);
} catch (PDOException $e) {
    echo json_encode([]);
}
?>
