<?php  
 require_once 'Model/conexion.php';
 class UsuariosModel{ 
          #-----------------------------------------------------------
       #obtener todas usuarios
     public function getUsuariosModel($tabla){         	
		 	$sql = Conexion::conectar()->prepare("SELECT * FROM $tabla LEFT JOIN rol as r ON $tabla.tipo_usuario=r.idrol WHERE $tabla.estado = 1");
		 	$sql->execute();
		 	return $sql->fetchAll();
		 	$sql->close();
		 }

     public function getUsuariosModel2($tabla){         	
      $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla LEFT JOIN rol as r ON $tabla.tipo_usuario=r.idrol WHERE $tabla.estado = 0");
      $sql->execute();
      return $sql->fetchAll();
      $sql->close();
    }

     public function ingresarUsuariosModel($datosModel , $tabla){
      	$sql = Conexion::conectar()->prepare("INSERT INTO $tabla (nombreusuario,password,tipo_usuario,ID_empleado) VALUES(:nombreusuario,:password,:tipo_usuario,:ID_empleado)");
        $hasher=$datosModel['password'].$datosModel['nombreusuario'];
        $hasher = hash('sha512', $hasher);
      	$sql->bindParam(':nombreusuario' , $datosModel['nombreusuario'] , PDO::PARAM_STR);
        $sql->bindParam(':ID_empleado' , $datosModel['ID_empleado'] , PDO::PARAM_STR);
       // $sql->bindParam(':apellido' , $datosModel['apellido'] , PDO::PARAM_STR);
        $sql->bindParam(':tipo_usuario' , $datosModel['tipo_usuario'] , PDO::PARAM_STR);
      //	$sql->bindParam(':password' , $datosModel['password'], PDO::PARAM_STR);
        $sql->bindParam(':password' , $hasher, PDO::PARAM_STR);
      	if ($sql->execute()) {
      		return 'success';
      	}else{
      		return 'error';
      	}
      	$sql->close();
     }	

    public function deleteUsuariosModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado` = '0' WHERE idusuario = :idusuario");
      $sql->bindParam(':idusuario', $datosModel, PDO::PARAM_INT);
      if ($sql->execute()) {
         return 'success';
      }else{
        return 'error';
      }
      $sql->close();
    }

    public function restaurarUsuariosModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado` = '1' WHERE idusuario = :idusuario");
      $sql->bindParam(':idusuario', $datosModel, PDO::PARAM_INT);
      if ($sql->execute()) {
         return 'success';
      }else{
        return 'error';
      }
      $sql->close();
    }

  public function editarUsuariosModel($datosModel,$tabla){
     $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `nombreusuario`=:nombreusuario, `password` = :password,`tipo_usuario`=:tipo_usuario, `ID_empleado`=:ID_empleado WHERE idusuario = :idusuario");
        if (strlen($datosModel['password'])>50){
          $hasher=$datosModel['password'];
        }
        else{
          $hasher=$datosModel['password'].$datosModel['nombreusuario'];
          $hasher = hash('sha512', $hasher); 
        }
        $sql->bindParam(':nombreusuario' , $datosModel['nombreusuario'] , PDO::PARAM_STR);
        $sql->bindParam(':idusuario' , $datosModel['idusuario'] , PDO::PARAM_STR);
        $sql->bindParam(':tipo_usuario' , $datosModel['tipo_usuario'] , PDO::PARAM_STR);
        $sql->bindParam(':ID_empleado' , $datosModel['ID_empleado'] , PDO::PARAM_STR);
        $sql->bindParam(':password' , $hasher, PDO::PARAM_STR);
     if ($sql->execute()) {
       return 'success';
     }else{
      return 'error';
     }
     $sql->close();
  }
 }