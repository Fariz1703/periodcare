import 'package:flutter/material.dart';
import 'package:periodcare/feature/calendar/calendarmodel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:flutter/widget_previews.dart';

class Calendar extends StatelessWidget {
  final List<DateRange> highlightedRanges;

  // = [
  //   DateRange(
  //     dateStart: DateTime(2026, 11, 5),
  //     dateEnd: DateTime(2026, 11, 8),
  //   ),
  //   DateRange(
  //     dateStart: DateTime(2026, 11, 12),
  //     dateEnd: DateTime(2026, 11, 15),
  //   ),
  //   DateRange(
  //     dateStart: DateTime(2026, 11, 20),
  //     dateEnd: DateTime(2026, 11, 25),
  //   ),
  // ];

  const Calendar({super.key, required this.highlightedRanges});

  bool isHighlighted(DateTime day) {
    return highlightedRanges.any((range) {
      final start = range.dateStart;
      DateTime end = range.dateEnd ?? DateTime.now();
      if (start == null) {
        return false;
      }

      final date = DateTime(day.year, day.month, day.day);

      final startDate = DateTime(start.year, start.month, start.day);

      final endDate = DateTime(end.year, end.month, end.day);

      return !date.isBefore(startDate) && !date.isAfter(endDate);
    });
  }

  bool isRangeStart(DateTime day) {
    return highlightedRanges.any((range) {
      final start = range.dateStart;
      return start != null && isSameDay(day, start);
    });
  }

  bool isRangeEnd(DateTime day) {
    return highlightedRanges.any((range) {
      final start = range.dateStart;
      final end = range.dateEnd ?? DateTime.now();

      if (start == null) return false;

      return isSameDay(day, end);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 12),
      decoration: BoxDecoration(
                            gradient: const RadialGradient(
                      center: Alignment.topRight,
                      radius: 0.5,
                      colors: [Color(0xFFFFE8EA), Color(0xFFFFFFFF)],
                    ),
        borderRadius: BorderRadius.circular(32),
        color: AppColors.onPrimary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2035, 12, 31),
            focusedDay: DateTime.now(),

            startingDayOfWeek: StartingDayOfWeek.sunday,
            calendarFormat: CalendarFormat.month,

            headerVisible: true,
            daysOfWeekHeight: 44,
            rowHeight: 44,

            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),

            // rangeSelectionMode: RangeSelectionMode.toggledOn,

            // rangeStartDay: rangeStart,
            // rangeEndDay: rangeEnd,
            // onRangeSelected: (start, end, focused) {
            //   setState(() {
            //     rangeStart = start;
            //     rangeEnd = end;
            //     selectedDay = focused;
            //   });
            // },
            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.zero,
              cellPadding: EdgeInsets.zero,
              rangeHighlightColor: Colors.transparent,
              outsideDaysVisible: true,
              markersMaxCount: 1,
              markerSize: 8,
              markersAlignment: Alignment.bottomCenter,

              // withinRangeTextStyle: AppTextStyles.bodySmall.copyWith(
              //   color: AppColors.surface,
              // ),
              // rangeStartDecoration: BoxDecoration(
              //   color: AppColors.primary,
              //   shape: BoxShape.circle,
              // ),
              // rangeEndDecoration: BoxDecoration(
              //   color: AppColors.primary,
              //   shape: BoxShape.circle,
              // ),
              // withinRangeDecoration: BoxDecoration(
              //   color: AppColors.primary,
              //   shape: BoxShape.circle,
              // ),
            ),

            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final isActive = isHighlighted(day);
                final isStart = isRangeStart(day);
                final isEnd = isRangeEnd(day);

                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isActive)
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.horizontal(
                              left: isStart
                                  ? const Radius.circular(20)
                                  : Radius.zero,
                              right: isEnd
                                  ? const Radius.circular(20)
                                  : Radius.zero,
                            ),
                          ),
                        ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primary
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${day.day}',

                          style: AppTypography.bodySmall.copyWith(
                            height: 1,
                            color: isActive
                                ? AppColors.onPrimary
                                : AppColors.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },

              todayBuilder: (context, day, focusedDay) {
                final isActive = isHighlighted(day);
                final isStart = isRangeStart(day);
                final isEnd = isRangeEnd(day);

                return Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isActive)
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.horizontal(
                              left: isStart
                                  ? const Radius.circular(20)
                                  : Radius.zero,
                              right: isEnd
                                  ? const Radius.circular(20)
                                  : Radius.zero,
                            ),
                          ),
                        ),

                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primary
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${day.day}',
                          style: AppTypography.bodySmall.copyWith(
                            color: isActive
                                ? AppColors.onPrimary
                                : AppColors.onSecondary,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 4.75,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.onPrimary
                                : AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },

              dowBuilder: (context, day) {
                const days = ['MIN', 'SEN', 'SEL', 'RAB', 'KAM', 'JUM', 'SAB'];

                return Center(
                  child: Text(
                    days[day.weekday % 7],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Color(0XffF2EDEA),
            ),
            child: Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, size: 16, color: AppColors.primary),
                    SizedBox(width: 2),
                    Text(
                      "Periode Haid",
                      style: AppTypography.bodySmall.copyWith(fontSize: 8
                      ,fontWeight: FontWeight.bold),
                      
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 16,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withAlpha(20),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                          color: isHighlighted(DateTime.now())
                              ? AppColors.primary
                              : AppColors.onPrimary,
                        ),
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: isHighlighted(DateTime.now())
                              ? AppColors.onPrimary
                              : AppColors.primary,
                        ),
                      ],
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Hari ini",
                      style: AppTypography.bodySmall.copyWith(fontSize: 8,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@Preview(name: 'Calendar View Widget')
Widget calendarPreview() {
  return MaterialApp(
    home: Calendar(
      highlightedRanges: [
        DateRange(
          dateStart: DateTime(2026, 11, 5),
          dateEnd: DateTime(2026, 11, 7),
        ),
        DateRange(
          dateStart: DateTime(2026, 11, 12),
          dateEnd: DateTime(2026, 11, 15),
        ),
        DateRange(
          dateStart: DateTime(2026, 11, 20),
          dateEnd: DateTime(2026, 11, 25),
        ),
      ],
    ),
  );
}
