import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../utils/DateTimeUtils.dart';

class Calendar extends StatefulWidget {
  final DateTime currentMonth;
  final Map<int, double> data;
  final Function(DateTime) onMonthChanged;

  final DateTime? selectedDate;
  final Function(DateTime) onDateSelectionChanged;

  const Calendar({
    Key? key,
    required this.currentMonth,
    required this.data,
    required this.onMonthChanged,
    required this.selectedDate,
    required this.onDateSelectionChanged,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<String> weekdays = ["S", "M", "T", "W", "T", "F", "S"];

  DateTime get firstDayOfMonth =>
      DateTime(widget.currentMonth.year, widget.currentMonth.month, 1);

  int get daysInMonth =>
      DateTime(widget.currentMonth.year, widget.currentMonth.month + 1, 0).day;

  int get startWeekday =>
      firstDayOfMonth.weekday % 7; // Ensure Sunday is index 0

  Widget _buildWeekHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          weekdays
              .map(
                (element) => Expanded(
                  child: Center(
                    child: Text(
                      element,
                      style: TextStyle(fontSize: 10, fontFamily: 'Inter'),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildWeekDay() {
    List<Widget> rows = [];
    int dayCounter = 1;
    bool firstRowFilled = false;

    for (int i = 0; i < 6; i++) {
      List<Widget> daysRow = [];

      for (int j = 0; j < 7; j++) {
        if (!firstRowFilled && j < startWeekday) {
          daysRow.add(Expanded(child: SizedBox()));
        } else if (dayCounter > daysInMonth) {
          daysRow.add(Expanded(child: SizedBox()));
        } else {
          firstRowFilled = true;
          DateTime day = DateTime(widget.currentMonth.year, widget.currentMonth.month, dayCounter);
          bool isSelected = DateUtils.isSameDay(widget.selectedDate, day);
          daysRow.add(
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectDate(day);
                  });
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    border:
                        isSelected
                            ? Border.all(
                              color: Color.fromARGB(255, 118, 118, 118),
                              width: 1,
                            )
                            : null,
                    color:
                        widget.data.containsKey(dayCounter)
                            ? widget.data[dayCounter]! >= 0
                                ? Color.fromARGB(255, 217, 235, 255)
                                : Color.fromARGB(255, 252, 233, 212)
                            : Colors.transparent,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1, // Ensures square cells
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            dayCounter.toString(),
                            style: TextStyle(fontSize: 12, fontFamily: 'Inter - Semi - Bold'),
                          ),
                          widget.data.containsKey(dayCounter)
                              ? Text(
                                "${widget.data[dayCounter]! >= 0 ? '+' : '-'}${widget.data[dayCounter]!.abs()}",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  color:
                                      widget.data[dayCounter]! >= 0
                                          ? Constants.COLOR_STRONG_BLUE
                                          : Color.fromARGB(255, 248, 156, 51),
                                ),
                              )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          dayCounter++;
        }
      }

      rows.add(Row(spacing: 5, children: daysRow));

      if (dayCounter > daysInMonth) break;
    }
    return Column(spacing: 5, children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        const double velocityThreshold = 300; // Adjust as needed

        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! > velocityThreshold) {
            _shiftMonth(false); // Swipe right
          } else if (details.primaryVelocity! < -velocityThreshold) {
            _shiftMonth(true); // Swipe left
          }
        }
      },
      child: Column(
        spacing: 7,
        children: [
          _buildWeekHeader(),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            },
            child: Column(
              key: ValueKey(widget.currentMonth),
              children: [_buildWeekDay()],
            ),
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

  void _selectDate(DateTime dateTime) {
    widget.onDateSelectionChanged(dateTime);
  }
}
