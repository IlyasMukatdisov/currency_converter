// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:currency_converter/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CurrencyCardItem extends HookWidget {
  final String bodyText;
  final String currencyText;
  final String amount;
  const CurrencyCardItem({
    Key? key,
    required this.bodyText,
    required this.currencyText,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bodyText,
            style: TextStyles.cardBodyTextStyle,
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  alignment: Alignment.centerLeft,
                  onChanged: (value) {},
                  borderRadius: BorderRadius.circular(10),
                  value: 'USD',
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xFF989898),
                  ),
                  focusColor: Colors.transparent,
                  items: [
                    DropdownMenuItem(
                      value: 'USD',
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'icons/flags/png/us.png',
                              package: 'country_icons',
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'USD',
                            style: TextStyles.cardHeaderTextStyle,
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'EUR',
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'icons/flags/png/eu.png',
                              package: 'country_icons',
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            'USD',
                            style: TextStyles.cardHeaderTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.only(left: 20, right: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  maxLines: 1,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'\d+\.?\d*'),
                    ),
                  ],
                  onFieldSubmitted: (value) {
                    if (value.endsWith('.')) {
                      _controller.text = '${_controller.text}0';
                    }
                  },
                  controller: _controller,
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
            ],
          )
        ],
      ),
    );
  }
}
