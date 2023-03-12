// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:currency_converter/model/currency_rate_model.dart';
import 'package:currency_converter/pages/components/currency_card_item.dart';
import 'package:currency_converter/providers/currency_provider.dart';
import 'package:currency_converter/utils/strings.dart';

class CurrencyCard extends ConsumerWidget {
  final List<CurrencyModel> list;

  const CurrencyCard({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyName = ref.watch(currencyNameProvider);
    final currencyAmount = ref.watch(currencyAmountProvider);

    final double amountCurrencyRateToUSD = list.firstWhere(
      (element) => element.name == currencyName[Strings.amountCurrency],
    ).rate;

    final double convertedAmountCurrencyRateToUSD = list.firstWhere(
      (element) => element.name == currencyName[Strings.convertedAmountCurrency],
    ).rate;

    final amountRate = convertedAmountCurrencyRateToUSD/amountCurrencyRateToUSD;
    final convertedAmountRate = amountCurrencyRateToUSD/convertedAmountCurrencyRateToUSD;

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            CurrencyCardItem(
              bodyText: 'Amount',
              currencyName: currencyName[Strings.amountCurrency]!,
              amount: currencyAmount[Strings.amount].toString(),
              isConverted: false,
              currenciesList: list,
              rate: amountRate,
            ),
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
            CurrencyCardItem(
              currenciesList: list,
              bodyText: 'Converted Amount',
              currencyName: currencyName[Strings.convertedAmountCurrency]!,
              amount: currencyAmount[Strings.convertedAmount].toString(),
              isConverted: true,
              rate: convertedAmountRate,
            ),
          ],
        ),
      ),
    );
  }
}
