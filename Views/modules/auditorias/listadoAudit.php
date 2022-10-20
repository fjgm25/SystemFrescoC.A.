<div class="container" style="overflow: auto; width: 1131px; height: 500px;"><br>
 <div class="row">
	<div class="col-md-8">
 <ol class="breadcrumb">
   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> LOG DE AUDITORIA DE TABLAS</li>
 </ol>
	</div>
		<div class="col-md-3">
		  <div class="alert alert-success" role="alert">
		  &nbsp;&nbsp;&nbsp;&nbsp;
		</div>
   	  </div>
   	<div class="col-md-12">
	 <table class="table table-bordered table-hover dt-responsive" id="tablaProductos">
	 	<thead class=" bg-danger">
	 		<tr>
	 			<td class="td" align="center">ID</td>	
			 	<td class="td" align="center">TABLA</td>
	 			<td class="td" align="center">TIPO</td>
	 			<td class="td" align="center">FECHA</td>
				<td class="td" align="center">HORA</td>
				<td class="td" align="center">USUARIO</td>
				<td class="td" align="center">PK</td>
	 		</tr>
	 	</thead>

	 	<?php 
          $prod = new AuditoriaController();
          $prod->getAuditoriaController();
	 	 ?>

	 </table>
	 <br>	
  </div>
</div>
</div>
