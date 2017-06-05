<?php

    class basedatos{
        
        private static $ObjetoAccesoDatos;
        private $objetoPDO;

        //$conexion = new mysqli("localhost", "root", "", "utn");

        public function __construct()
        {
            try { 
                $this->objetoPDO = new PDO('mysql:host=localhost;dbname=estacionamiento;charset=utf8', 'root', '', array(PDO::ATTR_EMULATE_PREPARES => false,PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
                $this->objetoPDO->exec("SET CHARACTER SET utf8");
                } 
            catch (PDOException $e) { 
                print "Error!: " . $e->getMessage(); 
                die();
            }
        }

        public function ejecutarQuery($sqlstr)
        { 
            
            //$sql->execute();
            //$db = PDOconn();
            //$query = "SELECT * FROM posts ORDER BY id DESC LIMIT 0,3";
            $sql = $this->objetoPDO->prepare($sqlstr);
            $row = $sql->execute();

            return $row;
            //return $this->objetoPDO->prepare($sql); 

        }
        public function RetornarUltimoIdInsertado()
        { 
            return $this->objetoPDO->lastInsertId(); 
        }

        public static function dameUnObjetoAcceso()
        { 
            if (!isset(self::$ObjetoAccesoDatos)) {          
                self::$ObjetoAccesoDatos = new AccesoDatos(); 
            } 
            return self::$ObjetoAccesoDatos;        
        }


        // Evita que el objeto se pueda clonar
        public function __clone()
        { 
            trigger_error('La clonación de este objeto no está permitida', E_USER_ERROR); 
        }



    }

?>

