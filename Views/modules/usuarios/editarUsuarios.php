<?php  
 require_once 'Views/modules/ventas/conexion.php';
 $idusuario = $_GET['idusuario'];
     $consulta = $conexion->query("SELECT * FROM usuarios as u LEFT JOIN rol ON u.tipo_usuario=rol.idrol LEFT JOIN empleado as e ON  u.ID_empleado=e.ID_empleado WHERE idusuario = $idusuario");
?>

<div class="container">
	<ol class="breadcrumb">
	   <li class="breadcrumb-item active"><i class="fa fa-list"> </i>EDITAR USUARIOS </li>
	</ol>
  <div class="row">
     <div class="col-md-7">
	      <form method="post">
	      <?php foreach ($consulta as $row => $value): ?>
	      	<input type="hidden" name="idusuario" value="<?php echo $value['idusuario'] ?>">
			  <div class="form-group">
			  <label for="formGroupExampleInput">Usuario</label>
			<input type="text" name="nombreusuario" class="form-control" id="formGroupExampleInput" value="<?php echo $value['nombreusuario'] ?>">
			  </div>
			  <div class="form-group">
			  <label for="formGroupExampleInput2">Contraseña Usuario <span>(<i>Si no desea cambiar la contraseña deje el campo como está</i>)</span></label>
			<input type="password" name="password" class="form-control" id="formGroupExampleInput2"value="<?php echo $value['password'] ?>">
			  </div>
 			<div class="form-group">
	              <label for="formGroupExampleInput3" class="form-control-label">ID_Empleado</label>
	      		  	<select class="form-control chosen-select" id="formGroupExampleInput3" name="id_empleado">		<option value="<?php echo $value['ID_empleado'] ?>" ><?php echo ucwords($value['nombres']).' '.ucwords($value['apellidos']);?>
	           			</option>
	              	<?php   $aux2=$value['ID_empleado'];
					if ($aux2!='') {
	              		$cons2 = $conexion->query("SELECT * FROM empleado WHERE estado=1 AND empleado.ID_empleado!=$aux2"); }
	              	else{
	              		$cons2 = $conexion->query("SELECT * FROM empleado WHERE estado=1"); 
	              	}
	              	?>
	            		<?php foreach ($cons2 as $row3 ): ?>
	            			<option value="<?php echo $row3['ID_empleado'];?>">
	            			<?php echo ucwords($row3['nombres']).' '.ucwords($row3['apellidos']);?>
	            			</option>
	            		<?php endforeach ?>
	    			</select>
            </div>
			  <div class="form-group">
	              <label for="formGroupExampleInput5" class="form-control-label">Tipo de Usuario</label>
	      		  	<select class="form-control chosen-select" id="formGroupExampleInput5" name="tipo_usuario">		<option value="<?php echo $value['tipo_usuario'] ?>" ><?php echo ucwords($value['descripcion']) ?>
	           			</option>
	              	<?php   $aux1=$value['tipo_usuario'];
	              	if ($aux1!='') {
	              		$cons = $conexion->query("SELECT * FROM rol WHERE estado=1 AND rol.idrol!=$aux1");}
	              	else{
	              		$cons = $conexion->query("SELECT * FROM rol WHERE estado=1");
	              	}
	              	echo "<script>console.log('Debug Objects: " . $aux1 . "' );</script>";?>
	            		<?php foreach ($cons as $row2 ): ?>
	            			<option value="<?php echo $row2['idrol']; ?>">
	            			<?php echo ucwords($row2['descripcion']); ?>
	            			</option>
	            		<?php endforeach ?>
	    			</select>
            </div>
			<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			<button type="submit" name="editarUsuario" class="btn btn-primary">Guardar Cambios</button>
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
$eU = new UsuariosController();
$eU->editarUsuariosController();
?>