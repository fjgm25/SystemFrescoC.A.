
<div class="container" style="overflow: auto; width: 1131px; height: 500px;"><br>

 <?php 
  if (isset($_GET['action'])) {
 	if ($_GET['action']== 'restaurarCategorias') {
 	     echo '<center><div class="alert alert-danger alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong> La Categoria de un  Producto fue Restaurada Satifactoriamente en el sistema.
          </div>
        </center>';
 	}
 }

  ?>
 <div class="row">
	<div class="col-lg-8">
 <ol class="breadcrumb">
   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> LISTADO DE CATEGORIAS ELIMINADAS</li>
 </ol>
	</div>

   	<div class="col-md-8 text-center">
    <table class="table table-bordered table-hover dt-responsive" id="tablaProductos" >
	 	<thead class="bg-primary">
	 		<tr>
	 			<td class="td" align="center">NOMBRE CATEGORIA</td>
	 			<td class="td" align="center">RESTAURAR</td>
	 		</tr>
	 	</thead>
     <?php 
     $categorias = new CategoriasController();
     $categorias->getCategoriasController2();
     $categorias->restaurarCategoriasController();
    ?>

	 </table>
   <br>
    </div>
    	<div class="col-md-3 text-center">
    	  <img src="assets/img/foto1.jpg" width="350" height="285">
    	</div>

  </div>
</div>


