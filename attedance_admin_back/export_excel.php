<?php
require '../vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include '../includes/conn.php';

$course_id = $_GET['course_id'] ?? null;
$subject_id = $_GET['subject_id'] ?? null;
$date = $_GET['date'] ?? null;

if (!$course_id || !$subject_id || !$date) {
    die("Faltan parámetros");
}

$stmt = $conn->prepare("
    SELECT s.first_name, s.last_name, 'Alumno' AS type, sa.status, sa.justification, sa.justification_file, sa.attendance_date
    FROM student_attendance sa
    JOIN students s ON sa.student_id = s.student_id
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    WHERE sc.course_id=? AND sc.subject_id=? AND sa.attendance_date=?
    UNION
    SELECT t.first_name, t.last_name, 'Profesor' AS type, sa.status, sa.justification, sa.justification_file, sa.attendance_date
    FROM student_attendance sa
    JOIN schedules sc ON sa.schedule_id = sc.schedule_id
    JOIN teachers t ON sc.teacher_id = t.teacher_id
    WHERE sc.course_id=? AND sc.subject_id=? AND sa.attendance_date=?
");
$stmt->execute([$course_id,$subject_id,$date,$course_id,$subject_id,$date]);
$records = $stmt->fetchAll(PDO::FETCH_ASSOC);

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', '#')
      ->setCellValue('B1', 'Nombre')
      ->setCellValue('C1', 'Tipo')
      ->setCellValue('D1', 'Estado')
      ->setCellValue('E1', 'Justificado')
      ->setCellValue('F1', 'Archivo')
      ->setCellValue('G1', 'Fecha')
      ->setCellValue('H1', 'Hora');

$row = 2;
foreach($records as $i=>$r){
    $sheet->setCellValue("A$row", $i+1)
          ->setCellValue("B$row", $r['first_name'].' '.$r['last_name'])
          ->setCellValue("C$row", $r['type'])
          ->setCellValue("D$row", $r['status'])
          ->setCellValue("E$row", $r['justification'] ? 'Sí':'No')
          ->setCellValue("F$row", $r['justification_file'] ?? '')
          ->setCellValue("G$row", $r['attendance_date']);
    $row++;
}

$writer = new Xlsx($spreadsheet);
$filename = "Reporte_Asistencia_$date.xlsx";
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment; filename=\"$filename\"");
$writer->save('php://output');
exit;
