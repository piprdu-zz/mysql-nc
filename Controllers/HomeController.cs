using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using mysql_nc.Models;

namespace mysql_nc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private LibraryContext _context;

        public HomeController(ILogger<HomeController> logger, LibraryContext context)
        {
            _logger = logger;
            _context = context;
        }

        private void InsertData()
        {
            
            // Creates the database if not exists
            _context.Database.EnsureCreated();

            // Adds a publisher
            var publisher = new Publisher
            {
                Name = "Mariner Books"
            };
            
            _context.Publisher.Add(publisher);

            // Adds some books
            _context.Book.Add(new Book
            {
                ISBN = "978-0544003415",
                Title = "The Lord of the Rings",
                Author = "J.R.R. Tolkien",
                Language = "English",
                Pages = 1216,
                Publisher = publisher
            });
            
            _context.Book.Add(new Book
            {
                ISBN = "978-0547247762",
                Title = "The Sealed Letter",
                Author = "Emma Donoghue",
                Language = "English",
                Pages = 416,
                Publisher = publisher
            });

            // Saves changes
            _context.SaveChanges();
        }

        public IActionResult Index()
        {
            
            //InsertData();
            
            int totalLibros = _context.Book.Count();

            return View(totalLibros);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
