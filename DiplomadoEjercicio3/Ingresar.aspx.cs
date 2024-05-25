using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;

namespace DiplomadoEjercicio3
{
    public partial class Ingresar : System.Web.UI.Page
    {
        DemoEntities contexto;
        protected void Page_Load(object sender, EventArgs e)
        {
            contexto = new DemoEntities();
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (contexto.Usuarios.
                Any(x=>x.UsuarioNombre==NombreUsuario.Value 
                && x.UsuarioContraseña==Contraseña.Value))
            {
                Response.Redirect(
                    ResolveUrl("~/AdministracionClientes.aspx"));
            }
            else
            {
                lblMensaje.Text 
                    = "El usuario o la contraseña son incorrectos";
            }
        }
    }
}