import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controllers/registro_dni_controller.dart';

class ScreenRegistroDni extends StatefulWidget {
  const ScreenRegistroDni({super.key});

  @override
  State<ScreenRegistroDni> createState() => _ScreenRegistroDniState();
}

class _ScreenRegistroDniState extends State<ScreenRegistroDni> {
  final TextEditingController _dniController = TextEditingController();
  final RegistroDniController _logicController = RegistroDniController();

  String _mensaje = '';
  bool _esExitoso = false;

  void _registrarDni() {
    final resultado = _logicController.validarDni(_dniController.text);

    setState(() {
      _mensaje = resultado;
      _esExitoso = resultado == 'DNI registrado correctamente';
    });
  }

  @override
  void dispose() {
    _dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4. Registro de DNI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _dniController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Número de DNI',
                hintText: 'Ingrese 8 dígitos',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrarDni,
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