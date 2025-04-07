import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/widgets/calendar/CalendarHeader.dart';

import '../../utils/DateTimeUtils.dart';
import 'Calendar.dart';

class EnhancedCalendar extends StatefulWidget {
  final DateTime dateStart;
  final DateTime dateEnd;
  final DateTime? selectedDate;
  final Map<int, double> data;
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
          data: widget.data,
          onMonthChanged: _updateOneMonth,
          selectedDate: widget.selectedDate,
          onDateSelectionChanged: widget.onDateSelectionChanged,
        ),
      ],
    );
  }
}
