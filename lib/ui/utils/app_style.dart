import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyle {
  static const TextStyle appBarStyleLight = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.accentColorLight);
  static const TextStyle titlesTextStyleLight = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.accentColorLight);
}
