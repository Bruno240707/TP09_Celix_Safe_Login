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

        public IActionResult LoginValidar2(string email, string contraseña)
        {
            if (email == null || contraseña == null)
            {
                return View("Login");
            }

            List<Usuarios> listaUsuarios = BD.ObtenerListaUsuarios();

            for (int i = 0; i < listaUsuarios.Count; i++)
            {
                if (listaUsuarios[i].email == email && listaUsuarios[i].contraseña == contraseña)
                {
                    ViewBag.Mensaje = "Inicio de sesión exitoso.";
                    return RedirectToAction("PostLogin", new {IdUsuario = listaUsuarios[i].idUsuario});
                }
            }
            ViewBag.Error = "Email o contraseña incorrectos.";
            return View("Login");
        }


        public IActionResult PostLogin(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            return View();
        }

        public IActionResult Registrarse()
        {
            return View();
        }

        public IActionResult Foro(Post post, int IdUsuario)
        {
            BD.agregarPost(post);
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            return View();
        }
        public IActionResult Registro(Usuarios user, string confirmarContra)
        {
            if (user.username == null || user.contraseña == null || confirmarContra == null)
            {
                return View("Registrarse");
            }

            List<Usuarios> listaUsuarios = BD.ObtenerListaUsuarios();

            for (int i = 0; i < listaUsuarios.Count; i++)
            {
                if (listaUsuarios[i].email == user.email)
                {
                    ViewBag.Error = "El mail ya existe";
                    return View("Registrarse");
                }
            }

            BD.agregarUsuario(user);

            return RedirectToAction("Login");
        }

        public IActionResult Olvide()
        {
            return View();
        }

        public IActionResult cambiarContra(string email, string nuevaContraseña, string nombrePerro)
        {

            string nombrePerroAlmacenado = BD.obtenerNombrePerro(email);

            List<Usuarios> listaUsuarios = BD.ObtenerListaUsuarios();

            for (int i = 0; i < listaUsuarios.Count; i++)
            {
                if (listaUsuarios[i].email == email)
                {
                    bool contraseñaValida = ValidarContraseña(nuevaContraseña);
                    if (!contraseñaValida)
                    {
                        return View("Olvide");
                    }

                    if (nombrePerro != nombrePerroAlmacenado)
                    {
                        return View("Olvide");
                    }

                     BD.cambiarContra(email, nuevaContraseña, nombrePerro);

                    return RedirectToAction("Login");
                }
            }
            return View("Olvide");
        }


        public IActionResult Perfil(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            return View();
        }

        public IActionResult Productos(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Categoria_Productos> listaCategoriaProductos = BD.ObtenerListaCategoriaProductos();
            List<Productos> listaProductos = BD.ObtenerListaProductos();
            ViewBag.listaProductos = listaProductos;
            ViewBag.listaCategoriaProductos = listaCategoriaProductos;
            return View();
        }

        public IActionResult busquedaProducto(string busqueda, int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Categoria_Productos> listaCategoriaProductos = BD.ObtenerListaCategoriaProductos();
            List<Productos>listaProductosBuscados = BD.ObtenerListaProductosBusqueda(busqueda);
            ViewBag.listaProductosBuscados = listaProductosBuscados;
            ViewBag.listaCategoriaProductos = listaCategoriaProductos;
            return View("PostProductos");
        }

        public IActionResult Establecimientos(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Ubicacion_Establecimiento> listaUbicacionEstablecimientos = BD.ObtenerListaUbicacionEstablecimientos();
            List<Establecimientos> listaEstablecimientos = BD.ObtenerListaEstablecimientos();
            ViewBag.listaEstablecimientos = listaEstablecimientos;
            ViewBag.listaUbicacionEstablecimientos = listaUbicacionEstablecimientos;
            return View();
        }

        public IActionResult busquedaEstablecimientos(string busqueda, int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Ubicacion_Establecimiento> listaUbicacionEstablecimientos = BD.ObtenerListaUbicacionEstablecimientos();
            List<Establecimientos>listaEstablecimientosBuscados = BD.ObtenerListaEstablecimientoBusqueda(busqueda);
            ViewBag.listaEstablecimientosBuscados = listaEstablecimientosBuscados;
            ViewBag.listaUbicacionEstablecimientos = listaUbicacionEstablecimientos;
            return View("PostEstablecimientos");
        }
        public IActionResult Recetas(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Categoria_Recetas> listaCategoriaRecetas = BD.ObtenerListaCategoriaRecetas();
            List<Recetas> listaRecetas = BD.ObtenerListaRecetas();
            ViewBag.listaRecetas = listaRecetas;
            ViewBag.listaCategoriaRecetas = listaCategoriaRecetas;
            return View();
        }

        public IActionResult busquedaRecetas(string busqueda, int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Categoria_Recetas> listaCategoriaRecetas = BD.ObtenerListaCategoriaRecetas();
            List<Recetas>listaRecetasBuscados = BD.ObtenerListaRecetaBusqueda(busqueda);
            ViewBag.listaRecetasBuscados = listaRecetasBuscados;
            ViewBag.listaCategoriaRecetas = listaCategoriaRecetas;
            return View("PostRecetas");
        }

        public IActionResult ViewAñadirRecetas(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Categoria_Recetas> listaCategoriaRecetas = BD.ObtenerListaCategoriaRecetas();
            ViewBag.CategoriaRecetas = listaCategoriaRecetas;
            return View("AñadirRecetas");
        }

        public IActionResult AnadirRecetas(Recetas receta,int IdUsuario) 
        {
            BD.agregarReceta(receta);
            
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;

            List<Categoria_Recetas> listaCategoriaRecetas = BD.ObtenerListaCategoriaRecetas();
            List<Recetas> listaRecetas = BD.ObtenerListaRecetas();
            ViewBag.listaRecetas = listaRecetas;
            ViewBag.listaCategoriaRecetas = listaCategoriaRecetas;
            return View("Recetas");
        }

        public IActionResult ViewAñadirProductos(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            List<Categoria_Productos> listaCategoriaProductos = BD.ObtenerListaCategoriaProductos();
            ViewBag.CategoriaProductos = listaCategoriaProductos;
            return View("AñadirProductos");
        }

        public IActionResult agregarProducto(Productos producto,int IdUsuario) 
        {
            BD.agregarProducto(producto);
            
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;

            List<Categoria_Productos> listaCategoriaProductos = BD.ObtenerListaCategoriaProductos();
            List<Productos> listaProductos = BD.ObtenerListaProductos();
            ViewBag.listaProductos = listaProductos;
            ViewBag.listaCategoriaProductos = listaCategoriaProductos;
            return View("Productos");
        }

        public IActionResult ViewAñadirEstablecimientos(int IdUsuario)
        {
            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;
            
            List<Ubicacion_Establecimiento> listaUbicaciones = BD.ObtenerListaUbicaciones();

            ViewBag.listaUbicaciones = listaUbicaciones;

            return View("AñadirEstablecimientos");
        }

        public IActionResult agregarEstablecimiento(Establecimientos establecimiento, int IdUsuario)
        {
            BD.agregarEstablecimiento(establecimiento);

            Usuarios usuarioActivo = BD.verInfoUsuarioActivo(IdUsuario);
            ViewBag.usuario = usuarioActivo;

            List<Ubicacion_Establecimiento> listaUbicaciones = BD.ObtenerListaUbicaciones();
            List<Establecimientos> listaEstablecimientos = BD.ObtenerListaEstablecimientos();

            ViewBag.listaUbicaciones = listaUbicaciones;
            ViewBag.listaEstablecimientos = listaEstablecimientos;

            return View("Establecimientos");
        }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
        private bool ValidarContraseña(string contraseña)
        {
            bool minLargo = contraseña.Length >= 8;
            bool tieneMayuscula = contraseña.Any(char.IsUpper);
            bool tieneEspecial = contraseña.Any(contiene => "!@#$%^&*(),.?\":{}|<>".Contains(contiene));

            return minLargo && tieneMayuscula && tieneEspecial;
        }

         public IActionResult ObtenerReceta(int id)
        {
            Recetas receta = BD.ObtenerRecetaPorId(id);
            if (receta != null)
            {
                return Json(receta); 
            }
            return NotFound(); 
        }
}
