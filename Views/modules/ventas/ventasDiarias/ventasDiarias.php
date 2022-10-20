<div class="container">
<?php 
   require 'Views/modules/ventas/conexion.php';
   if (isset($_POST['reporteVenta'])) {
     date_default_timezone_set('America/Caracas');
    // $fechaInicial = date('d-m-Y' , strtotime( $_POST['fechaInicial']));
     //$fechaFinal   = date('d-m-Y' , strtotime($_POST['fechaFinal']));
     $fechaInicial = $_POST['fechaInicial'];
     $fechaFinal   = $_POST['fechaFinal'];

    $sql = $conexion->prepare('SELECT fecha, idproducto, SUM(total) AS "TOTAL" FROM ordenes
             WHERE dia BETWEEN  "'.$fechaInicial.'" AND "'.$fechaFinal.'" GROUP BY dia, idproducto ORDER BY dia ASC');
    $sql->execute();
    $respuesta = $sql->fetchAll();
    // var_dump($respuesta);
   }
   error_reporting(E_ERROR  | E_PARSE);
 ?>

    <ol class="breadcrumb">
      <li class="breadcrumb-item active"><i class="fa fa-list"> </i> VENTAS DIARIAS</li>
   </ol>
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
  <li class="nav-item">
    <a class="nav-link " id="uno" data-toggle="tab" href="#home" role="tab">Consultar Por Fechas</a>
  </li>
</ul>
<br>
<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane active" id="home" role="tabpanel">
     
<div id="formulario">
    <form method="post">
    <div class="row">
        <div class="col-md-6">
           <i class="fa fa-calendar"> </i> Fecha Inicial :
            <input type="date" name="fechaInicial" id="" class="form-control" required="">
        </div>

        <div class="col-md-6">
           <i class="fa fa-calendar"> </i> Fecha Final : 
            <input type="date" name="fechaFinal" id="" class="form-control" required="">
        </div>
    </div>
    <center>
    <div class="col-md-8 my-2">       
        <input type="submit" style="width: 13%; margin: 0px auto; display: flex; justify-content: center;" name="reporteVenta" value="Consultar" class="btn btn-outline-primary" id="consulta">
      </div>
    </center>
    </form>
</div>
  </div>
  <div class="tab-pane" id="profile" role="tabpanel">
  </div>
</div>
<center>
    
<?php  if ($fechaInicial > $fechaFinal) :
      echo "<h3>Error En La selección de las Fechas</h3>";
    ?>
    <br>
      
<?php else : ?>
            <?php //foreach ($respuesta as $key ): ?>
 <?php 
  echo "<h3>El Rango de Busqueda es: " .$fechaInicial ." Hasta: " .$fechaFinal. '</h3>';
 
 ?> 
            <div class="col-md-8">
               <table class="table table-bordered">
                 <thead class="bg-danger">
                     <tr>
                         <td class="td" align="center"> FECHA </td>
                         <td class="td" align="center"> CODIGO DE PRODUCTO  </td>
                         <td class="td" align="center"> TOTAL  </td>
                     </tr>
                 </thead>  
                 <?php foreach ($respuesta as $key ): ?>             
                    <tbody>
                         <td class="reportes" align="center">
                         <?php if($key['TOTAL'] == ''){
                             echo "<h4> No se Encontraron Datos en Las Fechas Seleccionadas </h4>";
                            }else{
                                 echo $key['fecha'] ;
                                } ?> </td>
                         <td class="reportes" align="center"> <?php echo "  " . $key['idproducto'] ?>  </td>
                          <td class="reportes" align="center"><i class="fa fa-usd"> </i> <?php echo "  " . $key['TOTAL'] ?>  </td>
                    </tbody>
                    <?php endforeach ?>
                   <button class="btn btn-info" onclick="return ImprimirVentas(<?php echo "'".$fechaInicial."'"; ?>,<?php echo "'".$fechaFinal."'"; ?>)">IMPRIMIR</button><br><br>
                 <?php //endforeach ?>
             <?php endif ; ?>
                </table>
           </div>
</center>
</div>
<script>


$(document).ready(function(){
    $("#uno").addClass("active");
  $("#uno").click(function(){
    $("#uno").addClass("active");
    $('#dos').removeClass('active');
  });
  $("#dos").click(function(){
    $("#dos").addClass("active");
      $('#uno').removeClass('active');
  });
  
});
</script>
<script src="../../../../assets/js/script.js"></script>
<script>
 $(document).ready(function(){
    $('#consulta').click( function(){
           $('#formulario').hide('slow'); 
    })
 }())
</script>
