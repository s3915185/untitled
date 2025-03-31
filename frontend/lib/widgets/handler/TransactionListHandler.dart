import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Constants.dart';
import 'package:untitled/utils/ImageUtils.dart';

class TransactionListHandler extends StatefulWidget {
  final DateTime? dateStart;
  final DateTime? dateEnd;

  const TransactionListHandler({
    Key? key,
    required this.dateStart,
    required this.dateEnd,
  }) : super(key: key);

  @override
  State<TransactionListHandler> createState() => _TransactionListHandlerState();
}

class _TransactionListHandlerState extends State<TransactionListHandler> {
  late String timelineToDisplay;
  late String formattedDateRange;

  @override
  void initState() {
    super.initState();
    _updateTimeline();
  }

  @override
  void didUpdateWidget(covariant TransactionListHandler oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.dateStart != oldWidget.dateStart ||
        widget.dateEnd != oldWidget.dateEnd) {
      _updateTimeline();
    }
  }

  void _updateTimeline() {
    setState(() {
      DateTime now = DateTime.now();
      DateFormat dateFormat = DateFormat("dd-MMM-yyyy"); // "20-Dec-2024"
      DateFormat monthYearFormat = DateFormat("MMM-yyyy"); // "Dec-2024"

      if (widget.dateStart != null && widget.dateEnd != null) {
        DateTime start = widget.dateStart!;
        DateTime end = widget.dateEnd!;

        // Determine `timelineToDisplay`
        if (DateUtils.isSameDay(start, end) &&
            DateUtils.isSameDay(start, now)) {
          timelineToDisplay = "Today";
        } else if (DateUtils.isSameDay(
              start,
              now.subtract(Duration(days: 1)),
            ) &&
            DateUtils.isSameDay(end, now.subtract(Duration(days: 1)))) {
          timelineToDisplay = "Yesterday";
        } else if (_isCurrentWeek(start, end, now)) {
          timelineToDisplay = "This Week";
        } else if (_isLastWeek(start, end, now)) {
          timelineToDisplay = "Last Week";
        } else if (_isSameMonth(start, end, now)) {
          timelineToDisplay = "This Month";
        } else if (_isLastMonth(start, end, now)) {
          timelineToDisplay = "Last Month";
        } else if (_isSameYear(start, end, now)) {
          timelineToDisplay = "This Year";
        } else if (_isLastYear(start, end, now)) {
          timelineToDisplay = "Last Year";
        } else {
          timelineToDisplay = "Custom Range";
        }

        // Determine `formattedDateRange`
        if (_isFirstDateOfMonth(start) && _isLastDateOfMonth(end)) {
          formattedDateRange = monthYearFormat.format(
            start,
          ); // Example: "Dec-2024"
        } else if (DateUtils.isSameDay(start, end)) {
          formattedDateRange = dateFormat.format(
            start,
          ); // Example: "20-Dec-2024"
        } else {
          formattedDateRange =
              "${dateFormat.format(start)} to ${dateFormat.format(end)}";
        }
      } else {
        timelineToDisplay = "No Date Selected";
        formattedDateRange = "";
      }
    });
  }

  // ✅ Check if the given date is the first day of the month
  bool _isFirstDateOfMonth(DateTime date) {
    return date.day == 1;
  }

  // ✅ Check if the given date is the last day of the month
  bool _isLastDateOfMonth(DateTime date) {
    DateTime nextDay = date.add(Duration(days: 1));
    return nextDay.month !=
        date.month; // If adding 1 day changes the month, it's the last day
  }

  // ✅ Check if the range belongs to the current week
  bool _isCurrentWeek(DateTime start, DateTime end, DateTime now) {
    DateTime weekStart = now.subtract(
      Duration(days: now.weekday - 1),
    ); // Start of this week (Monday)
    DateTime weekEnd = weekStart.add(
      Duration(days: 6),
    ); // End of this week (Sunday)
    return (start.isAfter(weekStart) ||
            DateUtils.isSameDay(start, weekStart)) &&
        (end.isBefore(weekEnd) || DateUtils.isSameDay(end, weekEnd));
  }

  // ✅ Check if the range belongs to the last week
  bool _isLastWeek(DateTime start, DateTime end, DateTime now) {
    DateTime lastWeekStart = now.subtract(
      Duration(days: now.weekday + 6),
    ); // Last week's Monday
    DateTime lastWeekEnd = lastWeekStart.add(
      Duration(days: 6),
    ); // Last week's Sunday
    return (start.isAfter(lastWeekStart) ||
            DateUtils.isSameDay(start, lastWeekStart)) &&
        (end.isBefore(lastWeekEnd) || DateUtils.isSameDay(end, lastWeekEnd));
  }

  // ✅ Check if the range belongs to the current month
  bool _isSameMonth(DateTime start, DateTime end, DateTime now) {
    return start.month == now.month &&
        start.year == now.year &&
        end.month == now.month &&
        end.year == now.year;
  }

  // ✅ Check if the range belongs to the last month
  bool _isLastMonth(DateTime start, DateTime end, DateTime now) {
    DateTime lastMonth = DateTime(now.year, now.month - 1, 1);
    return start.month == lastMonth.month &&
        start.year == lastMonth.year &&
        end.month == lastMonth.month &&
        end.year == lastMonth.year;
  }

  // ✅ Check if the range belongs to the current year
  bool _isSameYear(DateTime start, DateTime end, DateTime now) {
    return start.year == now.year && end.year == now.year;
  }

  // ✅ Check if the range belongs to the last year
  bool _isLastYear(DateTime start, DateTime end, DateTime now) {
    return start.year == now.year - 1 && end.year == now.year - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            "$formattedDateRange",
            style: TextStyle(
              fontFamily: 'Inter - Bold',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$timelineToDisplay",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 20,
            children: [
              Text(
                "See all",
                style: TextStyle(fontFamily: 'Inter', fontSize: 14),
              ),
              ImageUtils.formatSvg(
                Constants.ICON_OPTIONS,
                24,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
