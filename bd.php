<?php
    //conectar a la base de datos
    $conexion=@msqli_connect('localhost',"root','','database_fmt');
    //verificar la conexion
    if(!$conectar){
        echo"No Se Pudo Conectar Con El Servidor";
    }else{

        $base=mysql_select_db('database_fmt');
        if(!base){
           echo"No Se Encontro La Base De Datos";
        }
    }
    //recuperar las variables
    $nombre=$POST['nombre'];
    $apellido=$POST['apellido'];
    $direccion_de_email=$POST['direccion de mail'];
    $password=$POST['password']
    $repetir_password=$POST['repetir password']
    //hacer la sentencia de sql
    $sql="INSERT INTO datos VALUES('$nombre',
                                   '$apellido',
                                   '$direccion_de_mail',
                                   '$password',
                                   '$repetir_password')";
    //ejecutar la sentencia de sql
    $ejecutar=mysql_query($sql);
    //verificar de la ejecucion
    if (!$ejecutar){
        echo"Hubo Algun Error";
    }else{
        echo"Datos Guardados Correctamente<br><a href'index.html'>Volver</a>";
    }
?>


