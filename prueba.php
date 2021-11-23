
<?php
include('conexion.php');
?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Find My Team</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="icon" href="images/favicon-32x32.ico">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&family=Work+Sans:wght@400;700&display=swap" rel="stylesheet"> 

</head>
<body>
 <button onclick="envioExitoso()">Click</button>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
<script src="funcionesGrupo04-2.js"></script>


</body>
</html>


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
        echo utf8_decode('<script>alert("Datos cargados con éxito")</script> ');		
        echo "<script>location.href='login.html'</script>";
    }
?>
