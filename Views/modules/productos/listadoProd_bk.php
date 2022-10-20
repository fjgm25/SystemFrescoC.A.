<div class="container" style="overflow: auto; width: 1131px; height: 500px;"><br>
<?php 
if (isset($_GET['action'])) {
  	if ($_GET['action']== 'productos_bk') {
 	    ;
 	}
 }

 ?>
 <div class="row">
	<div class="col-md-8">
 <ol class="breadcrumb">
   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> LISTADO DE PRODUCTOS ELIMINADOS</li>
 </ol>
	</div>
	
   	<div class="col-md-12">
	 <table class="table table-bordered table-hover dt-responsive" id="tablaProductos">
	 	<thead class=" bg-danger">
	 		<tr>
	 			<td class="td" align="center">NOMBRE PRODUCTO</td>
	 			<td class="td" align="center">CATEGORIA PRODUCTO</td>
	 			<td class="td" align="center">PRECIO</td>
	 			<td class="td" align="center">RESTAURAR</td>
	 		</tr>
	 	</thead>

	 	<?php 
          $prod = new ProductosController();
          $prod->getProductosController2();
          $prod->restaurarProductosController();
	 	 ?>

	 </table>
	 <br>	
  </div>
</div>
</div>
