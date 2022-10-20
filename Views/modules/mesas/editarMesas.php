<div class="container">
<div class="row">
	<div class="col-lg-12">
 <ol class="breadcrumb">
   <li class="breadcrumb-item active"><i class="fa fa-list"> </i> EDITAR LA MESA</li>
 </ol>
 </div>
</div>
<form method="post">
    <div class="row">
		<?php 
		 $editar = new MesasController();
		 $editar->editarMesasController();
		 $editar->actualizarMesasController();
		 ?>
</div>
</form>
