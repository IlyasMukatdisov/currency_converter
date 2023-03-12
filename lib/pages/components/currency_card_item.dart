import 'package:currency_converter/model/currency_rate_model.dart';
import 'package:currency_converter/providers/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_converter/utils/text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyCardItem extends ConsumerStatefulWidget {
  final String bodyText;
  final String currencyName;
  final String amount;
  final bool isConverted;
  final double rate;
  final List<CurrencyModel> currenciesList;

  const CurrencyCardItem({
    super.key,
    required this.amount,
    required this.bodyText,
    required this.currencyName,
    required this.isConverted,
    required this.rate,
    required this.currenciesList,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrencyCardItemState();
}

class _CurrencyCardItemState extends ConsumerState<CurrencyCardItem> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.amount.toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.amount.length),
    );
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.bodyText,
            style: TextStyles.cardBodyTextStyle,
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              MyDropdownButton(
                isConverted: widget.isConverted,
                currencyName: widget.currencyName,
                currenciesList: widget.currenciesList,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IntrinsicWidth(
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d*$'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value.endsWith('.')) {
                        return;
                      }
                      if (widget.isConverted) {
                        ref
                            .read(currencyAmountProvider.notifier)
                            .setConvertedAmount(
                              double.parse(
                                double.parse(value).toStringAsFixed(2),
                              ),
                            );
                        ref.read(currencyAmountProvider.notifier).setAmount(
                              double.parse(
                                (double.parse(value) * widget.rate)
                                    .toStringAsFixed(2),
                              ),
                            );
                      } else {
                        ref.read(currencyAmountProvider.notifier).setAmount(
                              double.parse(
                                double.parse(value).toStringAsFixed(2),
                              ),
                            );
                        ref
                            .read(currencyAmountProvider.notifier)
                            .setConvertedAmount(
                              double.parse(
                                (double.parse(value) * widget.rate)
                                    .toStringAsFixed(2),
                              ),
                            );
                      }
                    },
                    controller: controller,
                    cursorColor: const Color(0xFF3C3C3C),
                    expands: false,
                    textAlign: TextAlign.end,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyles.cardHeaderTextStyle.copyWith(
                      color: const Color(0xFF3C3C3C),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyDropdownButton extends ConsumerWidget {
  const MyDropdownButton({
    super.key,
    required this.isConverted,
    required this.currencyName,
    required this.currenciesList,
  });

  final bool isConverted;
  final String currencyName;
  final List<CurrencyModel> currenciesList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          alignment: Alignment.centerLeft,
          onChanged: (value) {
            if (value == null) {
              return;
            }
            ref.read(currencyAmountProvider.notifier).reset();
            if (isConverted) {
              ref
                  .read(currencyNameProvider.notifier)
                  .setConvertedAmountCurrency(value);
              return;
            }
            ref.read(currencyNameProvider.notifier).setAmountCurrency(value);
          },
          borderRadius: BorderRadius.circular(10),
          value: currencyName,
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            color: Color(0xFF989898),
          ),
          focusColor: Colors.transparent,
          items: currenciesList
              .map(
                (currency) => DropdownMenuItem<String>(
                  value: currency.name,
                  child: DropdownRow(
                    currencyFlag: currency.flag,
                    currencyName: currency.name,
                  ),
                ),
              )
              .toList()),
    );
  }
}

class DropdownRow extends StatelessWidget {
  final String currencyName;
  final String currencyFlag;
  const DropdownRow({
    required this.currencyName,
    required this.currencyFlag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            'icons/flags/png/$currencyFlag.png',
            package: 'country_icons',
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Text(
          currencyName,
          style: TextStyles.cardHeaderTextStyle,
        ),
      ],
    );
  }
}
