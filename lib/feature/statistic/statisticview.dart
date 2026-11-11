import 'package:flutter/material.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/feature/statistic/component/graphicwidget.dart';
import 'package:periodcare/feature/statistic/component/patternwidget.dart';
import 'package:periodcare/feature/statistic/statisticviewmodel.dart';
import 'package:periodcare/feature/statistic/component/cycleaverage.dart';
import 'package:provider/provider.dart';

class Statisticview extends StatelessWidget {
  Statisticview({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'durasiHaid': 8,
      'panjangSiklus': 25,
      'tanggalMulai': DateTime(2026, 11, 10),
    },
    {
      'durasiHaid': 5,
      'panjangSiklus': 28,
      'tanggalMulai': DateTime(2026, 12, 5),
    },
    {
      'durasiHaid': 6,
      'panjangSiklus': 24,
      'tanggalMulai': DateTime(2027, 1, 2),
    },
    {
      'durasiHaid': 7,
      'panjangSiklus': 26,
      'tanggalMulai': DateTime(2027, 1, 26),
    },
    {
      'durasiHaid': 4,
      'panjangSiklus': 27,
      'tanggalMulai': DateTime(2027, 2, 21),
    },
    {
      'durasiHaid': 9,
      'panjangSiklus': 29,
      'tanggalMulai': DateTime(2027, 3, 20),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Consumer<Statisticviewmodel>(
        builder: (context, vm, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CycleAverage(),
                  SizedBox(height: 24),
                  GraphicWidget(data: data),
                  SizedBox(height: 24),
                    PatternWidget(
                      data:vm.feelings
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

