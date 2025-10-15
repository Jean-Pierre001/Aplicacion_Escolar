<?php
require 'vendor/autoload.php';
include 'includes/conn.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Font;

$weekday = $_GET['weekday'] ?? null;

if (!$weekday) {
    die("❌ Falta el día seleccionado.");
}

try {
    // Nombre del día
    $dias = [
        'monday' => 'LUNES',
        'tuesday' => 'MARTES',
        'wednesday' => 'MIÉRCOLES',
        'thursday' => 'JUEVES',
        'friday' => 'VIERNES',
        'saturday' => 'SÁBADO'
    ];
    $nombreDia = $dias[$weekday] ?? strtoupper($weekday);

    // Traer aulas
    $stmt = $conn->prepare("SELECT classroom_id, name FROM classrooms ORDER BY name ASC");
    $stmt->execute();
    $classrooms = $stmt->fetchAll();
    if (empty($classrooms)) die("No hay aulas registradas.");

    // Traer horarios tarde
    $sql = "SELECT s.schedule_id, s.start_time, s.end_time,
                   c.name AS course_name, g.name AS group_name,
                   sub.name AS subject_name,
                   t.first_name, t.last_name,
                   cl.name AS classroom_name
            FROM schedules s
            LEFT JOIN courses c ON s.course_id = c.course_id
            LEFT JOIN groups g ON s.group_id = g.group_id
            JOIN subjects sub ON sub.subject_id = s.subject_id
            LEFT JOIN teachers t ON s.teacher_id = t.teacher_id
            LEFT JOIN classrooms cl ON s.classroom_id = cl.classroom_id
            WHERE s.weekday = :weekday AND s.start_time >= '12:00:00'
            ORDER BY s.start_time, cl.name";

    $stmt = $conn->prepare($sql);
    $stmt->execute([':weekday' => $weekday]);
    $horarios = $stmt->fetchAll();

    // Crear Excel
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    $ultimaCol = chr(65 + count($classrooms));

    // --------------------
    // Encabezados principales
    // --------------------
    $sheet->mergeCells("A1:{$ultimaCol}1");
    $sheet->setCellValue("A1", "TALLER 2025 – DISTRIBUCIÓN DE ESPACIOS POR DÍA");
    $sheet->getStyle("A1")->getFont()->setBold(true)->setSize(16)->getColor()->setRGB("FFFFFF");
    $sheet->getStyle("A1")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("A1")->getFill()->setFillType(Fill::FILL_SOLID)
          ->getStartColor()->setRGB("1F4E78");

    $sheet->mergeCells("A2:{$ultimaCol}2");
    $sheet->setCellValue("A2", $nombreDia);
    $sheet->getStyle("A2")->getFont()->setBold(true)->setSize(14);
    $sheet->getStyle("A2")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("A2")->getFill()->setFillType(Fill::FILL_SOLID)
          ->getStartColor()->setRGB("305496");

    $sheet->mergeCells("A3:{$ultimaCol}3");
    $sheet->setCellValue("A3", "SEDE OLIVERA");
    $sheet->getStyle("A3")->getFont()->setBold(true)->setSize(12);
    $sheet->getStyle("A3")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("A3")->getFill()->setFillType(Fill::FILL_SOLID)
          ->getStartColor()->setRGB("B4C6E7");

    // --------------------
    // Fila HORARIOS encabezado inicial
    // --------------------
    $sheet->setCellValue("A5", "HORARIOS");
    $sheet->getStyle("A5")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
    $sheet->getStyle("A5")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("A5")->getFill()->setFillType(Fill::FILL_SOLID)
          ->getStartColor()->setRGB("305496");
    $sheet->getRowDimension(5)->setRowHeight(30);

    // Fila nombres de aulas (col B en adelante)
    $col = "B";
    foreach ($classrooms as $aula) {
        $sheet->setCellValue($col . "5", strtoupper($aula['name']));
        $sheet->getStyle($col . "5")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
        $sheet->getStyle($col . "5")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->getStyle($col . "5")->getFill()->setFillType(Fill::FILL_SOLID)
              ->getStartColor()->setRGB("305496");
        $col++;
    }

    // --------------------
    // Bloques horarios + recreo + encabezado repetido + fila Curso/Grupo
    // --------------------
    $bloques = [
        "13:20 - 15:20",
        "RECREO",
        "15:30 - 17:30"
    ];

    $fila = 6; // fila inicial
    $contadorBloque = 1;
    foreach ($bloques as $bloque) {
        if ($bloque === "RECREO") {
            // Recreo ocupa todas las columnas
            $sheet->mergeCells("A{$fila}:{$ultimaCol}{$fila}");
            $sheet->setCellValue("A{$fila}", $bloque);
            $sheet->getStyle("A{$fila}")->getFont()->setBold(true);
            $sheet->getStyle("A{$fila}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER)
                  ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("A{$fila}")->getFill()->setFillType(Fill::FILL_SOLID)
                  ->getStartColor()->setRGB("FFFFFF");
            $sheet->getRowDimension($fila)->setRowHeight(30);

            $fila++;

            // Volver a poner HORARIOS y aulas debajo del recreo
            $sheet->setCellValue("A{$fila}", "HORARIOS");
            $sheet->getStyle("A{$fila}")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
            $sheet->getStyle("A{$fila}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            $sheet->getStyle("A{$fila}")->getFill()->setFillType(Fill::FILL_SOLID)
                  ->getStartColor()->setRGB("305496");
            $sheet->getRowDimension($fila)->setRowHeight(30);

            $col = "B";
            foreach ($classrooms as $aula) {
                $sheet->setCellValue($col . $fila, strtoupper($aula['name']));
                $sheet->getStyle($col . $fila)->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
                $sheet->getStyle($col . $fila)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle($col . $fila)->getFill()->setFillType(Fill::FILL_SOLID)
                      ->getStartColor()->setRGB("305496");
                $col++;
            }

            $fila++;
        } else {
            // Fila Curso/Grupo
            $sheet->setCellValue("A{$fila}", "Curso/Grupo");
            $sheet->getStyle("A{$fila}")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
            $sheet->getStyle("A{$fila}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER)
                  ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("A{$fila}")->getFill()->setFillType(Fill::FILL_SOLID)
                  ->getStartColor()->setRGB("305496");
            $sheet->getRowDimension($fila)->setRowHeight(30);

            $col = "B";
            foreach ($classrooms as $aula) {
                $cursoGrupo = "";
                foreach ($horarios as $h) {
                    $rango = substr($h['start_time'],0,5)." - ".substr($h['end_time'],0,5);
                    if ($rango == $bloque && $h['classroom_name'] == $aula['name']) {
                        $cursoGrupo = trim($h['course_name']." ".($h['group_name'] ?? ""));
                    }
                }
                $sheet->setCellValue($col.$fila, $cursoGrupo);
                $sheet->getStyle($col.$fila)->getAlignment()->setWrapText(true)
                      ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                      ->setVertical(Alignment::VERTICAL_CENTER);
                $sheet->getStyle($col.$fila)->getFont()->setSize(11);
                $col++;
            }

            $fila++;

            // Fila según bloque con descripción de horario
            $textoBloque = "{$bloques[0]}";
            if ($contadorBloque === 2) {
                $textoBloque = "{$bloques[2]}";
            }
            $sheet->setCellValue("A{$fila}", $textoBloque);
            $sheet->getStyle("A{$fila}")->getFont()->setBold(true)->getColor()->setRGB("FFFFFF");
            $sheet->getStyle("A{$fila}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER)
                  ->setVertical(Alignment::VERTICAL_CENTER);
            $sheet->getStyle("A{$fila}")->getFill()->setFillType(Fill::FILL_SOLID)
                  ->getStartColor()->setRGB("305496");
            $sheet->getRowDimension($fila)->setRowHeight(70);

            $col = "B";
            foreach ($classrooms as $aula) {
                $contenido = "";
                foreach ($horarios as $h) {
                    $rango = substr($h['start_time'],0,5)." - ".substr($h['end_time'],0,5);
                    if ($rango == $bloque && $h['classroom_name'] == $aula['name']) {
                        $materia = $h['subject_name'] ?? "";
                        $profesor = trim($h['first_name']." ".$h['last_name']);
                        $contenido .= "{$materia}\n{$profesor}";
                    }
                }
                $sheet->setCellValue($col.$fila, $contenido);
                $sheet->getStyle($col.$fila)->getAlignment()->setWrapText(true)
                      ->setHorizontal(Alignment::HORIZONTAL_CENTER)
                      ->setVertical(Alignment::VERTICAL_CENTER);
                $sheet->getStyle($col.$fila)->getFont()->setSize(11);
                $col++;
            }

            $fila++;
            $contadorBloque++;
        }
    }

    // Ajustar ancho de columnas
    foreach (range('A', $ultimaCol) as $col) {
        $sheet->getColumnDimension($col)->setWidth(25);
    }

    // Bordes
    $sheet->getStyle("A5:{$ultimaCol}".($fila-1))
          ->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

    // Descargar Excel
    $filename = "Distribucion_{$nombreDia}.xlsx";
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header("Content-Disposition: attachment; filename=\"$filename\"");
    $writer = new Xlsx($spreadsheet);
    $writer->save("php://output");
    exit;

} catch (PDOException $e) {
    echo "Error: ".$e->getMessage();
}
?>
