import 'package:flutter/material.dart';
// import 'package:flutter/widget_previews.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/feature/home/component/feeling_card.dart';
import 'package:periodcare/feature/home/homeviewmodel.dart';
import 'package:periodcare/shared/component/dashedcircle.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Consumer<HomeViewModel>(
        builder: (context, vm, child) {
          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                right: 16,
                                bottom: 4,
                              ),
                              child: Icon(
                                Icons.info_outline,
                                size: 16,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 4,
                                left: 24,
                                right: 24,
                                bottom: 8,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99),
                                color: Color(0xFFF2EDEA),
                              ),
                              child: Text(
                                vm.phase,
                                style: AppTypography.bodyLarge,
                                // AppTextStyles.bodyLarge.copyWith(
                                //   color: AppColors.primary,
                                // ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            DashedCircle(
                              size: 130,
                              color: AppColors.primary,
                              strokeWidth: 2,
                              dashLength: 6,
                              gapLength: 4,
                            ),
                            Container(
                              decoration: inset.BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary.withAlpha(120),
                                boxShadow: [
                                  inset.BoxShadow(
                                    color: Colors.black.withAlpha(75),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: const Offset(3, 3),
                                    inset: true,
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  vm.dayCounter.toString(),
                                  style: AppTypography.displayLarge.copyWith(
                                    fontSize: 60,
                                  ),
                                  // AppTextStyles.displayLarge.copyWith(
                                  //   color: AppColors.onSecondary,
                                  //   fontWeight: FontWeight.normal,
                                  // ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Hari",
                                      style: AppTypography.bodySmall.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary,
                                      ),
                                      // AppTextStyles.bodySmall
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Container(
                          margin: EdgeInsets.only(
                            top: 8,
                            right: 24,
                            left: 24,
                            bottom: 4,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF8a2846),
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                vm.buttonText,
                                style:
                                    //  AppTextStyles.bodySmall.copyWith(
                                    //   color: AppColors.surface,
                                    //   fontWeight: FontWeight.w600,
                                    // ),
                                    AppTypography.bodySmall.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Batalkan",
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.onSecondary,
                                fontSize: 10,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Apa Perasaanmu Hari Ini?",
                        style:
                            //  AppTextStyles.bodySmall.copyWith(
                            //   color: AppColors.onSecondary,
                            // ),
                            AppTypography.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: vm.feelings.map((feeling) {
                      return FeelingCard(
                        title: feeling['title']!,
                        image: feeling['image']!,
                        isSelected: vm.isSelected(feeling['title']!),
                        onTap: () {
                          vm.toggleFeeling(feeling['title']!);
                        },
                      );
                    }).toList(),
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

// @Preview(name: 'Home View')
// Widget homeViewPreview() {
//   return const MaterialApp(home: HomeView());
// }
