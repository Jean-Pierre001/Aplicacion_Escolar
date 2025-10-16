<?php
require 'vendor/autoload.php'; 
include 'includes/conn.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;

$course_id = $_GET['course_id'] ?? null;

if (!$course_id) {
    die("Falta el ID del curso");
}

try {
    // Obtener nombre del curso
    $stmt = $conn->prepare("SELECT name FROM courses WHERE course_id = :id");
    $stmt->execute([':id' => $course_id]);
    $course = $stmt->fetchColumn();

    if (!$course) {
        die("Curso no encontrado");
    }

    // Traer horarios de ese curso
    $sql = "SELECT sch.schedule_id, sub.name AS subject_name, 
                   t.first_name, t.last_name,
                   sch.weekday, sch.start_time, sch.end_time
            FROM schedules sch
            LEFT JOIN subjects sub ON sch.subject_id = sub.subject_id
            LEFT JOIN teachers t ON sch.teacher_id = t.teacher_id
            WHERE sch.course_id = :course_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute([':course_id' => $course_id]);
    $schedules = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Crear Excel
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    // Encabezado principal
    $sheet->mergeCells("A1:F1");
    $sheet->setCellValue("A1", "Horario - $course");
    $sheet->getStyle("A1")->getFont()->setBold(true)->setSize(16)->getColor()->setRGB("FFFFFF");
    $sheet->getStyle("A1")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("A1")->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB("1F4E78");

    // Encabezados de días (sin sábado)
    $dias = ["Hora", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes"];
    $col = "A";
    foreach ($dias as $dia) {
        $sheet->setCellValue($col . "2", $dia);
        $sheet->getStyle($col . "2")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
        $sheet->getStyle($col . "2")->getAlignment()
              ->setHorizontal(Alignment::HORIZONTAL_CENTER)
              ->setVertical(Alignment::VERTICAL_CENTER);
        $sheet->getStyle($col . "2")->getFill()
              ->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB("305496");
        $col++;
    }

    // Bloques fijos con separación de turnos
    $bloques = [
        "TURNO MAÑANA" => ["07:30 - 09:30", "09:40 - 11:40"],
        "TURNO TARDE"  => ["13:20 - 15:20", "15:30 - 17:30"]
    ];

    $row = 3;
    foreach ($bloques as $turno => $horas) {
        // Fila separadora de turno
        $sheet->mergeCells("A{$row}:F{$row}");
        $sheet->setCellValue("A{$row}", $turno);
        $sheet->getStyle("A{$row}")->getFont()->setBold(true)->setSize(13);
        $sheet->getStyle("A{$row}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->getStyle("A{$row}")->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB("B4C6E7");
        $row++;

        // Filas de cada horario
        foreach ($horas as $hora) {
            $sheet->setCellValue("A{$row}", $hora);
            $sheet->getStyle("A{$row}")->getFont()->setBold(true);
            $sheet->getStyle("A{$row}")->getAlignment()
                  ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                  ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("A{$row}")->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB("D9E1F2");

            // Buscar todas las clases en ese horario
            foreach ($schedules as $sch) {
                $rango = substr($sch['start_time'], 0, 5) . " - " . substr($sch['end_time'], 0, 5);
                if ($rango == $hora) {
                    $colIndex = [
                        'monday'    => "B",
                        'tuesday'   => "C",
                        'wednesday' => "D",
                        'thursday'  => "E",
                        'friday'    => "F"
                    ];
                    $col = $colIndex[$sch['weekday']] ?? null;
                    if ($col) {
                        $contenido = $sch['subject_name'] . "\n" . $sch['first_name'] . " " . $sch['last_name'];
                        $celdaActual = $sheet->getCell($col . $row)->getValue();
                        if ($celdaActual) {
                            $contenido = $celdaActual . "\n" . $contenido; // Acumular varias materias en la misma celda
                        }
                        $sheet->setCellValue($col . $row, $contenido);
                        $sheet->getStyle($col . $row)->getFont()->setBold(true);
                        $sheet->getStyle($col . $row)->getAlignment()->setWrapText(true);
                        $sheet->getStyle($col . $row)->getAlignment()
                              ->setVertical(Alignment::VERTICAL_CENTER)
                              ->setHorizontal(Alignment::HORIZONTAL_CENTER);
                    }
                }
            }
            $row++;
        }
    }

    // Ajustar tamaños iguales
    $sheet->getColumnDimension('A')->setWidth(15); // horas
    foreach (range('B', 'F') as $col) {
        $sheet->getColumnDimension($col)->setWidth(25);
    }
    for ($i = 2; $i < $row; $i++) {
        $sheet->getRowDimension($i)->setRowHeight(60);
    }

    // Bordes
    $sheet->getStyle("A2:F" . ($row - 1))
        ->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

    // Descargar archivo
    $filename = "Horario_{$course}.xlsx";
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header("Content-Disposition: attachment; filename=\"$filename\"");
    $writer = new Xlsx($spreadsheet);
    $writer->save("php://output");
    exit;

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
