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

        [HttpPost]//上傳檔案
        public async Task <IActionResult> Upload(IFormFile file)
        {
            if(file == null || file.Length == 0)
            {
                return BadRequest(BadRequest());
            }
            var filename = file.FileName;
            var filepath = Path.Combine(_environment.WebRootPath,@"\IMGs"+filename);
            using (var stream = new FileStream(filepath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }
            //檔名存入資料庫
            if (!string.IsNullOrEmpty(filename))
            {
                _context.Products.Add(new Product{ IMG = filename});
                _context.SaveChanges();
            }                
            return RedirectToAction("Index");

        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task <IActionResult> Create(Product product , IFormFile file)
        {
            await Upload(file);
            _context.Products.Add(product);
            _context.SaveChanges();
            return View();
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
    }
}
