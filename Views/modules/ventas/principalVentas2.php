<div class="container">
	<div class="row">
		<div class="col-lg-5">
		 <br>
		 <div class="mesas">
		  <h3>Seleccionar Una Mesa</h3>
		  <br>
			 <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			   <!--  <div class="btn-group mr-2" role="group" aria-label="First group"> -->
				<?php 
				 require 'Views/modules/ventas/conexion.php';
				 ob_start();
				 $consult = $conexion->query("SELECT * FROM mesa ORDER BY codmesa ASC");
				 $cont=0;
				foreach ($consult as $key): 
				$cont=$cont+1;
				if($cont%3==1) {
					  echo '<a href="mesas'.$key['codmesa'].'" class="btn btn-success">'.$key['mesa'].'</a>';
			    }
			    if($cont%3==2) {
					  echo '<a href="mesas'.$key['codmesa'].'" class="btn btn-danger">'.$key['mesa'].'</a>';
			    }    
				if($cont%3==0) {
					  echo '<a href="mesas'.$key['codmesa'].'" class="btn btn-primary">'.$key['mesa'].'</a>';
			          echo "<br><br>";
			        }
				endforeach ?>
				<a href="principalVentas2" class="btn btn-warning">Salir de las Mesas</a>
			<!-- </div> -->
		</div>
	  </div>
	  	<br><br>
	 </div>
		<div class="col-lg-7">
		   <?php 
             if (isset($_GET['action'])) {
             	include 'mesas/mesas.php';
             }
		    ?>
	   </div>	  
</div>
</div>