<?php  
 require_once 'Model/conexion.php';
 class EmpleadosModel{ 
          #-----------------------------------------------------------
       #obtener todas empleados
     public function getEmpleadosModel($tabla){         	
		 	$sql = Conexion::conectar()->prepare("select E.ID_empleado, E.nombres, E.apellidos, C.descripcion as cargo from empleado E, cargos C where E.cargo=C.idcargo and E.estado='1'");
		 	$sql->execute();
		 	return $sql->fetchAll();
		 	$sql->close();
		 }

     public function ingresarEmpleadosModel($datosModel , $tabla){
      	$sql = Conexion::conectar()->prepare("INSERT INTO $tabla (tipo_de_documento,numero_de_documento,nacionalidad,apellidos,nombres,fecha_de_nacimiento,direccion,telefono1,telefono2,cargo) VALUES(:tipo_de_documento,:numero_de_documento,:nacionalidad,:apellidos,:nombres,:fecha_de_nacimiento,:direccion,:telefono1,:telefono2,:cargo)");

      	$sql->bindParam(':tipo_de_documento' , $datosModel['tipo_de_documento'] , PDO::PARAM_STR);
        $sql->bindParam(':numero_de_documento' , $datosModel['numero_de_documento'] , PDO::PARAM_STR);
        $sql->bindParam(':nacionalidad' , $datosModel['nacionalidad'], PDO::PARAM_STR);
        $sql->bindParam(':apellidos' , $datosModel['apellidos'] , PDO::PARAM_STR);
        $sql->bindParam(':nombres' , $datosModel['nombres'] , PDO::PARAM_STR);
        $sql->bindParam(':fecha_de_nacimiento' , $datosModel['fecha_de_nacimiento'] , PDO::PARAM_STR);
        $sql->bindParam(':direccion' , $datosModel['direccion'] , PDO::PARAM_STR);
        $sql->bindParam(':telefono1' , $datosModel['telefono1'] , PDO::PARAM_STR);
        $sql->bindParam(':telefono2' , $datosModel['telefono2'] , PDO::PARAM_STR);
        $sql->bindParam(':cargo' , $datosModel['cargo'] , PDO::PARAM_STR);

      	if ($sql->execute()) {
      		return 'success';
      	}else{
      		return 'error';
      	}
      	$sql->close();
     }	

    public function deleteEmpleadosModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado` = '0' WHERE ID_empleado = :ID_empleado");
      $sql->bindParam(':ID_empleado', $datosModel, PDO::PARAM_INT);
      if ($sql->execute()) {
         return 'success';
      }else{
        return 'error';
      }
      $sql->close();
    }

  public function editarEmpleadosModel($datosModel,$tabla){
     $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `tipo_de_documento`=:tipo_de_documento,`numero_de_documento`=:numero_de_documento,`nacionalidad`=:nacionalidad,`apellidos`=:apellidos,`nombres`=:nombres,`fecha_de_nacimiento`=:fecha_de_nacimiento,`direccion`=:direccion,`telefono1`=:telefono1,`telefono2`=:telefono2,`cargo`=:cargo WHERE ID_empleado = :ID_empleado");
        
        $sql->bindParam(':tipo_de_documento' , $datosModel['tipo_de_documento'] , PDO::PARAM_STR);
        $sql->bindParam(':numero_de_documento' , $datosModel['numero_de_documento'] , PDO::PARAM_STR);
        $sql->bindParam(':nacionalidad' , $datosModel['nacionalidad'], PDO::PARAM_STR);
        $sql->bindParam(':apellidos' , $datosModel['apellidos'] , PDO::PARAM_STR);
        $sql->bindParam(':nombres' , $datosModel['nombres'] , PDO::PARAM_STR);
        $sql->bindParam(':fecha_de_nacimiento' , $datosModel['fecha_de_nacimiento'] , PDO::PARAM_STR);
        $sql->bindParam(':direccion' , $datosModel['direccion'] , PDO::PARAM_STR);
        $sql->bindParam(':telefono1' , $datosModel['telefono1'] , PDO::PARAM_STR);
        $sql->bindParam(':telefono2' , $datosModel['telefono2'] , PDO::PARAM_STR);
        $sql->bindParam(':cargo' , $datosModel['cargo'] , PDO::PARAM_STR);
        $sql->bindParam(':ID_empleado' , $datosModel['ID_empleado'] , PDO::PARAM_STR);
     if ($sql->execute()) {
       return 'success';
     }else{
      return 'error';
     }
     $sql->close();
  }
 }