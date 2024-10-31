function validarContraseña(password) {

    const minLargo = password.length >= 8;
    const tieneMayuscula = /[A-Z]/.test(password);
    const tieneEspecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);

    let esValida = false;
    if (minLargo == true && tieneMayuscula == true && tieneEspecial == true) {
        esValida = true;
    }

    return esValida;
}

function sonIguales(password, repetirPassword)
{
    let sonIguales = false;
    if (password == repetirPassword) 
    {
        sonIguales = true;
    }
    return sonIguales;
}