using System.Diagnostics;
using System.Reflection.Metadata.Ecma335;
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

        public IActionResult LoginValidar(string email, string contraseña)
        {
            if (email == null || contraseña == null)
            {
                return View("Login");
            }

            bool validUser = BD.existeUsuarioLogin(email, contraseña);

            if (validUser)
            {
                Usuarios usuarioIngreso = BD.verInfoUsuario(email);
                ViewBag.usuario = usuarioIngreso;
                return View("PostLogin");
            }

            return View("Login");
        }

        public IActionResult Registrarse()
        {
            return View();
        }

        public IActionResult Registro(Usuarios user, string confirmarContra)
        {
            if (user.username == null || user.contraseña == null || confirmarContra == null)
            {
                return View("Registrarse");
            }

            if (user.contraseña != confirmarContra)
            {
                return View("Registrarse");
            }

            bool contraseñaValida = ValidarContraseña(user.contraseña);
            if (!contraseñaValida)
            {
                return View("Registrarse");
            }

            if (BD.existeUsuarioRegistro(user.email))
            {
                return View("Registrarse");
            } 

            BD.agregarUsuario(user);

            return RedirectToAction("Login");
        }

        public IActionResult Olvide()
        {
            return View();
        }

        public IActionResult cambiarContra(string email, string contraseña, string confirmarContra)
        {
            bool contraseñaValida = ValidarContraseña(contraseña);
            if (!contraseñaValida)
            {
                return View("cambiarContra");
            }

            if (contraseña != confirmarContra)
            {
                return View("Registrarse");
            }

            if (!BD.existeUsuarioRegistro(email))
            {
                return View("Registrarse");
            }

            BD.cambiarContra(email, contraseña);

            return RedirectToAction("Login");
        }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
        private bool ValidarContraseña(string contraseña)
        {
            bool minLargo = contraseña.Length >= 8;
            bool tieneMayuscula = contraseña.Any(char.IsUpper);
            bool tieneEspecial = contraseña.Any(contiene => "!@#$%^&*(),.?\":{}|<>".Contains(contiene));

            return minLargo && tieneMayuscula && tieneEspecial;
        }
}