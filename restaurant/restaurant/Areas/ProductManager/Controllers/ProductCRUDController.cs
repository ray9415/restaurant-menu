using Microsoft.AspNetCore.Mvc;
using restaurant.Models;
using restaurant.Data;

namespace restaurant.Areas.ProductManager.Controllers
{
    [Area("ProductManager")]
    public class ProductCRUDController : Controller
    {
        private readonly restaurantContext _context;
        public ProductCRUDController(restaurantContext context)
        {
            _context = context;
        }
        public IActionResult Index() 
        { 
            var result = _context.Products.ToList();
            return View(result); 
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Product product)
        {
            _context.Products.Add(product);
            _context.SaveChanges();
            return View();
        }
    }
}
