
<div class="modal fade" id="bebidas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar a las Mesas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" id='productospedidos'>
        <div class="row">  
        <div class="col-md-6">
         
             <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'BEBIDAS'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listabebida" name="listabebida">
           <option value="0"  required="" >SELECCIONA UNA BEBIDA</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>

              <?php endforeach ?>
        </select>
        </div>
<br>
     <div class="col-md-6">
             <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'CARNES'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listaplatocarne" name="listaplatocarne">
           <option value="0"  required="" >SELECCIONA PLATO DE CARNE</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
      </div>
           <div class="col-md-6">
<br><br>
     <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'POSTRES'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listapostre" name="listapostre">
           <option value="0"  required="" >SELECCIONA UN POSTRE</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio']  ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
        <div class="col-md-6">
        <br><br>
     <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'ENSALADAS'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listaensalada" name="listaensalada" required="">
           <option value="0"  required="" >SELECCIONA ENSALADAS</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio']  ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
         <div class="col-md-6">
        <br><br>
      <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'NAVIDAD'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listanavideno" name="listanavideno" required="">
           <option value="0"  required="" >SELECCIONA NAVIDEÑOS</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
         <div class="col-md-6">
        <br><br>
      <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'PANES'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listapanes" name="listapanes" required="">
           <option value="0"  required="" >SELECCIONA PANES</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
         <div class="col-md-6">
        <br><br>
              <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'DESAYUNO'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listadesayuno" name="listadesayuno" required="">
           <option value="0"  required="" >SELECCIONA DESAYUNO</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
         <div class="col-md-6">
        <br><br>
              <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'PIZZAS'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listapizza" name="listapizza" required="">
           <option value="0"  required="" >SELECCIONA PIZZA</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
         <div class="col-md-6">
        <br><br>

     <?php             
            $consul = $conexion->query("SELECT * FROM productos pro JOIN categorias cat ON pro.idcategoria = cat.idcategoria WHERE nombrecategoria= 'ADICIONALES'  order by nombreproducto asc");      
            ?>
          <select class="form-control chosen-select" id="listaadicionales" name="listaadicionales">
           <option value="0"  required="" >SELECCIONA ADICIONALES</option> 
                <?php foreach ($consul as $fila): ?>
             <option value="<?php echo $fila['idproducto']. '-' .$fila['nombreproducto']. '-' .  $fila['precio'] ?>"> <?php echo ucwords($fila['nombreproducto'])?> 
            </option>
              <?php endforeach ?>
        </select>
        </div>
       
      </div>
        <input type="hidden" name="fecha" id="fecha" value="<?php echo  date('d-m-Y') ?>">
        <input type="hidden" name="hora" id="hora" value="<?php echo  date('H:i:s') ?>">
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button type="submit" name="agregarBebidas" id="agregarBebidas" class="btn btn-primary">Agregar</button>
      </div>
     </form>
    </div>
  </div>
</div>
 </div>