import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/widgets/calendar/EnhancedCalendar.dart';
import 'package:untitled/widgets/list/TransactionList.dart';

import '../dto/TransactionElement.dart';
import '../enum/TransactionCategory.dart';
import '../layouts/BasicLayout.dart';

class ReportScreen extends StatefulWidget {
  final DateTime dateStart;
  final DateTime dateEnd;

  const ReportScreen({Key? key, required this.dateStart, required this.dateEnd})
    : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final List<TransactionElement> data = [
    TransactionElement(DateTime(2025, 3, 8), "Dinner Date (Dining out)", TransactionCategoryType.FOOD, -132.00),
    TransactionElement(DateTime(2025, 3, 7), "Gym membership Renewal", TransactionCategoryType.SUBSCRIPTIONS, -450.00),
    TransactionElement(DateTime(2025, 3, 5), "Son's birthday gift", TransactionCategoryType.LEISURE, -150.00),
    TransactionElement(DateTime(2025, 3, 2), "Salary M3/2025", TransactionCategoryType.HOUSINGBILLS, 7516.00),
    TransactionElement(DateTime(2025, 3, 1), "Car's Tire fix", TransactionCategoryType.TRANSPORTATION, -85.00),
  ];

  DateTime? selectedDate;
  late DateTime currentStart;
  late DateTime currentEnd;

  @override
  void initState() {
    super.initState();
    currentStart = widget.dateStart;
    currentEnd = widget.dateEnd;
  }

  void _updateSelectedDate(DateTime? newDate) {
    setState(() {
      if (selectedDate != null && DateUtils.isSameDay(selectedDate!, newDate)) {
        selectedDate = null;
      } else {
        selectedDate = newDate;
      }
    });
  }

  DateTime? _getDate(bool isStart) {
    if (selectedDate != null) {
      return selectedDate;
    } else {
      return isStart ? currentStart : currentEnd;
    }
  }

  void _updateMonth(DateTime? start, DateTime? end) {
    setState(() {
      currentStart = start!;
      currentEnd = end!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicLayout(
        childrens: [
          Text("Reports", style: TextStyle(fontSize: 12, fontFamily: 'Inter')),
          EnhancedCalendar(
            dateStart: currentStart,
            dateEnd: currentEnd,
            selectedDate: selectedDate,
            onPeriodChanged: _updateMonth,
            onDateSelectionChanged: _updateSelectedDate,
          ),
          TransactionList(dateStart: _getDate(true), dateEnd: _getDate(false), data: data, isEdit: false),
        ],
      ),
    );
  }
}
