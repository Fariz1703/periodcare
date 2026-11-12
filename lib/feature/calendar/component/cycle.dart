import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/feature/calendar/calendarmodel.dart';
import 'package:periodcare/helper/datemonth.dart';

class CycleWidget extends StatelessWidget {
  const CycleWidget({super.key, required this.dateRange, this.nextStart, required this.onTap});

  final DateRange dateRange;

  final DateTime? nextStart;

  final VoidCallback onTap;

  int calculateDays(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }


  int calculateCycle(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    if (dateRange.dateStart == null || dateRange.dateEnd == null) {
      return const SizedBox.shrink();
    }

    final start = dateRange.dateStart;
    final end = dateRange.dateEnd;
    int countCycle = 0;

    final dayDiff = calculateDays(start!, end!);

    bool haveCycle = (nextStart != null);

    if (haveCycle == true) {
      countCycle = calculateCycle(start, nextStart!);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: AppColors.onPrimary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.circle, size: 40, color: Color(0xffF2EDEA)),
              SvgPicture.asset(
                "assets/images/cyclecalendar.svg",
                height: 16,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${dateMonth(start)} - ${dateMonth(end)}',
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Durasi $dayDiff Hari",
                    style: AppTypography.bodySmall.copyWith(
                      fontSize: 8,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    haveCycle ? ", Panjang Siklus $countCycle Hari" : "",
                    style: AppTypography.bodySmall.copyWith(
                      fontSize: 8,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.circle, size: 40, color: Color(0xffF2EDEA)),
                SvgPicture.asset(
                  "assets/images/edit.svg",
                  height: 12,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    AppColors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// @Preview(name: 'Calendar View Widget')
// Widget calendarPreview() {
//   return MaterialApp(
//     home: Calendar(
//       highlightedRanges: [
//         DateRange(
//           dateStart: DateTime(2026, 11, 5),
//           dateEnd: DateTime(2026, 11, 7),
//         ),
//         DateRange(
//           dateStart: DateTime(2026, 11, 12),
//           dateEnd: DateTime(2026, 11, 15),
//         ),
//         DateRange(
//           dateStart: DateTime(2026, 11, 20),
//           dateEnd: DateTime(2026, 11, 25),
//         ),
//       ],
//     ),
//   );
// }
