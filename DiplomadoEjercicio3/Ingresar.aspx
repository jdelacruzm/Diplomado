<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ingresar.aspx.cs" Inherits="DiplomadoEjercicio3.Ingresar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        .row {
            margin-bottom: 20px;
        }

        .rojo{
            color:red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <b>Nombre de usuario</b>
                </div>
                 <div class="col-md-3">
                    <input id="NombreUsuario" 
                        class="form-control"
                        runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <b>Contraseña</b>
                </div>
                 <div class="col-md-3">
                    <input id="Contraseña" 
                        class="form-control"
                        type="password" 
                        runat="server" />
                </div>
            </div>
             <div class="row">
                 <div class="col-md-3">
                     <asp:Button ID="btnIngresar" 
                         CssClass="btn btn-primary" 
                         runat="server" Text="Ingresar"
                          OnClick="btnIngresar_Click"
                         />
                     <asp:Label ID="lblMensaje" CssClass="rojo" 
                         runat="server" Text=""></asp:Label>
                 </div>
             </div>
        </div>
    </form>
</body>
</html>
