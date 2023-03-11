import 'package:currency_converter/pages/components/currency_card_item.dart';
import 'package:currency_converter/providers/currency_provider.dart';
import 'package:currency_converter/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrencyCard extends ConsumerWidget {
  const CurrencyCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyType = ref.watch(currencyTypeProvider);
    final currencyAmount = ref.watch(currencyAmountProvider);

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            CurrencyCardItem(
              bodyText: 'Amount',
              currencyType: currencyType[Strings.amountCurrency]!,
              amount: currencyAmount[Strings.amount].toString(),
              isConverted: false,
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
              bodyText: 'Converted Amount',
              currencyType: currencyType[Strings.convertedAmountCurrency]!,
              amount: currencyAmount[Strings.convertedAmount].toString(),
              isConverted: true,
            ),
          ],
        ),
      ),
    );
  }
}
