<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['subject_ids']) && is_array($_POST['subject_ids'])) {
    $subject_ids = array_map('intval', $_POST['subject_ids']);

    if(count($subject_ids) === 0) {
        die('No se seleccionaron materias.');
    }

    try {
        $placeholders = implode(',', array_fill(0, count($subject_ids), '?'));
        $sql = "UPDATE subjects 
                SET turno = CASE 
                              WHEN turno = 'mañana' THEN 'tarde'
                              WHEN turno = 'tarde' THEN 'mañana'
                              ELSE turno
                            END
                WHERE subject_id IN ($placeholders)";
        $stmt = $conn->prepare($sql);
        $stmt->execute($subject_ids);

        header('Location: ../subjects.php');
        exit;
    } catch(PDOException $e) {
        die("Error al cambiar turno: " . $e->getMessage());
    }
} else {
    die('Solicitud inválida.');
}
?>
