using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Model;

namespace DiplomadoEjercicio3.Controllers
{
    public class UsuariosController : ApiController
    {
        DemoEntities contexto;
        public UsuariosController()
        {
            contexto = new DemoEntities();
        }

        // GET api/<controller>
        public List<Usuarios> Get()
        {
            List<Usuarios> Usuarios =
                contexto.Usuarios
                //.Where(x=>x.UsuarioNombre.StartsWith("L"))
                .OrderBy(x => x.UsuarioNombre).ToList();
            return Usuarios;
        }

        // GET api/<controller>/5
        public Usuarios Get(int id)
        {
            return contexto.Usuarios.Find(id);
        }

        // POST api/<controller>
        public void Post(Usuarios value)
        {
            //Any
            //Válida que no exista el nombre de usuario
            //a insertar
            if (!contexto.Usuarios.
                Any(x=>x.UsuarioNombre==value.UsuarioNombre))
            {
                contexto.Usuarios.Add(value);
                contexto.SaveChanges();
            }
           
        }

        // PUT api/<controller>/5
        public void Put(Usuarios value)
        {
            Usuarios pasado = contexto.Usuarios.Find(value.UsuarioId);
            contexto.Entry(pasado).CurrentValues.SetValues(value);
            contexto.SaveChanges();

        }

        // DELETE api/<controller>/5
        public void Delete(int UsuarioId)
        {
            Usuarios Usuario = contexto.Usuarios.Find(UsuarioId);
            contexto.Usuarios.Remove(Usuario);
            contexto.SaveChanges();
        }
    }
}