<?php
include '../../includes/conn.php';

if (isset($_POST['name']) && isset($_POST['course_ids'])) {
    $name = trim($_POST['name']);
    $course_ids = json_decode($_POST['course_ids'], true);
    $subject_id = isset($_POST['subject_id']) ? intval($_POST['subject_id']) : 0;

    if (empty($course_ids)) {
        echo json_encode(['exists' => false]);
        exit;
    }

    // Verificar si existe una materia con el mismo nombre en alguno de los cursos seleccionados
    $placeholders = implode(',', array_fill(0, count($course_ids), '?'));

    $sql = "
        SELECT COUNT(*) 
        FROM subjects s
        JOIN subject_courses sc ON s.subject_id = sc.subject_id
        WHERE LOWER(s.name) = ?
        AND sc.course_id IN ($placeholders)
    ";

    $params = [strtolower($name)];
    $params = array_merge($params, $course_ids);

    if ($subject_id > 0) {
        $sql .= " AND s.subject_id != ?";
        $params[] = $subject_id;
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);

    echo json_encode(['exists' => $stmt->fetchColumn() > 0]);
}
?>
