public class Post
{
    public int idPost {get; set;}
    public string tituloPost {get; set;}
    public string contenidoPost {get; set;}
    public List<Comentario> comentarios { get; set; } = new List<Comentario>();
    public Post(){
    }

    

}