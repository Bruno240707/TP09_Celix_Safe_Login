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

const validarNombreReceta = () => {
    const nombreReceta = document.getElementById("nombreReceta").value
    let mensajeErrorNombre = document.getElementById("mensajeErrorNombre")
    let nombreValido = nombreReceta.length > 5
    mensajeErrorNombre.style.color = "Red"

    if(!nombreValido) {
        mensajeErrorNombre.innerHTML = "El nombre de la receta debe tener almenos 5 caracteres"
    }
    else {
        mensajeErrorNombre.innerHTML = ""
    }
}

const validarContenidoReceta = () => {
    const contenidoReceta = document.getElementById("contenidoReceta").value
    let mensajeErrorContenido = document.getElementById("mensajeErrorContenido")
    let contenidoValido = contenidoReceta.length > 20
    mensajeErrorContenido.style.color = "Red"

    if(!contenidoValido) {
        mensajeErrorContenido.innerHTML = "El contenido debe tener almenos 20 caracteres"
    }
    else {
        mensajeErrorContenido.innerHTML = ""
    }
}

const validarCalificacion = () => {
    const calificacionReceta = document.getElementById("calificacionReceta").value
    let mensajeErrorCalificacion = document.getElementById("mensajeErrorCalificacion")
    let calificacionEsValida = calificacionReceta > 0
    mensajeErrorCalificacion.style.color = "Red"

    if (!calificacionEsValida) {
        mensajeErrorCalificacion.innerHTML = "La calificacion debe ser de almenos 1 estrella"
    }
    else {
        mensajeErrorCalificacion.innerHTML = ""
    }
}

const validarFotoReceta = () => {
    const fotoReceta = document.getElementById("fotoReceta").value
    let mensajeErrorFoto = document.getElementById("mensajeErrorFoto")
    let fotoEsValido = fotoReceta.length > 10
    mensajeErrorFoto.style.color = "Red"

    if(!fotoEsValido){
        mensajeErrorFoto.innerHTML = "El formato es invalido"
    } else {
        mensajeErrorFoto.innerHTML = ""

    }

}

const validarAñadirReceta = () => {
    let todoValido = false
    const calificacionReceta = document.getElementById("calificacionReceta").value
    const nombreReceta = document.getElementById("nombreReceta").value
    const contenidoReceta = document.getElementById("contenidoReceta").value
    const fotoReceta = document.getElementById("fotoReceta").value

    let fotoEsValido = fotoReceta.length > 10
    let nombreValido = nombreReceta.length > 5
    let contenidoValido = contenidoReceta.length > 20
    let calificacionEsValida = calificacionReceta > 0

    if(calificacionEsValida && contenidoValido && nombreValido && fotoEsValido)
    {
        todoValido = true
    }
    else {
        todoValido = false
    }

    return todoValido
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


