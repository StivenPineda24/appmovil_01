import 'package:flutter/material.dart';
import '../controllers/formulario_correo_controller.dart';

class ScreenFormularioCorreo extends StatefulWidget {
  const ScreenFormularioCorreo({super.key});

  @override
  State<ScreenFormularioCorreo> createState() => _ScreenFormularioCorreoState();
}

class _ScreenFormularioCorreoState extends State<ScreenFormularioCorreo> {
  final TextEditingController _correoController = TextEditingController();
  final FormularioCorreoController _logicController =
      FormularioCorreoController();

  String _mensaje = '';
  bool _esExitoso = false;

  void _registrarCorreo() {
    final resultado = _logicController.validarCorreo(_correoController.text);

    setState(() {
      _mensaje = resultado;
      _esExitoso = resultado == 'Correo registrado correctamente';
    });
  }

  @override
  void dispose() {
    _correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2. Formulario de correo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _correoController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'ejemplo@correo.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrarCorreo,
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