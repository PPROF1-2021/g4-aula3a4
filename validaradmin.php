<?php

session_start();

include('conexion.php');

$nombre=$_POST['nombre'];
$apellido=$_POST['apellido'];
$pass=$_POST['pass'];

//conectar a la base de datos
/*$conexion=mysqli_connect("localhost", "root", "", "database_fmt");*/
$consulta="SELECT * FROM admins WHERE nombre_admin='$nombre' and apellido_admin='$apellido' and pass_admin='$pass'";
$resultado=mysqli_query($conexion, $consulta);

$filas= mysqli_num_rows($resultado);
if($filas>0) {
    echo "<SCRIPT>window.location='adminusuarios.php';</SCRIPT>";
}
else {
    echo utf8_decode('<script>alert("Datos incorrectos")</script> ');		
	echo "<script>location.href='loginadmin.html'</script>";
}
//mysqli_free_result($resultado);
//mysqli_close($conexion);

?>