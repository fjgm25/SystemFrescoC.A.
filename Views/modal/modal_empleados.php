<?php  
 require_once 'Views/modules/ventas/conexion.php';
?>
		<div class="modal fade" id="empleados">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">Nuevo Empleado</h4>
					</div>
					<div class="modal-body">
			<form method="post">
			  <div class="form-group">
			    <label for="nombreusuario">Nombres</label>
			    <input type="text" name="nombres" class="form-control" id="nombres" placeholder="Nombres del Empleado" required="">
			  </div>
			  <div class="form-group">
			    <label for="apellidosusuario">Apellidos</label>
			    <input type="text" name="apellidos" class="form-control" id="apellidos" placeholder="Apellidos del Empleado" required="">
			  </div>
			  <div class="form-group">
              <label for="tipo_documento" class="form-control-label">Tipo de Documento</label>
			      <select class="form-control chosen-select" id="tipo_de_documento" name="tipo_de_documento">
			           <option value="0"  required="">Seleccione un tipo...</option>
			           <option>Cédula de Identidad</option>
			           <option>Pasaporte</option>
			           <option>Licencia de Conducir</option>
			           <option>RIF</option>
			    </select>
            </div>
            <div class="form-group">
			    <label for="numerodocumento">Número de Documento</label>
			    <input type="number" name="numero_de_documento" class="form-control" id="numero_de_documento" placeholder="Número de Documento" required="">
			  </div>
			  <div class="form-group">
			    <label for="nacionalidad">Nacionalidad</label>
			    <input type="text" name="nacionalidad" class="form-control" id="nacionalidad" placeholder="Nacionalidad del Empleado" required="">
			  </div>
			  <div class="form-group">
			    <label for="direccion">Direccion</label>
			    <input type="text" name="direccion" class="form-control" id="direccion" placeholder="Direccion del Empleado" required="">
			  </div>
			  <div class="form-group">
			    <label for="telefonoprincipal">Teléfono Principal</label>
			    <input type="text" name="telefono1" class="form-control" id="telefono1" placeholder="Teléfono Principal" required="">
			  </div>
			  <div class="form-group">
			    <label for="telefonosecundario">Teléfono Secundario</label>
			    <input type="text" name="telefono2" class="form-control" id="telefono2" placeholder="Teléfono Secundario">
			  </div>
			  <div class="form-group">
              <label for="formGroupExampleInput5" class="form-control-label">Cargo</label>
	      	      <select class="form-control chosen-select" id="formGroupExampleInput4" name="cargo">
			           <option value="0"  required="">Selecciona Cargo</option>	
			          <?php             
			            $consulta2 = $conexion->query("SELECT * FROM cargos order by idcargo asc");
			            while ($fila2=$consulta2->fetch(PDO::FETCH_OBJ)) {                    
			            echo '<option value="'.$fila2->idcargo.'">'.ucwords($fila2->descripcion).'</option>';
			      }?>
			    </select>
            </div>

			</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<button type="submit" name="guardarEmpleados" class="btn btn-primary">Guardar Cambios</button>
           </form>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->

		<?php 
		 $usuario = new EmpleadosController();
		 $usuario->ingresarEmpleadoscontroller();
         $usuario->deleteEmpleadosController();
		 ?>