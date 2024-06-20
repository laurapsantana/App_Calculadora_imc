import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:calculadora_imc/consts/constantes.dart';
import 'package:calculadora_imc/pages/result_page.dart';
import 'package:calculadora_imc/sexo.dart';
import 'package:calculadora_imc/widgets/button_rounded.dart';
import 'package:calculadora_imc/widgets/content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:calculadora_imc/widgets/button_low.dart';
import 'package:calculadora_imc/widgets/standard_card.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo? sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 23;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: StandardCard(
                      onTapFunc: () {
                        setState(() {
                          sexoSelecionado = Sexo.masculino;
                        });
                      },
                      selectColor: sexoSelecionado == Sexo.masculino
                          ? kcolorStandardCard
                          : kcolorStandardCardOff,
                      childCard: ContentICon(
                        textCard: 'MASCULINO',
                        iconCont: FontAwesomeIcons.mars,
                      ),
                    )),
                Expanded(
                  child: StandardCard(
                    onTapFunc: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    selectColor: sexoSelecionado == Sexo.feminino
                        ? kcolorStandardCard
                        : kcolorStandardCardOff,
                    childCard: ContentICon(
                      textCard: 'FEMININO',
                      iconCont: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StandardCard(
              selectColor: kcolorStandardCard,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tamanho',
                    style: kdescricaoTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$altura',
                        style: kstyleTextData,
                      ),
                      const Text(
                        'cm',
                        style: kdescricaoTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: kcolorContainerBottom,
                    value: altura.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        altura = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: StandardCard(
                    selectColor: kcolorStandardCard,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PESO',
                          style: kdescricaoTextStyle,
                        ),
                        Text(
                          '$peso',
                          style: kstyleTextData,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonRounded(
                              child: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  peso--;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            ButtonRounded(
                              onPressed: () {
                                setState(() {
                                  peso++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: StandardCard(
                    selectColor: kcolorStandardCard,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IDADE',
                          style: kdescricaoTextStyle,
                        ),
                        Text(
                          '$idade',
                          style: kstyleTextData,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonRounded(
                              child: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  idade--;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            ButtonRounded(
                              onPressed: () {
                                setState(() {
                                  idade++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container Bottom
          ButtonLow(
            textButton: 'CALCULAR',
            onPressed: () {
              setState(() {
                Calculadora calc = Calculadora(altura: altura, peso: peso);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                          statusImc: calc.obterResultado(),
                          imc: calc.calc(),
                          interpretacao: calc.obterInterpretacao()),
                    ));
              });
            },
          ),
        ],
      ),
    );
  }
}
