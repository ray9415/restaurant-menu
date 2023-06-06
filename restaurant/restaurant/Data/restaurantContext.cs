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

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<OrderDetail>().HasKey(od => new {od.OrderId,od.ProductId});
        }
    }
}
