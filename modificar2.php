<?php
include('conexion.php');

modificarUsuario(
    $_POST['nombre'],
    $_POST['apellido'],
    $_POST['telefono'],
    $_POST['fecha_nac'],
    $_POST['email'],
    $_POST['pass'],
    $_POST['idRegistro']
);

function modificarUsuario($nom, $apell, $telef, $fecha_nac, $mail, $pass, $no){
    include('conexion.php');
    $sentencia="UPDATE registro SET nombre='".$nom."', apellido='".$apell."', telefono= '".$telef."', fecha_de_nacimiento= '".$fecha_nac."', direccion_de_email='".$mail."', password='".$pass."' WHERE idRegistro='".$no."' ";
    $resultado=mysqli_query($conexion, $sentencia);
}
?>

<script type="text/javascript">
    alert("Usuario modificado exitosamente");
    window.location.href='adminusuarios.php';

</script>