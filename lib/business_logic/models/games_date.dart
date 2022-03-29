import 'package:intl/intl.dart';

class GamesDate {
  int day;
  int month;
  int year;
  int weekday;
  bool isToday;

  GamesDate({
    required this.day,
    required this.month,
    required this.year,
    required this.weekday,
    required this.isToday,
  });

  String detailedFormat() => '$day.$month.$year, ${_getWeekdayName()}';

  String simpleFormat() =>
      isToday ? 'TODAY' : '$day.$month. ${_getWeekdayName()}';

  String apiFormat() {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime(year, month, day));
  }

  String _getWeekdayName() {
    String dayName;
    switch (weekday) {
      case 1:
        dayName = 'MONDAY';
        break;
      case 2:
        dayName = 'TUESDAY';
        break;
      case 3:
        dayName = 'WEDNESDAY';
        break;
      case 4:
        dayName = 'THURSDAY';
        break;
      case 5:
        dayName = 'FRIDAY';
        break;
      case 6:
        dayName = 'SATURDAY';
        break;
      default:
        dayName = 'SUNDAY';
    }
    return dayName;
  }
}
