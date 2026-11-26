class FormularioEstudianteController {
  String? validarNombre(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'El nombre es obligatorio';
    }
    return null;
  }

  String? validarApellido(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'El apellido es obligatorio';
    }
    return null;
  }

  String? validarCorreo(String? valor) {
    final texto = valor?.trim() ?? '';
    if (texto.isEmpty || !texto.contains('@')) {
      return 'Ingrese un correo válido (debe contener @)';
    }
    final partes = texto.split('@');
    if (partes.length != 2 || partes[0].isEmpty || partes[1].isEmpty) {
      return 'Ingrese un correo válido (debe contener @)';
    }
    return null;
  }

  String obtenerMensajeExito() {
    return 'Estudiante registrado exitosamente';
  }
}