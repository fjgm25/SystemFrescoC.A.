<?php  
 require_once 'Views/modules/ventas/conexion.php';

?>

<div class="container">
	
  <ol class="breadcrumb">
     <li class="breadcrumb-item active"><i class="fa fa-list"> </i> ATENCIONES REALIZADAS </li>
  </ol>

   <div class="row">
	<div class="col-lg-12">
	<table class="table table-bordered" id="tablaProductos">
		<thead class="bg-danger">
			<tr>
				<th class="usuarios" align="center">ID Aten.</th>
				<th class="usuarios" align="center">Mesa</th>
				<th class="usuarios" align="center">Fecha</th>
				<th class="usuarios" align="center">Hora</th>
				<th class="usuarios" align="center">Atendido por</th>
				<th class="usuarios" align="center">Monto</th>
				<th class="usuarios" align="center">PDF</th>
			</tr>
		</thead>
		<tbody>
		<?php
		
        $consulta = "SELECT A.idatencion, O.mesa, O.fecha, O.hora, O.empleado, SUM(O.total) as monto FROM atencion as A, ordenes as O WHERE O.idatencion = A.idatencion GROUP BY O.idatencion";
        $ejecutar_consulta = $conexion->query($consulta);
		$ejecutar_consulta = is_array($ejecutar_consulta) ? $ejecutar_consulta : array();
        //$resultado = $ejecutar_consulta->fetch();			
		foreach ($ejecutar_consulta as $key){ 
            $idatencion=$key['idatencion'];
			$mesa=chr(34).$key['mesa'].chr(34);
			$fecha=chr(34).$key['fecha'].chr(34);
			$hora=chr(34).$key['hora'].chr(34);
			$empleado=chr(34).$key['empleado'].chr(34);
			$monto=chr(34).$key['monto'].chr(34);
			echo "<tr>
					<td align='center'>".$key['idatencion']."</td>
					<td align='center'>".$key['mesa']."</td>
					<td align='center'>".$key['fecha']."</td>
					<td align='center'>".$key['hora']."</td>
					<td align='center'>".$key['empleado']."</td>
					<td align='center'>".$key['monto']."</td>
					<td>
					  <button onclick='PDFatencion(".$idatencion.",$mesa,$fecha,$hora,$empleado,$monto)' type='button'>
					    <i class='fa fa-print btn btn-danger  btn-sm'>
					    </i>
					  </button>
					</td>
				  </tr>";			
		} 

		?>			
		</tbody>
	</table>
	</div>
 </div>
</div>

<script type="text/javascript">
	
  function PDFatencion(idatencion,mesa,fecha,hora,empleado,monto)
  {
  	//alert(idatencion+'-'+mesa+'-'+fecha+'-'+hora+'-'+empleado+'-'+monto);
    window.open("Views/modules/atenciones/atenciones_PDF.php?idatencion="+idatencion+"&mesa="+mesa+"&fecha="+fecha+"&hora="+hora+"&empleado="+empleado+"&monto="+monto, "Generar reporte", "toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, fullscreen=yes");

  }


</script>


