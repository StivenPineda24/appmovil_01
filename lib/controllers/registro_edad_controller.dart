class RegistroEdadController {
  String validarEdad(String edadTexto) {
    final limpio = edadTexto.trim();

    if (limpio.isEmpty) {
      return 'La edad es obligatoria';
    }

    final edad = int.tryParse(limpio);
    if (edad == null) {
      return 'Solo se permiten números';
    }

    if (edad < 18) {
      return 'Debe ser mayor o igual a 18 años';
    }

    return 'Edad registrada correctamente';
  }
}