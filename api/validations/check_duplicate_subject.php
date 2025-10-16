<?php
include '../../includes/conn.php';

if (isset($_POST['name']) && isset($_POST['course_ids'])) {
    $name = trim($_POST['name']);
    $course_ids = json_decode($_POST['course_ids'], true);
    $subject_id = isset($_POST['subject_id']) ? intval($_POST['subject_id']) : 0;

    $placeholders = implode(',', array_fill(0, count($course_ids), '?'));
    $params = array_merge([strtolower($name)], $course_ids);

    $sql = "SELECT COUNT(*) FROM subjects 
            WHERE LOWER(name) = ? 
            AND course_id IN ($placeholders)";

    if ($subject_id > 0) {
        $sql .= " AND subject_id != ?";
        $params[] = $subject_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    echo json_encode(['exists' => $stmt->fetchColumn() > 0]);
}
?>
