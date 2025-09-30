<?php
require('../fpdf/fpdf.php');
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    die("Faltan parámetros");
}

$stmt = $conn->prepare("SELECT s.first_name, s.last_name, a.status, a.attendance_date, a.attendance_time
                        FROM attendance a
                        JOIN students s ON a.student_id = s.student_id
                        WHERE a.course_id=? AND a.subject_id=? AND a.attendance_date=?");
$stmt->execute([$course_id, $subject_id, $date]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(0,10,"Reporte de Asistencia - $date",0,1,'C');
$pdf->Ln(5);

$pdf->SetFont('Arial','B',12);
$pdf->Cell(10,10,"#",1);
$pdf->Cell(60,10,"Alumno",1);
$pdf->Cell(30,10,"Estado",1);
$pdf->Cell(40,10,"Fecha",1);
$pdf->Cell(30,10,"Hora",1);
$pdf->Ln();

$pdf->SetFont('Arial','',12);
foreach($records as $i=>$r){
    $pdf->Cell(10,10,$i+1,1);
    $pdf->Cell(60,10,$r['first_name'].' '.$r['last_name'],1);
    $pdf->Cell(30,10,$r['status'],1);
    $pdf->Cell(40,10,$r['attendance_date'],1);
    $pdf->Cell(30,10,$r['attendance_time'],1);
    $pdf->Ln();
}

$pdf->Output("I", "Reporte_Asistencia_$date.pdf");
