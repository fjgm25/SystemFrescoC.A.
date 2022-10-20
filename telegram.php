

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurante Fresco</title>
    <link rel="stylesheet" href="assets/css/chat.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;600;800&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="images/favicon.png" >

    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

 





</head>
<body id="cuerpo">
    <!-- Chat -->

<div   id="caj1">
    <div  id="caj2">
        
<div>
    
</div>


  

    <div id="chat" class="chat">
        <div class="chat-cabecera">
            <div class="chat-cabecera-avatar">
                <img src="logo.jpg" alt="Restaurante Fresco" />
            </div>
            <div class="chat-cabecera-texto">
                <div class="chat-cabecera-texto-nombre">Restaurante Fresco</div>
                <div class="chat-cabecera-texto-estado">Normalmente respondo dentro del dia</div>
            </div>
        </div>
        <div class="chat-cuerpo">
            <div class="chat-cuerpo-dentro">
      
       <div class="form">
            <div class="bot-inbox inbox">
                <div class="icon">
                    <i class="fas fa-user"></i>
                </div>


                <div class="msg-header" >
                    

                    <p align="justify">Hola, ¿cómo puedo ayudarte?</p>
                </div>
            </div>
        </div> 
           

         

        <div class="typing-field">
            <div class="input-data">
        
                <input id="data" type="text" placeholder="Escribe algo aquí.." >
                <button id="send-btn"  onclick="Enviar();">Enviar   </button>
                <div id="resultado">   </div>
               
                </div>
        </div>
    
            </div>
        </div>
        <div class="chat-pie">
            <a href="https://t.me/restafres_bot" target="blank" class="chat-pie-boton">
                <svg width="28" height="28" viewBox="0 0 18 18" fill="currentColor">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z"/>
                </svg>                    
                Ir a Telegram
            </a>
        </div>
    </div>
    <!--Burbuja  -->
    <div id="burbuja" class="burbuja">
        
        <svg  class="burbuja-icono"  xmlns="http://www.w3.org/2000/svg" width="66" height="66" fill="currentColor" class="bi bi-telegram" viewBox="0 0 16 16"> <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z"/> </svg>          
    </div>

    </div>

</div>




 <script type="text/javascript">
function objetoAjax(){
var xmlhttp=false;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
           xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            xmlhttp = false;
        }
    }

    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}


function Enviar(){
valor= document.getElementById("data").value;
ajax= objetoAjax();
ajax.open("POST","telegram2.php", true);
ajax.onreadystatechange=function(){

if (ajax.readyState==4) {
       document.getElementById("resultado").innerHTML=ajax.responseText;


}

}

ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
ajax.send("tel2="+valor)


}

</script>



    <script src="assets/js/telegram.js"></script>
</body>
</html>


 