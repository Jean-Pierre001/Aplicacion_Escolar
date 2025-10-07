<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $first_name = trim($_POST['first_name']);
    $last_name  = trim($_POST['last_name']);
    $DNI        = !empty($_POST['DNI']) ? $_POST['DNI'] : null;
    $course_id  = $_POST['course_id'];
    $group_id   = !empty($_POST['group_id']) ? $_POST['group_id'] : null; // Nuevo campo

    try {
        $sql = "INSERT INTO students (first_name, last_name, DNI, course_id, group_id) 
                VALUES (:first_name, :last_name, :DNI, :course_id, :group_id)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ':first_name' => $first_name,
            ':last_name'  => $last_name,
            ':DNI'        => $DNI,
            ':course_id'  => $course_id,
            ':group_id'   => $group_id
        ]);

        header("Location: ../students.php"); // Redirige al listado
        exit;

    } catch (PDOException $e) {
        die("Error al agregar estudiante: " . $e->getMessage());
    }
} else {
    header("Location: ../students.php");
    exit;
}
