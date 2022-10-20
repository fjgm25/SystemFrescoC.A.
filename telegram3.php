<?php  
require "componente.php"


?>




<?php
	
	
		$apiToken = "5523187269:AAHfo_lyDpGl2pM0MQGHSXNbJglsb2BHoYI";
		$data = [
		    'chat_id' => '@frescorestaurante', 
		    'text' => $_POST['tel3']
		];


		$response = getSslpage("https://api.telegram.org/bot$apiToken/sendMessage?" . http_build_query($data) );	
	
?>