<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../../assets/css/font-awesome.min.css">
	<title>Ingreso al sistema</title>
</head>

<body>

<div class="row">	
		
	<div class="col-md-12">
    <div class="conta">
	<div class="col-md-12">
    	  <img src="../../assets/img/foto1.jpg"  style="display: block; margin-left: auto; margin-right: auto; width: 60%">
    	</div>
       <h1>Restaurant&nbsp;&nbsp;&nbsp;<i class="fa fa-cutlery"></i> Fresco </h1>
		<form class="" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
		<hr>
	  <div class="form-group">
		 <i class="fa fa-user"></i> <label for="nombreusuario"><b> Nombre del Usuario</b></label>	    
		<input type="text" name="nombreusuario" class="form-control" placeholder="Nombre Usuario ">
	  </div>
	  <div class="form-group">
	      <i class="fa fa-unlock-alt"></i> <label for="password"><b> Contraseña del  Usuario</b></label> 
		<input type="password" name="password" class="form-control" placeholder="Contraseña Usuario">
	  </div><br>
       <?php  if(!isset($_SESSION['nombreusuario'])){
                 require 'btn.php'; }?>
             <?php if (!empty($enviar)): ?>
                 <div class="enviar">
                     <?php echo $enviar;  ?>
                 </div>
              <?php echo $enviado; ?> 
            <?php endif; ?>
            <br>
            <?php if(!empty($error)): ?>
            	<br>
                <div class="error">                
                     <?php echo $error ?>
               </div>
            <?php endif; ?>
		</form>
    </div>
	</div>
</div>
<style>
@import url('https://fonts.googleapis.com/css?family=Chewy');
*{
	padding: 0;
	margin:0;
}

	h1,label{
		
		text-align: center;
	}
	.conta{
		width: 700px;
		margin:auto;
		border: 5px solid #c9c9c9;
		padding: 30px 50px 60px;
		background: #fff;
		border-radius: 7px;
		margin-top: 50px;
	}
	body{
	    background-image: url('../../assets/img/foto2.jpg');
	    opacity: 0.9;
	    margin:auto;
	    background-repeat: no-repeat;
	    background-size: cover;
	}
	.error{
		color: #000;
	}
	.enviar{
		background: #36D05E;
		color: #fff;
		border-radius:8px;
		height: 50px;
	}
	.form-control{
		border-bottom:3px solid #2F49E6;
	}
hr	{
	border: 4px solid #055b7a;
	}
</style>
</body>
<style>
    footer {
        position: relative;
        height: 300px;
        width: 100%;
        background-color: #333333;
    }

    p.copyright {
        position: absolute;
        width: 100%;
        color: #fff;
        line-height: 40px;
        font-size: 0.7em;
        text-align: center;
        bottom:0;
    }
</style>

</html>