<?php  
 require_once 'Views/modules/ventas/conexion.php';
?>
		<div class="modal fade" id="usuarios">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">Nuevo Usuario</h4>
					</div>
					<div class="modal-body">
			<form method="post">
			  <div class="form-group">
			    <label for="formGroupExampleInput">Usuario</label>
			    <input type="text" name="nombreusuario" class="form-control" id="formGroupExampleInput" placeholder="Ingrese el Usuario" required="">
			  </div>
			  <div class="form-group">
			    <label for="formGroupExampleInput2">Contraseña Usuario</label>
			    <input type="password" name="password" class="form-control" id="formGroupExampleInput2" placeholder="Ingrese la Contraseña para el Usuario" required="">
			  </div>
			  <div class="form-group">
              <label for="formGroupExampleInput3" class="form-control-label">Tipo de Usuario</label>
			      <select class="form-control chosen-select" id="formGroupExampleInput3" name="tipo_usuario">
			           <option value="0"  required="">SELECCIONA UN TIPO</option>
			          <?php             
			            $consulta = $conexion->query("SELECT * FROM rol order by idrol asc");
			            while ($fila=$consulta->fetch(PDO::FETCH_OBJ)) {                    
			            echo '<option value="'.$fila->idrol.'">'.ucwords($fila->descripcion).'</option>';
			      }?>
			    </select>
            </div>
            
            <div class="form-group">
              <label for="formGroupExampleInput4" class="form-control-label">Codigo de Empleado</label>
			      <select class="form-control chosen-select" id="formGroupExampleInput4" name="ID_empleado">
			           <option value="0"  required="">SELECCIONA CODIGO DE EMPLEADO</option>	
			          <?php             
			            $consulta2 = $conexion->query("SELECT * FROM empleado order by ID_empleado asc");
			            while ($fila2=$consulta2->fetch(PDO::FETCH_OBJ)) {                    
			            echo '<option value="'.$fila2->ID_empleado.'">'.ucwords($fila2->nombres).' '.ucwords($fila2->apellidos).'</option>';
			      }?>
			    </select>
            </div>


			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<button type="submit" name="guardarUsuario" class="btn btn-primary">Guardar Cambios</button>
           </form>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

		<?php 
		 $usuario = new UsuariosController();
		 $usuario->ingresarUsuariocontroller();
         $usuario->deleteUsuariosController();
		 ?>