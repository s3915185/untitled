import 'package:flutter/widgets.dart';
import 'package:untitled/enum/DateFilter.dart';
import 'package:untitled/enum/ElementCategory.dart';
import '../../Constants.dart';
import 'ListElementHandler.dart';

class TypeAndValueHandler extends StatelessWidget {
  const TypeAndValueHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListElementHandler(elements: ElementCategory.values),
        ListElementHandler(elements: DateFilter.values),
      ],
    );
  }
}