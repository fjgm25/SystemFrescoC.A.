<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <link rel="stylesheet" href="assets/css/bootstrap.css"> 
  <link rel="stylesheet" href="assets/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="assets/css/responsive.bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="assets/css/estilos.css"> 
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/chosen/chosen.min.css">
  <script src="assets/js/lib/jquery.min.js"></script>
  <script src="assets/js/lib/jquery.dataTables.js"></script>
  <script src="assets/js/lib/dataTables.bootstrap.min.js"></script>
  <script src="assets/js/lib/dataTables.responsive.min.js"></script>
  <script src="assets/js/lib/responsive.bootstrap.min.js"></script>
  <script src="assets/js/lib/jquery-ui.min.js"></script>
  <script src="assets/chosen/chosen.jquery.min.js"></script>  
  <script src="assets/js/chosen.js"></script>  
  <script src="assets/js/lib/bootstrap.js"></script>  
  <script src="assets/js/lib/menu.js"></script>  
  <script src="assets/js/calendario.js"></script>  
  <title>Administrador</title>
</head>
<body>
<?php if ($_SESSION['tipo_usuario'] == 1 OR $_SESSION['nombreusuario'] == 'admin') { ?>
<nav class="navbar navbar-dark bg-primary">
  <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
  <div class="collapse navbar-toggleable-md" id="navbarResponsive">
    <ul class="nav navbar-nav">
       <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> Reservas</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="index"><i class="btn btn-dark btn-sm  fa fa-address-book"></i>Listado Reservas</a>
        </div>
      </li>
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-product-hunt" aria-hidden="true"></i> Platillos</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="listadoProd"><i class="btn btn-primary btn-sm  fa fa-list-ol"></i> Listado Platillos</a>
        </div>
      </li>
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-universal-access" aria-hidden="true"></i> Categorías</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="categorias"><i class="btn btn-dark btn-sm  fa fa-codiepie"></i> Listado Categorias</a>
        </div>
      </li> 
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-table" aria-hidden="true"></i> Mesas</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="principalVentas"><i class="btn btn-primary btn-sm  fa fa-list-ol"></i> Listado Mesas</a>
           <a id="sub" class="dropdown-item" href="mesas"><i class="btn btn-primary btn-sm  fa fa-cogs"></i> Configurar Mesas</a>
        </div>
      </li> 
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Reportes</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown"> 
          <a id="sub" class="dropdown-item" href="ventasCategoria"><i class="btn btn-success btn-sm  fa fa-usd"></i> Reporte Ventas Diarias</a> 
          <a id="sub" class="dropdown-item" href="ventasCategoriaC"><i class="btn btn-success btn-sm  fa fa-usd"></i> Reporte Ventas Consolidado</a> 
          <a id="sub" class="dropdown-item" href="reportProductos"><i class="btn btn-success btn-sm  fa fa-product-hunt"></i> Reporte Platillos</a>
          <a id="sub" class="dropdown-item" href="reportReservas"><i class="btn btn-success btn-sm  fa fa-flag"></i> Reporte Reservas</a>
          <a id="sub" class="dropdown-item" href="reportOrdenes"><i class="btn btn-success btn-sm  fa fa-plus-square"></i> Reporte Ordenes</a>
           <a id="sub" class="dropdown-item" href="reportUsuarios"><i class="btn btn-success btn-sm  fa fa-street-view"></i> Reporte Usuarios</a>
           <a id="sub" class="dropdown-item" href="reportEmpleados"><i class="btn btn-success btn-sm  fa fa-group"></i> Reporte Empleados</a>
           <a id="sub" class="dropdown-item" href="atenciones"><i class="btn btn-success btn-sm  fa fa-money"></i> Reporte Atenciones</a>
        </div>
      </li> 
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-history" aria-hidden="true"></i> Auditoria</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="listadoAudit"><i class="btn btn-dark btn-sm  fa fa-eye"></i>Registros de Auditoria</a>
	  <a id="sub" class="dropdown-item" href="ventasDiarias"><i class="btn btn-dark btn-sm  fa fa-usd"></i>Reporte Auditoria Ventas Detallado</a>
          <a id="sub" class="dropdown-item" href="HistoricoProductos"><i class="btn btn-dark btn-sm  fa fa-list-ol"></i> Reporte Historico Platillos</a>
          <a id="sub" class="dropdown-item" href="HistoricoUsuarios"><i class="btn btn-dark btn-sm  fa fa-street-view"></i> Reporte Historico Usuarios</a>
          <a id="sub" class="dropdown-item" href="HistoricoEmpleados"><i class="btn btn-dark btn-sm  fa fa-group"></i> Reporte Historico Empleados</a>
          <a id="sub" class="dropdown-item" href="categorias_bk"><i class="btn btn-dark btn-sm  fa fa-recycle"></i> Restaurar Categorias</a>
          <a id="sub" class="dropdown-item" href="productos_bk"><i class="btn btn-dark btn-sm  fa fa-recycle"></i> Restaurar Platillos</a>
          <a id="sub" class="dropdown-item" href="usuarios_bk"><i class="btn btn-dark btn-sm  fa fa-recycle"></i> Restaurar Usuarios</a>
        </div>
      </li>

 <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-address-card" aria-hidden="true"></i> Quienes somos </a>

<div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="nosotros"><i class="btn btn-dark btn-sm  fa fa-eye"></i>información</a>
           <a id="sub" class="dropdown-item" href="nosotros1"><i class="btn btn-dark btn-sm  fa fa-eye"></i>ubicación y contacto</a>
             <a id="sub" class="dropdown-item" href="nosotros2"><i class="btn btn-dark btn-sm  fa fa-eye"></i>Estructura organizativa</a>
        </div>


      </li>









<!-- User ================================================================================= -->
       <li class="nav-item dropdown  nav-item active float-xs-right">
         <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-windows" aria-hidden="true"></i> Hola! <?php echo  ' ' .strtoupper($_SESSION[ 'nombreusuario']); ?></a>
         <div class="dropdown-menu" aria-labelledby="responsiveNavbarDropdown">
          <a class="dropdown-item" href="salir"><i class="btn btn-danger btn-sm fa fa-window-close-o"> </i>Cerrar Sesión</a>
          <a class="dropdown-item" href="usuarios"><i class="btn btn-primary btn-sm fa fa-user-circle"></i>Usuarios</a>
          <a class="dropdown-item" href="empleados"><i class="btn btn-primary btn-sm fa fa-male"></i>Empleados</a>
          <a class="dropdown-item" href="backup"><i class="btn btn-danger btn-sm fa fa-database"></i>Backup</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<?php }
else {
  if ($_SESSION['tipo_usuario'] == 2){ ?>

  <!-- #===============================================================
   Fin
  0===================================================================== -->
<nav class="navbar navbar-dark bg-primary">
  <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
  <div class="collapse navbar-toggleable-md" id="navbarResponsive">
     <ul class="nav navbar-nav">
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-product-hunt" aria-hidden="true"></i> Productos</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="listadoProd"><i class="btn btn-primary btn-sm  fa fa-list-ol"></i> Listado Platillos</a>
        </div>
      </li>
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-usd" aria-hidden="true"></i> Ventas</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="principalVentas"><i class="btn btn-primary btn-sm  fa fa-list-ol"></i> Listado Mesas</a>
        </div>
      </li> 
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-newspaper-o" aria-hidden="true"></i>Reportes</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
          <a id="sub" class="dropdown-item" href="ventasCategoria"><i class="btn btn-success btn-sm  fa fa-usd"></i>Reportes Ventas Diarias</a> 
          <a id="sub" class="dropdown-item" href="ventasCategoriaC"><i class="btn btn-success btn-sm  fa fa-usd"></i>Reportes Ventas Consolidado</a>
          <a id="sub" class="dropdown-item" href="reportProductos"><i class="btn btn-danger btn-sm  fa fa-usd"></i>Reportes Platillos</a>
          <a id="sub" class="dropdown-item" href="reportOrdenes"><i class="btn btn-danger btn-sm  fa fa-usd"></i>Reportes Ordenes</a> 
          <a id="sub" class="dropdown-item" href="atenciones"><i class="btn btn-success btn-sm  fa fa-cog"></i>Reporte Atenciones</a> 
        </div>
      </li> 

      

      <!-- USUARIO NO ADMINISTRADOR -->
       <li class="nav-item dropdown  nav-item active float-xs-right">
         <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-windows btn btn-warning btn-sm" aria-hidden="true"></i> Hola ! <?php echo  ' ' .strtoupper($_SESSION[ 'nombreusuario']);  ?></a>
         <div class="dropdown-menu" aria-labelledby="responsiveNavbarDropdown">
          <a class="dropdown-item" href="salir"><i class="btn btn-primary btn-sm fa fa-window-close-o"> </i> Cerrar Sesión</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<?php 
}
else
{
 ?>
<nav class="navbar navbar-dark bg-primary">
  <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
  <div class="collapse navbar-toggleable-md" id="navbarResponsive">
    <a class="navbar-brand" href="index"><i class="fa fa-table" aria-hidden="true"></i> Reservas</a>
    <ul class="nav navbar-nav">
    <a class="navbar-brand" href="principalVentas"><i class="fa fa-list-ol" aria-hidden="true"></i>Listado Mesas</a> 
      <li class="nav-item dropdown nav-item active">
        <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-newspaper-o" aria-hidden="true"></i>Reportes</a>
        <div class="dropdown-menu" id="sub" aria-labelledby="responsiveNavbarDropdown">
         <a id="sub" class="dropdown-item" href="reportReservas"><i class="btn btn-danger btn-sm  fa fa-usd"></i>Reportes Reservas</a>
         <a id="sub" class="dropdown-item" href="reportOrdenes"><i class="btn btn-danger btn-sm  fa fa-usd"></i>Reportes Ordenes</a>
        </div>
      </li> 
      <!-- USUARIO NO ADMINISTRADOR -->
       <li class="nav-item dropdown  nav-item active float-xs-right">
         <a class="nav-link dropdown-toggle" href="#" id="responsiveNavbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-windows btn btn-warning btn-sm" aria-hidden="true"></i> Hola ! <?php echo  ' ' .strtoupper($_SESSION[ 'nombreusuario']);  ?></a>
         <div class="dropdown-menu" aria-labelledby="responsiveNavbarDropdown">
          <a class="dropdown-item" href="salir"><i class="btn btn-primary btn-sm fa fa-window-close-o"> </i> Cerrar Sesión</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<?php 
  }
}
 ?>
   
