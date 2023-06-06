using Microsoft.AspNetCore.Mvc;
using restaurant.Data;
using restaurant.Models;

namespace restaurant.Controllers
{
    public class MenuController : Controller
    {
        private readonly restaurantContext _context;

        public MenuController(restaurantContext context)
        {
            _context = context;
        }
        public IActionResult Menu()
        {
            //_context.Orders.Where(m => m.Id == 0).Select
            return View();
        }
    }
}