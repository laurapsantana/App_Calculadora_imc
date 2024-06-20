import 'package:flutter/material.dart';
import 'package:calculadora_imc/consts/constantes.dart';
import 'package:calculadora_imc/widgets/button_low.dart';
import 'package:calculadora_imc/widgets/standard_card.dart';


class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.statusImc,
    required this.imc,
    required this.interpretacao,
  }) : super(key: key);

  final String statusImc;
  final String imc;
  final String interpretacao;

  Color _getTextColor() {
    if (statusImc == 'Normal') {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CALCULADORA IMC',
          style: TextStyle(color: kcolorContainerBottom),
        ),
      ),
      body: Column(
        children: [
          const Text(
            'RESULTADO',
            style: kstyleTextData,
          ),
          Expanded(
            flex: 5,
            child: StandardCard(
              selectColor: kcolorStandardCard,
              childCard: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      statusImc,
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      imc,
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      interpretacao,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ButtonLow(
            textButton: 'RECALCULAR',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
