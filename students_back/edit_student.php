<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $student_id = $_POST['student_id'];
    $first_name = trim($_POST['first_name']);
    $last_name  = trim($_POST['last_name']);
    $DNI        = !empty($_POST['DNI']) ? $_POST['DNI'] : null;
    $course_id  = $_POST['course_id'];

    try {
        $sql = "UPDATE students SET first_name = :first_name, last_name = :last_name, DNI = :DNI, course_id = :course_id 
                WHERE student_id = :student_id";
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ':first_name' => $first_name,
            ':last_name'  => $last_name,
            ':DNI'        => $DNI,
            ':course_id'  => $course_id,
            ':student_id' => $student_id
        ]);

        header("Location: ../students.php");
        exit;

    } catch (PDOException $e) {
        die("Error al editar estudiante: " . $e->getMessage());
    }
} else {
    header("Location: ../students.php");
    exit;
}
