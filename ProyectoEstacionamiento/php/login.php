<?php   
    require_once("empleado.php");

    $usuario = $_POST['usuario'];
    $contra  = $_POST['contrasena'];

    //isset sirve para determinar si la variable tiene datos.
    //de lo contrario devuelve false. 
    //throw new Exception("hubo un error generado...");
    
    if( isset($usuario) ) {

        echo "tu usuario es: ".$usuario; 
        echo "contraseña es: ".$contra;

        //se debe de incluir la clase empleados. 
        $empleado = new empleado();
        
        //se debe llamar al metodo validar usuario de la clase empleados. 
        $empleado->validarUsuario($usuario);

    }else{        
        echo "No se coloco un usuario : "; 
    }
?>