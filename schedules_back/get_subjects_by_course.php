<?php
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
if (!$course_id) {
    echo json_encode([]);
    exit;
}

try {
    // 🔹 Ahora la relación es muchos a muchos, así que consultamos usando subject_courses
    $stmt = $conn->prepare("
        SELECT s.subject_id, s.name
        FROM subjects s
        INNER JOIN subject_courses sc ON s.subject_id = sc.subject_id
        WHERE sc.course_id = ?
        ORDER BY s.name ASC
    ");
    $stmt->execute([$course_id]);

    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
