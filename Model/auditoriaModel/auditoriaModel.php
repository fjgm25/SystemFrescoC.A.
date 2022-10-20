<?php  

 require_once 'Model/conexion.php';

 class AuditoriaModel{

 	 public function getAuditoriaModel($tabla){
         
         $sql = Conexion::conectar()->prepare("SELECT * FROM $tabla");
         $sql->execute();
         return $sql->fetchAll();
         $sql->close();
       }
 }
         
