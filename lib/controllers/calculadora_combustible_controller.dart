class CalculadoraCombustibleController {
  Map<String, dynamic> calcular({
    required String marcaVehiculo,
    required String distanciaStr,
    required String combustibleStr,
  }) {
    // 1. Validar campos vacíos
    if (marcaVehiculo.isEmpty || distanciaStr.isEmpty || combustibleStr.isEmpty) {
      return {
        'error': true,
        'mensaje': 'Por favor, complete todos los campos.',
      };
    }

    // 2. Convertir valores a números
    final double? distancia = double.tryParse(distanciaStr);
    final double? combustible = double.tryParse(combustibleStr);

    if (distancia == null || combustible == null) {
      return {
        'error': true,
        'mensaje': 'Por favor, ingrese valores numéricos válidos.',
      };
    }

    // 3. Condición 4: La distancia y el combustible deben ser mayores que cero
    if (distancia <= 0 || combustible <= 0) {
      return {
        'error': true,
        'mensaje': 'La distancia y el combustible deben ser mayores que cero.',
      };
    }

    // 4. Condición 1: Calcular rendimiento (kilómetros por litro)
    double rendimiento = distancia / combustible;

    // 5. Condiciones 2 y 3: Evaluar si el rendimiento es bueno o bajo
    String mensajeRendimiento = '';
    if (rendimiento >= 15) {
      mensajeRendimiento = 'Buen rendimiento';
    } else {
      mensajeRendimiento = 'Rendimiento bajo';
    }

    return {
      'error': false,
      'marca': marcaVehiculo,
      'rendimiento': rendimiento,
      'mensajeRendimiento': mensajeRendimiento,
    };
  }
}