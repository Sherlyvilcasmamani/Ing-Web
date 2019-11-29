var elBoton = document.getElementById("btnListar");
elBoton.onclick = function () {

    $.get("Cliente/listarTodo", function (data) {

        var contenido = "";
        contenido += "<table id='miTabla' class='table'>";
        contenido += "<thead>";
        contenido += "<tr>";
        contenido += "<td>Codigo</td>";
        contenido += "<td>Nombre</td>";
        contenido += "<td>Direccion</td>";
        contenido += "<td>Ciudad</td>";
        contenido += "<td>Email</td>";
        contenido += "<td>Telefono</td>";
        contenido += "<td>Opciones</td>";
        contenido += "</tr>";
        contenido += "</thead>";

        for (var i = 0; i < data.length; i++) {

            contenido += "<tbody>";
            contenido += "<tr>";
            contenido += "<td>" + data[i].Codigo + "</td>";
            contenido += "<td>" + data[i].Nombre + "</td>";
            contenido += "<td>" + data[i].Direccion + "</td>";
            contenido += "<td>" + data[i].Ciudad + "</td>";
            contenido += "<td>" + data[i].Email + "</td>";
            contenido += "<td>" + data[i].Telefono + "</td>";
            contenido += "<td><button class='btn btn-primary' onclick=iniciarEdicion(" + data[i].Codigo + ") data-toggle='modal' data-target='#exampleModal'> <i class='glyphicon glyphicon-edit'></i></button> ";
            contenido += "<button class='btn btn-primary' onclick=iniciarEliminado(" + data[i].Codigo + ") data-toggle='modal' data-target='#eliminarModal'>  <i class='glyphicon glyphicon-trash'></i></button> </td>";
            contenido += "</tr>";
        }

        contenido += "</tbody>";
        contenido += "</table>";

        document.getElementById("misClientes").innerHTML = contenido;


    });
};

function iniciarEdicion(elCodigoCapturado) {
    $.get("Cliente/Buscar_PorCodigo/?argCodigo=" + elCodigoCapturado, function (data) {
        //$.get("Participante/Buscar_PorDNI/?argDNI=" + elCodigoCapturado, function (data) {
        document.getElementById("txtCodigo").disabled = true;
        for (var i = 0; i < data.length; i++) {
            document.getElementById("txtCodigo").value = data[i].Codigo;
            document.getElementById("txtNombres").value = data[i].Nombre;
            document.getElementById("txtDireccion").value = data[i].Direccion;
            document.getElementById("txtCiudad").value = data[i].Ciudad;

            document.getElementById("txtEmail").value = data[i].Email;
            document.getElementById("txtTelefono").value = data[i].Telefono;



        }



    });
};
function iniciarEliminado(elCodigoCapturado) {

    var losDatos = new FormData();

    losDatos.append("Codigo", elCodigoCapturado);


    $.ajax({
        type: "POST",
        url: "Cliente/EliminarCliente",
        data: losDatos,
        contentType: false,
        processData: false,
        success: function (resultado) {
            if (resultado == 'True') {
                alert("Cliente eliminado.");
            }
            else {
                alert("Ocurrió un error.");
            }
        }
    });
    //alert("¿Desea eliminar a " + elCodigoCapturado + " ?");
};
var botonGuardarModal = document.getElementById("btnGuardarDeModal");
botonGuardarModal.onclick = function () {
    GuardarDatos();
};

function GuardarDatos() {
    
    var CODExistente = document.getElementById("txtCodigo").value;
    var nombreNUEVO = document.getElementById("txtNombres").value;
    var direccionNUEVO = document.getElementById("txtDireccion").value;
    var ciudadNUEVO = document.getElementById("txtCiudad").value;
    var emailNUEVO = document.getElementById("txtEmail").value;
    var telfNUEVO = document.getElementById("txtTelefono").value;


    var losDatos = new FormData();
    losDatos.append("Codigo", CODExistente);
    losDatos.append("Nombre", nombreNUEVO);
    losDatos.append("Direccion", direccionNUEVO);
    losDatos.append("Ciudad", ciudadNUEVO);
    losDatos.append("Email", emailNUEVO);
    losDatos.append("Telefono", telfNUEVO);


    $.ajax({
        type: "POST",
        url: "Cliente/Editar",
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

    var codigoNUEVO = document.getElementById("txtCodigo2").value;
    var nombreNUEVO = document.getElementById("txtNombres2").value;
    var direccionNUEVO = document.getElementById("txtDireccion2").value;
    var ciudadNUEVO = document.getElementById("txtCiudad2").value;
    var emailNUEVO = document.getElementById("txtEmail2").value;
    var telfNUEVO = document.getElementById("txtTelefono2").value;


    var losDatos = new FormData();

    losDatos.append("Codigo", codigoNUEVO);
    losDatos.append("Nombre", nombreNUEVO);
    losDatos.append("Direccion", direccionNUEVO);
    losDatos.append("Ciudad", ciudadNUEVO);
    losDatos.append("Email", emailNUEVO);
    losDatos.append("Telefono", telfNUEVO);


    $.ajax({
        type: "POST",
        url: "Cliente/Insertar",
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


