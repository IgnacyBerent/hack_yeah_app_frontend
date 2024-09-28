import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/styles/color_styles.dart';

class ThemeNotifier extends ChangeNotifier {
  Map<String, Color> _currentTheme = darkTheme;

  Map<String, Color> get currentTheme => _currentTheme;

  void changeTheme(String theme) {
    if (theme == 'Dark') {
      _currentTheme = darkTheme;
    } else if (theme == 'Light') {
      _currentTheme = lightTheme;
    } else if (theme == 'Contrast') {
      _currentTheme = contrastTheme;
    }
    notifyListeners();
  }
}
