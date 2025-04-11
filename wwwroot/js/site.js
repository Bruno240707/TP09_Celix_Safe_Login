function validarContraseña() {
    let contraseña = document.getElementById("contraseña");
    let contra1= contraseña;
    let contra2 = document.getElementById("confirmarContra");
    const minLargo = contra1.value.length >= 8; 
    const tieneMayuscula = /[A-Z]/.test(contra1.value); 43 
    const tieneEspecial = /[!@#$%^&*(),.?":{}|<>]/.test(contra1.value);

    let esValida = true;
    
    let mensajeError = document.getElementById("mensajeError");

    let mens = document.getElementById("ContraDif");

    if(!minLargo || !tieneEspecial || !tieneMayuscula)
    {
        mensajeError.innerHTML= "La contraseña debe tener 8 caracteres, una mayuscula y un caracter especial";
        esValida=false;
    }
    else {
        mensajeError.innerHTML= "";
    }

    if(contra1.value != contra2.value)
    {
        mens.innerHTML= "Las contraseñas no son coincidientes";
        esValida=false;
    }
    else {
        mens.innerHTML= "";
    }

    return esValida;
}
////////////
const validarNombre = (e) => {
    let mensajeErrorNombre = document.getElementById("mensajeErrorNombre")
    let nombreValido = e.target.value.trim().length > 5
    mensajeErrorNombre.style.color = "Red"

    if(!nombreValido) {
        mensajeErrorNombre.innerHTML = "El nombre debe tener almenos 5 caracteres"
    }
    else {
        mensajeErrorNombre.innerHTML = ""
    }

    return nombreValido
}

const validarContenido = (e) => {
    let mensajeErrorContenido = document.getElementById("mensajeErrorContenido")
    let contenidoValido = e.target.value.trim().length > 20
    mensajeErrorContenido.style.color = "Red"

    if(!contenidoValido) {
        mensajeErrorContenido.innerHTML = "El contenido debe tener almenos 20 caracteres"
    }
    else {
        mensajeErrorContenido.innerHTML = ""
    }

    return contenidoValido
}

const validarCalificacion = (e) => {
    let mensajeErrorCalificacion = document.getElementById("mensajeErrorCalificacion")
    let calificacionEsValida = e.target.value > 0
    mensajeErrorCalificacion.style.color = "Red"

    if (!calificacionEsValida) {
        mensajeErrorCalificacion.innerHTML = "La calificacion debe ser de almenos 1 estrella"
    }
    else {
        mensajeErrorCalificacion.innerHTML = ""
    }

    return calificacionEsValida
}

const validarFoto = (e) => {
    let mensajeErrorFoto = document.getElementById("mensajeErrorFoto")
    let fotoEsValido = e.target.value.trim().length > 10
    mensajeErrorFoto.style.color = "Red"

    if(!fotoEsValido){
        mensajeErrorFoto.innerHTML = "El formato es invalido"
    } else {
        mensajeErrorFoto.innerHTML = ""
    }

    return fotoEsValido

}

const enviarProductos = () => {
    const nombre = document.getElementById("nombreProducto")
    const descripcion = document.getElementById("descripcionProducto")
    const calificacion = document.getElementById("calificacionProducto")
    const foto = document.getElementById("fotoProducto")

    let nombreValido = nombre.value.length > 5
    let contenidoValido = descripcion.value.length > 20
    let calificacionEsValida = calificacion.value > 0
    let fotoEsValido = foto.value.length > 10

    return nombreValido && contenidoValido && calificacionEsValida && fotoEsValido;
}

const enviarRecetas = () => {
    const nombre = document.getElementById("nombreReceta")
    const descripcion = document.getElementById("contenidoReceta")
    const calificacion = document.getElementById("calificacionReceta")
    const foto = document.getElementById("fotoReceta")

    let nombreValido = nombre.value.length > 5
    let contenidoValido = descripcion.value.length > 20
    let calificacionEsValida = calificacion.value > 0
    let fotoEsValido = foto.value.length > 10

    return nombreValido && contenidoValido && calificacionEsValida && fotoEsValido;
}

const enviarEstablecimientos = () => {
    const nombre = document.getElementById("nombreEstablecimiento")
    const descripcion = document.getElementById("descripcionEstablecimiento")
    const calificacion = document.getElementById("calificacionEstablecimiento")
    const foto = document.getElementById("fotoEstablecimiento")

    let nombreValido = nombre.value.length > 5
    let contenidoValido = descripcion.value.length > 20
    let calificacionEsValida = calificacion.value > 0
    let fotoEsValido = foto.value.length > 10

    return nombreValido && contenidoValido && calificacionEsValida && fotoEsValido;
}



//model

function mostrarReceta(idReceta) {
    $.ajax({
        url: '/Home/ObtenerReceta',  
        type: 'GET',
        data: { id: idReceta },
        success: function(response) {
            
            $('#modalImagen').attr('src', response.fotoReceta);
            $('#modalTitulo').text(response.nombreReceta);
            $('#modalContenido').text(response.contenidoReceta);
            $('#modalCalificacion').text(response.calificacionReceta);

            $('#modal').css('display', 'flex');
        },
        error: function(xhr, status, error) {
            console.error("Error:", error);
        }
    });
}
const AgregarPost = () => {
    
    const titulo = document.getElementById('tituloPost').value.trim();
    const contenido = document.getElementById('contenidoPost').value.trim();

 
    if (titulo && contenido) {
        
        const nuevoPost = document.createElement('div');
        nuevoPost.classList.add('post');  

       
        nuevoPost.innerHTML = `
            <h2>${titulo}</h2>
            <p>${contenido}</p>
            <div class="comentarios"></div>
            <textarea placeholder="Escribe tu comentario..." rows="3"></textarea>
            <button onclick="agregarComentario(this)">Enviar Comentario</button>
        `;

        document.getElementById('posts').prepend(nuevoPost);
        document.getElementById('tituloPost').value = '';
        document.getElementById('contenidoPost').value = '';
    } else {
        alert('Por favor, completa tanto el título como el contenido del post.');
    }
};

const agregarComentario = (button) => {
 
    const post = button.closest('.post');

    const comentarioTextarea = post.querySelector('textarea');
    const comentarioTexto = comentarioTextarea.value.trim();
    

    if (comentarioTexto) {
  
        const nuevoComentario = document.createElement('div');
        nuevoComentario.classList.add('comentario');
        
       
        nuevoComentario.innerHTML = `<p><strong>Nuevo Usuario</strong> ${comentarioTexto}</p>`;
        
       
        post.querySelector('.comentarios').appendChild(nuevoComentario);
        
   
        const contador = post.querySelector('.contadorComentarios');
        const numComentarios = post.querySelectorAll('.comentario').length;
        contador.textContent = numComentarios;

       
        comentarioTextarea.value = '';
    
    
    } else {
 
        alert('Por favor, escribe un comentario antes de enviarlo.');
    }
  
};



