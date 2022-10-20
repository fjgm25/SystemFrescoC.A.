  <div class="modal fade bd-example" id="mesas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="exampleModalLabel">Nueva Mesa</h4>
        </div>
        <div class="modal-body">

          <form method="post">
          <div class="row">
            <div class="col-md-12">  
              <div class="form-group">
               <center> <label for="mesa-name" class="form-control-label">Nombre Mesa :</center></label>       
                <input type="text" class="form-control" id="mesa-name" name="mesa"  onblur="soloMayusculasN('mesa')" required="">
              </div>
            </div>
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" name="agregarMesas">Agregar Mesa</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<?php  
$regis = new MesasController();
$regis->agregarMesasController();
?>