import 'package:flutter/material.dart';
import 'package:periodcare/feature/calendar/calendarmodel.dart';


class CalendarViewModel extends ChangeNotifier {
  CalendarViewModel();

  List<DateRange> highlightedRanges = [
    DateRange(
      dateStart: DateTime(2026, 11, 5),
      dateEnd: DateTime(2026, 11, 9),
    ),
    DateRange(dateStart: DateTime(2026, 11, 12), dateEnd: DateTime(2026, 11, 15)),
    DateRange(dateStart: DateTime(2026, 11, 20), dateEnd: DateTime(2026, 11, 25)),
];
}