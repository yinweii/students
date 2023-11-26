import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTimeUtil._();
  static int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  static String? updateTime(String? date) {
    if (date == null) {
      return '';
    }
    final dateFormat = DateFormat("yyyy-MM-dd");
    final dateTime = dateFormat.parse(date);
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  static String fromatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat("dd-MM-yyyy").format(date);
  }
}
