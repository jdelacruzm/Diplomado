using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;

namespace DiplomadoEjercicio3.Models
{
    public class ApplicationUser : IdentityUser
    {
        // Puedes agregar propiedades adicionales aquí.
    }
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext() : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}