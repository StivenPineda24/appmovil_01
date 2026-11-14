import 'package:flutter/material.dart';
import '../controllers/calculadora_de_promedio_controller.dart';

class ScreenCalculadoraDePromedio extends StatefulWidget {
  const ScreenCalculadoraDePromedio({super.key});

  @override
  State<ScreenCalculadoraDePromedio> createState() => _ScreenCalculadoraDePromedioState();
}

class _ScreenCalculadoraDePromedioState extends State<ScreenCalculadoraDePromedio> {
  // Controladores de los campos de texto
  final _nombreController = TextEditingController();
  final _nota1Controller = TextEditingController();
  final _nota2Controller = TextEditingController();
  final _nota3Controller = TextEditingController();

  final _controller = CalculadoraDePromedioController();

  String _resultado = '';
  String _estado = '';
  String _advertencia = '';

  void _procesarCalculo() {
    final res = _controller.calcular(
      nombre: _nombreController.text.trim(),
      n1Str: _nota1Controller.text.trim(),
      n2Str: _nota2Controller.text.trim(),
      n3Str: _nota3Controller.text.trim(),
    );

    setState(() {
      if (res['error'] == true) {
        _advertencia = res['mensaje'];
        _resultado = '';
        _estado = '';
      } else {
        _advertencia = '';
        _resultado = 'Promedio: ${res['promedio']}';
        _estado = '${res['nombre']} está: ${res['estado']}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Académica'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre del estudiante'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 1 (0 - 20)'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 2 (0 - 20)'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nota3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nota 3 (0 - 20)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _procesarCalculo,
              child: const Text('Calcular promedio'),
            ),
            const SizedBox(height: 20),
            if (_advertencia.isNotEmpty)
              Text(_advertencia, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            if (_resultado.isNotEmpty) ...[
              Text(_resultado, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(_estado, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _estado.contains('Aprobado') ? Colors.green : Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}