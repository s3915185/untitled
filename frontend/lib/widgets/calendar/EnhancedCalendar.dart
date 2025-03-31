import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/widgets/calendar/CalendarHeader.dart';

import '../../utils/DateTimeUtils.dart';
import 'Calendar.dart';

class EnhancedCalendar extends StatefulWidget {
  final DateTime dateStart;
  final DateTime dateEnd;
  final DateTime? selectedDate;
  final Function(DateTime?, DateTime?) onPeriodChanged;
  final Function(DateTime?) onDateSelectionChanged;

  const EnhancedCalendar({
    Key? key,
    required this.dateStart,
    required this.dateEnd, this.selectedDate,required this.onPeriodChanged, required this.onDateSelectionChanged,
  }) : super(key: key);

  @override
  State<EnhancedCalendar> createState() => _EnhancedCalendarState();
}

class _EnhancedCalendarState extends State<EnhancedCalendar> {

  void _updateOneMonth(DateTime newMonth) {
    widget.onPeriodChanged(DateTimeUtils.getFirstDateOfMonth(newMonth.year, newMonth.month), DateTimeUtils.getLastDateOfMonth(newMonth.year, newMonth.month));
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
          onMonthChanged: _updateOneMonth,
        ),
        Calendar(
          currentMonth: widget.dateStart,
          data: {
            1: 200,
            6: -34.21,
            7: 392.12,
            8: -23.28,
            9: -239.32,
            11: 403.23,
            12: 200,
            16: -34.21,
            17: 392.12,
            18: -23.28,
            19: -239.32,
            21: 403.23,
            23: -34.21,
            24: 392.12,
            26: -23.28,
            27: -239.32,
            29: 403.23,
          },
          onMonthChanged: _updateOneMonth,
          selectedDate: widget.selectedDate,
          onDateSelectionChanged: widget.onDateSelectionChanged,
        ),
      ],
    );
  }
}
