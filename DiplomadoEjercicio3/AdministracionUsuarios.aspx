<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionUsuarios.aspx.cs" Inherits="DiplomadoEjercicio3.AdministracionUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Administración de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
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
                    <h4>Usuarios</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9">
                </div>
                <div class="col-md-3">
                    <button id="agregarUsuario" class="btn btn-primary"
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
                                <td>Contraseña</td>
                                <td>Editar</td>
                                <td>Eliminar</td>
                            </tr>
                        </thead>
                        <tbody id="listadoUsuarios">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="UsuarioModal" class="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Nombre del Usuario</label>
                                <input id="UsuarioNombre" type="text"
                                    class="form-control" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Contraseña del Usuario</label>
                                <input id="UsuarioContraseña" type="text"
                                    class="form-control" required />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button id="btnGuardar" type="button"
                            onclick="GuardarUsuario();"
                            class="btn btn-primary">
                            Guardar</button>
                         <button id="btnActualizar" type="button"
                            onclick="ActualizarUsuario();"
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
                        <p id="UsuarioAEliminar"></p>
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
        var uri = "api/Usuarios";
        var UsuarioSeleccionado;

        $(function () {
            console.log("página cargada completamente");
            DevolverUsuarios();
        });

        function DevolverUsuarios() {
            $.getJSON(uri).done(function (data) {
                console.log(data);
                $("#listadoUsuarios").empty();
                $.each(data, function (index, value) {
                    let row = "<td>" + value.UsuarioId + "</td>" +
                        "<td>" + value.UsuarioNombre + "</td>" +
                        "<td>" + value.UsuarioContraseña + "</td>" +
                        "<td><button class='btn btn-info'" +
                        "onclick=LanzarEdicion(" + value.UsuarioId + ");"
                        +">" +
                        "Editar</button></td>" +
                        "<td> <button class='btn btn-danger'" +
                        "onclick='LanzarEliminar(" + value.UsuarioId +
                        "," + "\"" + value.UsuarioNombre + "\""+
                        ");'>" +
                        "Eliminar </button> </td>";
                    $('<tr/>', { html: row }).appendTo($("#listadoUsuarios"));
                });
                console.log("llamada exitosa");
            }).fail(function () {
                console.log("error al llamar el controlador");
            }).always(function () {
                console.log("llamada al controlador");
            });
        }

        function LanzarEdicion(UsuarioId) {
            $("#btnGuardar").hide();
            $("#btnActualizar").show();
            ConsultarUsuario(UsuarioId);
            $("#UsuarioModal").modal('show');
        }

        function ConsultarUsuario(UsuarioId) {
            $.get(uri, { id: UsuarioId }, function (Usuario) {
                console.log("Se realizó la consulta correctamente");
                CargarUsuario(Usuario);
            });
        }

        function CargarUsuario(Usuario) {
            $("#UsuarioNombre").val(Usuario.UsuarioNombre);
            $("#UsuarioContraseña").val(Usuario.UsuarioContraseña);
            UsuarioSeleccionado = Usuario.UsuarioId;
        }

        function LanzarEliminar(UsuarioId, nombreUsuario) {
            UsuarioSeleccionado = UsuarioId;
            $("#UsuarioAEliminar").text(nombreUsuario);
            $("#ConfimarEliminar").modal('show');
        }

        function Eliminar() {
            $("#ConfimarEliminar").modal('hide');
            EliminarUsuario(UsuarioSeleccionado);
        }

        function EliminarUsuario(UsuarioId) {
            $.ajax({
                url: uri + "?UsuarioId=" + UsuarioId,
                type: "DELETE",
                dataType: "json",
                success: function (data, textStatus, xhr) {
                    console.log("El Usuario se elimino exitosamente");
                    DevolverUsuarios();
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Ha ocurrido un error en el eliminado del Usuario");
                },
            });
        }

        function LanzarModal() {
            $("#btnGuardar").show();
            $("#btnActualizar").hide();
            $("#UsuarioModal").modal('show');
        }

        function GuardarUsuario() {
            var Usuario = ObtenerUsuario();
            $.ajax({
                url: uri,
                type: "POST",
                data: Usuario,
                dataType: "json",
                success: function (data, textStatus, xhr) {
                    console.log("El Usuario se agrego exitosamente");
                    DevolverUsuarios();
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Ha ocurrido un error en el grabado del Usuario");
                }
            });
            $("#UsuarioModal").modal('hide');
        }

        function ActualizarUsuario() {
            var Usuario = ObtenerUsuario();
            Usuario.UsuarioId = UsuarioSeleccionado;
            $.ajax({
                url: uri,
                type: 'PUT',
                dataType: 'json',
                data: Usuario,
                success: function (data, textStatus, xhr) {
                    console.log("El Usuario se actualizó exitosamente");
                    DevolverUsuarios();
                },
                error: function (xhr, textStatus, errorThrown) {
                    console.log("Ha ocurrido un error en la actualizada del Usuario");
                }
            });
            $('#UsuarioModal').modal('hide');
        }

        function ObtenerUsuario() {
            var Usuario = new Object();
            Usuario.UsuarioNombre = $("#UsuarioNombre").val();
            Usuario.UsuarioContraseña = $("#UsuarioContraseña").val();
            console.log(Usuario);
            return Usuario;
        }
        </script>

</body>
</html>
