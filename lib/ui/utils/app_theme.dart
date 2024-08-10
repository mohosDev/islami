import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_colors.dart';
import 'package:project/ui/utils/app_style.dart';

abstract class AppTheme {
  static ThemeData appThemeLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        headlineSmall: AppStyle.headerSmallLight,
        headlineMedium: AppStyle.headerMediumLight,
        headlineLarge: AppStyle.headerLargeLight,
        bodySmall: AppStyle.bodySmallLight,
        bodyMedium: AppStyle.bodyMediumLight,
        bodyLarge: AppStyle.bodyLargeLight,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight, // Custom tertiary color
      ),
      appBarTheme: appBarThemeLight,
      scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryLight,
        selectedItemColor: AppColors.accentLight,
        unselectedItemColor: AppColors.primaryDark,
      ));

  static ThemeData appThemeDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        headlineSmall: AppStyle.headerSmallDark,
        headlineMedium: AppStyle.headerMediumDark,
        headlineLarge: AppStyle.headerLargeDark,
        bodySmall: AppStyle.bodySmallDark,
        bodyMedium: AppStyle.bodyMediumDark,
        bodyLarge: AppStyle.bodyLargeDark,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentDark, // Custom tertiary color
      ),
      appBarTheme: appBarThemeDark,
      scaffoldBackgroundColor: AppColors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDark,
        selectedItemColor: AppColors.accentDark,
        unselectedItemColor: AppColors.white,
      ));
}

AppBarTheme get appBarThemeLight => const AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    );
AppBarTheme get appBarThemeDark => const AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    );
