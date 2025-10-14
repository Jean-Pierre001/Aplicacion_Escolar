<?php
include '../includes/conn.php';

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $classroom_id = intval($_GET['id']);

    try {
        // Buscar todos los schedule_id asociados al aula
        $stmt = $conn->prepare("SELECT schedule_id FROM schedules WHERE classroom_id = :id");
        $stmt->bindParam(':id', $classroom_id);
        $stmt->execute();
        $schedules = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if (!empty($schedules)) {
            // Crear lista de IDs para usar en IN (...)
            $in = str_repeat('?,', count($schedules) - 1) . '?';

            // 1️⃣ Eliminar asistencias de profesores
            $stmt = $conn->prepare("DELETE FROM teacher_attendance WHERE schedule_id IN ($in)");
            $stmt->execute($schedules);

            // 2️⃣ Eliminar asistencias de estudiantes
            $stmt = $conn->prepare("DELETE FROM student_attendance WHERE schedule_id IN ($in)");
            $stmt->execute($schedules);

            // 3️⃣ Eliminar los horarios
            $stmt = $conn->prepare("DELETE FROM schedules WHERE classroom_id = :id");
            $stmt->bindParam(':id', $classroom_id);
            $stmt->execute();
        }

        // 4️⃣ Finalmente eliminar el aula
        $stmt = $conn->prepare("DELETE FROM classrooms WHERE classroom_id = :id");
        $stmt->bindParam(':id', $classroom_id);
        $stmt->execute();

        header("Location: ../classrooms.php?success=delete");
        exit;
    } catch (PDOException $e) {
        die("❌ Error al eliminar el aula: " . $e->getMessage());
    }
} else {
    header("Location: ../classrooms.php");
    exit;
}
?>
