import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light; // Default theme mode
  bool isDarkThemeEnabled = false; // Default to light theme

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkThemeEnabled = prefs.getBool('theme') ?? false;
    currentTheme = isDarkThemeEnabled ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners after loading the theme
  }

  void isDarkThemeEnabledCheck(bool value) async {
    isDarkThemeEnabled = value;
    currentTheme = value ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
