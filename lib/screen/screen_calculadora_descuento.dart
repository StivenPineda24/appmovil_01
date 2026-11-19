import 'package:flutter/material.dart';
import '../controllers/calculadora_descuento_controller.dart';

class ScreenCalculadoraDescuento extends StatefulWidget {
  const ScreenCalculadoraDescuento({super.key});

  @override
  State<ScreenCalculadoraDescuento> createState() => _ScreenCalculadoraDescuentoState();
}

class _ScreenCalculadoraDescuentoState extends State<ScreenCalculadoraDescuento> {
  // Controladores de texto
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _descuentoController = TextEditingController();

  final _controller = CalculadoraDescuentoController();

  // Variables para resultados y UI
  String _resultadoNombre = '';
  String _resultadoMontoDescuento = '';
  String _resultadoPrecioFinal = '';
  String _resultadoTipo = '';
  String _advertencia = '';

  void _procesarCalculo() {
    final res = _controller.calcular(
      nombreProducto: _nombreController.text.trim(),
      precioStr: _precioController.text.trim(),
      descuentoStr: _descuentoController.text.trim(),
    );

    setState(() {
      if (res['error'] == true) {
        _advertencia = res['mensaje'];
        _resultadoNombre = '';
        _resultadoMontoDescuento = '';
        _resultadoPrecioFinal = '';
        _resultadoTipo = '';
      } else {
        _advertencia = '';
        _resultadoNombre = 'Producto: ${res['nombre']}';
        _resultadoMontoDescuento = 'Descuento aplicado: S/ ${(res['montoDescuento'] as double).toStringAsFixed(2)}';
        _resultadoPrecioFinal = 'Precio final: S/ ${(res['precioFinal'] as double).toStringAsFixed(2)}';
        _resultadoTipo = res['tipoDescuento'];
      }
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _descuentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Descuento'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _precioController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Precio del producto (S/)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descuentoController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Porcentaje de descuento (0 - 100)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _procesarCalculo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Calcular descuento',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (_advertencia.isNotEmpty)
              Text(
                _advertencia,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            if (_resultadoNombre.isNotEmpty) ...[
              Card(
                elevation: 4,
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _resultadoNombre,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _resultadoMontoDescuento,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _resultadoPrecioFinal,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Chip(
                          label: Text(
                            _resultadoTipo,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _resultadoTipo == 'Descuento especial' ? Colors.orange : Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}