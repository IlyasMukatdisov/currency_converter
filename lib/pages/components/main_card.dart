import 'package:currency_converter/pages/components/currency_card_item.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          CurrencyCardItem(
              bodyText: 'Amount', currencyText: '1000', amount: ''),
        ],
      ),
    );
  }
}
