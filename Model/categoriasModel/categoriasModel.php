<?php  
  require_once 'Model/conexion.php';
  class CategoriasModel{
    #-----------------------------------------------------------
    #INGRESAR NUEVAS CATEGORIAS
    public static function agregarCategoriasModel($datosModel ,$tabla){
      $sql = Conexion::conectar()->prepare("INSERT INTO  $tabla (nombrecategoria) VALUES(:nombrecategoria)");
      $sql->bindParam(':nombrecategoria',$datosModel['nombrecategoria'], PDO::PARAM_STR);
      if ($sql->execute()) {
        return 'success';
      }else{
        return 'error';
      }
      $sql->close();
    }

    #-----------------------------------------------------------
    #OBTENER TODAS LAS CATEGORIAS
    public static function getCategoriasModel($tabla){
      $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE estado=1");
      $sql->execute();
         return $sql->fetchAll();
         $sql->close();
    }

    public static function getCategoriasModel2($tabla){
      $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE estado=0");
      $sql->execute();
         return $sql->fetchAll();
         $sql->close();
    }
    
    public static function editarCategoriasModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("SELECT * FROM  $tabla WHERE idcategoria = :idcategoria");
      $sql->bindParam(':idcategoria',$datosModel,PDO::PARAM_INT);
      $sql->execute();
      return $sql->fetch();
      $sql->close();
    }
    
    static function actualizarCategoriaModel($datosModel,$tabla){
      $sql= Conexion::conectar()->prepare("UPDATE $tabla SET nombrecategoria = :nombrecategoria WHERE idcategoria = :idcategoria");
      $sql->bindParam(':nombrecategoria',$datosModel['nombrecategoria'], PDO::PARAM_STR);
      $sql->bindParam(':idcategoria',$datosModel['idcategoria'], PDO::PARAM_INT);
      if($sql->execute()){
        return "success";
      }else{
        return  "error";
      }
      $sql->close();
    }

    public static function deleteCategoriasModel($datosModel,$tabla){
    $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado`=0 WHERE idcategoria = :idcategoria");
    $sql->bindParam(':idcategoria', $datosModel, PDO::PARAM_INT);
    if ($sql->execute()) {
      return 'success';
      }else{
        return 'Error';
      }
      $sql->close();
    }

    public static function restaurarCategoriasModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado`=1 WHERE idcategoria = :idcategoria");
      $sql->bindParam(':idcategoria', $datosModel, PDO::PARAM_INT);
      if ($sql->execute()) {
        return 'success';
        }else{
          return 'Error';
        }
        $sql->close();
      }

  }