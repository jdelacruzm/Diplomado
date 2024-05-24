using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Model;

namespace DiplomadoEjercicio3.Controllers
{
    public class ClientesController : ApiController
    {
        DemoEntities contexto;
        public ClientesController()
        {
            contexto = new DemoEntities();
        }
        // GET api/<controller>
        public List<Clientes> Get()
        {
            List<Clientes> clientes = 
                contexto.Clientes
                //.Where(x=>x.ClienteNombre.StartsWith("L"))
                .OrderBy(x=>x.ClienteNombre).ToList();
            return clientes;
        }

        // GET api/<controller>/5
        public Clientes Get(int id)
        {
            return contexto.Clientes.Find(id);
        }

        // POST api/<controller>
        public void Post(Clientes value)
        {
            contexto.Clientes.Add(value);
            contexto.SaveChanges();
        }

        // PUT api/<controller>/5
        public void Put(Clientes value)
        {
            Clientes pasado = contexto.Clientes.Find(value.ClienteId);
            contexto.Entry(pasado).CurrentValues.SetValues(value);
            contexto.SaveChanges();

        }

        // DELETE api/<controller>/5
        public void Delete(int ClienteId)
        {
            Clientes cliente = contexto.Clientes.Find(ClienteId);
            contexto.Clientes.Remove(cliente);
            contexto.SaveChanges();
        }
    }
}