<?php
require '../vendor/autoload.php'; // PhpSpreadsheet
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

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

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', '#')
      ->setCellValue('B1', 'Alumno')
      ->setCellValue('C1', 'Estado')
      ->setCellValue('D1', 'Fecha')
      ->setCellValue('E1', 'Hora');

$row = 2;
foreach($records as $i=>$r){
    $sheet->setCellValue("A$row", $i+1)
          ->setCellValue("B$row", $r['first_name'].' '.$r['last_name'])
          ->setCellValue("C$row", $r['status'])
          ->setCellValue("D$row", $r['attendance_date'])
          ->setCellValue("E$row", $r['attendance_time']);
    $row++;
}

$writer = new Xlsx($spreadsheet);
$filename = "Reporte_Asistencia_$date.xlsx";
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment; filename=\"$filename\"");
$writer->save('php://output');
exit;
