import 'dart:math' show pow;

class Calculadora {
  Calculadora({
    required this.altura,
    required this.peso,
  });

  final int altura;
  final int peso;

  // Calcula o IMC e retorna como String com uma casa decimal
  String calc() {
    double imc = calcularIMC();
    return imc.toStringAsFixed(1);
  }

  // Retorna o valor do IMC como double
  double calcularIMC() {
    return peso / pow(altura / 100, 2);
  }

  // Retorna a categoria do IMC como String
  String obterResultado() {
    double imc = calcularIMC();
    if (imc >= 25) {
      return 'Acima do peso';
    } else if (imc >= 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  // Retorna uma interpretação do IMC
  String obterInterpretacao() {
    double imc = calcularIMC();
    if (imc >= 25) {
      return 'Você está com o peso acima do normal. Tente se exercitar mais.';
    } else if (imc >= 18.5) {
      return 'Excelente! O seu peso está normal';
    } else {
      return 'Você está com o peso abaixo do normal. Tente comer um pouco mais.';
    }
  }
}
