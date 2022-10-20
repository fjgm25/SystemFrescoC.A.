<?php  
    ob_start();
    include 'conexion.php';

    $recibido = '';
    $mensaje ='';

     if (isset($_REQUEST['action'])) 
	 {    
	 	$recibido = $_POST['action'];

	 	//  se cargan articulos para una mesa --------------------------------------------------

	    if($recibido!='' && $recibido!='EliminarOrdenProducto' && $recibido!='FacturarMesa' && $recibido!='cambio cantidad mesa' && $recibido!='VerMesa')
	    {
            $codmesa = $_POST['codmesa'];
            $usuario = $_POST['usuario'];
            $empleado = $_POST['empleado'];
            $mesa = $_POST['mesa'];

	    	    

           date_default_timezone_set ('America/Caracas');

    // fecha
        $week_days = array ("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado");  
        $months = array ("", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");  
        $year_now = date ("Y");  
        $month_now = date ("n");  
        $day_now = date ("j");  
        $week_day_now = date ("w");  
        $date = $week_days[$week_day_now] . ", " . $day_now . " de " . $months[$month_now] . " de " . $year_now;   
        
        //hora
        $am_pm = date("a");
        $hora = date("h");
        $minuto = date("i");
        $horacom = $hora.":".$minuto." ".$am_pm;
        
    // dia
    $dia =  date("Y-m-d");

           foreach($recibido as $fila) 
           {   $idorden = '';

           	   $consultaselect = "select idorden from ordenes where codmesa='".$codmesa."' and idproducto='".$fila[0]."' and precio='".$fila[2]."' and mesa like'%".$mesa."%' and estado='Pendiente'";           	  

           	   
           	   foreach($conexion->query($consultaselect) as $key) { $idorden = $key['idorden']; }
           	   //$mensaje.='ID:'.$idorden.'------';           	   
				

           	    if($idorden=='') // el producto se inserta por primera vez
           	    {
                    $consultainsert = "insert into ordenes(codmesa,idproducto,precio,cantidad,total,fecha,hora,dia,usuario,empleado, mesa,estado) values ('".$codmesa."','".$fila[0]."','".$fila[2]."','".$fila[3]."','".$fila[4]."','".$date."','".$horacom."','".$dia."','".$usuario."','".$empleado."','".$mesa."','Pendiente')";

                 	 $ejecutar_consultainsert = $conexion->query($consultainsert);
                 	 //$mensaje.='-pasó por insert-';
           	    }
           	    else // el producto ya está cargado y se actualiza
           	    {
           	    	$consultaupdate = "update ordenes set cantidad='".$fila[3]."', total='".$fila[4]."', fecha='".$date."' ,hora='".$horacom."', usuario='".$usuario."' ,empleado='".$empleado."' where idorden=".$idorden;

           	    	$ejecutar_consultaupdate = $conexion->query($consultaupdate);
           	    	//$mensaje.='-pasó por update-';
           	    }

           	    
           }

           //echo $mensaje;
	    }




	    //  se eliminan articulos para una mesa --------------------------------------------------
	    
	    if($recibido=='EliminarOrdenProducto')
	    {
        $codmesa = $_POST['codmesa'];
        $idproducto = $_POST['idproducto'];

        $idorden = '';

        $consultaselect = "select idorden from ordenes where codmesa='".$codmesa."' and idproducto='".$idproducto."' and estado='Pendiente'";               

        foreach($conexion->query($consultaselect) as $key) { $idorden = $key['idorden']; }            
        $consultaupdate = "update ordenes set estado='Eliminado' where idorden=".$idorden;

        $ejecutar_consultaupdate = $conexion->query($consultaupdate); 
	    	echo 'Articulo Eliminado';
	    }

	    //  se facturan articulos para una mesa --------------------------------------------------

	    if($recibido=='FacturarMesa')
	    {
        $codmesa = $_POST['codmesa'];
        $usuariox = $_POST['usuario'];
        
                    
        $consultaupdate = "update ordenes set estado='Facturado' where estado='Pendiente' and codmesa='".$codmesa."'";
        $ejecutar_consultaupdate = $conexion->query($consultaupdate); 

        // inserta en la tabla atenciones
        $consultainsert = "insert into atencion(idmesa,usuario,estado) values ('".$codmesa."','".$usuariox."','Facturado')";
        $ejecutar_consultainsert = $conexion->query($consultainsert);

        //consultar el ultimo id ingresado en tabla atencion
        $consultaselect = "select idatencion from atencion order by idatencion desc limit 1";  
        $idatencion='';       

        foreach($conexion->query($consultaselect) as $key) 
        { 
          $idatencion = $key['idatencion'];
        }

        // actualizar campo idatencion con el id insertado
      $consultaupdatex = "update ordenes set idatencion='".$idatencion."' where idatencion='0' and codmesa='".$codmesa."'";
        $ejecutar_consultaupdatex = $conexion->query($consultaupdatex); 


	    	echo $usuariox;
	    }

	    //  se consulta que hay cargado para mesa --------------------------------------------------
	    if($recibido=='VerMesa')
	    {
        $codmesa = $_POST['codmesa'];

        $consultaselect = "select O.idproducto, P.nombreproducto, O.precio, O.cantidad, O.total from ordenes O, productos P where O.codmesa = '".$codmesa."' and O.estado='Pendiente' and O.idproducto=P.idproducto";    

        $ordenmesa='';          

        foreach($conexion->query($consultaselect) as $key) 
        { 

          $ordenmesa.= "<tr id='row".$key['idproducto']."'><td>".$key['idproducto']."</td><td>".$key['nombreproducto']."</td><td id='preuni".$key['idproducto']."' style='width:10px'>".$key['precio']."</td><td><input class='form-control form-control-sm' id='".$key['idproducto']."' style='width:80px' type='text' value='1' onchange='totalizar(".$key['idproducto'].")' /></td><td id='totaluni".$key['idproducto']."'>".$key['total']."</td><td><button onclick='eliminarProducto(".$key['idproducto'].")' type='button'><i class='fa fa-trash-o btn btn-danger btn-sm'></i></button></td></tr>";
        }

	    	echo $ordenmesa;
	    }


	    //  actualiza por cambio de cantidad --------------------------------------------------
	    if($recibido=='cambio cantidad mesa')
	    {  

	        $mensaje = 'cambio cantidad mesa';
	    	$arreglo = $_POST['arreglo'];
	    	$codmesa = $_POST['codmesa'];
            $usuario = $_POST['usuario'];
            $empleado = $_POST['empleado'];
            $mesa = $_POST['mesa'];	    	    

           date_default_timezone_set ('America/Caracas');

	   		 // fecha
	        $week_days = array ("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado");  
	        $months = array ("", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");  
	        $year_now = date ("Y");  
	        $month_now = date ("n");  
	        $day_now = date ("j");  
	        $week_day_now = date ("w");  
	        $date = $week_days[$week_day_now] . ", " . $day_now . " de " . $months[$month_now] . " de " . $year_now;   
	        
	        //hora
	        $am_pm = date("a");
	        $hora = date("h");
	        $minuto = date("i");
	        $horacom = $hora.":".$minuto." ".$am_pm;
        
            $idorden = '';

           	$consultaselect = "select idorden from ordenes where codmesa='".$codmesa."' and idproducto='".$arreglo[0]."' and precio='".$arreglo[1]."' and mesa like'%".$mesa."%' and estado='Pendiente'";           	  

           	foreach($conexion->query($consultaselect) as $key) { $idorden = $key['idorden']; }
           	
           	$consultaupdate = "update ordenes set cantidad='".$arreglo[2]."', total='".$arreglo[3]."', fecha='".$date."' ,hora='".$horacom."', usuario='".$usuario."' ,empleado='".$empleado."' where idorden=".$idorden;

           	$ejecutar_consultaupdate = $conexion->query($consultaupdate);  

	    	//echo $mensaje;
	    	
	    }


     }

 ?>


 