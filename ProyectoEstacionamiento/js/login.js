function validaruser() {

    //tomo el valor del usuario ingresado. 
    var usuario = $('#login_username').val();
    //tomo el valor de la password ingresada. 
    var password = $('#password').val();

    $("#resultado").text("Procesando");

    var Url = "php/login.php";

    //alert(usuario);

    var funcionAjax = $.ajax({
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
    funcionAjax.done(function(data) {
        $("#resultado").text("mensaje prueba");
        $("#resultado").text(data);
        //alert("retorno OK");
        alert(data);
    })
    funcionAjax.fail(function(data) {
        alert("error fatal");
    })
    funcionAjax.always(function(data) {
        $("#resultado").text("Busqueda Completada");
        //alert("complete");
    });


}

$(document).ready(function() {

    //Se ejecuta al oprimir el boton LOGIN
    //Manejador del evento click del boton Login
    $('#validar').on('click', function() {

        //tomo el valor del usuario ingresado. 
        var usuario = $('#login_username').val();
        //tomo el valor de la password ingresada. 
        var password = $('#password').val();

        $("#resultado").text("Procesando");

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

                success: function(output) {
                    $("#resultado").text(output);
                },
                // código a ejecutar si la petición falla;
                // son pasados como argumentos a la función
                // el objeto de la petición en crudo y código de estatus de la petición
                error: function(xhr, status) {
                    $("#resultado").text("hubo un problema: " + status);
                },
                // código a ejecutar sin importar si la petición falló o no
                complete: function(xhr, status) {
                    //$("#resultado").html(status);
                }

            })
            /*
            //el evento .Done se coresponde al resultado del explorador no de la respuesta de ajax
            .done(function(data) {
                $("#resultado").text("mensaje prueba");
                $("#resultado").text(data);
                //alert("retorno OK");
                alert(data);
            })
            .fail(function(data) {
                $("#resultado").text(data);
                alert("error fatal");
            })
            .always(function(data) {
                //$("#resultado").text("Busqueda Completada");
                //alert("complete");
            })
            */

        ;

        //alert(mensaje);
    });

    $("#apretarme").on("click", function() {
        alert("hi hi hi hi");
    });

});