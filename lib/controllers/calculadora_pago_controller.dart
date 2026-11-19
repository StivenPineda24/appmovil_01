class CalculadoraPagoController {
  Map<String, dynamic> calcular({
    required String nombre,
    required String horasStr,
    required String pagoHoraStr,
  }) {
    // 1. Validar campos vacíos
    if (nombre.isEmpty || horasStr.isEmpty || pagoHoraStr.isEmpty) {
      return {
        'error': true,
        'mensaje': 'Por favor, complete todos los campos.',
      };
    }

    // 2. Convertir a números
    final double? horas = double.tryParse(horasStr);
    final double? pagoPorHora = double.tryParse(pagoHoraStr);

    if (horas == null || pagoPorHora == null) {
      return {
        'error': true,
        'mensaje': 'Por favor, ingrese valores numéricos válidos.',
      };
    }

    // 3. Condición 3: No se deben permitir valores negativos
    if (horas < 0 || pagoPorHora < 0) {
      return {
        'error': true,
        'mensaje': 'No se permiten valores negativos en horas ni en pago.',
      };
    }

    // 4. Condiciones 1 y 2: Cálculo de sueldo
    double sueldoTotal = 0.0;
    if (horas <= 48) {
      // Condición 1: Hasta 48 horas (pago normal)
      sueldoTotal = horas * pagoPorHora;
    } else {
      // Condición 2: Más de 48 horas (horas adicionales con 50% más)
      double horasNormales = 48;
      double horasExtras = horas - 48;
      double pagoHoraExtra = pagoPorHora * 1.5; // 50% más

      sueldoTotal = (horasNormales * pagoPorHora) + (horasExtras * pagoHoraExtra);
    }

    // Retornar resultados con éxito
    return {
      'error': false,
      'nombre': nombre,
      'sueldo': sueldoTotal,
    };
  }
}