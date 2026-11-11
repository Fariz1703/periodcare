import 'package:flutter/material.dart';
// import 'package:periodcare/feature/calendar/calendarmodel.dart';

class Statisticviewmodel extends ChangeNotifier {
  Statisticviewmodel();

  final List<Map<String, dynamic>> feelings = const [
    {"title": "Kram Perut", "image": "sick.svg" ,"count":1},
    {"title": "Mudah Lelah", "image": "battery.svg","count":1},
    {"title": "Mual", "image": "mual.svg","count":1},
    {"title": "Sakit Kepala", "image": "mood.svg","count":1},
    {"title": "Mengantuk", "image": "night.svg","count":1},
    {"title": "Perut Gembung", "image": "swollen.svg","count":1},
    {"title": "Lelah", "image": "energy.svg","count":1},
  ];
}
