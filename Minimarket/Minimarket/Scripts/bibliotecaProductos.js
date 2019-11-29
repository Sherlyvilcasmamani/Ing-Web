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


//var elBoton = document.getElementById("btnVer");
//elBoton.onclick = function () {
//    var LaLlavePrimaria = document.getElementById("cmbTipo").value;
//    $.get("Producto/listarPorCategoria/?argCodigoCategoria=" + LaLlavePrimaria, function (data) {

//        var contenido = "";
//        contenido += "<table id='miTabla' class='table'>";
//        contenido += "<thead>";
//        contenido += "<tr>";
//        contenido += "<td>Codigo</td>";
//        contenido += "<td>Nombre</td>";
//        contenido += "<td>Descripcion</td>";
//        contenido += "<td>Proveedor</td>";
//        contenido += "<td>Categoria</td>";
//        contenido += "<td>Precio</td>";
//        contenido += "<td>Stock</td>";
//        contenido += "</tr>";
//        contenido += "</thead>";

//        contenido += "<tbody>";
//        for (var i = 0; i < data.length; i++) {
//            contenido += "<tr>";
//            contenido += "<td>" + data[i].Codigo + "</td>";
//            contenido += "<td>" + data[i].Nombre + "</td>";
//            contenido += "<td>" + data[i].Descripcion + "</td>";
//            contenido += "<td>" + data[i].CodigoProveedor.Nombre + "</td>";
//            contenido += "<td>" + data[i].CodigoCategoria.Nombre + "</td>";
//            contenido += "<td>" + data[i].Precio + "</td>";
//            contenido += "<td>" + data[i].Stock + "</td>";
//            contenido += "<td><button class='btn btn-primary' onclick=iniciarEdicion(" + data[i].DNI + ") data-toggle='modal' data-target='#exampleModal'> <i class='glyphicon glyphicon-edit'></i></button> </td>";
//            contenido += "<td><button class='btn btn-primary' onclick=iniciarEliminado(" + data[i].DNI + ")>  <i class='glyphicon glyphicon-trash'></i></button> </td>";
//            contenido += "</tr>";
//        }
//        contenido += "</tbody>";
//        contenido += "</table>";
//        document.getElementById("listaProductos").innerHTML = contenido;
//    })
//};
