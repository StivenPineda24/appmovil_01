class FormularioNombresController {
  String validarNombre(String nombre) {
    final textoLimpio = nombre.trim();

    if (textoLimpio.isEmpty) {
      return 'Ingrese su nombre';
    }

    return 'Registro exitoso';
  }
}