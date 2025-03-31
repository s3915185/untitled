import 'dart:ui';

import '../abstract/EnumAndTranslation.dart';

class PieChartElement {
  EnumAndTranslation? element;
  double? percentage;
  Color color;

  PieChartElement(this.element, this.percentage, this.color);
}