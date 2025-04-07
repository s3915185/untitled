import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/dto/DoublePair.dart';
import 'package:untitled/widgets/calendar/CalendarHeader.dart';

import '../../utils/DateTimeUtils.dart';
import 'Calendar.dart';

class EnhancedCalendar extends StatefulWidget {
  final DateTime dateStart;
  final DateTime dateEnd;
  final DateTime? selectedDate;
  final Map<int, DoublePair> data;
  final Function(DateTime?, DateTime?) onPeriodChanged;
  final Function(DateTime?) onDateSelectionChanged;

  const EnhancedCalendar({
    Key? key,
    required this.dateStart,
    required this.dateEnd, this.selectedDate,required this.onPeriodChanged, required this.onDateSelectionChanged, required this.data,
  }) : super(key: key);

  @override
  State<EnhancedCalendar> createState() => _EnhancedCalendarState();
}

class _EnhancedCalendarState extends State<EnhancedCalendar> {

  void _updateOneMonth(DateTime newMonth) {
    widget.onPeriodChanged(DateTimeUtils.getFirstDateOfMonth(newMonth.year, newMonth.month), DateTimeUtils.getLastDateOfMonth(newMonth.year, newMonth.month));
  }

  double _getUpAmount() {
    if (widget.selectedDate != null) {
      return widget.data[widget.selectedDate?.day]?.upAmount ?? 0;
    } else {
      return widget.data.values
          .map((pair) => pair.upAmount)
          .fold(0.0, (sum, amount) => sum + amount);
    }
  }

  double _getDownAmount() {
    if (widget.selectedDate != null) {
      return widget.data[widget.selectedDate?.day]?.downAmount ?? 0;
    } else {
      return widget.data.values
          .map((pair) => pair.downAmount)
          .fold(0.0, (sum, amount) => sum + amount);
    }
  }

  Map<int, double> _mapForCalendar() {
    return {
      for (final entry in widget.data.entries)
        entry.key: entry.value.upAmount + entry.value.downAmount
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        CalendarHeader(
          currentMonth: widget.dateStart,
          upAmount: _getUpAmount(),
          downAmount: _getDownAmount(),
          onMonthChanged: _updateOneMonth,
        ),
        Calendar(
          currentMonth: widget.dateStart,
          data: _mapForCalendar(),
          onMonthChanged: _updateOneMonth,
          selectedDate: widget.selectedDate,
          onDateSelectionChanged: widget.onDateSelectionChanged,
        ),
      ],
    );
  }
}
