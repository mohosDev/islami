import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData appThemeLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.accentColorLight,
    ),
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: AppColors.transparent,
  );

  static ThemeData appThemeDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.white,
    ),
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: AppColors.transparent,
  );
}

AppBarTheme get appBarTheme => const AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      centerTitle: true,
    );
