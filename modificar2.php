<?php
include('conexion.php');

modificarUsuario(
    $_POST['nombre'],
    $_POST['apellido'],
    $_POST['email'],
    $_POST['pass'],
    $_POST['idRegistro']
);

function modificarUsuario($nom, $apell, $mail, $pass, $no){
    include('conexion.php');
    $sentencia="UPDATE registro SET nombre='".$nom."', apellido='".$apell."', direccion_de_email='".$mail."', password='".$pass."' WHERE idRegistro='".$no."' ";
    $resultado=mysqli_query($conexion, $sentencia);
}
?>

<script type="text/javascript">
    alert("Usuario modificado exitosamente");
    window.location.href='adminusuarios.php';

</script>