<?php
require 'vendor/autoload.php';
include 'includes/conn.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;

$day = $_GET['day'] ?? null;
if (!$day) die("Falta el día");

$weekdays_es = [
    'monday'    => 'Lunes',
    'tuesday'   => 'Martes',
    'wednesday' => 'Miércoles',
    'thursday'  => 'Jueves',
    'friday'    => 'Viernes'
];

try {
    // Traer todos los cursos
    $courses = $conn->query("SELECT course_id, name FROM courses ORDER BY name")->fetchAll(PDO::FETCH_ASSOC);

    // Traer todos los horarios del día
    $stmt = $conn->prepare("
        SELECT sch.course_id, sch.start_time, sch.end_time,
               sub.name AS subject_name,
               t.first_name, t.last_name
        FROM schedules sch
        LEFT JOIN subjects sub ON sch.subject_id = sub.subject_id
        LEFT JOIN teachers t ON sch.teacher_id = t.teacher_id
        WHERE sch.weekday = :day
        ORDER BY sch.start_time, sch.course_id
    ");
    $stmt->execute(['day' => $day]);
    $schedules = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();
    $sheet->setTitle($weekdays_es[$day]);

    // Encabezado principal
    $sheet->mergeCells("A1:" . chr(65+count($courses)) . "1");
    $sheet->setCellValue("A1", "TALLER 2025 DISTRIBUCIÓN DE ESPACIOS POR DÍA");
    $sheet->getStyle("A1")->getFont()->setBold(true)->setSize(16)->getColor()->setRGB("FFFFFF");
    $sheet->getStyle("A1")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER)
          ->setVertical(Alignment::VERTICAL_CENTER);
    $sheet->getStyle("A1")->getFill()->setFillType(Fill::FILL_SOLID)
          ->getStartColor()->setRGB("1F4E78");

    // Horario columna A
    $sheet->setCellValue("A2", "Horario");
    $sheet->getStyle("A2")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
    $sheet->getStyle("A2")->getFill()->setFillType(Fill::FILL_SOLID)
          ->getStartColor()->setRGB("305496");
    $sheet->getColumnDimension('A')->setWidth(15);

    // Columnas cursos
    $colIndex = 66; // B
    foreach ($courses as $course) {
        $col = chr($colIndex);
        $sheet->setCellValue($col . "2", $course['name']);
        $sheet->getStyle($col . "2")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
        $sheet->getStyle($col . "2")->getFill()->setFillType(Fill::FILL_SOLID)
              ->getStartColor()->setRGB("305496");
        $sheet->getStyle($col . "2")->getAlignment()
              ->setHorizontal(Alignment::HORIZONTAL_CENTER)
              ->setVertical(Alignment::VERTICAL_CENTER)
              ->setWrapText(true);
        $sheet->getColumnDimension($col)->setWidth(40);
        $colIndex++;
    }

    // Horas únicas del día
    $uniqueTimes = [];
    foreach ($schedules as $sch) {
        $time = substr($sch['start_time'],0,5) . " - " . substr($sch['end_time'],0,5);
        $uniqueTimes[$time] = $time;
    }

    $row = 3;
    foreach ($uniqueTimes as $hora) {
        $sheet->setCellValue("A$row", $hora);
        $sheet->getStyle("A$row")->getFont()->setBold(true);
        $sheet->getStyle("A$row")->getFill()->setFillType(Fill::FILL_SOLID)
              ->getStartColor()->setRGB("D9E1F2");
        $sheet->getStyle("A$row")->getAlignment()
              ->setHorizontal(Alignment::HORIZONTAL_CENTER)
              ->setVertical(Alignment::VERTICAL_CENTER);

        // Colocar clases por curso
        $colIndex = 66; // B
        foreach ($courses as $course) {
            $col = chr($colIndex);
            $cellContent = '';
            foreach ($schedules as $sch) {
                $time = substr($sch['start_time'],0,5) . " - " . substr($sch['end_time'],0,5);
                if ($sch['course_id']==$course['course_id'] && $time==$hora) {
                    $cellContent = $sch['subject_name'] . "\n" . $sch['last_name'] . " " . $sch['first_name'];
                }
            }
            $sheet->setCellValue($col . $row, $cellContent);
            $sheet->getStyle($col . $row)->getAlignment()
                  ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                  ->setVertical(Alignment::VERTICAL_CENTER)
                  ->setWrapText(true);
            $sheet->getStyle($col . $row)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
            $colIndex++;
        }

        // Alternar color filas
        $fillColor = $row % 2 == 0 ? "FFFFFF" : "EAF1FB";
        $sheet->getStyle("A$row:" . chr(65+count($courses)-1) . "$row")
              ->getFill()->setFillType(Fill::FILL_SOLID)
              ->getStartColor()->setRGB($fillColor);

        $row++;
    }

    $filename = "Distribucion_Espacios_" . $weekdays_es[$day] . ".xlsx";
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header("Content-Disposition: attachment; filename=\"$filename\"");
    $writer = new Xlsx($spreadsheet);
    $writer->save("php://output");
    exit;

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
