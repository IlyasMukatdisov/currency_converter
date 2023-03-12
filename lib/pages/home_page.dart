import 'package:currency_converter/pages/components/footer.dart';
import 'package:currency_converter/pages/components/header.dart';
import 'package:currency_converter/pages/components/currency_card.dart';
import 'package:currency_converter/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(firebaseCurrencyProvider);

    return asyncValue.when(
      data: (list) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const SizedBox(
                      height: 40,
                    ),
                    CurrencyCard(
                      list: list,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Footer(
                      
                      list: list,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(body: Center(child: Text(error.toString())));
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
