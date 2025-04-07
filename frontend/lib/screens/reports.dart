import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/dto/UserTransactionDTO.dart';
import 'package:untitled/screens/reportsService.dart';
import 'package:untitled/widgets/calendar/EnhancedCalendar.dart';
import 'package:untitled/widgets/list/TransactionList.dart';

import '../api/ApiClient.dart';
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
  late List<UserTransactionDTO>? _userTransactionList;
  bool _isLoading = true;

  late List<TransactionElement> data = [];

  DateTime? selectedDate;
  late DateTime currentStart;
  late DateTime currentEnd;

  Future<void> _fetchUserTransaction() async {
    final homeService = ReportService(ApiClient());

    try {
      final userTransactionList = await homeService.getUserTransactionsByUserInfoId(1);
      setState(() {
        _userTransactionList = userTransactionList;
        data = _userTransactionList!.map((element) {
          return TransactionElement(
            element.localDateTime,
            element.name,
            element.transactionCategory,
            element.amount,
          );
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentStart = widget.dateStart;
    currentEnd = widget.dateEnd;
    _fetchUserTransaction();
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
