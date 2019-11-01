var nombre;
var apellidoP;
var apellidoM;
var celular;
var correo;
var outerHTML;
var idAsesor;
var nombreAsesor;

variable = (new URL(document.location)).searchParams;
if (variable.get("idAsesor") != null){
    idAsesor = variable.get("idAsesor");
    nombreAsesor = variable.get("nombre");
    outerHTML = variable.get("link");
    outerHTML = outerHTML+"&nombre="+nombreAsesor;

    history.replaceState({}, null, "/Sistema-Inmobiliaria/html/menu_Cliente.html");
    
} else {
    alert("No se pudo recuperar la informacion de la base de datos");
}

function cerrarRegistro(){
    /* SE LIMPIAN TODOS LOS INPUT */
    document.getElementById("txtnombre").value = '';
    document.getElementById("txtapellidoP").value = '';
    document.getElementById("txtapellidoM").value = '';
    document.getElementById("txtcelular").value = '';
    document.getElementById("txtcorreo").value = '';
}

function guardarCliente(){
    /* RECUPERAR DATOS DE LOS INPUT */
    var nombre = document.getElementById("txtnombre").value;
    var apellidoP = document.getElementById("txtapellidoP").value;
    var apellidoM = document.getElementById("txtapellidoM").value;
    var celular = document.getElementById("txtcelular").value;
    var correo = document.getElementById("txtcorreo").value;
    var idAsesor = "1";

    /* CREACION DEL QUERY */
    var q = "nombre="+nombre+"&"+"apellidoP="+apellidoP+"&"+"apellidoM="+apellidoM+"&"+"celular="+celular+"&"+"correo="+correo+"&"+"idAsesor="+idAsesor;
    
    /* VALIDACION DE CAMPOS VACIOS */
    if (nombre == null || nombre == "", apellidoP == null || apellidoP == "", apellidoM == null || apellidoM == "", celular == null || celular == "", correo == null || correo == "") {
        alert("Hay campos vacios");
    } else {

    /* EN CASO DE QUE NO HAYA CAMPOS VACIOS SE HACE EL REQUEST A LA BD POR MEDIO DEL ARCHIVO .PL */
        console.log("Agregar cliente");
        var xhr = new XMLHttpRequest();
        var titulo;
        var contenido;
        xhr.onreadystatechange = function(){
            if(xhr.readyState == 4){
                var respuesta = xhr.responseXML;
                console.log(xhr.responseXML);

                var x = respuesta.getElementsByTagName("resultado");

                var titulo = x[0].getElementsByTagName("titulo")[0].textContent;

                var contenido = x[0].getElementsByTagName("contenido")[0].textContent;

                if (titulo == "Nuevo cliente"){
                    alert(contenido);
                    window.open(outerHTML,"_parent");
                } else if (titulo == "Error de conexion"){
                    alert(contenido);
                }
            }
        }

        xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/agregarCliente.pl", true);
        xhr.setRequestHeader(
            'Content-type', 
            'application/x-www-form-urlencoded'
        ); 
        xhr.responseType = "document";
        xhr.send(q);
    }
};