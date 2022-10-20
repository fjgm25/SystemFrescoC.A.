<?php session_start();
	try {
		$error = '';
		$enviar='';
		$enviado='';
		$conexion = new PDO('mysql:host=localhost;dbname=restaurant', 'root','');
		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$nombreusuario = $_POST['nombreusuario'];
			$password = $_POST['password'];
			$hasher=$password.$nombreusuario;
     		$sql = $conexion->prepare('SELECT * FROM usuarios WHERE nombreusuario = :nombreusuario AND password =SHA2(:password,512)');
    // $sql->execute(array(':nombreusuario'=>$nombreusuario,':password'=>$password));
     		$sql->execute(array(':nombreusuario'=>$nombreusuario,':password'=>$hasher));
		    $resultado = $sql->fetch();
	        if ($resultado != false) {
		      $_SESSION['nombreusuario'] = $nombreusuario;
		      $_SESSION['tipo_usuario'] = $resultado['tipo_usuario'];
		      $enviar .=  '<center> Bienvenido <br>'. ucwords($resultado['nombreusuario']).'</center> <br>';
		      $enviar .= '<meta http-equiv="refresh" content="4;url=../../index">';
		      $enviado .= '<center><i class="fa fa-cog fa-spin fa-3x fa-fw"></i><br><span class="">Accediendo Al Sistema...</span></center><br>';
		    }
		    else {
	   		$error .= '<li class="alert alert-danger"> Verifique que Los campos esten llenos o que los Datos ingresados sean los correctos </li>';  
			}
		}
	} catch (Exception $e) {
		echo "";
	}
	require 'login.view.php';
 ?>