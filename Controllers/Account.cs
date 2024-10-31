using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP09_Login_Marasi_Cordero.Models;

namespace TP06.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }

        public IActionResult Login(string username, string contraseña)
        {
            if (username == null || contraseña == null)
            {
                return View();
            }

            bool validUser = BD.existeUsuario(username, contraseña);

            if (validUser)
            {
                return RedirectToAction("PostLogin", "Home");
            }

            return View();
        }
        public IActionResult Register()
        {
            return View();
        }

        public IActionResult Registro(string username, string contraseña, string confirmarContra)
        {
            if (username == null || contraseña == null)
            {
                return View();
            }

            

        }
}