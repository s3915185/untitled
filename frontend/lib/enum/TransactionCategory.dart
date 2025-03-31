import 'package:untitled/abstract/EnumAndTranslation.dart';

enum TransactionCategoryType {
  HOUSINGBILLS,
  TRANSPORTATION,
  SUBSCRIPTIONS,
  FOOD,
  LEISURE,
}

enum TransactionCategory implements EnumAndTranslation{
  housingBills(TransactionCategoryType.HOUSINGBILLS, "Housing & Bills"),
  transportation(TransactionCategoryType.TRANSPORTATION, "Transportation"),
  subscriptions(TransactionCategoryType.SUBSCRIPTIONS, "Subscriptions & Recurring Cost"),
  food(TransactionCategoryType.FOOD, "Food & Dining"),
  leisure(TransactionCategoryType.LEISURE, "Shopping & Leisure");

  @override
  final TransactionCategoryType enumType;

  @override
  final String enumTranslation;

  const TransactionCategory(this.enumType, this.enumTranslation);

  static String getMessage(TransactionCategoryType element) {
    return TransactionCategory.values
        .firstWhere((category) => category.enumType == element, orElse: () => TransactionCategory.food) // Default value
        .enumTranslation;
  }
}