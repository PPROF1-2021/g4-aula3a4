<?php

    //conectar a la base de datos
    $conexion= mysqli_connect('localhost','id17571613_root','findmyteam2021ISPC!');
    mysqli_set_charset ($conexion, "utf8");

    //verificar la conexion
    if(!$conexion){
        echo "No Se Pudo Conectar Con El Servidor";
    }else{

        $base= mysqli_select_db ($conexion, 'id17571613_database_fmt');
        if(!$base){
           echo"No Se Encontro La Base De Datos";
        }
    }


    //Contraseña de la base de datos de prueb: findmyteam2021ISPC!
?>
