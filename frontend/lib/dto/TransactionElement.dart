class TransactionElement {
  DateTime? dateTime;
  String? elementName;
  String? transactionCategory;
  double? value;
  int? id;

  TransactionElement(this.id, this.dateTime, this.elementName,
      this.transactionCategory, this.value);
}