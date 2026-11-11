import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'package:periodcare/core/theme/app_text_style.dart';
import 'package:periodcare/feature/calendar/calendarview.dart';
import 'package:periodcare/feature/home/homeview.dart';
import 'package:periodcare/feature/statistic/statisticview.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  final PageController pageController = PageController();

  final List<Widget> pages = [HomeView(), CalendarView(), Statisticview()];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<String> pagesstr = ["Beranda", "Kalendar", "Statistik"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset("assets/images/logo.svg", height: 14),
              ],
            ),
            SizedBox(width: 8),
            Text(
              "Period",
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              "Care",
              style: AppTypography.bodyLarge.copyWith(
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.onPrimary,
        indicatorColor: Colors.transparent,
        elevation: 8,
        shadowColor: Colors.black.withAlpha(50),

        selectedIndex: selectedIndex,

        animationDuration: const Duration(milliseconds: 500),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            );
          }

          return const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          );
        }),

        onDestinationSelected: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        },

        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/images/blood.svg",
              height: 16,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            selectedIcon: SvgPicture.asset(
              "assets/images/blood.svg",
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Beranda',
          ),

          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/images/calendar.svg",
              height: 16,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            selectedIcon: SvgPicture.asset(
              "assets/images/calendar.svg",
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Kalendar',
          ),

          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/images/statistic.svg",
              height: 16,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            selectedIcon: SvgPicture.asset(
              "assets/images/statistic.svg",
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            label: 'Statistik',
          ),
        ],
      ),
    );
  }
}
