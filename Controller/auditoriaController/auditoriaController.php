<?php  
ob_start();

class AuditoriaController {

	public function getAuditoriaController(){
		 $respuesta = AuditoriaModel::getAuditoriaModel('auditoria');

       foreach ($respuesta as $row) {
         echo '<tr> 
              <td align="center"> '. $row['id_auditoria'].'</td>
              <td align="center"> '. $row['tabla'].'</td>
              <td align="center"> '. $row['tipo'].'</td> 
              <td align="center"> '. $row['fecha'].'</td> 
              <td align="center"> '. $row['hora'].'</td>
              <td align="center"> '. $row['usuario'].'</td> 
              <td align="center"> '. $row['valor_id'].'</td> 
              </tr>';
       }
	}

}