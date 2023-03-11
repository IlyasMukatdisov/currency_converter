// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:currency_converter/utils/custom_clippers.dart';
import 'package:currency_converter/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyCardItem extends StatelessWidget {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  alignment: Alignment.centerLeft,
                  onChanged: (value) {},
                  borderRadius: BorderRadius.circular(10),
                  value: 'USD',
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Color(0xFF3C3C3C),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
