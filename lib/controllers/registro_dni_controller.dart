class RegistroDniController {
  String validarDni(String dniTexto) {
    final limpio = dniTexto.trim();

    // Comprueba que no esté vacío, que tenga 8 dígitos y que solo contenga números
    if (limpio.isEmpty || limpio.length != 8 || int.tryParse(limpio) == null) {
      return 'DNI incorrecto';
    }

    return 'DNI registrado correctamente';
  }
}