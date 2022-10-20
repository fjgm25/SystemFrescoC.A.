
<div class="container" style="overflow: auto; width: 1131px; height: 500px;"><br>

 <?php 
 if (isset($_GET['action'])) {
 	if ($_GET['action']== 'okMesas') {
 	     echo '<center><div class="alert alert-success alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong> La Mesa fue agragada Satifactoriamente al sistema.
          </div>
        </center>';
 	}
 }

  if (isset($_GET['action'])) {
 	if ($_GET['action']== 'borrarMesas') {
 	     echo '<center><div class="alert alert-danger alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong> La Mesa fue Borrada Satifactoriamente del sistema.
          </div>
        </center>';
 	}
 }
if (isset($_GET['action'])) {
  if ($_GET['action']== 'okEditMesas') {
       echo '<center><div class="alert alert-success alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong> La Mesa fue Editada Satifactoriamente.
          </div>
        </center>';
  }
 }
  ?>
 <div class="row">
	<div class="col-lg-8">
 <ol class="breadcrumb">
   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> LISTADO DE MESAS</li>
 </ol>
	</div>
		<div class="col-lg-4">
		  <div class="alert alert-success" role="alert">
		  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#mesas" data-whatever="@mdo">
		<i class="fa fa-plus"> </i> Registrar Nuevas Mesas
		  </button>
		</div>
   	  </div> 
   	<div class="col-md-8 text-center">
   	  	
	 <table class="table table-bordered table-hover dt-responsive" id="tablaProductos" >
	 	<thead class="bg-primary">
	 		<tr>
	 			<td class="td" align="center">NOMBRE MESAS</td>
	 			<td class="td" align="center">ACCIONES</td>
	 		</tr>
	 	</thead>
     <?php 
     $mesas = new MesasController();
     $mesas->getMesasController();
     $mesas->deleteMesasController();
    ?>

	 </table>
   <br>
    </div>
    	<div class="col-md-3 text-center">
    	  <img src="assets/img/foto1.jpg" width="350" height="285">
    	</div>

  </div>
</div>
		   <?php require 'Views/modal/modal_mesas.php'; ?>

