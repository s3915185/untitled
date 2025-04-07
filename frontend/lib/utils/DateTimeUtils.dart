import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime shiftOneMonth(DateTime dateTime, bool isForward) {
    int newMonth = dateTime.month + (isForward ? 1 : -1);
    int newYear = dateTime.year;

    if (newMonth > 12) {
      newMonth = 1;
      newYear++;
    } else if (newMonth < 1) {
      newMonth = 12;
      newYear--;
    }

    return DateTime(newYear, newMonth, dateTime.day);
  }

  static DateTime getFirstDateOfMonth(int year, int month) {
    return DateTime(year, month, 1);
  }

  static DateTime getLastDateOfMonth(int year, int month) {
    return DateTime(year, month + 1, 0);
  }

  static bool isFirstDateOfMonth(DateTime dateTime) {
    return dateTime.day == 1;
  }

  static bool isLastDateOfMonth(DateTime dateTime) {
    return dateTime.day == DateTime(dateTime.year, dateTime.month + 1, 0).day;
  }

  static bool isStartAndEndOfSameMonth(DateTime? dateStart, DateTime? dateEnd) {
    if (dateStart == null || dateEnd == null) {
      return false;
    }
    return dateStart.year == dateEnd.year && dateStart.month == dateEnd.month;
  }

  static String dateTimeNormalFormat(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("dd-MMM-yyyy");
    return dateFormat.format(dateTime);
  }

  static String dateTimeApiFormat(DateTime dateTime) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(dateTime);
  }
}
