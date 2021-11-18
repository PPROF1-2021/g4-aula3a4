<?php
$direccion_de_email=$POST['direccion de emai'];
$password=$POST['password'];

//conectar a la base de datos
$conexion=mysqli_connect("localhost", "root", "", "database_fmt");
$consulta="SELECT * FROM usuario WHERE usuario='$email' and password='$password'";
$resultado=mysqli_query($conexion, $consulta);

$filas= mysqli_num_rows($resultado);
if($filas>0) {
    header("location:index.html");
}
else {
    echo "Error en la autentificación";
}
mysqli_free_result($resultado);
mysqli_close($conexion);

?>