<?php  
ob_start();
class MesasController {
  public function agregarMesasController(){
  	if (isset($_POST['agregarMesas'])) {
  	  $datosController = array("mesa"=>$_POST['mesa']);
  	  $respuesta = MesasModel::agregarMesasModel($datosController,'mesas');
      if ($respuesta == 'success') {
  	   	 header('location:okMesas');
  	  }else{
         header('location:mesas');
 		  }
  	}
  }

  public function getMesasController(){
      $respuesta = MesasModel::getMesasModel('mesas');
       foreach ($respuesta as $row) {
         echo '<tr> 
              <td align="center"> '. $row['mesa'].'</td>
              <td align="center"><a href="index.php?action=editarmesa&codmesa='.$row['codmesa'].'" <i class="fa fa-edit btn btn-primary btn-sm"></i> </a>
               <a class="fa fa-trash btn btn-danger  btn-sm" href="index.php?action=mesas&idBorrar='.$row['codmesa'].'" &nbsp;  </a>
              </td>
              </tr>';
       }
    }

    public function editarMesasController(){
      $datosController= $_GET['codmesa'];
      $respuesta = MesasModel::editarMesasModel($datosController,'mesas');
      echo'  <div class="col-md-8">  
             <div class="form-group">
             <label for="mesa-name" class="form-control-label">Nombre Mesa :</label>
             <input type="text" class="form-control" id="mesa-name" name="mesa" value="'.$respuesta['mesa'].' ">
             </div>       
             <input type="hidden" name="codmesa" value="'.$respuesta['codmesa'].'">
             <button type="submit" class="btn btn-primary" name="editarMesas">Editar la Mesa</button>
             </div>
             <div class="col-md-4">
     <img src="assets/img/foto3.jpg" width="350" height="285"">
     </div>';
    }

   public function actualizarMesasController(){
         if (isset($_POST['editarMesas'])) {
          $datosController= array("mesa"=>$_POST['mesa'],
                                     'codmesa'=>$_POST['codmesa']);
          #pedir la informacion al modelo.
          $respuesta= MesasModel::actualizarMesasModel($datosController,'mesas');
          if ($respuesta == 'success') {
                header('location:okEditMesas');
          }
        }
     }

  public function deleteMesasController(){
     if (isset($_GET['idBorrar'])) {
      $datosController = $_GET['idBorrar'];
   #pedir la informacion al modelo.
      $respuesta = MesasModel::deleteMesasModel($datosController,'mesas');
      if ($respuesta == 'success') {
         header('location:borrarMesas');
      }
     }
   }
}