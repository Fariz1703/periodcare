import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';

class CycleAverage extends StatelessWidget {
  const CycleAverage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.onPrimary,
                            gradient: const RadialGradient(
                      center: Alignment.topRight,
                      radius: 1.2,
                      colors: [Color(0xFFFFE8EA), Color(0xFFFFFFFF)],
                    ),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/statistic.svg",
                    height: 24,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Rata-Rata\nPola Siklus",
                    style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold,color: AppColors.textPrimary,),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "6 Bulan Terakhir",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              CycleAverageSurfaceContainer(title: "Panjang Siklus",imgPath: "assets/images/cycle.svg",totalDay: 28,),
              SizedBox(width: 16),
              CycleAverageSurfaceContainer(title: "Durasi Haid",imgPath: "assets/images/blood.svg",totalDay: 5,),
            ],
          ),
        ],
      ),
    );
  }
}

class CycleAverageSurfaceContainer extends StatelessWidget {
  const CycleAverageSurfaceContainer({
    super.key, required this.title, required this.imgPath, required this.totalDay,
  });

  final String title;
  final String imgPath;
  final int totalDay;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.surfaceContainer,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppTypography.bodySmall.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary
                  ),
                ),
                Spacer(),
                SvgPicture.asset(
                  imgPath,
                  height: 12,
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(totalDay.toString(),style: AppTypography.displayLarge.copyWith(color: AppColors.primary),),
                SizedBox(width: 4,),
                Text("Hari",style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold,color: AppColors.textPrimary))
              ],
            )
            
          ],
        ),
      ),
    );
  }
}
