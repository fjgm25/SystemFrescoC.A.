<?php 
	class Conexion{
		public static function conectar(){
			try {
				$conexion = new PDO('mysql:host=localhost;dbname=restaurant','root','');
				$conexion->exec('SET CHARACTER SET utf8');
				$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				return $conexion;
			} catch (Exception $e) {
				echo "ERROR DE CONEXION". $e->getMessage. $e->getLine;
			}
		}
	}
