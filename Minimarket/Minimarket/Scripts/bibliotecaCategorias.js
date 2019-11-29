var elBoton = document.getElementById("btnListar");
elBoton.onclick = function () {

    $.get("Categoria/listarTodo", function (data) {

        var contenido = "";
        contenido += "<table id='miTabla' class='table'>";
        contenido += "<thead>";
        contenido += "<tr>";
        contenido += "<td>Codigo</td>";
        contenido += "<td>Nombre</td>";
        contenido += "<td>Descripción</td>";
        contenido += "</tr>";
        contenido += "</thead>";

        for (var i = 0; i < data.length; i++) {

            contenido += "<tbody>";
            contenido += "<tr>";
            contenido += "<td>" + data[i].Codigo + "</td>";
            contenido += "<td>" + data[i].Nombre + "</td>";
            contenido += "<td>" + data[i].Descripcion + "</td>";
            contenido += "<td><button class='btn btn-primary' onclick=iniciarEdicion(" + data[i].Codigo + ") data-toggle='modal' data-target='#exampleModal'> <i class='glyphicon glyphicon-edit'></i></button> ";
            contenido += "<button class='btn btn-primary' onclick=iniciarEliminado(" + data[i].Codigo + ") data-toggle='modal' data-target='#eliminarModal'>  <i class='glyphicon glyphicon-trash'></i></button> </td>";
            contenido += "</tr>";
        }

        contenido += "</tbody>";
        contenido += "</table>";

        document.getElementById("misCategorias").innerHTML = contenido;


    });
};



function iniciarEdicion(elCodigoCapturado) {
    $.get("Categoria/Buscar_PorCodigo/?argCodigo=" + elCodigoCapturado, function (data) {

        document.getElementById("txtCodigo").disabled = true;
        for (var i = 0; i < data.length; i++) {
            document.getElementById("txtCodigo").value = data[i].Codigo;
            document.getElementById("txtNombres").value = data[i].Nombre;
            document.getElementById("txtDescripcion").value = data[i].Descripcion;

        }

    });
};
function iniciarEliminado(elCodigoCapturado) {

    var losDatos = new FormData();

    losDatos.append("Codigo", elCodigoCapturado);


    $.ajax({
        type: "POST",
        url: "Categoria/Eliminar",
        data: losDatos,
        contentType: false,
        processData: false,
        success: function (resultado) {
            if (resultado == 'True') {
                alert("Categoria eliminado.");
            }
            else {
                alert("Ocurrió un error.");
            }
        }
    });

    //alert("¿Desea eliminar a " + elCodigoCapturado+" ?");
};
var botonGuardarModal = document.getElementById("btnGuardarDeModal");
botonGuardarModal.onclick = function () {
    GuardarDatos();
};

function GuardarDatos() {

    var CODExistente = document.getElementById("txtCodigo").value;
    var nombreNUEVO = document.getElementById("txtNombres").value;
    var descripcionNUEVO = document.getElementById("txtDescripcion").value;



    var losDatos = new FormData();
    losDatos.append("Codigo", CODExistente);
    losDatos.append("Nombre", nombreNUEVO);
    losDatos.append("Descripcion", descripcionNUEVO);



    $.ajax({
        type: "POST",
        url: "Categoria/Editar",
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

    var codNUEVO = document.getElementById("txtCodigo2").value;
    var nombreNUEVO = document.getElementById("txtNombres2").value;
    var descripcionNUEVO = document.getElementById("txtDescripcion2").value;



    var losDatos = new FormData();
    losDatos.append("Codigo", codNUEVO);
    losDatos.append("Nombre", nombreNUEVO);
    losDatos.append("Descripcion", descripcionNUEVO);



    $.ajax({
        type: "POST",
        url: "Categoria/Insertar",
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