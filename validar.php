<?php
$direccion_de_email=$POST['direccion de emai'];
$password=$POST['password'];

//conectar a la base de datos
$conexion=msqli_connect("localhost", "root", "", "database_fmt");
$consulta="SELECT * FROM usuario WHERE usuario='$usuario' and password='$password'";
$resultado=mysqli_query($conexion, $consulta);

$filas=mysqli_num_row($resultado);
if($filas>o) {
    header("location:index.html");
}
else {
    echo "Error en la autentificación";
}
musqli_free_result($resultado);
mysqli_close($conexion);