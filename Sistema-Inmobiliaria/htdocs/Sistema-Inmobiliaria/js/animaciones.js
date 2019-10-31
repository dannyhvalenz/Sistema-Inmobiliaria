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
    document.getElementById("barra_superior").style.display =
        "inline-block";
    document.getElementById("barra_superior").style.width = "100%";
}