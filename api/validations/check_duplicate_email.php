<?php
include '../../includes/conn.php';
header('Content-Type: application/json');

$email = trim($_POST['email'] ?? '');
$user_id = $_POST['user_id'] ?? null;

if(!$email){
    echo json_encode(['exists'=>false]);
    exit();
}

if($user_id){
    $stmt = $conn->prepare("SELECT COUNT(*) FROM users WHERE email=? AND user_id != ?");
    $stmt->execute([$email,$user_id]);
}else{
    $stmt = $conn->prepare("SELECT COUNT(*) FROM users WHERE email=?");
    $stmt->execute([$email]);
}

echo json_encode(['exists'=>$stmt->fetchColumn() > 0]);
