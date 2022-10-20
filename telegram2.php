
<?php  
require "componente.php"
?>


<?php
	
	
		$apiToken = "5584242745:AAGzyR2vWh2Nwqd0ATXTPCKHDKWcOWdyuyA";
		$data = [
		    'chat_id' => '@frescorestaurante', 
		    'text' => $_POST['tel2']
		];


		$response = getSslpage("https://api.telegram.org/bot$apiToken/sendMessage?" . http_build_query($data) );	
	
?>




