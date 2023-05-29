using Microsoft.AspNetCore.Mvc;
using restaurant.Models;

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
