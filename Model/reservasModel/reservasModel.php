<?php 

require_once 'Model/conexion.php';
 class Datos{       
       #-----------------------------------------------------------
       #obtener todas reservas
 	 	public static function getReservasModel( $tabla){
 	 		$sql=Conexion::conectar()->prepare("SELECT *  FROM $tabla  WHERE estado=1 ORDER BY diallegada asc ");
 	 		$sql->execute();
 	 		return $sql->fetchAll();
 	 		$sql->close();
 	 	} 

 	 // agregar Reservas
 	 public static function agregarReservasModel($datosModel,$tabla){
 	 	  $stmt = Conexion::conectar()->prepare("INSERT INTO $tabla(nombrecliente,cantidadpersonas,telefono,diallegada,horallegada,observaciones)
 	 	  	VALUES(:nombrecliente,:cantidadpersonas,:telefono,:diallegada,:horallegada,:observaciones)");
            $stmt->bindParam(':nombrecliente',$datosModel['nombrecliente'], PDO::PARAM_STR);
            $stmt->bindParam(':cantidadpersonas',$datosModel['cantidadpersonas'],PDO::PARAM_STR);
            $stmt->bindParam(':telefono',$datosModel['telefono'], PDO::PARAM_STR);
            $stmt->bindParam(':diallegada',$datosModel['diallegada'], PDO::PARAM_STR);
            $stmt->bindParam(':horallegada',$datosModel['horallegada'], PDO::PARAM_STR);
            $stmt->bindParam(':observaciones',$datosModel['observaciones'], PDO::PARAM_STR);
            if ($stmt->execute()) {
               return 'success';
            }else{
                return 'error';
            }
            $stmt->close();
 	 }	

 	 	public static function deleteReservaModel($datosModel,$tabla){
      $stmt = Conexion::conectar()->prepare("UPDATE $tabla SET `estado`=0 WHERE idreserva = :idreserva");
      $stmt->bindParam(':idreserva', $datosModel, PDO::PARAM_INT);
      if ($stmt->execute()) {
         return 'success';
      }else{
        return 'Error';
      }
      $stmt->close();
    }
     
     public static function totalReservasModel($tabla){
      date_default_timezone_set('America/Caracas');
         $fecha = date('Y-m-d');
         $sql=Conexion::conectar()->prepare("SELECT COUNT(*) as total FROM $tabla WHERE diallegada >= NOW() AND estado=1");
         $sql->execute();
         return $sql->fetchAll();
         $sql->close();
      }

     public static function editarReservasModel($datosModel,$tabla){
        date_default_timezone_set('America/Caracas');
        $sql=Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE idreserva = :idreserva");
        $sql->bindParam(':idreserva',$datosModel, PDO::PARAM_INT);
        $sql->execute();
        return $sql->fetch();
        $sql->close();
     } 

        static function actualizarReservasModel($datosModel,$tabla){
      $sql=Conexion::conectar()->prepare("UPDATE $tabla SET nombrecliente = :nombrecliente,
       cantidadpersonas = :cantidadpersonas, telefono=:telefono,diallegada=:diallegada,horallegada=:horallegada,observaciones=:observaciones WHERE idreserva = :idreserva");
      $sql->bindParam(':nombrecliente',$datosModel['nombrecliente'], PDO::PARAM_STR);
      $sql->bindParam(':cantidadpersonas',$datosModel['cantidadpersonas'], PDO::PARAM_STR);
      $sql->bindParam(':telefono',$datosModel['telefono'], PDO::PARAM_STR);
      $sql->bindParam(':diallegada',$datosModel['diallegada'], PDO::PARAM_STR);
      $sql->bindParam(':horallegada',$datosModel['horallegada'], PDO::PARAM_STR);
      $sql->bindParam(':observaciones',$datosModel['observaciones'], PDO::PARAM_STR);
      $sql->bindParam(':idreserva',$datosModel['idreserva'], PDO::PARAM_STR);      
      if($sql->execute()){
             return "success";
      }else{
       return  "error";
      }
      $sql->close();
    }
 }