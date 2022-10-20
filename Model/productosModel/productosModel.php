<?php  

 require_once 'Model/conexion.php';

 class ProductosModel{

 	 public static function getProductosModel($tabla){
         
         $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla pro INNER JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE pro.estado=1");
         $sql->execute();
         return $sql->fetchAll();
         $sql->close();
       }

       public static function getProductosModel2($tabla){
         
        $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla pro INNER JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE pro.estado=0");
        $sql->execute();
        return $sql->fetchAll();
        $sql->close();
      }

 	public static function agregarProductosModel($datosModel,$tabla){
 		$sql = Conexion::conectar()->prepare("INSERT INTO $tabla(nombreproducto,idcategoria,idusuario,precio,precioUSD)
 			VALUES(:nombreproducto,:idcategoria,:idusuario,:precio,:precioUSD)");
 		$sql->bindParam(':nombreproducto',$datosModel['nombreproducto'], PDO::PARAM_STR);
 		$sql->bindParam(':idcategoria',$datosModel['idcategoria'],PDO::PARAM_STR);
 		$sql->bindParam(':idusuario',$datosModel['idusuario'],PDO::PARAM_STR);
 		$sql->bindparam(':precio',$datosModel['precio'], PDO::PARAM_STR);
    $sql->bindparam(':precioUSD',$datosModel['precioUSD'], PDO::PARAM_STR);
 		if ($sql->execute())  {
 			return 'success';
 		}else{
 			return 'error';
 		}
 		  $sql->close();
 	}
 	
     static function actualizarProductosModel($datosModel,$tabla){
        $sql= Conexion::conectar()->prepare("UPDATE $tabla SET nombreproducto = :nombreproducto ,idcategoria = :idcategoria, precio = :precio, precioUSD = :precioUSD, idusuario= :idusuario WHERE idproducto = :idproducto");
      $sql->bindParam(':nombreproducto',$datosModel['nombreproducto'], PDO::PARAM_STR);
      $sql->bindParam(':idcategoria',$datosModel['idcategoria'], PDO::PARAM_INT);
      $sql->bindParam(':precio',$datosModel['precio'], PDO::PARAM_INT);
      $sql->bindParam(':precioUSD',$datosModel['precioUSD'], PDO::PARAM_INT);
      $sql->bindParam(':idusuario',$datosModel['idusuario'], PDO::PARAM_INT);
      $sql->bindParam(':idproducto',$datosModel['idproducto'], PDO::PARAM_INT);
      if($sql->execute()){
             return "success";
      }else{
       return  "error";
      }
      $sql->close();
    }

 	 public static function deleteProductosModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado`=0 WHERE idproducto = :idproducto");
      $sql->bindParam(':idproducto', $datosModel, PDO::PARAM_INT);
      if ($sql->execute()) {
         return 'success';
      }else{
        return 'Error';
      }
      $sql->close();
    }

    public static function restaurarProductosModel($datosModel,$tabla){
      $sql = Conexion::conectar()->prepare("UPDATE $tabla SET `estado`=1 WHERE idproducto = :idproducto");
      $sql->bindParam(':idproducto', $datosModel, PDO::PARAM_INT);
      if ($sql->execute()) {
         return 'success';
      }else{
        return 'Error';
      }
      $sql->close();
    }


 }
         
