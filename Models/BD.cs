using System.Data.SqlClient;
using Dapper;

namespace TP09_Login_Marasi_Cordero.Models;
public class BD 
{
    private static string _ConnectionString = "Server=localhost;DataBase=TP09_Celix_Safe_Login;Trusted_Connection=true;";

    public static Usuario verInfoUsuario(int idUsuario) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "SELECT * FROM Usuario WHERE idUsuario = @idUsuario";
            return conn.QuerySingleOrDefault<Usuario>(sql, new { idUsuario });
        }
    }

    public static bool existeUsuario(string username, string contraseña) 
    {
        using (SqlConnection conn = new SqlConnection(_ConnectionString))
        {
            string sql = "IF EXIST (SELECT 1 FROM Usuario WHERE username = @username AND contraseña = @contraseña)";
            int count = conn.QuerySingleOrDefault<int>(sql, new { username, contraseña });
            return count > 0;
        }
    }

}