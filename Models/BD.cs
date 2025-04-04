using System.Data.SqlClient;
using Dapper;

namespace TP09_Login_Marasi_Cordero.Models;
public class BD 
{
    private static string _ConnectionString = "Server=localhost;DataBase=EFSI_database;Trusted_Connection=true;";

    public static Usuarios verInfoUsuario(string email) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT * FROM Usuarios WHERE email = @email";
            return conn.QuerySingleOrDefault<Usuarios>(sql, new { email });
        }
    }

    public static Usuarios verInfoUsuarioActivo(int idUsuario) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT * FROM Usuarios WHERE idUsuario = @idUsuario";
            return conn.QuerySingleOrDefault<Usuarios>(sql, new { idUsuario });
        }
    }

    public static List<Usuarios> ObtenerListaUsuarios()
    {
        List<Usuarios> listaUsuarios = new List<Usuarios>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Usuarios";
            listaUsuarios = conn.Query<Usuarios>(sql).ToList();
        }
        return listaUsuarios;
    }

    public static bool existeUsuarioRegistro(string email) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT (1) FROM Usuarios WHERE email = @email";
            int count = conn.QuerySingleOrDefault<int>(sql, new { email });
            return count > 0;
        }
    }

    public static void agregarUsuario(Usuarios user)
    {
        string sql = "INSERT INTO Usuarios(username, contraseña, nombre, apellido, email, nombrePerro) VALUES (@username, @contraseña, @nombre, @apellido, @email, @nombrePerro)";
        using(SqlConnection conn = new SqlConnection(_ConnectionString)) {
            conn.Execute(sql, new {Username = user.username, Contraseña = user.contraseña, Nombre = user.nombre, Apellido = user.apellido, Email = user.email, NombrePerro = user.nombrePerro});
        }
    }

    public static void agregarReceta(Recetas receta)
    {
        string sql = "INSERT INTO Recetas(nombreReceta, contenidoReceta, calificacionReceta, idCategoriaReceta, fotoReceta) VALUES (@nombreReceta, @contenidoReceta, @calificacionReceta, @idCategoriaReceta ,@fotoReceta)";
        using(SqlConnection conn = new SqlConnection(_ConnectionString)) {
            conn.Execute(sql, new {nombreReceta = receta.nombreReceta, contenidoReceta = receta.contenidoReceta, calificacionReceta = receta.calificacionReceta, idCategoriaReceta = receta.idCategoriaReceta, fotoReceta = receta.fotoReceta});
        }
    }
    public static void agregarProducto(Productos producto)
    {
        string sql = "INSERT INTO Recetas(nombreProducto, precioProducto, idCategoriaProducto, stock, calificacionProducto, fotoProducto, descripcionProducto) VALUES (@nombreProducto, @precioProducto, @idCategoriaProducto, @stock, @calificacionProducto, @fotoProducto, @descripcionProducto)";
        using(SqlConnection conn = new SqlConnection(_ConnectionString)) {
            conn.Execute(sql, new {nombreProducto = producto.nombreProducto, precioProducto = producto.precioProducto, idCategoriaProducto = producto.idCategoriaProducto, stock = producto.stock ,calificacionProducto = producto.calificacionProducto, fotoProducto = producto.fotoProducto, descripcionProducto = producto.descripcionProducto});
        }
    }

    public static void agregarPost(Post post)
    {
        
        using(SqlConnection conn = new SqlConnection(_ConnectionString)) 
        {
            string sql = "INSERT INTO Foro(tituloPost, contenidoPost) VALUES (@tituloPost, @contenidoPost)";
            conn.Execute(sql, new {tituloPost = post.tituloPost, contenidoPost = post.contenidoPost});
        }
    }

    public static void cambiarContra(string email, string nuevaContraseña, string nombrePerro)
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "UPDATE Usuarios SET contraseña = @nuevaContraseña WHERE email = @email AND nombrePerro = @nombrePerro";
            conn.Execute(sql, new { email, nuevaContraseña, nombrePerro }); 
        }
    }

    public static string obtenerNombrePerro(string email)
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT nombrePerro FROM Usuarios WHERE email = @email";
            string result = conn.QuerySingleOrDefault<string>(sql, new { email = email });
        
            return result;
        }
    }

//------------
    public static List<Categoria_Productos> ObtenerListaCategoriaProductos()
    {
        List<Categoria_Productos> listaCategoriaProductos = new List<Categoria_Productos>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Categoria_Productos";
            listaCategoriaProductos = conn.Query<Categoria_Productos>(sql).ToList();
        }
        return listaCategoriaProductos;
    }

    public static List<Productos> ObtenerListaProductos()
    {
        List<Productos> listaProductos = new List<Productos>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Productos";
            listaProductos = conn.Query<Productos>(sql).ToList();
        }
        return listaProductos;
    }

    public static List<Productos> ObtenerListaProductosBusqueda(string busqueda)
    {
        List<Productos> listaProductosBuscados = new List<Productos>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Productos WHERE nombreProducto LIKE @Busqueda";
            listaProductosBuscados = conn.Query<Productos>(sql, new {Busqueda = busqueda + "%"}).ToList();
        }
        return listaProductosBuscados;
    }

//--
    public static List<Ubicacion_Establecimiento> ObtenerListaUbicacionEstablecimientos()
    {
        List<Ubicacion_Establecimiento> listaUbicacionEstablecimientos = new List<Ubicacion_Establecimiento>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Ubicacion_Establecimiento";
            listaUbicacionEstablecimientos = conn.Query<Ubicacion_Establecimiento>(sql).ToList();
        }
        return listaUbicacionEstablecimientos;
    }

    public static List<Establecimientos> ObtenerListaEstablecimientos()
    {
        List<Establecimientos> listaEstablecimientos = new List<Establecimientos>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Establecimientos";
            listaEstablecimientos = conn.Query<Establecimientos>(sql).ToList();
        }
        return listaEstablecimientos;
    }

    public static List<Establecimientos> ObtenerListaEstablecimientoBusqueda(string busqueda)
    {
        List<Establecimientos> listaEstablecimientosBuscados = new List<Establecimientos>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Establecimientos WHERE nombreEstablecimiento LIKE @Busqueda";
            listaEstablecimientosBuscados = conn.Query<Establecimientos>(sql, new {Busqueda = busqueda + "%"}).ToList();
        }
        return listaEstablecimientosBuscados;
    }

//---

    public static List<Categoria_Recetas> ObtenerListaCategoriaRecetas()
    {
        List<Categoria_Recetas> listaCategoriaRecetas = new List<Categoria_Recetas>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Categoria_Recetas";
            listaCategoriaRecetas = conn.Query<Categoria_Recetas>(sql).ToList();
        }
        return listaCategoriaRecetas;
    }

    public static List<Recetas> ObtenerListaRecetas()
    {
        List<Recetas> listaRecetas = new List<Recetas>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Recetas";
            listaRecetas = conn.Query<Recetas>(sql).ToList();
        }
        return listaRecetas;
    }

    public static List<Recetas> ObtenerListaRecetaBusqueda(string busqueda)
    {
        List<Recetas> listaRecetasBuscados = new List<Recetas>();
        using(SqlConnection conn = new SqlConnection(_ConnectionString)){
            string sql="SELECT * FROM Recetas WHERE nombreReceta LIKE @Busqueda";
            listaRecetasBuscados = conn.Query<Recetas>(sql, new {Busqueda = busqueda + "%"}).ToList();
        }
        return listaRecetasBuscados;
    }

     public static Recetas ObtenerRecetaPorId(int idReceta)
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT * FROM Recetas WHERE idReceta = @idReceta";
            return conn.QuerySingleOrDefault<Recetas>(sql, new { idReceta });
        }
    }

}