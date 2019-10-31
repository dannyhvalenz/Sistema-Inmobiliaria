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
    document.getElementById("mensaje").innerHTML = "Hola " + nombreAsesor;

    /* ESTA LINEA SIRVE PARA QUE EN EL QUERY QUE VE EL USUARIO NO SE VEAN LOS PARAMETROS QUE SE PASARON DE UN HTML A OTRO*/
    history.replaceState({}, null, "/Sistema-Inmobiliaria/html/menu_Propietario.html");
}

/* FUNCION PARA BUSCAR POR NOMBRE A LOS PROPIETARIOS */
function buscar() {
    var busqueda = document.getElementById("busqueda").value;
    var q = "idAsesor="+idAsesor+"&busqueda="+busqueda;
    if (busqueda == null || busqueda == ""){
        cargarPropietarios();
    } else {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function(){
            if(xhr.readyState==4 && xhr.status==200){
                var respuesta = xhr.responseXML;
                console.log(xhr.responseXML);
                
                if (respuesta != null){
                    x = respuesta.getElementsByTagName('resultado'),
                    xs = new XMLSerializer();
                    document.getElementById('box').innerHTML = '';
                    for (i=0; i<x.length; ++i) {
                        document.getElementById('box').innerHTML += xs.serializeToString(x[i]) + '\n<br />\n';
                    }
                }

                if (titulo == "Acceso correcto"){
                    window.location="http://localhost:8888/Sistema-Inmobiliaria/html/menu_Propietario.html";
                    
                } else if (titulo == "Acceso incorrecto"){
                    document.getElementById("mensaje").style.display = "block";
                    document.getElementById("mensaje").innerHTML = "Usuario o contraseña inválidos";
                } 
            }
        }

        xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/buscarPropietarios.pl", true);
        xhr.setRequestHeader(
        'Content-type', 
        'application/x-www-form-urlencoded'
        ); 
        xhr.responseType = "document";
        xhr.send(q);
    }
    
}

function w3_open_mostrar(id) {
    var path = "mostrar_Propietario.html?idPropietario="+id+"&link="+linkWhenRefresh;
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divVisualizar").style.width = "50%";
    document.getElementById("divAdmin").style.width = "50%";
    document.getElementById("divAdmin").style.height = "100vh";
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divAdmin").style.visibility = "visible";

    document.getElementById("divAdmin").innerHTML =
        '<object type="text/html" data='+path+' height="100%" width="100%" class="w3-border-left" id="divActualizar"></object>';
}

/* FUNCION PARA ABRIR EL DIV LATERAL CON EL HTML PARA ACTUALIZAR AL PROPIETARIO */
function w3_open_actualizar(id) {
    var path = "gestionar_Propietario.html?idPropietario="+id+"&nombreAsesor="+nombreAsesor+"&link="+linkWhenRefresh;
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divVisualizar").style.width = "50%";
    document.getElementById("divAdmin").style.width = "50%";
    document.getElementById("divAdmin").style.height = "100vh";
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divAdmin").style.visibility = "visible";

    document.getElementById("divAdmin").innerHTML =
        '<object type="text/html" data='+path+' height="100%" width="100%" class="w3-border-left" id="divActualizar"></object>';

}

/* FUNCION PARA ABRIR EL DIV LATERAL CON EL HTML PARA REGISTRAR UN NUEVO PROPIETARIO */
function w3_open_registro() {
    var path = "registro_Propietario.html?idAsesor="+idAsesor+"&nombreAsesor="+nombreAsesor+"&link="+linkWhenRefresh;
    alert("w3-open-registro path = " + path + "LINK WHEN REFRESH = "+linkWhenRefresh);
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

/* FUNCION PARA CARGAR TODOS LOS PROPIETARIOS EN EL DIV QUE CORRESPONDE */
function cargarPropietarios(){
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        if(xhr.readyState==4 && xhr.status==200){
            var respuesta = xhr.responseXML;
            console.log(xhr.responseXML);
            
            if (respuesta != null){
                x = respuesta.getElementsByTagName('resultado'),
                xs = new XMLSerializer();
                document.getElementById('box').innerHTML = '';
                    for (i=0; i<x.length; ++i) {
                    document.getElementById('box').innerHTML += xs.serializeToString(x[i]) + '\n<br />\n';
}
            }

            if (titulo == "Acceso correcto"){
                window.location="http://localhost:8888/Sistema-Inmobiliaria/html/menu_Propietario.html";
                
            } else if (titulo == "Acceso incorrecto"){
                document.getElementById("mensaje").style.display = "block";
                document.getElementById("mensaje").innerHTML = "Usuario o contraseña inválidos";
            } 
        }
    }

    var q = "idAsesor="+idAsesor;

    xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/mostrarPropietarios.pl", true);
    xhr.setRequestHeader(
    'Content-type', 
    'application/x-www-form-urlencoded'
    ); 
    xhr.responseType = "document";
    xhr.send(q);
};
