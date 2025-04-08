import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/enum/ElementCategory.dart';
import 'package:untitled/utils/DateTimeUtils.dart';

import '../../utils/ImageUtils.dart';

class CalendarHeader extends StatefulWidget {
  final DateTime currentMonth;
  final double? upAmount;
  final double? downAmount;
  final Function(DateTime) onMonthChanged;

  const CalendarHeader({
    Key? key,
    required this.currentMonth,
    required this.upAmount, required this.downAmount,
    required this.onMonthChanged,
  }) : super(key: key);

  @override
  State<CalendarHeader> createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends State<CalendarHeader> {
  Widget _buildTransactionInfo(
    ElementCategoryType elementCategory,
    double value,
      bool isStart,
  ) {
    String assetPath =
        elementCategory == ElementCategoryType.INCOME
            ? Constants.ICON_TREND_UP
            : Constants.ICON_TREND_DOWN;

    Color color =
        elementCategory == ElementCategoryType.INCOME
            ? Constants.COLOR_STRONG_BLUE
            : Color.fromARGB(255, 248, 156, 51);
    return Expanded(
      child: Row(
        spacing: 10,
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          ImageUtils.formatSvg(assetPath, 24, color: color),
          Text(
            "$value",
            style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: color),
          ),
        ],
      ),
    );
  }

  void _shiftMonth(bool isForward) {
    widget.onMonthChanged(
      DateTimeUtils.shiftOneMonth(widget.currentMonth, isForward),
    );
  }

  Widget _buildDateSelectionHandler() {
    return SizedBox(
      width: 130,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _shiftMonth(false), // Shift backward
              child: ImageUtils.formatSvg(
                Constants.ICON_ARROW_LEFT,
                24,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 10), // Add spacing
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Text(
                "${widget.currentMonth.year} - ${widget.currentMonth.month}",
                key: ValueKey(widget.currentMonth),
                style: const TextStyle(fontSize: 12, fontFamily: 'Inter'),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => _shiftMonth(true), // Shift forward
              child: ImageUtils.formatSvg(
                Constants.ICON_ARROW_RIGHT,
                24,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTransactionInfo(ElementCategoryType.INCOME, widget.upAmount!, true),
        _buildDateSelectionHandler(),
        _buildTransactionInfo(ElementCategoryType.SPENDING, widget.downAmount!, false),
      ],
    );
  }
}
