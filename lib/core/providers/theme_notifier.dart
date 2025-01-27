import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/enums/app_themes_enum.dart';

final class ThemeNotifier extends ChangeNotifier {
  AppThemesEnum _currentTheme = AppThemesEnum.main;
  ThemeMode _themeMode = ThemeMode.system;

  AppThemesEnum get currentTheme => _currentTheme;
  ThemeMode get themeMode => _themeMode;

  void setTheme(AppThemesEnum theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void updateSystemThemeMode() {
    if (_themeMode == ThemeMode.system) {
      notifyListeners();
    }
  }
}
