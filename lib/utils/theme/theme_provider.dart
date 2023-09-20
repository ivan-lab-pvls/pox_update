import 'package:flutter/material.dart';
import 'package:pockex/utils/theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark;

  ThemeProvider(this.isDark);

  getTheme() => isDark ? darkTheme : lightTheme;

  setTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
