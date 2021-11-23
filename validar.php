<?php

session_start();

include('conexion.php');

$email=$_POST['email'];
$pass=$_POST['pass'];

//conectar a la base de datos
/*$conexion=mysqli_connect("localhost", "root", "", "database_fmt");*/
$consulta="SELECT * FROM registro WHERE direccion_de_email='$email' and password='$pass'";
$resultado=mysqli_query($conexion, $consulta);

$filas= mysqli_num_rows($resultado);
if($filas>0) {
    echo "<SCRIPT>window.location='construccion.php?email=$email';</SCRIPT>";
}
else {
    echo utf8_decode('<script>alert("Usuario o contraseña incorrectos, en caso de no estar registrado hágalo para poder ingresar")</script> ');		
	echo "<script>location.href='login.html'</script>";
}
//mysqli_free_result($resultado);
//mysqli_close($conexion);

?>