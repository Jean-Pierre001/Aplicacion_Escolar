<?php
// includes/conn.php
// Conexión a la Base de Datos con PDO

$host = "sql306.infinityfree.com";       
$dbname = "if0_40067456_sistema_escolar"; 
$username = "if0_40067456";        
$password = "CpBSUZhrZ2m";            

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("❌ Error de conexión: " . $e->getMessage());
}
?>