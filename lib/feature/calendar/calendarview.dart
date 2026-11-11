import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widget_previews.dart';

import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/feature/calendar/component/calendar.dart';
import 'package:periodcare/feature/calendar/calendarviewmodel.dart';
import 'package:periodcare/feature/calendar/component/cycle.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Consumer<CalendarViewModel>(
        builder: (context, vm, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
            
                  Calendar(highlightedRanges: vm.highlightedRanges),
            
                  const SizedBox(height: 24),
            
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Riwayat Siklus Sebelumnya",
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${vm.highlightedRanges.length} Siklus Tercatat",
                        style: AppTypography.bodySmall.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
            
                  const SizedBox(height: 12),
            
                  Column(
                    children: [
                      ...List.generate(vm.highlightedRanges.length, (index) {
                        return Column(
                          children: [
                            CycleWidget(
                              dateRange: vm.highlightedRanges[index],
                              nextStart: index + 1 < vm.highlightedRanges.length
                                  ? vm.highlightedRanges[index + 1].dateStart
                                  : null,
                            ),
                            const SizedBox(height: 12),
                          ],
                        );
                      }).reversed,
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

@Preview(name: 'Calendar View')
Widget calendarPreview() {
  return ChangeNotifierProvider<CalendarViewModel>(
    create: (_) => CalendarViewModel(),
    child: const MaterialApp(home: CalendarView()),
  );
}
