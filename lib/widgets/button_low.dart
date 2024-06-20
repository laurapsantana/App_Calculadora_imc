import 'package:calculadora_imc/consts/constantes.dart';
import 'package:flutter/material.dart';

class ButtonLow extends StatelessWidget {
  final Function() onPressed;
  final String textButton;
  const ButtonLow({
    super.key,
    required this.onPressed,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        color: kcolorContainerBottom,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kheithContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$textButton',
              style: kdescricaoTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
