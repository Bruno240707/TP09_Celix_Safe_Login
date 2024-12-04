function validarContraseña(password) {
    const minLargo = password.length >= 8;
    const tieneMayuscula = /[A-Z]/.test(password);
    const tieneEspecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);

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
