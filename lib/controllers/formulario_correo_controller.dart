class FormularioCorreoController {
  String validarCorreo(String correo) {
    final texto = correo.trim();

    if (texto.isEmpty || !texto.contains('@')) {
      return 'Ingrese un correo válido';
    }

    final partes = texto.split('@');
    if (partes.length != 2 || partes[0].isEmpty || partes[1].isEmpty) {
      return 'Ingrese un correo válido';
    }

    return 'Correo registrado correctamente';
  }
}