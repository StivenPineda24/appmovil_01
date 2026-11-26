import 'package:flutter/material.dart';
//import 'package:flutter_app_1/screen/screen_basico1.dart';
//import 'package:flutter_app_1/screen/screen_basico2.dart';
//import 'package:flutter_app_1/screen/screen_calculadora.dart';
//import 'screen/screen_calculadora_de_promedio.dart';
//import 'screen/screen_calculadora_pago.dart';
//import 'screen/screen_calculadora_descuento.dart';
// import 'screen/screen_calculadora_combustible.dart';
//import 'screen/screen_formulario_nombres.dart';
//import 'screen/screen_formulario_correo.dart';
//import 'screen/screen_registro_edad.dart';
//import 'screen/screen_registro_dni.dart';
//import 'screen/screen_registro_password.dart';
import 'screen/screen_formulario_estudiante.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STIVEN PINEDA',
      home: ScreenFormularioEstudiante(),
    );
  }
}
