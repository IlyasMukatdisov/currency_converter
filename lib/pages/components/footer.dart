// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:currency_converter/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:currency_converter/model/currency_rate_model.dart';
import 'package:currency_converter/providers/currency_provider.dart';
import 'package:currency_converter/utils/text_styles.dart';

class Footer extends ConsumerWidget {
  final List<CurrencyModel> list;
  const Footer({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyName = ref.watch(currencyNameProvider);

    final CurrencyModel amountCurrency = list.firstWhere(
      (element) => element.name == currencyName[Strings.amountCurrency],
    );

    final CurrencyModel convertedAmountCurrency = list.firstWhere(
      (element) =>
          element.name == currencyName[Strings.convertedAmountCurrency],
    );

    final convertedAmountRate =
        amountCurrency.rate / convertedAmountCurrency.rate;

    final rateString = convertedAmountRate.toStringAsFixed(2).startsWith('0.00')
        ? convertedAmountRate.toStringAsFixed(6)
        : convertedAmountRate.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Indicative Exchange Rate',
          style: TextStyles.bodyTextStyle,
        ),
        Text(
          '1 ${convertedAmountCurrency.name} = $rateString ${amountCurrency.name}',
          style: TextStyles.cardHeaderTextStyle,
        ),
      ],
    );
  }
}
