<?php
include '../../includes/conn.php';

if(isset($_POST['name'])){
    $name = trim($_POST['name']);
    $role_id = isset($_POST['role_id']) ? intval($_POST['role_id']) : 0;

    $sql = "SELECT COUNT(*) FROM roles WHERE LOWER(TRIM(name)) = LOWER(TRIM(?))";
    $params = [$name];

    if($role_id > 0){
        $sql .= " AND role_id != ?";
        $params[] = $role_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    $exists = $stmt->fetchColumn() > 0;

    echo json_encode(['exists' => $exists]);
}
?>
