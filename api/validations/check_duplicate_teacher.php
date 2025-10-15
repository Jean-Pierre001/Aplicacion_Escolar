<?php
include '../../includes/conn.php';

if (isset($_POST['first_name']) && isset($_POST['last_name'])) {
    $first = trim($_POST['first_name']);
    $last = trim($_POST['last_name']);
    $teacher_id = isset($_POST['teacher_id']) ? intval($_POST['teacher_id']) : 0;

    $sql = "SELECT COUNT(*) FROM teachers WHERE LOWER(first_name) = LOWER(?) AND LOWER(last_name) = LOWER(?)";
    $params = [$first, $last];

    if ($teacher_id > 0) {
        $sql .= " AND teacher_id != ?";
        $params[] = $teacher_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    $exists = $stmt->fetchColumn() > 0;

    echo json_encode(['exists' => $exists]);
}
?>
