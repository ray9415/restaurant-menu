using Microsoft.AspNetCore.Mvc;
//using System.IO;
using System.Collections;
using restaurant.Models;
using restaurant.Data;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

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
        public async Task<IActionResult> Index()
        {
            return _context.Products != null ?
                        View(await _context.Products.ToListAsync()) :
                        Problem("Entity set 'restaurantContext.Products'  is null.");
        }

        public async Task<IActionResult> Login()
        {
            return View();
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task <IActionResult> Create(Product product , IFormFile file)
        {
            if (ModelState.IsValid)
            {
                //檔案上傳
                string uploadpath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/IMGs", file.FileName);
                using (var stream = new FileStream(uploadpath, FileMode.Create))
                {
                    await file.OpenReadStream().CopyToAsync(stream);
                }
                product.IMG = file.FileName;
                _context.Products.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Products == null)
                return NotFound();

            var product = await _context.Products
                .FirstOrDefaultAsync(m => m.ProductId == id);

            if (product == null)
            {
                return NotFound();
            }

            return View(product);
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

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Products == null)
            {
                return NotFound();
            }

            var p =await _context.Products.FirstOrDefaultAsync(d => d.ProductId == id); 
            if (p == null) 
            {
                return NotFound();
            }
            return View(p);
        }

        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirm(int? id) 
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'restaurantContext.Products'  is null.");
            }
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                _context.Products.Remove(product);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }
    }
}
