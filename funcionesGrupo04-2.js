//funcion para capturar los datos del formulario de "calcularPartido.html"
function calcularTiempoF(){

    var fechaActual = new Date();

    const fechaIngresada = document.getElementById('datoFecha').value;
    var fechaComparar = new Date(fechaIngresada);

    var fechaFinal = Math.floor(fechaComparar.getTime() - fechaActual.getTime());
    var dia = 1000 * 60 * 60 * 24;

    //var diaFaltante = document.getElementById('diaFalt'),
        //mesFaltante = document.getElementById('mesFalt'),
        //yearFaltante = document.getElementById('yearFalt');

    var diasF = Math.floor(fechaFinal/dia),//(fechaComparar.getDate() - fechaActual.getDate()),
        mesF = Math.floor(diasF/31),//(fechaComparar.getMonth() - fechaActual.getMonth()),
        yearF = Math.floor(mesF/12); //(fechaComparar.getFullYear() - fechaActual.getFullYear());

    alert ("Faltan " + diasF + " días, para tu próximo partido"  )
    //alert (fechaFinal);


    //diaFaltante.textContent = diaF;
    //mesFaltante.textContent = mesF;
    //yearFaltante.textContent = yearF;  
    
    //alert(fechaActual);
} 

function cargaExito(){
    var comprobar = datosCargados();
    /*if (comprobar == 0){
        swal ('ÉXITO', 'Datos enviados correctamente, ' + nombre.value + ' ' + apellido.value +  ' aguarda un momento te estamos redirigiendo', 'success');
        setTimeout( function() { window.location.href = "construccion.html"; }, 5000 );
       }*/
}

//funcion de alerta para formulario enviado
function datosCargados(){
    var nombre = document.getElementById("nombre"); 
    var apellido = document.getElementById("apellido");
    var email = 0;
    email = document.getElementById("email");
    var pass = document.getElementById("pass");
    var reppass = document.getElementById("repass");
    //var fechanac = document.getElementById("fechanac");
    //var fechanacimiento = new Date(fechanac);     

   var pValidar = validarDatos();
   
   if (pValidar == 1){
    swal ('ERROR', 'Por favor complete los datos', 'error');   
   }

   if (pValidar == 2){
    swal ('ERROR', 'Los passwords no coinciden', 'error');
   }

   if(pValidar == 3){
    swal ('WARNING', 'El nombre debe contener entre 2 y 20 caracteres', 'warning');
   }

   /*if (pValidar == 0){
    swal ('ÉXITO', 'Datos enviados correctamente, ' + nombre.value + ' ' + apellido.value +  ' aguarda un momento te estamos redirigiendo', 'success');
    setTimeout( function() { window.location.href = "construccion.html"; }, 5000 );
   }*/

   return pValidar;
    
}

function validarDatos(){

    var bandera = 0;
    const largoMax = 20;
    const largoMin = 2;

    if (nombre.value == 0 || apellido.value == 0 || pass.value == 0 || reppass.value == 0 || email.value == 0){
        bandera = 1;
    }

    if (pass.value != reppass.value){
        bandera = 2;
    }

    if (nombre.value.length < largoMin || nombre.value.length > largoMax ){
        bandera = 3;
    }
        
    return bandera;
    
}
 
function avisoReset(){    
    document.datos.reset();

}



