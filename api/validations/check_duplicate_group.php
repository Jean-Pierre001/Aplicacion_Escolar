<?php
include '../../includes/conn.php';

if (isset($_POST['name']) && isset($_POST['course_id'])) {
    $name = trim($_POST['name']);
    $course_id = intval($_POST['course_id']);
    $group_id = isset($_POST['group_id']) ? intval($_POST['group_id']) : 0;

    $sql = "SELECT COUNT(*) FROM groups WHERE LOWER(name) = LOWER(?) AND course_id = ?";
    $params = [$name, $course_id];

    if ($group_id > 0) {
        $sql .= " AND group_id != ?";
        $params[] = $group_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    echo json_encode(['exists' => $stmt->fetchColumn() > 0]);
}
?>
