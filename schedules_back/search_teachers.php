<?php
include '../includes/conn.php';

$first = $_GET['first'] ?? '';
$last = $_GET['last'] ?? '';

try {
    $sql = "SELECT teacher_id, first_name, last_name 
            FROM teachers 
            WHERE 1";

    $params = [];
    if ($first !== '') {
        $sql .= " AND first_name LIKE ?";
        $params[] = "%$first%";
    }
    if ($last !== '') {
        $sql .= " AND last_name LIKE ?";
        $params[] = "%$last%";
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);

    echo json_encode($stmt->fetchAll());
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
