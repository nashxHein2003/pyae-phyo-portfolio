import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isToggled = true;

  void toggle() {
    isToggled = !isToggled;
    notifyListeners();
  }
}
