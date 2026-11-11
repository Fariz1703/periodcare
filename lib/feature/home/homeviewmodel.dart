import 'package:flutter/material.dart';


class HomeViewModel extends ChangeNotifier {

  String phase = 'Fase Menstruasi';
  int dayCounter = 0;
  String buttonText = "Catat : Haid Dimulai Hari ini";
  List<String> selectedFeelings=[];
  

  final List<Map<String, String>> feelings = const [
    {"title": "Kram Perut", "image": "assets/images/sick.svg"},
    {"title": "Mudah Lelah", "image": "assets/images/battery.svg"},
    {"title": "Mual", "image": "assets/images/mual.svg"},
    {"title": "Sakit Kepala", "image": "assets/images/mood.svg"},
    {"title": "Mengantuk", "image": "assets/images/night.svg"},
    {"title": "Perut Gembung", "image": "assets/images/swollen.svg"},
    {"title": "Lelah", "image": "assets/images/energy.svg"},
  ];

    void toggleFeeling(String title) {
    if (selectedFeelings.contains(title)) {
      selectedFeelings.remove(title);
    } else {
      selectedFeelings.add(title);
    }

    notifyListeners();
  }

  bool isSelected(String title) {
    return selectedFeelings.contains(title);
  }

  void changePhase(String newPhase) {
    phase = newPhase;

    notifyListeners();
  }

  void changeButtonText(String newButtonText) {
    phase = newButtonText;

    notifyListeners();
  }

  
}