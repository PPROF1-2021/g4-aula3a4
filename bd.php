<?php

    include('conexion.php');

    //recuperar las variables
    $nombre=$_POST['nombre'];
    $apellido=$_POST['apellido'];
    $direccion_de_email=$_POST['email'];
    $password=$_POST['pass'];
    $reppassword=$_POST['reppass'];
    $telefono= 'pendiente';
    $fecha_nac= '0000-00-00';
    $ubicacion='0';
    $genero='0';
    //hacer la sentencia de sql
    $sql="INSERT INTO registro (nombre, apellido, telefono, fecha_de_nacimiento, direccion_de_email, idUbicacion_usuario, idGenero, password, repetir_password )
                        values ('$nombre','$apellido','$telefono','$fecha_nac','$direccion_de_email','$ubicacion','$genero','$password', '$reppassword')";
                                          
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


