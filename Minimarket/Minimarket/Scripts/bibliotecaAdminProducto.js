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
    document.getElementById("cmbCategoriaParaEditar").innerHTML = contenido;
    document.getElementById("cmbCategoriaParaEditar2").innerHTML = contenido;

});

$.get("Proveedor/listarTodo", function (data) {
    var contenido = "";
    contenido += "<select id='cmbProveedor' class='form-control' >";

    for (var i = 0; i < data.length; i++) {

        contenido += "<option value=" + data[i].Codigo +
            ">" + data[i].Nombre +
            "</option>";
    }
    contenido += "</select>";
    document.getElementById("cmbProveedorParaEditar").innerHTML = contenido;
    document.getElementById("cmbProveedorParaEditar2").innerHTML = contenido;

});

var elBoton = document.getElementById("btnVer");
elBoton.onclick = function () {
    var LaLlavePrimaria = document.getElementById("cmbCategoria").value;
    $.get("Producto/listarPorCategoria/?argCodigoCategoria=" + LaLlavePrimaria, function (data) {

        var contenido = "";
        contenido += "<table id='miTabla' class='table'>";
        contenido += "<thead>";
        contenido += "<tr>";
        contenido += "<td>Codigo</td>";
        contenido += "<td>Nombre</td>";
        contenido += "<td>Descripcion</td>";
        contenido += "<td>Proveedor</td>";
        contenido += "<td>Categoria</td>";
        contenido += "<td>Precio</td>";
        contenido += "<td>Stock</td>";
        contenido += "</tr>";
        contenido += "</thead>";

        contenido += "<tbody>";
        for (var i = 0; i < data.length; i++) {
            contenido += "<tr>";
            contenido += "<td>" + data[i].Codigo + "</td>";
            contenido += "<td>" + data[i].Nombre + "</td>";
            contenido += "<td>" + data[i].Descripcion + "</td>";
            contenido += "<td>" + data[i].CodigoProveedor.Nombre + "</td>";
            contenido += "<td>" + data[i].CodigoCategoria.Nombre + "</td>";
            contenido += "<td>" + data[i].Precio + "</td>";
            contenido += "<td>" + data[i].Stock + "</td>";
            contenido += "<td><button class='btn btn-primary' onclick=iniciarEdicion(" + data[i].Codigo + ") data-toggle='modal' data-target='#exampleModal'> <i class='glyphicon glyphicon-edit'></i></button> </td>";
            contenido += "<td><button class='btn btn-primary' onclick=iniciarEliminado(" + data[i].Codigo + ")>  <i class='glyphicon glyphicon-trash'></i></button> </td>";
            contenido += "</tr>";
        }
        contenido += "</tbody>";
        contenido += "</table>";
        document.getElementById("listaProductos").innerHTML = contenido;
    })
};


function iniciarEdicion(elCodigoCapturado) {

    $.get("AdminProducto/Buscar_PorCodigo/?argCodigo=" + elCodigoCapturado, function (losDatos) {
        document.getElementById("txtCodigo").disabled = true;
        for (var i = 0; i < losDatos.length; i++) {
            document.getElementById("txtCodigo").value = losDatos[i].Codigo;
            document.getElementById("txtNombre").value = losDatos[i].Nombre;
            document.getElementById("txtDescripcion").value = losDatos[i].Descripcion;
            document.getElementById("txtPrecio").value = losDatos[i].Precio;
            document.getElementById("txtStock").value = losDatos[i].Stock;


            var elComboProveedor = document.getElementById("cmbProveedorParaEditar");

            for (var k = 0; k < elComboProveedor.length; k++) {
                if (elComboProveedor[k].value == losDatos[i].CodigoProveedor.Codigo) {
                    document.getElementById("cmbProveedorParaEditar").selectedIndex = k;
                    break;
                }
            }

            var elComboCategoria = document.getElementById("cmbCategoriaParaEditar");
            for (var k = 0; k < elComboCategoria.length; k++) {
                if (elComboCategoria[k].value == losDatos[i].CodigoCategoria.Codigo) {
                    document.getElementById("cmbCategoriaParaEditar").selectedIndex = k;
                    break;
                }
            }

        }

    });
};


var botonGuardarModal = document.getElementById("btnGuardarDeModal");
botonGuardarModal.onclick = function () {
    GuardarDatos();
};

function iniciarEliminado(elCodigoCapturado) {

    var losDatos = new FormData();

    losDatos.append("Codigo", elCodigoCapturado);


    $.ajax({
        type: "POST",
        url: "AdminProducto/Eliminar",
        data: losDatos,
        contentType: false,
        processData: false,
        success: function (resultado) {
            if (resultado == 'True') {
                alert("Producto eliminado.");
            }
            else {
                alert("Ocurrió un error.");
            }
        }
    });
    //alert("¿Desea eliminar a " + elCodigoCapturado + " ?");
};



function GuardarDatos() {

    var CodigoExistente = document.getElementById("txtCodigo").value;
    var nombreNUEVO = document.getElementById("txtNombre").value;
    var descripcionNUEVO = document.getElementById("txtDescripcion").value;
    var precioNUEVO = document.getElementById("txtPrecio").value;
    var stockNUEVO = document.getElementById("txtStock").value;

    var proveedorNUEVO = document.getElementById("cmbProveedorParaEditar").value;
    var categoriaNUEVO = document.getElementById("cmbCategoriaParaEditar").value;

    var losDatos = new FormData();
    losDatos.append("Codigo", CodigoExistente);
    losDatos.append("Nombre", nombreNUEVO);
    losDatos.append("Descripcion", descripcionNUEVO);
    losDatos.append("Precio", precioNUEVO);
    losDatos.append("Stock", stockNUEVO);

    //Cuidadoooooooo
    //Cuidadoooooooo - (Porque son llaves foráneas)
    losDatos.append("CodigoProveedor.Codigo", proveedorNUEVO);
    losDatos.append("CodigoCategoria.Codigo", categoriaNUEVO);
    //Cuidadoooooooo
    //Cuidadoooooooo

    $.ajax({
        type: "POST",
        url: "AdminProducto/Editar",
        data: losDatos,
        contentType: false,
        processData: false,
        success: function (resultado) {
            if (resultado == 'True') {
                alert("Datos guardados satisfactoriamente.");
            }
            else {
                alert("Ocurrió un error.");
            }
        }
    });
};

var botonGuardarModal2 = document.getElementById("btnGuardarDeModal2");
botonGuardarModal2.onclick = function () {
    InsertarDatos();
};



function InsertarDatos() {


    var nombreNUEVO = document.getElementById("txtNombre2").value;
    var descripcionNUEVO = document.getElementById("txtDescripcion2").value;
    var precioNUEVO = document.getElementById("txtPrecio2").value;
    var stockNUEVO = document.getElementById("txtStock2").value;

    var proveedorNUEVO = document.getElementById("cmbProveedorParaEditar2").value;
    var categoriaNUEVO = document.getElementById("cmbCategoriaParaEditar2").value;

    var losDatos = new FormData();

    losDatos.append("Nombre", nombreNUEVO);
    losDatos.append("Descripcion", descripcionNUEVO);
    losDatos.append("Precio", precioNUEVO);
    losDatos.append("Stock", stockNUEVO);
    losDatos.append("CodigoProveedor", proveedorNUEVO);
    losDatos.append("CodigoCategoria", categoriaNUEVO);


    $.ajax({
        type: "POST",
        url: "AdminProducto/Insertar",
        data: losDatos,
        contentType: false,
        processData: false,
        success: function (resultado) {
            if (resultado == 'True') {
                alert("Datos guardados satisfactoriamente.");
            }
            else {
                alert("Ocurrió un error.");
            }
        }
    });
};