import 'package:flutter/material.dart';
import 'package:kpop_application/core/themes/themes.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}
