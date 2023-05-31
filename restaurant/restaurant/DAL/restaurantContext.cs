using Microsoft.EntityFrameworkCore;
using restaurant.Models;

namespace restaurant.DAL
{
    public class restaurantContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
    }
}
