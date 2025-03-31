import 'package:intl/intl.dart';

class CommonUtils {
  static String formatCurrency(dynamic amount) {
    NumberFormat formatter;

    if (amount is double && amount % 1 != 0) {
      formatter = NumberFormat("#,##0.000", "en_US");
    } else {
      formatter = NumberFormat("#,##0", "en_US");
    }

    return "${formatter.format(amount)} VND";
  }
}