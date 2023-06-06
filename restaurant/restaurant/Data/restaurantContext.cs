using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using restaurant.Models;

namespace restaurant.Data
{
    public class restaurantContext : DbContext
    {
        public restaurantContext(DbContextOptions<restaurantContext> options):base(options)
        {
        }
        public DbSet<Product> Products { get; set; }
        public DbSet<Order> Orders { get; set; }    
        public DbSet<OrderDetail> OrderDetails { get; set; }
    }
}
