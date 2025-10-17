<?php
include '../../includes/conn.php';

if (isset($_POST['cupof'])) {
    $cupof = trim($_POST['cupof']);
    $subject_id = isset($_POST['subject_id']) ? intval($_POST['subject_id']) : 0;

    $sql = "SELECT COUNT(*) FROM subjects WHERE CUPOF = ?";
    $params = [$cupof];

    if ($subject_id > 0) {
        $sql .= " AND subject_id != ?";
        $params[] = $subject_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    echo json_encode(['exists' => $stmt->fetchColumn() > 0]);
}
?>
