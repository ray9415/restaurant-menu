using Microsoft.AspNetCore.Mvc;

namespace restaurant.Areas.Front.Controllers
{
    [Area("Front")]
    public class OrderController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
