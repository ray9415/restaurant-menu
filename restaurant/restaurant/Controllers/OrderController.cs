using Microsoft.AspNetCore.Mvc;

namespace restaurant.Controllers
{
    public class OrderController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
