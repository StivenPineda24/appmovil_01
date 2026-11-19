class CalculadoraDescuentoController {
  Map<String, dynamic> calcular({
    required String nombreProducto,
    required String precioStr,
    required String descuentoStr,
  }) {
    // 1. Validar campos vacíos
    if (nombreProducto.isEmpty || precioStr.isEmpty || descuentoStr.isEmpty) {
      return {
        'error': true,
        'mensaje': 'Por favor, complete todos los campos.',
      };
    }

    // 2. Convertir valores a números
    final double? precio = double.tryParse(precioStr);
    final double? porcentajeDescuento = double.tryParse(descuentoStr);

    if (precio == null || porcentajeDescuento == null) {
      return {
        'error': true,
        'mensaje': 'Por favor, ingrese valores numéricos válidos.',
      };
    }

    // 3. Condición 4: El precio del producto debe ser mayor que cero
    if (precio <= 0) {
      return {
        'error': true,
        'mensaje': 'El precio del producto debe ser mayor que cero.',
      };
    }

    // 4. Condición 3: El descuento debe estar entre 0% y 100%
    if (porcentajeDescuento < 0 || porcentajeDescuento > 100) {
      return {
        'error': true,
        'mensaje': 'El porcentaje de descuento debe estar entre 0% y 100%.',
      };
    }

    // 5. Cálculos del descuento y precio final
    double montoDescuento = precio * (porcentajeDescuento / 100);
    double precioFinal = precio - montoDescuento;

    // 6. Condiciones 1 y 2: Evaluar tipo de descuento
    String tipoDescuento = '';
    if (porcentajeDescuento >= 20) {
      tipoDescuento = 'Descuento especial';
    } else {
      tipoDescuento = 'Descuento regular';
    }

    return {
      'error': false,
      'nombre': nombreProducto,
      'montoDescuento': montoDescuento,
      'precioFinal': precioFinal,
      'tipoDescuento': tipoDescuento,
    };
  }
}