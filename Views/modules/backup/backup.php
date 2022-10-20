<?php
$conn = mysqli_connect("localhost", "root", "", "restaurant");
if (! empty($_FILES)) {
    // Validating SQL file type by extensions
    if (! in_array(strtolower(pathinfo($_FILES["backup_file"]["name"], PATHINFO_EXTENSION)), array(
        "sql"
    ))) {
        $response = array(
            "type" => "error",
            "message" => "Tipo de archivo no valido"
        );
    } else {
        if (is_uploaded_file($_FILES["backup_file"]["tmp_name"])) {
            move_uploaded_file($_FILES["backup_file"]["tmp_name"], $_FILES["backup_file"]["name"]);
            $response = restoreMysqlDB($_FILES["backup_file"]["name"], $conn);
        }
    }
}

function restoreMysqlDB($filePath, $conn)
{
    $sql = '';
    $error = '';
    
    if (file_exists($filePath)) {
        $lines = file($filePath);
        
        foreach ($lines as $line) {
            
            // Ignoring comments from the SQL script
            if (substr($line, 0, 2) == '--' || $line == '') {
                continue;
            }
            
            $sql .= $line;
            
            if (substr(trim($line), - 1, 1) == ';') {
                $result = mysqli_query($conn, $sql);
                if (! $result) {
                    $error .= mysqli_error($conn) . "\n";
                }
                $sql = '';
            }
        } // end foreach
        
        if ($error) {
            $response = array(
                "type" => "error",
                "message" => $error
            );
        } else {
            $response = array(
                "type" => "success",
                "message" => "Restauracion realizada exitosamente"
            );
        }
        exec('rm ' . $filePath);
    } // end if file exists
    
    return $response;
}

?>
<div class="container">
    <ol class="breadcrumb">
      <li class="breadcrumb-item active"><i class="fa fa-list"></i>BACKUP</li>
   </ol>
<style>


#frm-restore {
   /* background: #aee5ef;*/
    padding: 20px;
   /* border-radius: 2px;
    border: #a3d7e0 1px solid;*/
    width: 100%;
}

.form-row {
    margin-bottom: 20px;
}

.input-file {
    background: #FFF;
    padding: 10px;
    margin-top: 5px;
    border-radius: 2px;
}

.btn-action {
    background: #333;
    border: 0;
    padding: 10px 40px;
    color: #FFF;
    border-radius: 2px;
}

.response {
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 2px;
}

.error {
    background: #fbd3d3;
    border: #efc7c7 1px solid;
}

.success {
    background: #cdf3e6;
    border: #bee2d6 1px solid;
}
</style>
<!-- Tab panes -->
  <div class="col-md-6">
     <table class="table table-bordered">
         <button class="btn btn-dark" onclick="return Backup()">REALIZAR BACKUP</button><br><br>
      </table>
    </div>
    <ol class="breadcrumb">
      <li class="breadcrumb-item active"><i class="fa fa-list"></i>RESTAURACION</li>
   </ol>
<?php
if (! empty($response)) {
    ?>
<div class="response <?php echo $response["type"]; ?>">
<?php echo nl2br($response["message"]); ?>
</div>
<?php
}
?>
 <form method="post" action="" enctype="multipart/form-data"
        id="frm-restore">
        <div class="form-row">
            <div>Seleccionar Archivo a restaurar</div>
            <div>
                <input type="file" name="backup_file" class="input-file" />
            </div>
        </div>
        <div>
            <input type="submit" name="restore" value="RESTAURAR"
                class="btn-action" />
        </div>
    </form>
 </center>

<script src="../../../../assets/js/script.js"></script>


