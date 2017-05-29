<?php

    class basedatos{
        
        private $_servidor;
        private $_basedatos;
        private $_usuario;
        private $_contraseña;
        private $_conexion;


        public function __construct($servidor, $basedatos, $usuario, $contraseña){
            private $_servidor = $servidor ;
            private $_basedatos = $basedatos;
            private $_usuario = $usuario;
            private $_contraseña = $contraseña;
        }

        public function conectarse()
        {
            //ESTILO POR PROCEDIMIENTO.
            //mysqli_connect es una extension o alias del constructor mysqli::__construct()
            //$conexion = mysqli_connect("localhost","root","","utn"); //el password se deja vacio porque es una prueba local (servidor,root,pass ,base) //http://php.net/manual/es/class.mysqli.php
            //ESTILO POR OBJETO.
            $_conexion = new mysqli( $this->$_servidor , $this->$_usuario , $this->$_contraseña , $this->$_basedatos );

            if (!$_conexion) {
                echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
                echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
                echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
                exit;
            }

            echo "Éxito: Se realizó una conexión apropiada a MySQL!" . PHP_EOL;
            echo "Información del host: " . mysqli_get_host_info($enlace) . PHP_EOL;

            //return $_conexion;
        }



    }

?>

