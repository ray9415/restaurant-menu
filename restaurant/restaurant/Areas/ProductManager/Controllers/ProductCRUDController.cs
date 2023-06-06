using Microsoft.AspNetCore.Mvc;

namespace restaurant.Areas.ProductManager.Controllers
{
    public class ProductCRUDController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
