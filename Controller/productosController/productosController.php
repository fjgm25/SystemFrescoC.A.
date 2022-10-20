<?php  
ob_start();

class ProductosController {

	public function getProductosController(){
		 $respuesta = ProductosModel::getProductosModel('productos');

       foreach ($respuesta as $row) {
         echo '<tr> 
              <td align="center"> '. $row['nombreproducto'].'</td>
              <td align="center"> '. $row['nombrecategoria'].'</td>
              <td align="center"> '. $row['precio'].'</td>  
              <td align="center"> '. $row['precioUSD'].'</td> 
              <td align="center"><a href="index.php?action=editarProductos&idproducto='.$row['idproducto'].'" <i class="fa fa-edit btn btn-primary btn-sm"></i> </a>
               <a class="fa fa-trash btn btn-danger  btn-sm" href="index.php?action=listadoProd&idBorrar='.$row['idproducto'].'" &nbsp;  </a>
              </td>
              </tr>';
       }
	}

   public function getProductosController2(){
      $respuesta = ProductosModel::getProductosModel2('productos');

      foreach ($respuesta as $row) {
        echo '<tr> 
             <td align="center"> '. $row['nombreproducto'].'</td>
             <td align="center"> '. $row['nombrecategoria'].'</td>
             <td align="center"> '. $row['precio'].'</td>
             <td align="center"> '. $row['precioUSD'].'</td>   
             <td align="center">
              <a class="fa fa-recycle btn btn-primary  btn-sm" href="index.php?action=productos_bk&idRestaurar='.$row['idproducto'].'" &nbsp;  </a>
             </td>
             </tr>';
      }
  }

   public function agregarProductosController(){
   	 if (isset($_POST['agregarProductos'])) {
   	 	$datosController = array("nombreproducto"=>$_POST['nombreproducto'],
   	 		                     "idcategoria"=>$_POST['idcategoria'],
   	 		                     "idusuario"=>$_POST['idusuario'],
   	 		                     "precio"=>$_POST['precio'],
                                 "precioUSD"=>$_POST['precioUSD']);
      if ($_POST['idcategoria']==0) {
          header('location:errorProductos');
      }
      else {
   	 	$respuesta = ProductosModel::agregarProductosModel($datosController, 'productos');
  	   if ($respuesta == 'success') {
  	   	 header('location:okProductos');
  	   }else{
             header('location:listadoProd');
 		   }
      }
   	 }
   }

   public function deleteProductosController(){

        if (isset($_GET['idBorrar'])) {
           $datosController = $_GET['idBorrar'];

   #pedir la informacion al modelo.
      $respuesta = ProductosModel::deleteProductosModel($datosController,'productos');
      if ($respuesta == 'success') {
         header('location:borrarProductos');
      }
     }
   }

   public function restaurarProductosController(){

      if (isset($_GET['idRestaurar'])) {
         $datosController = $_GET['idRestaurar'];

   #pedir la informacion al modelo.
      $respuesta = ProductosModel::restaurarProductosModel($datosController,'productos');
      if ($respuesta == 'success') {
         header('location:productos_bk');
      }
    }
   }

    

   public function actualizarProductosController(){
         if (isset($_POST['editarProductos'])) {


          $datosController= array("nombreproducto"=>$_POST['nombreproducto'],
                                  'idcategoria'   =>$_POST['idcategoria'],
                                  'precio'        =>$_POST['precio'],
                                  'precioUSD'     =>$_POST['precioUSD'],
                                  'idusuario'     =>$_POST['idusuario'],
                                  'idproducto'    =>$_POST['idproducto']
                                     );
          #pedir la informacion al modelo.

          $respuesta= ProductosModel::actualizarProductosModel($datosController,'productos');
      
          if ($respuesta == 'success') {
                header('location:okEditar');
          }
        }
     }












}