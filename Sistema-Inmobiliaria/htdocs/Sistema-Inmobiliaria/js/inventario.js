var btnSubmitIndex = document.getElementById("btnSubmitIndex");
var btnSubmitInventario = document.getElementById("btnSubmitInventario");

if(btnSubmitIndex){
    btnSubmitIndex.addEventListener("click", buscarPropiedadesIndex);
} else if (btnSubmitInventario){
    btnSubmitInventario.addEventListener("click", buscarPropiedadesInventario);
}

function buscarPropiedadesInventario(){
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            var respuesta = xhr.responseXML;
            console.log(xhr.responseXML);

            var x = respuesta.getElementsByTagName("resultado");

            var titulo = x[0].getElementsByTagName("titulo")[0].textContent;

            var contenido = x[0].getElementsByTagName("contenido")[0].textContent;

            if (titulo == "Acceso correcto"){
                window.location="http://localhost:8888/Sistema-Inmobiliaria/html/inventario.html";
            } else if (titulo == "Acceso incorrecto"){
                document.getElementById("mensaje").style.display = "block";
                document.getElementById("mensaje").innerHTML = "Usuario o contraseña inválidos";
            }
        }
    }

    var u = document.getElementById("usuario").value;
    var p = document.getElementById("contrasena").value;
    var q = "usuario="+u+"&"+"contrasena="+p;

    xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/login.pl", true);
    xhr.setRequestHeader(
    'Content-type', 
    'application/x-www-form-urlencoded'
    ); 
    xhr.responseType = "document";
    xhr.send(q);
};

function buscarPropiedadesIndex(){
    console.log("inicio");
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            var respuesta = xhr.responseXML;
            console.log(xhr.responseXML);

            var x = respuesta.getElementsByTagName("resultado");

            //alert(x[0].getElementsByTagName("titulo")[0].textContent);
            var titulo = x[0].getElementsByTagName("titulo")[0].textContent;

            //alert(x[0].getElementsByTagName("contenido")[0].textContent);
            var contenido = x[0].getElementsByTagName("contenido")[0].textContent;

            if (titulo == "Acceso correcto"){
                window.location="http://localhost:8888/Sistema-Inmobiliaria/html/Propietario/menu_Propietario.html";
            } else if (titulo == "Acceso incorrecto"){
                document.getElementById("mensaje").style.display = "block";
                document.getElementById("mensaje").innerHTML = "Usuario o contraseña inválidos";
            }
        }
    }

    var u = document.getElementById("usuario").value;
    var p = document.getElementById("contrasena").value;
    var q = "usuario="+u+"&"+"contrasena="+p;

    xhr.open("POST", "http://localhost:8888/cgi-bin/Sistema-Inmobiliaria/login.pl", true);
    xhr.setRequestHeader(
    'Content-type', 
    'application/x-www-form-urlencoded'
    ); 
    xhr.responseType = "document";
    xhr.send(q);
};