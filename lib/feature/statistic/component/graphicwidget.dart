import 'package:flutter/material.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/feature/statistic/component/CycleChartPainter.dart';
import 'package:periodcare/helper/datemonth.dart';

class GraphicWidget extends StatelessWidget {
  const GraphicWidget({super.key, required this.data});

  final List<Map<String, dynamic>> data;

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
                      radius: 0.5,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grafik Historis",
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    "Tren 6 Siklus Terakhir",
                    style: AppTypography.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 120,
            width: double.infinity,
            child: CustomPaint(
              painter: CycleChartPainter(
                cycleDuration: data
                    .map((e) => e['panjangSiklus'] as int)
                    .toList(),
                periodDuration: data
                    .map((e) => e['durasiHaid'] as int)
                    .toList(),
                dateStart: data
                    .map((e) => e['tanggalMulai'] as DateTime)
                    .toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(data.length, (index) {
                return Column(
                  children: [
                    Text(
                      dateMonth(data[index]["tanggalMulai"]),
                      style: AppTypography.bodySmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          data[index]["panjangSiklus"].toString(),
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " hr",
                          style: AppTypography.bodySmall.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          data[index]["durasiHaid"].toString(),
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " hr",
                          style: AppTypography.bodySmall.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: AppColors.surfaceContainer,
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
                      style: AppTypography.bodySmall.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, size: 16, color: AppColors.secondary),
                    SizedBox(width: 2),
                    Text(
                      "Siklus Haid",
                      style: AppTypography.bodySmall.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.show_chart, size: 16, color: AppColors.primary),
                    SizedBox(width: 2),
                    Text(
                      "Tren Siklus",
                      style: AppTypography.bodySmall.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
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
