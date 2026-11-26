import 'package:flutter/material.dart';
import '../controllers/formulario_estudiante_controller.dart';

class ScreenFormularioEstudiante extends StatefulWidget {
  const ScreenFormularioEstudiante({super.key});

  @override
  State<ScreenFormularioEstudiante> createState() =>
      _ScreenFormularioEstudianteState();
}

class _ScreenFormularioEstudianteState
    extends State<ScreenFormularioEstudiante> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final FormularioEstudianteController _logicController =
      FormularioEstudianteController();

  String _mensaje = '';

  void _registrarEstudiante() {
    final esValido = _formKey.currentState?.validate() ?? false;

    setState(() {
      if (esValido) {
        _mensaje = _logicController.obtenerMensajeExito();
      } else {
        _mensaje = '';
      }
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 6. Formulario de estudiante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingresa el nombre',
                  border: OutlineInputBorder(),
                ),
                validator: _logicController.validarNombre,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ingresa el apellido',
                  border: OutlineInputBorder(),
                ),
                validator: _logicController.validarApellido,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  hintText: 'ejemplo@correo.com',
                  border: OutlineInputBorder(),
                ),
                validator: _logicController.validarCorreo,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registrarEstudiante,
                child: const Text('REGISTRAR'),
              ),
              const SizedBox(height: 20),
              if (_mensaje.isNotEmpty)
                Text(
                  _mensaje,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}