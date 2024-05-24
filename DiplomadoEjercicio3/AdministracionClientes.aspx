<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionClientes.aspx.cs" Inherits="DiplomadoEjercicio3.AdministracionClientes" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Administración de clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        .row {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" novalidate="novalidate"
        onsubmit="return false;">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <h4>Clientes</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9">
                </div>
                <div class="col-md-3">
                    <button id="agregarCliente" class="btn btn-primary"
                        onclick="LanzarModal();">
                        Agregar
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <td>Id</td>
                                <td>Nombre</td>
                                <td>Telefono</td>
                                <td>Domicilio</td>
                                <td>Editar</td>
                                <td>Eliminar</td>
                            </tr>
                        </thead>
                        <tbody id="listadoClientes">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="ClienteModal" class="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cliente</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Nombre del Cliente</label>
                                <input id="ClienteNombre" type="text"
                                    class="form-control" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Teléfono del Cliente</label>
                                <input id="ClienteTelefono" type="text"
                                    class="form-control" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Dirección del Cliente</label>
                                <input id="ClienteDireccion" type="text"
                                    class="form-control" required />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button id="btnGuardar" type="button"
                            onclick="GuardarCliente();"
                            class="btn btn-primary">
                            Guardar</button>
                         <button id="btnActualizar" type="button"
                            onclick="ActualizarCliente();"
                            class="btn btn-primary">
                            Actualizar</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="ConfimarEliminar" class="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirmación de Eliminar</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>¿Esta seguro que desea eliminar el registro?</p>
                        <p id="ClienteAEliminar"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="button" onclick="Eliminar();" class="btn btn-primary">Si</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        var uri = "api/Clientes";
        var clienteSeleccionado;

        $(function () {
            console.log("página cargada completamente");
            DevolverClientes();
        });

        function DevolverClientes() {
            $.getJSON(uri).done(function (data) {
                console.log(data);
                $("#listadoClientes").empty();
                $.each(data, function (index, value) {
                    let row = "<td>" + value.ClienteId + "</td>" +
                        "<td>" + value.ClienteNombre + "</td>" +
                        "<td>" + value.ClienteTelefono + "</td>" +
                        "<td>" + value.ClienteDireccion + "</td>" +
                        "<td><button class='btn btn-info'" +
                        "onclick=LanzarEdicion(" + value.ClienteId + ");"
                        +">" +
                        "Editar</button></td>" +
                        "<td> <button class='btn btn-danger'" +
                        "onclick='LanzarEliminar(" + value.ClienteId +
                        "," + "\"" + value.ClienteNombre + "\""+
                        ");'>" +
                        "Eliminar </button> </td>";
                    $('<tr/>', { html: row }).appendTo($("#listadoClientes"));
                });
                console.log("llamada exitosa");
            }).fail(function () {
                console.log("error al llamar el controlador");
            }).always(function () {
                console.log("llamada al controlador");
            });
        }

        function LanzarEdicion(clienteId) {
            $("#btnGuardar").hide();
            $("#btnActualizar").show();
            ConsultarCliente(clienteId);
            $("#ClienteModal").modal('show');
        }

        function ConsultarCliente(clienteId) {
            $.get(uri, { id: clienteId }, function (cliente) {
                console.log("Se realizó la consulta correctamente");
                CargarCliente(cliente);
            });
        }

        function CargarCliente(cliente) {
            $("#ClienteNombre").val(cliente.ClienteNombre);
            $("#ClienteTelefono").val(cliente.ClienteTelefono);
            $("#ClienteDireccion").val(cliente.ClienteDireccion);
            clienteSeleccionado = cliente.ClienteId;
        }

        function LanzarEliminar(ClienteId, nombreCliente) {
            clienteSeleccionado = ClienteId;
            $("#ClienteAEliminar").text(nombreCliente);
            $("#ConfimarEliminar").modal('show');
        }

        function Eliminar() {
            $("#ConfimarEliminar").modal('hide');
            EliminarCliente(clienteSeleccionado);
        }

        function EliminarCliente(ClienteId) {
            $.ajax({
                url: uri + "?ClienteId=" + ClienteId,
                type: "DELETE",
                dataType: "json",
                success: function (data, textStatus, xhr) {
                    console.log("El cliente se elimino exitosamente");
                    DevolverClientes();
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Ha ocurrido un error en el eliminado del cliente");
                },
            });
        }

        function LanzarModal() {
            $("#btnGuardar").show();
            $("#btnActualizar").hide();
            $("#ClienteModal").modal('show');
        }

        function GuardarCliente() {
            var cliente = ObtenerCliente();
            $.ajax({
                url: uri,
                type: "POST",
                data: cliente,
                dataType: "json",
                success: function (data, textStatus, xhr) {
                    console.log("El cliente se agrego exitosamente");
                    DevolverClientes();
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Ha ocurrido un error en el grabado del cliente");
                }
            });
            $("#ClienteModal").modal('hide');
        }

        function ActualizarCliente() {
            var cliente = ObtenerCliente();
            cliente.ClienteId = clienteSeleccionado;
            $.ajax({
                url: uri,
                type: 'PUT',
                dataType: 'json',
                data: cliente,
                success: function (data, textStatus, xhr) {
                    console.log("El cliente se actualizó exitosamente");
                    DevolverClientes();
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Ha ocurrido un error en la actualizada del cliente");
                }
            });
            $('#ClienteModal').modal('hide');
        }

        function ObtenerCliente() {
            var cliente = new Object();
            cliente.ClienteNombre = $("#ClienteNombre").val();
            cliente.ClienteTelefono = $("#ClienteTelefono").val();
            cliente.ClienteDireccion = $("#ClienteDireccion").val();
            console.log(cliente);
            return cliente;
        }
    </script>
</body>
</html>
