import 'package:flutter/material.dart';
import '../controllers/calculadora_pago_controller.dart';

class ScreenCalculadoraPago extends StatefulWidget {
  const ScreenCalculadoraPago({super.key});

  @override
  State<ScreenCalculadoraPago> createState() => _ScreenCalculadoraPagoState();
}

class _ScreenCalculadoraPagoState extends State<ScreenCalculadoraPago> {
  // Controladores de los campos de texto
  final _nombreController = TextEditingController();
  final _horasController = TextEditingController();
  final _pagoHoraController = TextEditingController();

  final _controller = CalculadoraPagoController();

  String _resultadoNombre = '';
  String _resultadoSueldo = '';
  String _advertencia = '';

  void _procesarCalculo() {
    final res = _controller.calcular(
      nombre: _nombreController.text.trim(),
      horasStr: _horasController.text.trim(),
      pagoHoraStr: _pagoHoraController.text.trim(),
    );

    setState(() {
      if (res['error'] == true) {
        _advertencia = res['mensaje'];
        _resultadoNombre = '';
        _resultadoSueldo = '';
      } else {
        _advertencia = '';
        _resultadoNombre = 'Trabajador: ${res['nombre']}';
        _resultadoSueldo = 'Sueldo Total: S/ ${(res['sueldo'] as double).toStringAsFixed(2)}';
      }
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _horasController.dispose();
    _pagoHoraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Pago de Trabajador'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre del trabajador'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _horasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Horas trabajadas en la semana'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pagoHoraController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Pago por cada hora (S/)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _procesarCalculo,
              child: const Text('Calcular sueldo'),
            ),
            const SizedBox(height: 20),
            if (_advertencia.isNotEmpty)
              Text(
                _advertencia,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            if (_resultadoNombre.isNotEmpty) ...[
              Text(
                _resultadoNombre,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                _resultadoSueldo,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ],
        ),
      ),
    );
  }
}