import 'package:currency_converter/utils/strings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';




final currencyAmountProvider =
    NotifierProvider<CurrencyAmountNotifier, Map<String, double>>(
  () {
    return CurrencyAmountNotifier();
  },
);

class CurrencyAmountNotifier extends Notifier<Map<String, double>> {
  @override
  Map<String, double> build() {
    return {
      Strings.amount: 10000,
      Strings.convertedAmount: 1,
    };
  }

  void setAmount(double amount) {
    final double convertedAmount = 2 * amount;

    state = {
      Strings.amount: amount,
      Strings.convertedAmount: convertedAmount,
    };
  }

  void setConvertedAmount(double convertedAmount) {
    final double amount = 0.5 * convertedAmount;

    state = {
      Strings.amount: amount,
      Strings.convertedAmount: convertedAmount,
    };
  }
}

final currencyTypeProvider =
    NotifierProvider<CurrencyTypeNotifier, Map<String, String>>(
  () {
    return CurrencyTypeNotifier();
  },
);

class CurrencyTypeNotifier extends Notifier<Map<String, String>> {
  @override
  build() {
    return {
      Strings.amountCurrency: Strings.usd,
      Strings.convertedAmountCurrency: Strings.eur,
    };
  }

  void setAmountCurrency(String amountCurrency) {
    if (amountCurrency == state[Strings.convertedAmountCurrency]) {
      state = {
        Strings.amountCurrency: state[Strings.convertedAmountCurrency]!,
        Strings.convertedAmountCurrency: state[Strings.amountCurrency]!,
      };
      return;
    }

    state = {
      Strings.amountCurrency: amountCurrency,
      Strings.convertedAmountCurrency: state[Strings.convertedAmountCurrency]!,
    };
  }

  void setConvertedAmountCurrency(String convertedAmountCurrency) {
    if (convertedAmountCurrency == state[Strings.amountCurrency]) {
      state = {
        Strings.amountCurrency: state[Strings.convertedAmountCurrency]!,
        Strings.convertedAmountCurrency: state[Strings.amountCurrency]!,
      };
      return;
    }

    state = {
      Strings.amountCurrency: state[Strings.amountCurrency]!,
      Strings.convertedAmountCurrency: convertedAmountCurrency,
    };
  }
}
