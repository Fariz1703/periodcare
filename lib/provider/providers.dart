import 'package:periodcare/feature/calendar/calendarview.dart';
import 'package:periodcare/feature/home/homeview.dart';
import 'package:periodcare/feature/home/homeviewmodel.dart';
import 'package:periodcare/feature/calendar/calendarviewmodel.dart';
import 'package:periodcare/feature/statistic/statisticview.dart';
import 'package:periodcare/feature/statistic/statisticviewmodel.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(
    create: (_) => HomeViewModel(),
    child: HomeView(),
  ),
  ChangeNotifierProvider(
    create: (_) => CalendarViewModel(),
    child: CalendarView(),
  ),
  ChangeNotifierProvider(
    create: (_) =>Statisticviewmodel(),
    child: Statisticview(),
  ),
];