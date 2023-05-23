using Microsoft.AspNetCore.Mvc;

namespace restaurant.Controllers
{
    public class MenuController : Controller
    {
        public IActionResult Menu()
        {
            return View();
        }
    }
}
