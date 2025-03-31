import 'package:untitled/abstract/EnumAndTranslation.dart';

enum ElementCategoryType {SPENDING, INCOME}

enum ElementCategory implements EnumAndTranslation{
  spending(ElementCategoryType.SPENDING, "Spending"),
  income(ElementCategoryType.INCOME, "Income");

  @override
  final ElementCategoryType enumType;

  @override
  final String enumTranslation;

  const ElementCategory(this.enumType, this.enumTranslation);
}