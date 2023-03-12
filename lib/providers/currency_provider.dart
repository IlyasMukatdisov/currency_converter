import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_converter/model/currency_rate_model.dart';
import 'package:currency_converter/utils/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Future<List<CurrencyRateModel>> getCourses() async {
//   final List<CurrencyRateModel> list = [];
//   try {
//     final snapshot = await FirebaseFirestore.instance
//         .collection(Strings.currencyRatesCollection)
//         .get();
//     snapshot.docs.map(
//       (doc) => list.add(
//         CurrencyRateModel.fromMap(
//           doc.data(),
//         ),
//       ),
//     );
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return list;
// }

final firebaseCurrencyProvider = AutoDisposeFutureProvider<List<CurrencyModel>>(
  (ref) async {
    final snapshot = await FirebaseFirestore.instance
        .collection(Strings.currencyCollection)
        .get();
    return snapshot.docs
        .map(
          (doc) => CurrencyModel.fromMap(
            doc.data(),
          ),
        )
        .toList();
  },
);

final currencyAmountProvider =
    AutoDisposeNotifierProvider<CurrencyAmountNotifier, Map<String, double>>(
  () {
    return CurrencyAmountNotifier();
  },
);

class CurrencyAmountNotifier extends AutoDisposeNotifier<Map<String, double>> {
  @override
  Map<String, double> build() {
    return {
      Strings.amount: 0,
      Strings.convertedAmount: 0,
    };
  }

  void reset() {
    state = {
      Strings.amount: 0,
      Strings.convertedAmount: 0,
    };
  }

  void setAmount(double amount) {
    state = {
      Strings.amount: amount,
      Strings.convertedAmount: state[Strings.convertedAmount]!,
    };
  }

  void setConvertedAmount(double convertedAmount) {
    state = {
      Strings.amount: state[Strings.amount]!,
      Strings.convertedAmount: convertedAmount,
    };
  }
}

final currencyNameProvider =
    AutoDisposeNotifierProvider<CurrencyNameNotifier, Map<String, String>>(
  () {
    return CurrencyNameNotifier();
  },
);

class CurrencyNameNotifier extends AutoDisposeNotifier<Map<String, String>> {
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
