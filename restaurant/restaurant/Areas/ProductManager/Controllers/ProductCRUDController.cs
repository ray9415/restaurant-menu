using Microsoft.AspNetCore.Mvc;

namespace restaurant.Areas.ProductManager.Controllers
{
    [Area("ProductManager")]
    public class ProductCRUDController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
