import 'package:flutter/foundation.dart';
import 'package:football_news/models/models.dart';
import 'package:intl/intl.dart';

class AppDateManager extends ChangeNotifier {

  List<int> _years = [];
  List<int> get years => _years;

  // supported days
  List<AppDate> _days = [];
  List<AppDate> get days => List.unmodifiable(_days);
  int _selectedDayIndex = 0;

  int get selectedDayIndex => _selectedDayIndex;
  set selectedDayIndex(int index) {
    _selectedDayIndex = index;
    notifyListeners();
  }

  void init() {
    setDateList();
    setYearList();
  }

  void setYearList() {
    _years = [];
    int year = DateTime.now().year;

    for (int i = 2010; i < year; i++) {
      _years.add(i);
    }
    // _selectedYearIndex = _years.length - 1;
  }

  // int getSelectedYear() => years[_selectedYearIndex];

  String getYearTimeline(int year) {
    return '$year/${year + 1}';
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

      _days.add(AppDate(
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