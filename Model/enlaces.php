

<?php 



class Paginas{
	
	public function enlacesPaginasModel($enlaces){
		// =============================================================
		// enlacesde ventas
		// =============================================================
		switch ($enlaces) {
		    case "principalVentas":
		    case "buscar":
		    case "principalVentas2":
		        $module =  "Views/modules/ventas/".$enlaces.".php";
		        break;
		    case "mesa1":
		    case "mesa2":
		    case "mesa3":
		    case "mesa4":
		    case "mesa5":
		    case "mesa6":
		    case "mesa7":
		    case "mesa8":
		    case "mesa9":
		    case "mesa10":
		    case "mesa11":
		        $module =  "Views/modules/ventas/principalVentas.php";
		        break;
		    case "ventasDiarias":
		    	$module =  "Views/modules/ventas/ventasDiarias/ventasDiarias.php";
		    	break;
			case "ventasCategoria":
				$module =  "Views/modules/ventas/ventasCategoria/ventasCategoria.php";
				break;
			case "ventasCategoriaC":
				$module =  "Views/modules/ventas/ventasCategoria/ventasCategoriaC.php";
				break;
		    case "imprimir":
				$module =  "Views/modules/ventas/imprimir.php";
				break;
			case "ingresar":
				$module =  "Views/login/login.php";
				break;
			case "reservas":
			case "index" :
			case "okReservas":
			case "borrarReservas":
			case "cambioReservas":
				$module =  "Views/reservas/reservas.php";
				break;
  			case "buscarReservas":
  				$module =  "Views/reservas/buscarReservas.php";
  				break;
			case "editarReservas":
				$module =  "Views/reservas/editarReservas.php";
				break;
			case "salir":
				$module =  "Views/modules/usuarios/salir.php";
				break;
			case "usuarios":
			case "okUsuario":
			case "okBorrado":
			case "okEdiatdoUsuarios":
				$module =  "Views/modules/usuarios/usuarios.php";
				break;
			case "editarUsuarios":
				$module =  "Views/modules/usuarios/editarUsuarios.php";
				break;
			case "usuarios_bk":
				$module =  "Views/modules/usuarios/usuarios_bk.php";
				break;
			case "empleados":
			case "okEmpleados":
			case "okBorradoEmpleados":
			case "okEdiatdoEmpleados":
				$module =  "Views/modules/empleados/empleados.php";
				break;
			case "editarEmpleados":
				$module =  "Views/modules/empleados/editarEmpleados.php";
				break;
			case "atenciones":
			    $module ="Views/modules/atenciones/atenciones.php";
			    break;
			case "reportUsuarios":
				$module =  "Views/modules/usuarios/reportUsuarios.php";
				break;
			case "reportEmpleados":
				$module =  "Views/modules/empleados/reportEmpleados.php";
				break;
			case "reportProductos":
				$module =  "Views/modules/productos/reportProductos.php";
				break;
			case "reportAuditoria":
				$module =  "Views/modules/productos/reportProductos.php";
				break;	
			case "reportOrdenes":
				$module =  "Views/modules/ordenes/reportOrdenes.php";
				break;
			case "reportReservas":
				$module =  "Views/modules/reservas/reportReservas.php";
				break;
			case "HistoricoProductos":
				$module =  "Views/modules/productos/historicoProductos.php";
				break;
			case "HistoricoUsuarios":
				$module =  "Views/modules/usuarios/historicoUsuarios.php";
				break;
			case "HistoricoEmpleados":
				$module =  "Views/modules/empleados/historicoEmpleados.php";
				break;
			case "listadoProd":
			case "okProductos":
			case "errorProductos":
			case "borrarProductos":
			case "okEditar":
				$module =  "Views/modules/productos/listadoProd.php";
				break;
			case "productos_bk":
				$module =  "Views/modules/productos/listadoProd_bk.php";
				break;
			case "listadoAudit":
				$module =  "Views/modules/auditorias/listadoAudit.php";
				break;
			case "editarProductos":
				$module =  "Views/modules/productos/editarProductos.php";
				break;
			case "nosotros":
			     $module =  "Views/modules/nosotros/nosotros.php";
			     break;
            case "nosotros1":
			     $module =  "Views/modules/nosotros/nosotros1.php";
			     break;
            case "nosotros2":
			     $module =  "Views/modules/nosotros/nosotros2.php";
			     break;


			case "categorias":
			case "okCategorias":
			case "okEdit":
			case "borrarCategorias":
				$module =  "Views/modules/categorias/categorias.php";
				break;
			case "categorias_bk":
				$module =  "Views/modules/categorias/categorias_bk.php";
				break;
 			case "borrarCat":
 				$module =  "Views/modules/categorias/borrarCategorias.php";
 				break;
			case "editarcategoria":
				$module =  "Views/modules/categorias/editarCategorias.php";
				break;
			case "mesas":
			case "okMesas":
			case "okEditMesas":
			case "borrarMesas":
				$module =  "Views/modules/mesas/mesas.php";
				break;
 			case "borrarMes":
 				$module =  "Views/modules/mesas/borrarMesas.php";
 				break;
			case "editarmesa":
				$module =  "Views/modules/mesas/editarMesas.php";
				break;
			case "backup":
				$module =  "Views/modules/backup/backup.php";
				break;
			default:
				$module =  "Views/reservas/reservas.php";
				break;
			}
			return $module;
	}





	#--------------------------------------------------------
	#enlaces de la aplicacion 
}
 ?>


 <?php 

require_once 'telegram.php';
  ?>