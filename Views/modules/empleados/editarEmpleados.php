<?php  
 require_once 'Views/modules/ventas/conexion.php';
 $ID_empleado = $_GET['ID_empleado'];
     $consulta = $conexion->query("SELECT * FROM empleado as e LEFT JOIN cargos ON e.cargo=cargos.idcargo WHERE ID_empleado = $ID_empleado");
?>

<div class="container">
	<ol class="breadcrumb">
	   <li class="breadcrumb-item active"><i class="fa fa-list"> </i>EDITAR EMPLEADOS </li>
	</ol>
  <div class="row">
     <div class="col-md-7">
	      <form method="post">
	      <?php foreach ($consulta as $row => $value): ?>
	      	<input type="hidden" name="ID_empleado" value="<?php echo $value['ID_empleado'] ?>">
			  <div class="form-group">
			  <label for="formGroupExampleInput">Tipo de Documento</label>
					<select class="form-control chosen-select" id="tipo_de_documento" name="tipo_de_documento">
			           <option value="<?php echo $value['tipo_de_documento'] ?>"  required="">
			           	<?php 
			           	if ($value['tipo_de_documento']==1){
			           		echo 'Cédula de Identidad'; 
			           	}
			           	else{
			           		if ($value['tipo_de_documento']==2){
			           		echo 'Pasaporte'; 
			           		}
			           		else{
			           			if ($value['tipo_de_documento']==3){
			           			echo 'Licencia de Conducir'; 
			           			}
			           			else{
			           				if ($value['tipo_de_documento']==4){
			           					echo 'RIF'; 
				           			}
				           			else{
			           					echo 'Seleccionar';
			           				}
								}
							}
			           	}
			           	?></option>
			           <option>Cédula de Identidad</option>
			           <option>Pasaporte</option>
			           <option>Licencia de Conducir</option>
			           <option>RIF</option>
			    </select>

			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput2">Numero de Documento</label>
			<input type="text" name="numero_de_documento" class="form-control" id="formGroupExampleInput2" value="<?php echo $value['numero_de_documento'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput3">Nacionalidad</label>
			<input type="text" name="nacionalidad" class="form-control" id="formGroupExampleInput3" value="<?php echo $value['nacionalidad'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput">Apellidos</label>
			<input type="text" name="apellidos" class="form-control" id="formGroupExampleInput" value="<?php echo $value['apellidos'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput">Nombres</label>
			<input type="text" name="nombres" class="form-control" id="formGroupExampleInput" value="<?php echo $value['nombres'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput">Fecha_de_nacimiento</label>
			<input type="date" name="fecha_de_nacimiento" class="form-control" id="formGroupExampleInput" value="<?php echo $value['fecha_de_nacimiento'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput">Direccion</label>
			<input type="text" name="direccion" class="form-control" id="formGroupExampleInput" value="<?php echo $value['direccion'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput">Telefono1</label>
			<input type="text" name="telefono1" class="form-control" id="formGroupExampleInput" value="<?php echo $value['telefono1'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput">Telefono2</label>
			<input type="text" name="telefono2" class="form-control" id="formGroupExampleInput" value="<?php echo $value['telefono2'] ?>">
			   </div>
			  <div class="form-group">
	              <label for="formGroupExampleInput5" class="form-control-label">Cargo</label>
	      		  	<select class="form-control chosen-select" id="formGroupExampleInput5" name="cargo">		<option value="<?php echo $value['cargo'] ?>" ><?php echo ucwords($value['descripcion']) ?>
	           			</option>
	              	<?php   $aux1=$value['cargo'];
	              	if ($aux1!='') {
	              		$cons = $conexion->query("SELECT * FROM cargos WHERE estado=1 AND cargos.idcargo!=$aux1");}
	              	else{
	              		$cons = $conexion->query("SELECT * FROM cargos WHERE estado=1");
	              	}
	              	echo "<script>console.log('Debug Objects: " . $aux1 . "' );</script>";?>
	            		<?php foreach ($cons as $row2 ): ?>
	            			<option value="<?php echo $row2['idcargo']; ?>">
	            			<?php echo ucwords($row2['descripcion']); ?>
	            			</option>
	            		<?php endforeach ?>
	    			</select>
            </div>
			<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			<button type="submit" name="editarEmpleados" class="btn btn-primary">Guardar Cambios</button>
           </form>
	      <?php endforeach ?>
     </div>
     <div class="col-md-5">
        <img src="assets/img/foto1.jpg" width="450" height="250">
    </div>
  </div>
    <br>
</div>
<?php 
$eU = new EmpleadosController();
$eU->editarEmpleadosController();
?>