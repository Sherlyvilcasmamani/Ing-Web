$.get("Categoria/listarTodo", function (data) {
    var contenido = "";
    contenido += "<select id='cmbCategoria' class='form-control' >";

    for (var i = 0; i < data.length; i++) {

        contenido += "<option value=" + data[i].Codigo +
            ">" + data[i].Nombre +
            "</option>";
    }
    contenido += "</select>";
    document.getElementById("cmbCategoria").innerHTML = contenido;

});

$.get("Producto/listarTodo", function (data) {
    var contenido = "";
    contenido += "<div id='productos' class='row'>"
    for (var i = 0; i < data.length; i++) {

        contenido += "<div class='col-md-4'>";
        contenido += "<div class='carta'>";
        contenido += "<img src='" + data[i].Imagen + "' alt='Card image cap' style='width:100%'>";
        contenido += "<h1>" + data[i].Nombre + "</h1>";
        contenido += "<p class='precio'>S/." + data[i].Precio + "</p>";
        contenido += "<p>" + data[i].Descripcion + "</p>";
        contenido += "<p>Stock: " + data[i].Stock + " unidades</p>";
        contenido += "<p><button>Add to Cart</button></p>";
        contenido += "</div>";
        contenido += "</div>";
    }

    contenido += "</div>";

    document.getElementById("productos").innerHTML = contenido;

});


var elBoton = document.getElementById("btnBuscar");
elBoton.onclick = function () {
    var LaLlavePrimaria = document.getElementById("cmbCategoria").value;
    $.get("Producto/listarPorCategoria/?argCodigoCategoria=" + LaLlavePrimaria, function (data) {
        var contenido = "";
        contenido += "<div id='productos' class='row'>"
        for (var i = 0; i < data.length; i++) {

            contenido += "<div class='col-md-4'>";
            contenido += "<div class='carta'>";
            contenido += "<img src='" + data[i].Imagen + "' alt='Card image cap' style='width:100%'>";
            contenido += "<h1>" + data[i].Nombre + "</h1>";
            contenido += "<p class='precio'>S/." + data[i].Precio + "</p>";
            contenido += "<p>" + data[i].Descripcion + "</p>";
            contenido += "<p>Stock: " + data[i].Stock + " unidades</p>";
            contenido += "<p><button>Add to Cart</button></p>";
            contenido += "</div>";
            contenido += "</div>"; 
        }

        contenido += "</div>";

        document.getElementById("productos").innerHTML = contenido;

    })


}
