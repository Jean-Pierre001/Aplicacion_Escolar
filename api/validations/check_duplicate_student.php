<?php
include '../../includes/conn.php';
header('Content-Type: application/json');

try {
    if (isset($_POST['DNI']) && !empty($_POST['DNI'])) {
        $DNI = trim($_POST['DNI']);
        $student_id = isset($_POST['student_id']) ? intval($_POST['student_id']) : 0;

        $sql = "SELECT COUNT(*) FROM students WHERE DNI = ?";
        $params = [$DNI];

        if ($student_id > 0) {
            $sql .= " AND student_id != ?";
            $params[] = $student_id;
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
