import 'package:currency_converter/utils/text_styles.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Currency Converter',
            style: TextStyles.headerTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Check live rates, set rate alerts, receive notifications and more.',
            style: TextStyles.bodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
