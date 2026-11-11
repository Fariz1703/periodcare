import 'package:flutter/material.dart';
import 'package:periodcare/mainview.dart';

class PeriodCareApp extends StatelessWidget {
  const PeriodCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeriodCare',
      debugShowCheckedModeBanner: false,

      // home: const HomeView(),
      home:  MainView(),
    );
  }
}
