<?php
require_once("../../Views/modules/ventas/conexion.php");
require_once("../../dompdf/autoload.inc.php");
require_once("../../dompdf/lib/html5lib/Parser.php");
require_once("../../dompdf/lib/php-font-lib/src/FontLib/Autoloader.php");
require_once("../../dompdf/lib/php-svg-lib/src/autoload.php");
require_once("../../dompdf/src/Autoloader.php");
Dompdf\Autoloader::register();

$respuesta=array();
switch($_REQUEST["accion"])
{
    case 'imprimir':
    $mes = array("","Enero", 
          "Febrero", 
          "Marzo", 
          "Abril", 
          "Mayo", 
          "Junio", 
          "Julio", 
          "Agosto", 
          "Septiembre", 
          "Octubre", 
          "Noviembre", 
          "Diciembre");
    $txtdate=date('d')." de ". $mes[date('n')] . " de " . date('Y'). ", ".date('h:i:s A');
    $dompdf = new Dompdf\Dompdf();
    $codigoHTML="<head>
        </head>
        <body>
<table width=100% style='position: absolute;
  top: -30px;
  left: 0;'>
<tr>
<td align='center' valign='center' style='width:30%';>
<img id='logo' src='../../assets/img/logo.png' height='110' alt='Logo'>
</td>
<td align='center' valign='center' style='width:30%';>
</td>
<td align='center' cellspacing='10' valign='bottom' style='font-size:12px; font-weight:bold; width:40%; font-family:'Palatino Linotype', 'Book Antiqua', Palatino, serif; color:#531063;>
<div>San Cristobal - Estado Tachira</div><div> ".$txtdate."</div>
<div>Tel: 0414-0792380 / 0414-7114403 / 0276-4156485</div>
<div>Email:frescoesmejor@gmail.com</div>
</td>
</tr>
</table>
        <div id='main'>
      <div style='margin:auto; width:100%; position:relative; padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 75px; margin-right: auto;margin-left: auto;'>
        <div style='margin:auto; max-width:900px; border:0.5px #000 solid; min-height:20px; border-radius:5px;  padding-left:10px; padding-right:10px; margin-top:20px; margin-bottom:20px;'>
          <h1 align='center'style='font-size:26px; font-weight:bold; font-family:'Palatino Linotype', 'Book Antiqua', Palatino, serif; color:#531063;'>Reservaciones</h1>
        <hr>
        <form method='POST' name='form_ins' id='form_ins'>
        <table style='font-size: 13px; margin: 10px 5px 20px 5px; text-align: left;
              margin-left: auto;  margin-right: auto; padding: 2px;'>
          <tr style='width:150px; padding: 6px; border: 1px solid #ccc; text-align:center;
            background: #e8edff;
              border-right: 2px solid #d7d7d7;
              border-left: 2px solid #d7d7d7;
              border-bottom: 1px solid #d7d7d7;
              color: #669;
              border-top: 1px solid #d7d7d7;font-size:14px; font-weight:bold;'>
            <td style='width:10px;'>MESA</td>
            <td style='width:300px;'>PLATILLO</td>
            <td style='width:100px;'>EMPLEADO</td>
          </tr>";
          $q='SELECT * FROM mesa1 INNER JOIN productos AS p ON p.idproducto=mesa1.idproducto INNER JOIN usuarios as u ON mesa1.idusuario=u.idusuario WHERE mesa1.estado=1 UNION SELECT * FROM mesa2 INNER JOIN productos AS p ON p.idproducto=mesa2.idproducto INNER JOIN usuarios as u ON mesa2.idusuario=u.idusuario WHERE mesa2.estado=1 UNION SELECT * FROM mesa3 INNER JOIN productos AS p ON p.idproducto=mesa3.idproducto INNER JOIN usuarios as u ON mesa3.idusuario=u.idusuario WHERE mesa3.estado=1 UNION SELECT * FROM mesa4 INNER JOIN productos AS p ON p.idproducto=mesa4.idproducto INNER JOIN usuarios as u ON mesa4.idusuario=u.idusuario WHERE mesa4.estado=1 UNION SELECT * FROM mesa5 INNER JOIN productos AS p ON p.idproducto=mesa5.idproducto INNER JOIN usuarios as u ON mesa5.idusuario=u.idusuario WHERE mesa5.estado=1 UNION SELECT * FROM mesa6 INNER JOIN productos AS p ON p.idproducto=mesa6.idproducto INNER JOIN usuarios as u ON mesa6.idusuario=u.idusuario WHERE mesa6.estado=1 UNION SELECT * FROM mesa7 INNER JOIN productos AS p ON p.idproducto=mesa7.idproducto INNER JOIN usuarios as u ON mesa7.idusuario=u.idusuario WHERE mesa7.estado=1 UNION SELECT * FROM mesa8 INNER JOIN productos AS p ON p.idproducto=mesa8.idproducto INNER JOIN usuarios as u ON mesa8.idusuario=u.idusuario WHERE mesa8.estado=1 UNION SELECT * FROM mesa9 INNER JOIN productos AS p ON p.idproducto=mesa9.idproducto INNER JOIN usuarios as u ON mesa9.idusuario=u.idusuario WHERE mesa9.estado=1 UNION SELECT * FROM mesa10 INNER JOIN productos AS p ON p.idproducto=mesa10.idproducto INNER JOIN usuarios as u ON mesa10.idusuario=u.idusuario WHERE mesa10.estado=1';
        $consulta=$conexion->query($q);
     while ($dato = $consulta->fetch(PDO::FETCH_ASSOC))
      {
$codigoHTML.='
      <tr style="width:150px; padding: 6px; border: 1px solid #ccc; text-align: center;
            background: #e8edff;
              border-right: 2px solid #d7d7d7;
              border-left: 2px solid #d7d7d7;
              border-bottom: 1px solid #d7d7d7;
              color: #669;
              border-top: 1px solid #d7d7d7;">
        <td style="padding: 4px">'.$dato['mesa'].'</td>
        <td style="padding: 4px">'.$dato['nombreproducto'].'</td>
        <td style="padding: 4px">'.$dato['nombreusuario'].'</td>
      </tr>';
      } 
 $codigoHTML.='
    </table>
      </form>
      </div>
      </body>';

    $dompdf->loadHtml($codigoHTML);
    //$dompdf->loadHtml("hello world");
    $dompdf->set_option('isHtml5ParserEnabled', true);
    // (Optional) Setup the paper size and orientation
    $dompdf->setPaper('Letter', 'Portrait');
    // Render the HTML as PDF
    $dompdf->render();

    $canvas = $dompdf->get_canvas(); 
    $footer = $canvas->open_object();
    $w = $canvas->get_width();
    $h = $canvas->get_height();
    session_start();
    $usernm="Página {PAGE_NUM} de {PAGE_COUNT} - ";
    $usernm=$usernm.strtoupper($_SESSION['nombreusuario']);
    $canvas->page_text($w-590,$h-28,$usernm, 'arial',10);
    $canvas->close_object();
    $canvas->add_object($footer,"all");
  

    // Output the generated PDF (1 = download and 0 = preview)
    $dompdf->stream("Ordenes - ".date('Y-m-d H:i:s'),array("Attachment"=>1));
    //$dompdf->stream("watchlist.pdf");
    break;
}
echo implode("#",$respuesta);
?>