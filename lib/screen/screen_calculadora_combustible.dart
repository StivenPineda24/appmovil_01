import 'package:flutter/material.dart';
import '../controllers/calculadora_combustible_controller.dart';

class ScreenCalculadoraCombustible extends StatefulWidget {
  const ScreenCalculadoraCombustible({super.key});

  @override
  State<ScreenCalculadoraCombustible> createState() => _ScreenCalculadoraCombustibleState();
}

class _ScreenCalculadoraCombustibleState extends State<ScreenCalculadoraCombustible> {
  // Controladores de los campos de texto
  final _marcaController = TextEditingController();
  final _distanciaController = TextEditingController();
  final _combustibleController = TextEditingController();

  final _controller = CalculadoraCombustibleController();

  // Variables para resultados y UI
  String _resultadoMarca = '';
  String _resultadoRendimiento = '';
  String _resultadoMensaje = '';
  String _advertencia = '';

  void _procesarCalculo() {
    final res = _controller.calcular(
      marcaVehiculo: _marcaController.text.trim(),
      distanciaStr: _distanciaController.text.trim(),
      combustibleStr: _combustibleController.text.trim(),
    );

    setState(() {
      if (res['error'] == true) {
        _advertencia = res['mensaje'];
        _resultadoMarca = '';
        _resultadoRendimiento = '';
        _resultadoMensaje = '';
      } else {
        _advertencia = '';
        _resultadoMarca = 'Vehículo: ${res['marca']}';
        _resultadoRendimiento = 'Rendimiento: ${(res['rendimiento'] as double).toStringAsFixed(2)} km/l';
        _resultadoMensaje = res['mensajeRendimiento'];
      }
    });
  }

  @override
  void dispose() {
    _marcaController.dispose();
    _distanciaController.dispose();
    _combustibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Consumo de Combustible'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _marcaController,
              decoration: const InputDecoration(
                labelText: 'Marca del vehículo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _distanciaController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Distancia recorrida (km)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _combustibleController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Combustible utilizado (litros)',
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
                'Calcular rendimiento',
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
            if (_resultadoMarca.isNotEmpty) ...[
              Card(
                elevation: 4,
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _resultadoMarca,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _resultadoRendimiento,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Chip(
                          label: Text(
                            _resultadoMensaje,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: _resultadoMensaje == 'Buen rendimiento' ? Colors.green.shade700 : Colors.orange.shade800,
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