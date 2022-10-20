<div class="container">
	<ol class="breadcrumb">
	   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> LISTADO DE USUARIOS ELIMINADOS</li>
	</ol>
	  <br>
 <div class="row">
	<div class="col-md-8">
	<table class="table table-bordered" id="tablaProductos">
		<thead class="bg-primary">
			<tr>
				<td class="usuarios" align="center">Nombre Usuario</td>
				<td class="usuarios" align="center">Rol</td>
				<td class="usuarios" align="center">ID_Empleado</td>
				<td class="usuarios" align="center">Fecha Creado</td>
				<td class="usuarios" align="center">Restaurar</td>
			</tr>
		</thead>
		<tbody>
			<?php 
			 $usuarios= new UsuariosController();
			 $usuarios->getUsuariosController2();
			 $usuarios->restaurarUsuariosController();
			 ?>
		</tbody>
	</table>
	</div>
    <div class="col-md-4">
		<img src="assets/img/foto3.jpg" width="330" height="269">
    </div>
 </div>
	 <?php require 'Views/modal/modal_usuarios.php'; ?>
</div>