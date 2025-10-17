<?php
include '../../includes/conn.php';

if (isset($_POST['name']) && isset($_POST['course_ids'])) {
    $name = trim($_POST['name']);
    $course_ids = json_decode($_POST['course_ids'], true); // sigue siendo array
    $subject_id = isset($_POST['subject_id']) ? intval($_POST['subject_id']) : 0;

    if(empty($course_ids)){
        echo json_encode(['exists' => false]);
        exit;
    }

    $course_id = $course_ids[0]; // ahora solo tomamos un curso

    $sql = "SELECT COUNT(*) FROM subjects 
            WHERE LOWER(name) = ? 
            AND course_id = ?";

    $params = [strtolower($name), $course_id];

    if ($subject_id > 0) {
        $sql .= " AND subject_id != ?";
        $params[] = $subject_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);

    echo json_encode(['exists' => $stmt->fetchColumn() > 0]);
}
?>
