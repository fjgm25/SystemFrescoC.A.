<?php  

 	// ob_start();
 class EmpleadosController{
 	public function getEmpleadosController()
  {
 		$respuesta = EmpleadosModel::getEmpleadosModel('empleado');
 		foreach ($respuesta as $row) {
 		echo '<tr> 
              <td align="center"> '.$row['ID_empleado'].'</td>
              <td align="center"> '.$row['nombres'].' '.$row['apellidos'].'</td>
              <td align="center"> '.$row['cargo'].'</td>
			 <td align="center"><a href="index.php?action=editarEmpleados&ID_empleado='.$row["ID_empleado"].'"<i class="fa fa-edit btn btn-primary btn-sm"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="index.php?action=empleados&idBorrar='.$row["ID_empleado"].'"<i class="fa fa-trash-o btn btn-danger btn-sm"></i></a>
					</td>
 		      </tr>';
 		}
 	}

  public function ingresarEmpleadoscontroller(){
 		if (isset($_POST['guardarEmpleados'])) {
 			$datosController = array('tipo_de_documento' => $_POST['tipo_de_documento'],
                                 'numero_de_documento' => $_POST['numero_de_documento'],
                                 'nacionalidad'    => $_POST['nacionalidad'], 
                                 'apellidos'       => $_POST['apellidos'],
                                 'nombres'     => $_POST['nombres'],
                                 'fecha_de_nacimiento' => $_POST['fecha_de_nacimiento'],
                                  'direccion' => $_POST['direccion'],
                                  'telefono1' => $_POST['telefono1'],
                                  'telefono2' => $_POST['telefono2'],
                                  'cargo' => $_POST['cargo']);
   				#pedir la informacion al modelo.
 			$respuesta = EmpleadosModel::ingresarEmpleadosModel($datosController , 'empleado');
 			if ($respuesta == 'success') {
 				header('location:okEmpleados');
 			}else{
 				header('location:reservas');
 		  }
 		}
 	}

 	//borrar Usuario
   public function deleteEmpleadosController(){
   	 if (isset($_GET['idBorrar'])) {
   	 	$datosController = $_GET['idBorrar'];
   	 	$respuesta = EmpleadosModel::deleteEmpleadosModel($datosController, 'empleado');
   	 	if ($respuesta == 'success') {
         header('location:okBorradoEmpleados'); 
   	 	}
   	 }
   }

   public function editarEmpleadosController(){
      if (isset($_POST['editarEmpleados'])) {
       $datosController = array('ID_empleado' => $_POST['ID_empleado'],
                                'tipo_de_documento' => $_POST['tipo_de_documento'],
                                 'numero_de_documento' => $_POST['numero_de_documento'],
                                 'nacionalidad'    => $_POST['nacionalidad'], 
                                 'apellidos'       => $_POST['apellidos'],
                                 'nombres'     => $_POST['nombres'],
                                 'fecha_de_nacimiento' => $_POST['fecha_de_nacimiento'],
                                  'direccion' => $_POST['direccion'],
                                  'telefono1' => $_POST['telefono1'],
                                  'telefono2' => $_POST['telefono2'],
                                  'cargo' => $_POST['cargo']);
       $respuesta = EmpleadosModel::editarEmpleadosModel($datosController , 'empleado');
          if ($respuesta == 'success') {
         header('location:okEdiatdoEmpleados');       
      }
     }
   }
 }