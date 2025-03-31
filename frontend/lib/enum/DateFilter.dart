import 'package:untitled/abstract/EnumAndTranslation.dart';

enum DateFilterType {MONTHLY, WEEKLY, YEARLY}

enum DateFilter implements EnumAndTranslation {
  monthly(DateFilterType.MONTHLY, "Monthly"),
  weekly(DateFilterType.WEEKLY, "Weekly"),
  yearly(DateFilterType.YEARLY, "Yearly");

  @override
  final DateFilterType enumType;

  @override
  final String enumTranslation;

  const DateFilter(this.enumType, this.enumTranslation);
}