import 'package:flutter/material.dart';
import 'package:it_health_example/src/core/settings/app_colors.dart';

class AppTheme {
  /// single tone pattern
  static final AppTheme _instance = AppTheme._internal();
  factory AppTheme() => _instance;
  AppTheme._internal();

  static final AppTheme instance = AppTheme();

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}