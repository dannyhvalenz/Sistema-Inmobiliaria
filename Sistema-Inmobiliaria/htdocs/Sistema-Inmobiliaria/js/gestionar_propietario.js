
/* DECLARACION DE VARIABLES */
var nombre;
var apellidoP;
var apellidoM;
var celular;
var direccion;
var correo;
var outerHTML;
var idPropietario;
var nombreAsesor;

variable = (new URL(document.location)).searchParams;
if (variable.get("idPropietario") != null){
    idPropietario = variable.get("idPropietario");
    nombreAsesor = variable.get("nombreAsesor");
    outerHTML = variable.get("link");
    
    cargarPropietario(variable.get("idPropietario"));

    history.replaceState({}, null, "/Sistema-Inmobiliaria/html/menu_Propietario.html");
    
} else {
    alert("No se pudo recuperar la informacion de la base de datos");
}

function clickActualizar(){
    document.getElementById("titulo").innerHTML = "ACTUALIZAR PROPIETARIO";
    document.getElementById("divWhenMostrar").style.display = "none";
    document.getElementById("divWhenActualizar").style.display = "block";

    document.getElementById("txtnombre").removeAttribute("disabled");
    document.getElementById("txtapellidoP").removeAttribute("disabled");
    document.getElementById("txtapellidoM").removeAttribute("disabled");
    document.getElementById("txtcelular").removeAttribute("disabled");
    document.getElementById("txtdireccion").removeAttribute("disabled");
    document.getElementById("txtcorreo").removeAttribute("disabled");
}

function clickCancelar(){
    document.getElementById("titulo").innerHTML = "MOSTRAR PROPIETARIO";
    document.getElementById("divWhenMostrar").style.display = "block";
    document.getElementById("divWhenActualizar").style.display = "none";
    
    document.getElementById("txtnombre").setAttribute("disabled","disabled");
    document.getElementById("txtapellidoP").setAttribute("disabled","disabled");
    document.getElementById("txtapellidoM").setAttribute("disabled","disabled");
    document.getElementById("txtcelular").setAttribute("disabled","disabled");
    document.getElementById("txtdireccion").setAttribute("disabled","disabled");
    document.getElementById("txtcorreo").setAttribute("disabled","disabled");

    document.getElementById("txtnombre").value = nombre;
    document.getElementById("txtapellidoP").value = apellidoP;
    document.getElementById("txtapellidoM").value = apellidoM;
    document.getElementById("txtcelular").value = celular;
    document.getElementById("txtdireccion").value = direccion;
    document.getElementById("txtcorreo").value = correo;
}

function cargarPropietario(id){
    var xhr = new XMLHttpRequest();
    idPropietario = id;
    /* CREACION DEL QUERY */
    var q = "idPropietario="+idPropietario;

    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            var respuesta = xhr.responseXML;
            console.log(xhr.responseXML);
            
            var x = respuesta.getElementsByTagName("resultado");

            var titulo = x[0].getElementsByTagName("titulo")[0].textContent;
            
            if (titulo == "Carga exitosa"){
                nombre = x[0].getElementsByTagName("nombre")[0].textContent;
                document.getElementById("txtnombre").value = nombre;
                document.getElementById("txtnombre").setAttribute("disabled","disabled");

                apellidoP = x[0].getElementsByTagName("apellidoP")[0].textContent;
                document.getElementById("txtapellidoP").value = apellidoP;
                document.getElementById("txtapellidoP").setAttribute("disabled","disabled");

                apellidoM = x[0].getElementsByTagName("apellidoM")[0].textContent;
                document.getElementById("txtapellidoM").value = apellidoM;
                document.getElementById("txtapellidoM").setAttribute("disabled","disabled");

                celular = x[0].getElementsByTagName("celular")[0].textContent;
                document.getElementById("txtcelular").value = celular;
                document.getElementById("txtcelular").setAttribute("disabled","disabled");

                direccion = x[0].getElementsByTagName("direccion")[0].textContent;
                document.getElementById("txtdireccion").value = direccion;
                document.getElementById("txtdireccion").setAttribute("disabled","disabled");

                correo = x[0].getElementsByTagName("correo")[0].textContent;
                document.getElementById("txtcorreo").value = correo;
                document.getElementById("txtcorreo").setAttribute("disabled","disabled");
            } else if (titulo == "Error de conexion"){
                alert("Error de conexion con la base de datos");
            }
        }
    }

    xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/mostrarPropietarioInfo.pl", true);
    xhr.setRequestHeader(
        'Content-type', 
        'application/x-www-form-urlencoded'
    ); 
    xhr.responseType = "document";
    xhr.send(q);
}

function ShowResults(value) {
    alert(value);
 }

function actualizarPropietario(){
    /* RECUPERAR DATOS DE LOS INPUT */
    nombre = document.getElementById("txtnombre").value;
    apellidoP = document.getElementById("txtapellidoP").value;
    apellidoM = document.getElementById("txtapellidoM").value;
    celular = document.getElementById("txtcelular").value;
    direccion = document.getElementById("txtdireccion").value;
    correo = document.getElementById("txtcorreo").value;
    var camposVacios = new Boolean(false);
    
    var input = document.getElementsByTagName('input');
    for(i = 0;i < input.length; i++){
        if (camposVacios == false){
            if (input[i].value == null || input[i].value == ""){
                camposVacios = true;
            }
        }
    }

    /* CREACION DEL QUERY */
    var q = "nombre="+nombre+"&"+"apellidoP="+apellidoP+"&"+"apellidoM="+apellidoM+"&"
        +"celular="+celular+"&"+"direccion="+direccion+"&"+"correo="+correo+"&"
        +"idPropietario="+idPropietario;

    /* VALIDACION DE CAMPOS VACIOS */
    if (camposVacios == true) {
        alert("Hay campos vacios, verifica que todos los campos esten llenos");
    } else {

    /* EN CASO DE QUE NO HAYA CAMPOS VACIOS SE HACE EL REQUEST A LA BD POR MEDIO DEL ARCHIVO .PL */
        
        console.log("Actualizar Propietario");
        var xhr = new XMLHttpRequest();
        var titulo;
        var contenido;
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                var respuesta = xhr.responseXML;
                console.log(xhr.responseXML);
                var x = respuesta.getElementsByTagName("resultado");

                titulo = x[0].getElementsByTagName("titulo")[0].textContent;
                contenido = x[0].getElementsByTagName("contenido")[0].textContent;

                if (titulo == "Propietario actualizado"){
                    alert(contenido);
                    outerHTML = outerHTML+"&nombre="+nombreAsesor;
                    window.open(outerHTML,"_parent");
                    document.getElementById("titulo").innerHTML = "MOSTRAR PROPIETARIO";
                    document.getElementById("divWhenMostrar").style.display = "block";
                    document.getElementById("divWhenActualizar").style.display = "none";
                    
                    document.getElementById("txtnombre").setAttribute("disabled","disabled");
                    document.getElementById("txtapellidoP").setAttribute("disabled","disabled");
                    document.getElementById("txtapellidoM").setAttribute("disabled","disabled");
                    document.getElementById("txtcelular").setAttribute("disabled","disabled");
                    document.getElementById("txtdireccion").setAttribute("disabled","disabled");
                    document.getElementById("txtcorreo").setAttribute("disabled","disabled");

                    document.getElementById("txtnombre").value = nombre;
                    document.getElementById("txtapellidoP").value = apellidoP;
                    document.getElementById("txtapellidoM").value = apellidoM;
                    document.getElementById("txtcelular").value = celular;
                    document.getElementById("txtdireccion").value = direccion;
                    document.getElementById("txtcorreo").value = correo;
                } else if (titulo == "Error de conexion"){
                    alert(contenido);
                }
            }
        }

        xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/modificarPropietario.pl", true);
        xhr.setRequestHeader(
            'Content-type', 
            'application/x-www-form-urlencoded'
        ); 
        xhr.responseType = "document";
        xhr.send(q);
    }
};

function clickEliminar(){
    var q = "idPropietario="+idPropietario;
    console.log("Eliminar Propietario");
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4 && xhr.status == 200){
                var respuesta = xhr.responseXML;
                console.log(xhr.responseXML);
                
                var x = respuesta.getElementsByTagName("resultado");

                var titulo = x[0].getElementsByTagName("titulo")[0].textContent;
                var contenido = x[0].getElementsByTagName("contenido")[0].textContent;

                if (titulo == "Exito al eliminar"){
                    alert(contenido);
                    outerHTML = outerHTML+"&nombre="+nombreAsesor;
                    window.open(outerHTML,"_parent");
                } else if (titulo == "Error de conexion"){
                    alert(contenido);
                }
            }
        }

        xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/eliminarPropietario.pl", true);
        xhr.setRequestHeader(
            'Content-type', 
            'application/x-www-form-urlencoded'
        ); 
        xhr.responseType = "document";
        xhr.send(q);
};