$(document).ready(function() {

    //Se ejecuta al oprimir el boton LOGIN
    $('#validar').on('click', function() {
        var usuario = $('#login_username').val();
        var password = $('#password').val();
        var Url = "php/login.php";

        //alert(usuario);

        $.ajax({
                // la URL para la petición
                url: Url,
                // la información a enviar
                // (también es posible utilizar una cadena de datos)
                data: { usuario: usuario, contrasena: password },
                // especifica si será una petición POST o GET
                type: 'POST',
                // el tipo de información que se espera de respuesta
                //dataType: 'json',

                // código a ejecutar si la petición es satisfactoria;
                // la respuesta es pasada como argumento a la función
                /*
                
                success: function(output) {
                    alert(output.responseText);
                    //$("#resultado").html(output.responseText);
                },
                // código a ejecutar si la petición falla;
                // son pasados como argumentos a la función
                // el objeto de la petición en crudo y código de estatus de la petición
                error: function(xhr, status) {
                    alert('Disculpe, existió un problema');
                    $("#resultado").html("hubo un problema");
                },
                // código a ejecutar sin importar si la petición falló o no
                complete: function(xhr, status) {
                    alert('Petición realizada');
                    $("#resultado").html(status);
                }

                */

            })
            .done(function(data) {
                alert("retorno OK");
                alert(data);
                $("#resultado").text("mensaje prueba");
                $("#resultado").text(data);
            })
            .fail(function(data) {
                alert("error");
            })
            .always(function(data) {
                alert("complete");
            })

        ;

        alert(mensaje);
    });

    $("#apretarme").on("click", function() {
        alert("hi hi hi hi");
    });

});