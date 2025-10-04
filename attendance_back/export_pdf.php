<?php
require('../fpdf/fpdf.php');
include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    die("Faltan parámetros");
}

$stmt = $conn->prepare("
    SELECT s.first_name, s.last_name, 'Alumno' AS type, sa.status, sa.justification, sa.justification_file, sa.attendance_date, sa.attendance_time
    FROM student_attendance sa
    JOIN students s ON sa.student_id = s.student_id
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    WHERE sc.course_id=? AND sc.subject_id=? AND sa.attendance_date=?
    UNION
    SELECT t.first_name, t.last_name, 'Profesor' AS type, sa.status, sa.justification, sa.justification_file, sa.attendance_date, sa.attendance_time
    FROM student_attendance sa
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    JOIN teachers t ON sc.teacher_id = t.teacher_id
    WHERE sc.course_id=? AND sc.subject_id=? AND sa.attendance_date=?
");
$stmt->execute([$course_id,$subject_id,$date,$course_id,$subject_id,$date]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(0,10,"Reporte de Asistencia - $date",0,1,'C');
$pdf->Ln(5);

$pdf->SetFont('Arial','B',12);
$pdf->Cell(10,10,"#",1);
$pdf->Cell(60,10,"Nombre",1);
$pdf->Cell(25,10,"Tipo",1);
$pdf->Cell(25,10,"Estado",1);
$pdf->Cell(25,10,"Justificado",1);
$pdf->Cell(40,10,"Archivo",1);
$pdf->Cell(25,10,"Hora",1);
$pdf->Ln();

$pdf->SetFont('Arial','',12);
foreach($records as $i=>$r){
    $pdf->Cell(10,10,$i+1,1);
    $pdf->Cell(60,10,$r['first_name'].' '.$r['last_name'],1);
    $pdf->Cell(25,10,$r['type'],1);
    $pdf->Cell(25,10,$r['status'],1);
    $pdf->Cell(25,10,$r['justification'] ? 'Sí':'No',1);
    $pdf->Cell(40,10,$r['justification_file'] ?? '',1);
    $pdf->Cell(25,10,$r['attendance_time'],1);
    $pdf->Ln();
}

$pdf->Output("I", "Reporte_Asistencia_$date.pdf");
