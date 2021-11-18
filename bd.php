<?php

    //conectar a la base de datos
    $conexion= mysqli_connect('localhost','root','');
    mysqli_set_charset ($conexion, "utf8");

    //verificar la conexion
    if(!$conexion){
        echo "No Se Pudo Conectar Con El Servidor";
    }else{

        $base= mysqli_select_db ($conexion, 'db_findmyteam');
        if(!$base){
           echo"No Se Encontro La Base De Datos";
        }
    }

    /*include('conexion.php');*/

    //recuperar las variables
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $direccion_de_email=$_POST['email'];
    $password=$_POST['pass'];
    $repetir_password=$_POST['reppass'];
    //hacer la sentencia de sql
    $sql="INSERT INTO registro ('nombre','apellido','direccion_de_email','password','repetir_password')
                        values ('$nombre','$apellido','$direccion_de_email','$password','$repetir_password')";
                                          
    //ejecutar la sentencia de sql
    $ejecutar=mysqli_query($conexion, $sql);
    //verificar de la ejecucion
    if (!$ejecutar){
        echo"Hubo Algun Error";
    }else{
        echo"Datos cargados con exito";
    }
?>


