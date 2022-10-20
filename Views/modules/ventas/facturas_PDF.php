<?php
require('../../../fpdf/fpdf.php');



if (isset($_REQUEST['mesa'])) {    
	 	$mesa = $_REQUEST['mesa'];
	 	$titulo = 'Factura: '.$_REQUEST['mesa']; 
	 	//echo $mesa;
}


class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('../../../assets/img/logo.png',10,8,50);
     // Movernos a la derecha
    //
    $this->Cell(80);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    
 
    date_default_timezone_set ('America/Caracas');

     // fecha
        $week_days = array ("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado");  
        $months = array ("", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");  
        $year_now = date ("Y");  
        $month_now = date ("n");  
        $day_now = date ("j");  
        $week_day_now = date ("w");  
        $date = $week_days[$week_day_now] . ", " . $day_now . " de " . $months[$month_now] . " de " . $year_now;   
        
        //hora
        $am_pm = date("a");
        $hora = date("h");
        $minuto = date("i");
        $horacom = $hora.":".$minuto." ".$am_pm;

        $this->Cell(50);
        $this->SetFont('Arial','',10); 
        $this->Cell(50,10,'San Cristobal - Edo. tachira',0,0,'R');
        $this->Ln(5);
 
        $this->Cell(120);
        $this->Cell(70,10,'Impreso: '.$date.' a las '.$horacom,0,0,'R');
        $this->Ln(5);

        $this->Cell(140); 
        $this->Cell(50,10,'Tel. 0424-7111524 / 0414-7114403 / 0275-4156485',0,0,'R');
        $this->Ln(5);
        $this->Cell(135);
        $this->Cell(50,10,'Email: frescoesmejor@gmail.com',0,0,'R'); 
        $this->Ln(5);


        $this->SetFont('Arial','B',10);
        $titulo = 'Factura: '.$_REQUEST['mesa'];   
        // Título
         $this->Cell(60);
        $this->Cell(70,10,$titulo,0,1,'C');


    // Salto de línea
    $this->Ln(5);

    $this->SetFont('Arial','B',12);
    $this->Cell(20, 10, 'Cant',1,0,'C', 0);
    $this->Cell(100, 10, 'Producto',1,0,'C', 0);
    $this->Cell(50, 10, 'Pre. Uni.',1,1,'C', 0);

    
  }

	// Pie de página
	function Footer()
	{
	    // Posición: a 1,5 cm del final
	    $this->SetY(-15);
	    // Arial italic 8
	    $this->SetFont('Arial','I',8);
	    // Número de página
	    $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
	}
}

//require ('../../../Model/conexion.php');
//require_once("../../Views/modules/ventas/conexion.php");

require_once("conexion.php");
                  
        

  $consulta = "select O.cantidad, P.nombreproducto, O.total from ordenes O, productos P where O.mesa like '%".$mesa."%' and O.idproducto=P.idproducto and O.PDF='0'"; 

  $resultadoconsulta = $conexion->query($consulta);
  


$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage('Portrait','Letter');
$pdf->SetFont('Arial','',11);
$acum=0;
$bandera=0;



while ($row = $resultadoconsulta->fetch(PDO::FETCH_ASSOC))
{
	$pdf->Cell(20, 10, utf8_decode($row['cantidad']),1,0,'C', 0);
    $pdf->Cell(100, 10, utf8_decode($row['nombreproducto']),1,0,'C', 0);
    $pdf->Cell(50, 10, utf8_decode($row['total']),1,1,'C', 0);
    $acum = $acum + $row['total']; 
    $bandera=1;
}





if($bandera==1)
{
	$pdf->Cell(20);
	$pdf->SetFont('Arial','B',12);
	$pdf->Cell(100, 10, 'Total: ',0,0,'R', 0);
	$pdf->SetFont('Arial','B',13);
    $pdf->Cell(50, 10, $acum,1,1,'C', 0);
}

 $consultaupdate = "update ordenes set PDF='1' where mesa like'%".$mesa."%'";
        $ejecutar_consultaupdate = $conexion->query($consultaupdate);

$pdf->Output($titulo.'_Fecha_'.date("d_m_Y").'_Hora_'.date("h_i_a"), 'I');

?>



