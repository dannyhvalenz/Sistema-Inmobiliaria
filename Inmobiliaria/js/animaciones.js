'use strict';
function w3_open() {
    window.document.getElementById("divAdmin").style.display = "block";
    window.document.getElementById("divVisualizar").style.width = "50%";
    window.document.getElementById("divAdmin").style.width = "50%";
    window.document.getElementById("divAdmin").style.height = "100vh";
    window.document.getElementById("divAdmin").style.display = "block";
    window.document.getElementById("divAdmin").style.visibility = "visible";
    window.document.getElementById("divAdmin").innerHTML =
        '<object type="text/html" data="registro_propiedad.html" height="100%" width="100%" class="w3-border-left"></object>';
}

function w3_close() {
    window.document.getElementById("divAdmin").style.display = "none";
}

function w3_open_sidebar() {
    window.document.getElementById("main").style.marginLeft = "25%";
    window.document.getElementById("mySidebar").style.width = "25%";
    window.document.getElementById("mySidebar").style.display = "block";

    window.document.getElementById("barra_superior").style.width = "75%";
    window.document.getElementById("barra_superior").style.float = "right";
}

function w3_close_sidebar() {
    window.document.getElementById("main").style.marginLeft = "0%";
    window.document.getElementById("mySidebar").style.display = "none";
    window.document.getElementById("barra_superior").style.display = "inline-block";
    window.document.getElementById("barra_superior").style.width = "100%";
}
