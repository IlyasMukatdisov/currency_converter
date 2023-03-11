import 'package:currency_converter/pages/components/currency_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            const CurrencyCardItem(
                bodyText: 'Amount', currencyText: '1000', amount: '1000'),
            const SizedBox(
              height: 15,
              width: double.infinity,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                SvgPicture.asset(
                  'assets/images/exchange_icon.svg',
                ),
              ],
            ),
            const SizedBox(
              height: 15,
              width: double.infinity,
            ),
            const CurrencyCardItem(
                bodyText: 'Converted Amount',
                currencyText: '736',
                amount: '736'),
          ],
        ),
      ),
    );
  }
}
