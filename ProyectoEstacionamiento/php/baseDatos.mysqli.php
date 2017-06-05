<?php

    class basedatos{       
      

        public $conexion;


        public function __construct(){            
           $this->conexion = new mysqli("localhost", "root", "", "estacionamiento");

            if (!$this->conexion) {
                echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
                echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
                echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
                exit;
            }
            echo "Éxito: Se realizó una conexión apropiada a MySQL!" . PHP_EOL;
        }

       
        public function ejecutarQuery($sqlstr)
        { 
            
            $consulta = $this->conexion->query($sqlstr);

            if (!$consulta) {
               echo "Falló la obtención: (" . $this->$conexion->errno . ") " . $this->$conexion->error;
            }else{
                echo "consulta realizada OK";              
            }

            return $consulta ;
            //return $this->objetoPDO->prepare($sql); 

        }


            



    }

?>

