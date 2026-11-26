import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controllers/registro_edad_controller.dart';

class ScreenRegistroEdad extends StatefulWidget {
  const ScreenRegistroEdad({super.key});

  @override
  State<ScreenRegistroEdad> createState() => _ScreenRegistroEdadState();
}

class _ScreenRegistroEdadState extends State<ScreenRegistroEdad> {
  final TextEditingController _edadController = TextEditingController();
  final RegistroEdadController _logicController = RegistroEdadController();

  String _mensaje = '';
  bool _esExitoso = false;

  void _registrarEdad() {
    final resultado = _logicController.validarEdad(_edadController.text);

    setState(() {
      _mensaje = resultado;
      _esExitoso = resultado == 'Edad registrada correctamente';
    });
  }

  @override
  void dispose() {
    _edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3. Registro de edad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _edadController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Edad',
                hintText: 'Ingresa tu edad (18 o más)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrarEdad,
              child: const Text('REGISTRAR'),
            ),
            const SizedBox(height: 20),
            if (_mensaje.isNotEmpty)
              Text(
                _mensaje,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _esExitoso ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}