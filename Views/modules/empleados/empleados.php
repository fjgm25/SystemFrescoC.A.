<?php  
 require_once 'Views/modules/ventas/conexion.php';

?>

<div class="container">
	<ol class="breadcrumb">
	   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> LISTADO DE EMPLEADOS </li>
	</ol>
<?php 
if (isset($_GET['action'])) {
 	if ($_GET['action']== 'okEmpleados') {
 	     echo '<center><div class="alert alert-success alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong>El Empleado fue Agregado Satisfactoriamente al sistema.
          </div>
        </center>';
 	}
 	if ($_GET['action']== 'okBorradoEmpleados') {
 	     echo '<center><div class="alert alert-danger alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong>El Empleado fue Borrado Satisfactoriamente del sistema.
          </div>
        </center>';
 	}
	if ($_GET['action']== 'okEdiatdoEmpleados') {
 	     echo '<center><div class="alert alert-success alert-dismissible fade in" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <strong>Exitos!! </strong>El Empleado fue Editado Satifactoriamente.
          </div>
        </center>';
 	}
 }
 ?>
	<center>
			 <ul class="nav nav-tabs">
				  <li class="nav-item">
				   <a class="nav-link active" data-toggle="modal" data-target="#empleados" href="#">
				     <i class="fa fa-user btn btn-outline-info btn-sm"></i> 
				       Nuevo Empleado
				    </a>
				  </li>
				 
			</ul>
	  <br>
 <div class="row">
	<div class="col-md-8">
	<table class="table table-bordered" id="tablaProductos">
		<thead class="bg-primary">
			<tr>
				<th class="usuarios" align="center">ID</th>
				<th class="usuarios" align="center">Nombres y Apellidos</th>
				<th class="usuarios" align="center">Cargo</th>
				<th class="usuarios" align="center">Acciones</th>
			</tr>
		</thead>
		<tbody>
			<?php 
			 $empleados= new EmpleadosController();
			 $empleados->getEmpleadosController();
			 ?>
		</tbody>
	</table>
	</div>
    <div class="col-md-4">
		<img src="assets/img/foto3.jpg" width="330" height="269">
    </div>
 </div>
	 <?php require 'Views/modal/modal_empleados.php'; ?>
</div>
