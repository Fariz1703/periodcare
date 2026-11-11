import 'package:flutter/material.dart';

class AppNavigatorBar extends StatelessWidget{

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavigatorBar({
      super.key,
      required this.selectedIndex,
      required this.onDestinationSelected,
    });


    @override
    Widget build(BuildContext context) {

      return NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,

      destinations: [
        
      ],

      );
    }
}