<?php  
  require_once 'Model/conexion.php';
  class MesasModel{
    #-----------------------------------------------------------
    #INGRESAR NUEVAS CATEGORIAS
    public static function agregarMesasModel($datosModel ,$tabla){
      $sql = Conexion::conectar()->prepare("INSERT INTO  $tabla (mesa) VALUES(:mesa)");
      $sql->bindParam(':mesa',$datosModel['mesa'], PDO::PARAM_STR);
      if ($sql->execute()) {
        return 'success';
      }else{
        return 'error';
      }
      $sql->close();
    }

    #-----------------------------------------------------------
    #OBTENER TODAS LAS CATEGORIAS
    public static function getMesasModel($tabla){
      $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE estado=1");
      $sql->execute();
         return $sql->fetchAll();
         $sql->close();
    }
    
    public static function editarMesasModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("SELECT * FROM  $tabla WHERE codmesa = :codmesa");
      $sql->bindParam(':codmesa',$datosModel,PDO::PARAM_INT);
      $sql->execute();
      return $sql->fetch();
      $sql->close();
    }
    
    static function actualizarMesasModel($datosModel,$tabla){
      $sql= Conexion::conectar()->prepare("UPDATE $tabla SET mesa = :mesa WHERE codmesa = :codmesa");
      $sql->bindParam(':mesa',$datosModel['mesa'], PDO::PARAM_STR);
      $sql->bindParam(':codmesa',$datosModel['codmesa'], PDO::PARAM_INT);
      if($sql->execute()){
        return "success";
      }else{
        return  "error";
      }
      $sql->close();
    }

    public static function deleteMesasModel($datosModel,$tabla){
    $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado`=0 WHERE codmesa = :codmesa");
    $sql->bindParam(':codmesa', $datosModel, PDO::PARAM_INT);
    if ($sql->execute()) {
      return 'success';
      }else{
        return 'Error';
      }
      $sql->close();
    }
  }