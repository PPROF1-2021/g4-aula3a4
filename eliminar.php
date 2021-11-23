<?php

include('conexion.php');

$no_usr= $_GET['no'];  

$sentencia = "DELETE FROM registro WHERE idRegistro = '$no_usr'";
mysqli_query($conexion, $sentencia);

?>

<script type="text/javascript">
    alert("Usuario eliminado exitosamente");
    window.location.href='adminusuarios.php';

</script>