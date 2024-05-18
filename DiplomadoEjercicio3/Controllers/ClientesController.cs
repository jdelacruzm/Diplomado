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
                contexto.Clientes.
                Where(x=>x.ClienteNombre.StartsWith("L"))
                .OrderBy(x=>x.ClienteNombre).ToList();
            return clientes;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}