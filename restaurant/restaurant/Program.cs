using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using restaurant.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<restaurantContext>(Options=>Options.UseSqlServer(builder.Configuration.GetConnectionString("DBconnection")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
      name: "Front",
      pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
    );
});
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
      name: "ProductManager",
      pattern: "{area:exists}/{controller=ProductCRUD}/{action=Index}/{id?}"
    );
});


app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
