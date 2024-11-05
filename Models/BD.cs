using System.Data.SqlClient;
using Dapper;

namespace TP09_Login_Marasi_Cordero.Models;
public class BD 
{
    private static string _ConnectionString = "Server=localhost;DataBase=TP09_Celix_Safe_Login;Trusted_Connection=true;";

    public static Usuarios verInfoUsuario(string email) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT * FROM Usuarios WHERE email = @email";
            return conn.QuerySingleOrDefault<Usuarios>(sql, new { email });
        }
    }

    public static bool existeUsuarioLogin(string email, string contraseña) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT (1) FROM Usuarios WHERE email = @email AND contraseña = @Contraseña";
            int count = conn.QuerySingleOrDefault<int>(sql, new { email, contraseña });
            return count > 0;
        }
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
        string sql = "INSERT INTO Usuarios(username, contraseña, nombre, apellido, email) VALUES (@username, @contraseña, @nombre, @apellido, @email)";
        using(SqlConnection conn = new SqlConnection(_ConnectionString)) {
            conn.Execute(sql, new {Username = user.username, Contraseña = user.contraseña, Nombre = user.nombre, Apellido = user.apellido, Email = user.email});
        }
    }

    public static void cambiarContra(string email, string contraseña)
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "UPDATE Usuarios SET contraseña = @contraseña WHERE email = @email";
            conn.Execute(sql, new { email, contraseña });
        }
    }

}