<?php
include '../../includes/conn.php';

$name = trim($_GET['name'] ?? '');
$id = $_GET['id'] ?? null;

$response = ['exists' => false];

if ($name !== '') {
  $sql = "SELECT COUNT(*) FROM classrooms WHERE name = :name";
  if ($id) $sql .= " AND classroom_id != :id";

  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':name', $name);
  if ($id) $stmt->bindParam(':id', $id);
  $stmt->execute();

  if ($stmt->fetchColumn() > 0) {
    $response['exists'] = true;
  }
}

header('Content-Type: application/json');
echo json_encode($response);
?>
