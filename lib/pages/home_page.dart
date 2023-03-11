import 'package:currency_converter/pages/components/footer.dart';
import 'package:currency_converter/pages/components/header.dart';
import 'package:currency_converter/pages/components/currency_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Header(),
                SizedBox(
                  height: 40,
                ),
                CurrencyCard(),
                SizedBox(
                  height: 30,
                ),
                Footer(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
