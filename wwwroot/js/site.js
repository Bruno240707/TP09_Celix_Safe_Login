function validarContraseña(contraseña) {
    const minLargo = contraseña.length >= 8;
    const tieneMayuscula = /[A-Z]/.test(contraseña);
    const tieneEspecial = /[!@#$%^&*(),.?":{}|<>]/.test(contraseña);

    let esValida = minLargo && tieneMayuscula && tieneEspecial;
    
    const mensajeError = document.getElementById("mensajeError");

    if (esValida) {
        mensajeError.textContent = "";
    } else {
        mensajeError.textContent = "La contraseña debe tener al menos 8 caracteres, una mayúscula y un carácter especial.";
    }
    return esValida;
}

document.getElementById("contraseña").addEventListener("input", function() {
    validarContraseña(this.value);
});
