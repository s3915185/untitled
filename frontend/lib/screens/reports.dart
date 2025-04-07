import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/dto/DoublePair.dart';
import 'package:untitled/dto/UserTransactionCalendarDTO.dart';
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
  bool _isLoading = true;

  late List<TransactionElement> _userTransactionListData = [];
  late Map<int, DoublePair> _userTransactionCalendarListData = {
    // 1: 200,
    // 6: -34.21,
    // 7: 392.12,
    // 8: -23.28,
    // 9: -239.32,
    // 11: 403.23,
    // 12: 200,
    // 16: -34.21,
    // 17: 392.12,
    // 18: -23.28,
    // 19: -239.32,
    // 21: 403.23,
    // 23: -34.21,
    // 24: 392.12,
    // 26: -23.28,
    // 27: -239.32,
    // 29: 403.23,
  };

  DateTime? selectedDate;
  late DateTime currentStart;
  late DateTime currentEnd;
  final homeService = ReportService(ApiClient());

  Future<void> _getUserTransactions() async {

    try {
      final userTransactionList = await homeService
          .getUserTransactionsByUserInfoId(1, _getDate(true)!, _getDate(false)!);
      setState(() {
        _userTransactionListData =
            userTransactionList!.map((element) {
              return TransactionElement(
                element.localDate,
                element.name,
                element.transactionCategory,
                element.amount,
              );
            }).toList();
      });
    } catch (e) {
      setState(() {
      });
    }
  }

  Future<void> _getEachDayUpAndDownInfo() async {
    try {
      final userTransactionCalendarList = await homeService
          .getEachDayUpAndDownInfoByUserInfoIdAndPeriods(
            1,
            currentStart,
            currentEnd,
          );
      setState(() {
        _userTransactionCalendarListData = Map.fromEntries(
          userTransactionCalendarList!.map(
            (element) => MapEntry(
              element.date!.day,
              DoublePair(element.upAmount!, element.downAmount!)
            ),
          ),
        );
      });
    } catch (e) {
      setState(() {
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentStart = widget.dateStart;
    currentEnd = widget.dateEnd;
    _getUserTransactions();
    _getEachDayUpAndDownInfo();
  }

  void _updateSelectedDate(DateTime? newDate) {
    setState(() {
      if (selectedDate != null && DateUtils.isSameDay(selectedDate!, newDate)) {
        selectedDate = null;
      } else {
        selectedDate = newDate;
      }
      _getUserTransactions();
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
      selectedDate = null;
      _getUserTransactions();
      _getEachDayUpAndDownInfo();
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
            data: _userTransactionCalendarListData,
          ),
          TransactionList(
            dateStart: _getDate(true),
            dateEnd: _getDate(false),
            data: _userTransactionListData,
            isEdit: false,
          ),
        ],
      ),
    );
  }
}
