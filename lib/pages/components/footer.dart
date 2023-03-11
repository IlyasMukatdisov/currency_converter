import 'package:currency_converter/utils/text_styles.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Indicative Exchange Rate',
          style: TextStyles.bodyTextStyle,
        ),
        Text('1 SGD = 1.00 USD', style: TextStyles.cardHeaderTextStyle),
      ],
    );
  }
}
