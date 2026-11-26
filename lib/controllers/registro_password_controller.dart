class RegistroPasswordController {
  String validarPassword(String password) {
    final valor = password.trim();

    if (valor.isEmpty || valor.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return 'Contraseña registrada correctamente';
  }
}