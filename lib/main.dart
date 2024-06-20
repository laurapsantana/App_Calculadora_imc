import 'package:flutter/material.dart';
import 'package:calculadora_imc/consts/constantes.dart';
import 'package:calculadora_imc/pages/tela_principal.dart';

  const Color colorScaffoldBg = Color.fromRGBO(27, 30, 38, 1);

  void main() {
    runApp(const CalculadoraIMC());
  }

  class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: const TelaPrincipal(),
  theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: colorScaffoldBg,
  appBarTheme: kappBarStyler,
  ),
  );
  }
  }

