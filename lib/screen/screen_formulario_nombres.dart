import 'package:flutter/material.dart';
import '../controllers/formulario_nombres.dart';

class ScreenFormularioNombres extends StatefulWidget {
  const ScreenFormularioNombres({super.key});

  @override
  State<ScreenFormularioNombres> createState() => _ScreenFormularioNombresState();
}

class _ScreenFormularioNombresState extends State<ScreenFormularioNombres> {
  final TextEditingController _nombreController = TextEditingController();
  final FormularioNombresController _logicController =
      FormularioNombresController();

  String _mensaje = '';
  bool _esExitoso = false;

  void _registrar() {
    final resultado = _logicController.validarNombre(_nombreController.text);

    setState(() {
      _mensaje = resultado;
      _esExitoso = resultado == 'Registro exitoso';
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1. Formulario de nombres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Escribe tu nombre aquí',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrar,
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