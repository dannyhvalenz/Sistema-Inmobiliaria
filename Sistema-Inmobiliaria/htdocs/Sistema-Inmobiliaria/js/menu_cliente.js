/*
    CUESTIONES QUE FALTAN IMPLEMENTAR
    - Evitar que al cerrar sesion se pueda regresar a la pagina anterior
    - Que el refresh respete que la sesion aun esta activa
*/



variable = (new URL(document.location)).searchParams;
var idAsesor;
var nombreAsesor;
var linkWhenRefresh;
if (variable.get("idAsesor") != null){
    idAsesor = variable.get("idAsesor");
    nombreAsesor = variable.get("nombre");
    linkWhenRefresh = window.location.href;
    document.getElementById("mensaje").innerText = "Hola " + nombreAsesor;
    /* ESTA LINEA SIRVE PARA QUE EN EL QUERY QUE VE EL USUARIO NO SE VEAN LOS PARAMETROS QUE SE PASARON DE UN HTML A OTRO*/
    history.replaceState({}, null, "/Sistema-Inmobiliaria/html/menu_Cliente.html");
    
}

/* FUNCION PARA BUSCAR POR NOMBRE A LOS CLIENTES */
function buscar() {
    var busqueda = document.getElementById("busqueda").value;
    var q = "idAsesor="+idAsesor+"&busqueda="+busqueda;
    if (busqueda == null || busqueda == ""){
        cargarClientes();
    } else {
        var xhr = new XMLHttpRequest();
        var existeRespuesta = new Boolean (false);
        xhr.onreadystatechange = function(){
            if(xhr.readyState==4 && xhr.status==200){
                var respuesta = xhr.responseXML;
                console.log(xhr.responseXML);
                x = respuesta.getElementsByTagName('resultado');
                
                if (respuesta != null){
                    existeRespuesta = true;
                } else {
                    existeRespuesta = false;
                }
                
                if (existeRespuesta == true){
                    xs = new XMLSerializer();
                    document.getElementById('box').innerHTML = '';
                        for (i=0; i<x.length; ++i) {
                        document.getElementById('box').innerHTML += xs.serializeToString(x[i]) + '\n<br />\n';
                    }
                } else {
                    alert("Error de conexion con la base de datos");
                }
            }
        }

        xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/buscarClientes.pl", true);
        xhr.setRequestHeader(
        'Content-type', 
        'application/x-www-form-urlencoded'
        ); 
        xhr.responseType = "document";
        xhr.send(q);
    }
    
}

/* FUNCION PARA ABRIR EL DIV LATERAL CON EL HTML PARA ACTUALIZAR AL CLIENTE */
function w3_open_actualizar(id) {
    var path = "gestionar_Cliente.html?idCliente="+id+"&nombreAsesor="+nombreAsesor+"&link="+linkWhenRefresh;
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divVisualizar").style.width = "50%";
    document.getElementById("divAdmin").style.width = "50%";
    document.getElementById("divAdmin").style.height = "100vh";
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divAdmin").style.visibility = "visible";

    document.getElementById("divAdmin").innerHTML =
        '<object type="text/html" data='+path+' height="100%" width="100%" class="w3-border-left" id="divActualizar"></object>';

}

/* FUNCION PARA ABRIR EL DIV LATERAL CON EL HTML PARA REGISTRAR UN NUEVO CLIENTE */
function w3_open_registro() {
    var path = "registro_Cliente.html?idAsesor="+idAsesor+"&nombreAsesor="+nombreAsesor+"&link="+linkWhenRefresh;
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divVisualizar").style.width = "50%";
    document.getElementById("divAdmin").style.width = "50%";
    document.getElementById("divAdmin").style.height = "100vh";
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divAdmin").style.visibility = "visible";

    document.getElementById("divAdmin").innerHTML =
        '<object type="text/html" data='+path+' height="100%" width="100%" class="w3-border-left" id="divActualizar"></object>';
}

function w3_close() {
    document.getElementById("divAdmin").style.display = "none";
    document.getElementById("divVisualizar").style.width = "100%";
    document.getElementById("divAdmin").style.visibility = "hidden";
}

/* FUNCION PARA CARGAR TODOS LOS CLIENTES EN EL DIV QUE CORRESPONDE */
function cargarClientes(){
    var xhr = new XMLHttpRequest();
    var existeRespuesta = new Boolean (false);
    xhr.onreadystatechange = function(){
        if(xhr.readyState==4 && xhr.status==200){
            var respuesta = xhr.responseXML;
            console.log(xhr.responseXML);
            x = respuesta.getElementsByTagName('resultado');
            
            if (respuesta != null){
                existeRespuesta = true;
            } else {
                existeRespuesta = false;
            }
            
            if (existeRespuesta == true){
                xs = new XMLSerializer();
                document.getElementById('box').innerHTML = '';
                    for (i=0; i<x.length; ++i) {
                    document.getElementById('box').innerHTML += xs.serializeToString(x[i]) + '\n<br />\n';
                }
            } else {
                alert("Error de conexion con la base de datos");
            }
        }
    }

    var q = "idAsesor="+idAsesor;

    xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/mostrarClientes.pl", true);
    xhr.setRequestHeader(
    'Content-type', 
    'application/x-www-form-urlencoded'
    ); 
    xhr.responseType = "document";
    xhr.send(q);
};

function redireccionar(id){
    var q = "?idAsesor="+idAsesor+"&nombre="+nombreAsesor;
    if (id == "aPropietarios"){
        var path = "http://localhost:8888/Sistema-Inmobiliaria/html/menu_Propietario.html"+q;
        window.open(path,"_parent");
    } else if (id == "aClientes"){
        var path = "http://localhost:8888/Sistema-Inmobiliaria/html/menu_Cliente.html"+q;
        window.open(path,"_parent");
    } else if (id == "aInmuebles"){
        var path = "http://localhost:8888/Sistema-Inmobiliaria/html/menu_Inmueble.html"+q;
        window.open(path,"_parent");
    } else if(id == "cerrarSesion"){
        var path = "http://localhost:8888/Sistema-Inmobiliaria/html/IniciarSesion.html";
        window.open(path,"_parent");
    }
}