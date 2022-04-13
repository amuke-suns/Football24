import 'package:flutter/foundation.dart';
import 'package:football_news/business_logic/models/models.dart';
import 'package:intl/intl.dart';

class CalendarViewModel extends ChangeNotifier {

  // supported days
  List<GamesDate> _days = [];
  List<GamesDate> get days => List.unmodifiable(_days);
  int _selectedDayIndex = 0;

  int get selectedDayIndex => _selectedDayIndex;
  set selectedDayIndex(int index) {
    _selectedDayIndex = index;
    notifyListeners();
  }

  CalendarViewModel() {
    setDateList();
  }

  void setDateList() {
    _days = [];

    var date = DateTime.now();
    final DateFormat formatter = DateFormat('dd.MM');

    String todayDateString = formatter.format(date);
    date = date.add(const Duration(days: -8));

    for (int i = 0; i < 15; i++) {
      date = date.add(const Duration(days: 1));
      String dateString = formatter.format(date);

      if (dateString == todayDateString) {
        _selectedDayIndex = i;
      }

      _days.add(GamesDate(
        day: date.day,
        month: date.month,
        year: date.year,
        weekday: date.weekday,
        isToday: dateString == todayDateString,
      ));
    }
  }

  String getSelectedDateApiFormat() {
    return days[selectedDayIndex].apiFormat();
  }

  String? getAppDateDescription() {
    return days[selectedDayIndex].detailedFormat();
  }
}