import 'package:flutter/material.dart';
import '../controllers/registro_password_controller.dart';

class ScreenRegistroPassword extends StatefulWidget {
  const ScreenRegistroPassword({super.key});

  @override
  State<ScreenRegistroPassword> createState() => _ScreenRegistroPasswordState();
}

class _ScreenRegistroPasswordState extends State<ScreenRegistroPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final RegistroPasswordController _logicController =
      RegistroPasswordController();

  String _mensaje = '';
  bool _esExitoso = false;
  bool _ocultarClave = true;

  void _registrarPassword() {
    final resultado = _logicController.validarPassword(_passwordController.text);

    setState(() {
      _mensaje = resultado;
      _esExitoso = resultado == 'Contraseña registrada correctamente';
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5. Registro de contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _passwordController,
              obscureText: _ocultarClave,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Mínimo 6 caracteres',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _ocultarClave ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _ocultarClave = !_ocultarClave;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrarPassword,
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