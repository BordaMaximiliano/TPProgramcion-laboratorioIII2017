<?php

    //require_once("baseDatos.php"); 
    require_once("baseDatos.mysqli.php"); 
    

    class empleado{

        public function __construct()
        {
            
        }
        
        public function validarUsuario($usuario){

            try{

                $sql = "select  codigoEmpleado, nombre, apellido, codigoTurno, estado, tipoUsuario, usuario 
                        from empleado 
                        where usuario = '" . $usuario . "'"  ;

                echo "buscando usuario";
                //echo "**" . $sql . "**";
                
                $basedatos = new basedatos();    

                $consulta = $basedatos->ejecutarQuery($sql);  

                echo "<br>";
                var_dump($consulta); 
                echo "<br>";            

                /* obtener un array asociativo */
                while ($fila = $consulta->fetch_assoc()) {
                    
                    echo "<br>";
                    var_dump($fila);
                    echo "<br>";

                    //printf ("%s (%s)\n", $fila["nombre"], $fila["domicilio"] );
                    echo "<br>" . $fila["nombre"] . "<br>";
                    echo "<br>" . $fila["apellido"] . "<br>";
                    //echo $fila["localidad"] . "<br>";
                }

                /* liberar el conjunto de resultados */
                $consulta->free();


                //if (($consulta = $basedatos->ejecutarQuery($sql))) {
                    
                    // obtener un array asociativo 
                    /*while ($fila = $consulta->fetchAll(PDO::FETCH_ASSOC)) {
                        //printf ("%s (%s)\n", $fila["nombre"], $fila["domicilio"] );
                        echo "<br>" . $fila["nombre"] . "<br>";
                        echo $fila["apellido"] . "<br>";
                        echo $fila["estado"] . "<br>";
                    }*/
                    /*
                    while ($row = $consulta->fetchAll(PDO::FETCH_ASSOC))  {
                        $id = $row['nombre'];
                        $content = $row['apellido'];
                        echo "<br>" . $id . "<br>" ;
                        echo "<br>" . $content . "<br>";
                    }*/


                    

                    // liberar el conjunto de resultados 
                    //$consulta->free();

                /*
                }else{
                    echo "Falló la obtención: (" . $conexion->errno . ") " . $conexion->error;
                }
                */
            }catch (Exception $e) {
                echo 'Excepción capturada: ',  $e->getMessage(), "\n";
            }

        }

    }



?>