<?php
include '../../includes/conn.php';
header('Content-Type: application/json');

try {
    if (isset($_POST['name']) && isset($_POST['course_id'])) {
        $name = trim($_POST['name']);
        $course_id = intval($_POST['course_id']);
        $subject_id = isset($_POST['subject_id']) ? intval($_POST['subject_id']) : 0;

        $sql = "SELECT COUNT(*) FROM subjects WHERE LOWER(name) = LOWER(?) AND course_id = ?";
        $params = [$name, $course_id];

        if ($subject_id > 0) {
            $sql .= " AND subject_id != ?";
            $params[] = $subject_id;
        }

        $stmt = $conn->prepare($sql);
        $stmt->execute($params);
        $exists = $stmt->fetchColumn() > 0;

        echo json_encode(['exists' => $exists]);
    } else {
        echo json_encode(['exists' => false]);
    }
} catch (Exception $e) {
    echo json_encode(['exists' => false, 'error' => $e->getMessage()]);
}
