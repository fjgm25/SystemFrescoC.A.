<?php 
			


			function getSslpage($url)
			{
				$ch = curl_init();

						
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION , TRUE);
		curl_setopt($ch, CURLOPT_URL,"$url");
		curl_setopt($ch, CURLOPT_REFERER,"$url");
		curl_setopt($ch, CURLOPT_RETURNTRANSFER,TRUE);
		$result = curl_exec($ch);
		curl_close($ch);
		return$result;
			}
 



			 	?>





