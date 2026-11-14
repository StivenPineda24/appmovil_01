class CalculadoraDePromedioController {
  Map<String, dynamic> calcular({
    required String nombre,
    required String n1Str,
    required String n2Str,
    required String n3Str,
  }) {
    // Condición 4: Validar campos vacíos
    if (nombre.isEmpty || n1Str.isEmpty || n2Str.isEmpty || n3Str.isEmpty) {
      return {'error': true, 'mensaje': 'Por favor, complete todos los campos.'};
    }

    // Convertir a números decimales
    double? n1 = double.tryParse(n1Str);
    double? n2 = double.tryParse(n2Str);
    double? n3 = double.tryParse(n3Str);

    if (n1 == null || n2 == null || n3 == null) {
      return {'error': true, 'mensaje': 'Ingrese valores numéricos válidos.'};
    }

    // Condición 2: Validar notas entre 0 y 20
    if (n1 < 0 || n1 > 20 || n2 < 0 || n2 > 20 || n3 < 0 || n3 > 20) {
      return {'error': true, 'mensaje': 'Las notas deben estar entre 0 y 20.'};
    }

    // Calcular el promedio
    double promedio = (n1 + n2 + n3) / 3;

    // Condición 1: Nota mínima aprobatoria es 13
    bool aprobado = promedio >= 13;

    return {
      'error': false,
      'nombre': nombre,
      'promedio': promedio.toStringAsFixed(2), // Condición 3: Dos decimales
      'estado': aprobado ? 'Aprobado' : 'Desaprobado estudia más..',
    };
  }
}