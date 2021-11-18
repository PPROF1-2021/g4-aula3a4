<?php

    include('conexion.php');

    //recuperar las variables
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $direccion_de_email=$_POST['email'];
    $password=$_POST['pass'];
    $repetir_password=$_POST['reppass'];
    //hacer la sentencia de sql
    $sql="INSERT INTO registro (nombre, apellido, direccion_de_email, password, repetir_password)
                        values ('$nombre','$apellido','$direccion_de_email','$password','$repetir_password')";
                                          
    //ejecutar la sentencia de sql
    $ejecutar=mysqli_query($conexion, $sql);
    //verificar de la ejecucion
    if (!$ejecutar){
        echo utf8_decode('<script>alert("Hubo algun error en el registro, intente nuevamente")</script> ');		
        echo "<script>location.href='registro.html'</script>";
    }else{
        echo utf8_decode('<script>alert("Datos cargados exitosamente")</script> ');		
        echo "<script>location.href='login.html'</script>";
    }
?>


