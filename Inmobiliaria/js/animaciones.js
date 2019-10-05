"use strict";
function w3_open() {
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divVisualizar").style.width = "50%";
    document.getElementById("divAdmin").style.width = "50%";
    document.getElementById("divAdmin").style.height = "100vh";
    document.getElementById("divAdmin").style.display = "block";
    document.getElementById("divAdmin").style.visibility = "visible";

    document.getElementById("divAdmin").innerHTML =
        '<object type="text/html" data="registro_propiedad.html" ></object>';
}

function w3_close() {
    document.getElementById("divAdmin").style.display = "none";
}

function w3_open_sidebar() {
    document.getElementById("main").style.marginLeft = "25%";
    document.getElementById("mySidebar").style.width = "25%";
    document.getElementById("mySidebar").style.display = "block";

    document.getElementById("barra_superior").style.width = "75%";
    document.getElementById("barra_superior").style.float = "right";
}

function w3_close_sidebar() {
    document.getElementById("main").style.marginLeft = "0%";
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("barra_superior").style.display = "inline-block";
    document.getElementById("barra_superior").style.width = "100%";
}
