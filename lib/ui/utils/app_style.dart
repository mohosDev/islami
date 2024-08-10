import 'package:flutter/material.dart';
import 'package:project/ui/utils/app_colors.dart';

abstract class AppStyle {
  // Light
  //Header
  static const TextStyle headerSmallLight = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );
  static const TextStyle headerMediumLight = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );
  static const TextStyle headerLargeLight = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );
  // Body
  static const TextStyle bodySmallLight = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
  static const TextStyle bodyMediumLight = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
  static const TextStyle bodyLargeLight = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
  // Dark
  // Header
  static const TextStyle headerSmallDark = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle headerMediumDark = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle headerLargeDark = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  // Body
  static const TextStyle bodySmallDark = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static const TextStyle bodyMediumDark = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static const TextStyle bodyLargeDark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
