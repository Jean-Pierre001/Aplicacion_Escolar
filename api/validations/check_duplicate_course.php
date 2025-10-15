<?php
include '../../includes/conn.php';

if (isset($_POST['name'])) {
    $name = trim($_POST['name']);
    $course_id = isset($_POST['course_id']) ? intval($_POST['course_id']) : 0;

    $sql = "SELECT COUNT(*) FROM courses WHERE LOWER(name) = LOWER(?)";
    $params = [$name];

    if ($course_id > 0) {
        $sql .= " AND course_id != ?";
        $params[] = $course_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    echo json_encode(['exists' => $stmt->fetchColumn() > 0]);
}
?>
