import 'package:flutter/material.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/shared/component/app_button.dart';

void editCycleBottomSheet({required BuildContext context}) {
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
                      "Ubah Rentang Haid",
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
            SizedBox(height: 20),
            Text("Tanggal Mulai Haid", style: AppTypography.bodySmall),
            SizedBox(height: 2,),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "17 Maret 2026",
                        style: AppTypography.heading3.copyWith(fontSize: 14),
                      ),
                      Spacer(),
                      Icon(
                        Icons.calendar_month,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Text("Tanggal Selesai Haid", style: AppTypography.bodySmall),
            SizedBox(height: 2,),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "18 Maret 2026",
                        style: AppTypography.heading3.copyWith(fontSize: 14),
                      ),
                      Spacer(),
                      Icon(
                        Icons.event_available_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            AppButton(buttonText: "Konfirmasi", func: () {}),
          ],
        ),
      );
    },
  );
}
