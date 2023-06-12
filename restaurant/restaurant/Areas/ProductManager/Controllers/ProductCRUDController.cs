using Microsoft.AspNetCore.Mvc;
//using System.IO;
using System.Collections;
using restaurant.Models;
using restaurant.Data;
using System.Threading.Tasks;

namespace restaurant.Areas.ProductManager.Controllers
{
    [Area("ProductManager")]
    public class ProductCRUDController : Controller
    {
        private readonly restaurantContext _context;
        private readonly IWebHostEnvironment _environment ;
        public ProductCRUDController(restaurantContext context, IWebHostEnvironment environment)
        {
            _context = context;
            _environment = environment;
        }

        public IActionResult Index() 
        { 
            var result = _context.Products.OrderBy(m => m.Type).ToList();
            return View(result); 
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        public async Task <IActionResult> Create(Product product , IFormFile file)
        {
            //檔案上傳
            string uploadpath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/IMGs", file.FileName);
            using (var stream = new FileStream(uploadpath, FileMode.Create))
            {
                await file.OpenReadStream().CopyToAsync(stream);
            }
            product.IMG = file.FileName;
            _context.Products.Add(entity:product);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id) 
        {
            var product = _context.Products.Where(m => m.ProductId == id).FirstOrDefault();
            return View(product);
        }

        [HttpPost]
        public IActionResult Edit(Product product)
        {
            var modify = _context.Products.Where(m => m.ProductId == product.ProductId).FirstOrDefault();
            modify.Name = product.Name;
            modify.Description = product.Description;
            modify.Price = product.Price;
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            var p = _context.Products.Where(d => d.ProductId == id).FirstOrDefault(); 
            return View(p);
        }

        public IActionResult Delete(Product p) 
        {
            _context.Products.Remove(p);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
