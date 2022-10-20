const chat = document.getElementById('chat');
const burbuja = document.getElementById('burbuja');

burbuja.addEventListener('click', () => {
    chat.classList.toggle('open');
});

 

$(document).ready(function() {
            $("#send-btn").on("click", function() {
                $value = $("#data").val();
                $msg = '<div class="user-inbox inbox"><div class="msg-header"><p>' + $value + '</p></div></div>';
                $(".form").append($msg);
                $("#data").val('');

                // iniciar el código ajax
                $.ajax({
                    url: 'message.php',
                    type: 'POST',
                    data: 'text=' + $value,
                    success: function(result) {
                        $replay = '<div class="bot-inbox inbox"><div class="icon"><i class="fas fa-user"></i></div><div class="msg-header"><p>' + result + '</p></div></div>';
                        $(".form").append($replay);
                        // cuando el chat baja, la barra de desplazamiento llega automáticamente al final
                        $(".form").scrollTop($(".form")[0].scrollHeight);
                    

                      ajax.open("POST","telegram3.php", true);
                      ajax.onreadystatechange=function(){

                    if (ajax.readyState==4) {
                     document.getElementById("resultado").innerHTML=ajax.responseText;


}

}

                  ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
                  ajax.send("tel3="+result)




                    }


                    
                });
            });
        });





          
