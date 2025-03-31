import 'package:untitled/enum/TransactionCategory.dart';

class TransactionElement {
  DateTime? dateTime;
  String? elementName;
  TransactionCategoryType? transactionCategoryType;
  double? value;

  TransactionElement(this.dateTime, this.elementName,
      this.transactionCategoryType, this.value);
}