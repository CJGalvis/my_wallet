import 'package:intl/intl.dart';

class FormatHelper {
  static String currency(double value) {
    final formatter = NumberFormat.currency(
      customPattern: '#,### \u00a4',
      symbol: '',
      decimalDigits: 2,
    );

    return formatter.format(value);
  }

  static String date(DateTime date) {
    return DateFormat.yMd().format(date);
  }
}
