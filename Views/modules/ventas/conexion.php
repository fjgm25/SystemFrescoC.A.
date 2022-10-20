<?php 
 $conexion = new PDO('mysql:host=localhost;dbname=restaurant','root','');
   date_default_timezone_set('America/Caracas');
 $conexion->exec('SET CHARACTER SET utf8');
 ?>
