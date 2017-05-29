<?php   

    $usuario = $_POST['usuario'];
    $contra  = $_POST['contrasena'];

    if( isset($usuario) ) {

    echo "tu usuario es: ".$usuario; 
    echo "contraseña es: ".$contra;

    }else{
        echo "tu usuario es: ".$usuario; 
    }
?>