import 'package:flutter/material.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/feature/calendar/component/bottom_sheet_edit.dart';
import 'package:periodcare/shared/component/app_button.dart';

void showCycleBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 32,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withAlpha(200),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Journal',
                      style: AppTypography.badge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Rekaman Haid: 15 April 2026",
                      style: AppTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.surfaceContainerHigh,
                      ),
                      Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.textSecondary.withAlpha(200),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 4),
                      Text("Tanggal Mulai", style: AppTypography.bodySmall),
                      Spacer(),
                      Text(
                        "17 Maret 2026",
                        style: AppTypography.heading3.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.surfaceContainerHigh,
                    thickness: 2,
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.stop_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 4),
                      Text("Tanggal Selesai", style: AppTypography.bodySmall),
                      Spacer(),
                      Text(
                        "18 Maret 2026",
                        style: AppTypography.heading3.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.surfaceContainerHigh,
                    thickness: 2,
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 4),
                      Text("Durasi Haid", style: AppTypography.bodySmall),
                      Spacer(),
                      Text(
                        "4 Hari",
                        style: AppTypography.heading3.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            AppButton(
              buttonText: "Edit Tanggal",
              func: () {
                Navigator.pop(context);
                editCycleBottomSheet(context: context);
              },
            ),
          ],
        ),
      );
    },
  );
}
