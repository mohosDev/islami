import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String locale = 'en'; // Default locale

  LanguageProvider() {
    _loadLocaleFromPrefs();
  }

  Future<void> _loadLocaleFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    locale = prefs.getString('language') ??
        'en'; // Load the saved locale, default to 'en'
    notifyListeners(); // Notify listeners after loading the locale
  }

  void changeLocale(String? value) async {
    locale = value ?? locale;
    notifyListeners();
  }
}
