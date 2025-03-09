import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color surfaceTint = Color(0xFFFAF5EC);
  static const Color onSurface = Color(0xFF232220);
  static const Color onSurfaceVariant = Color(0xFF2A2A2A);
  static const Color secondary = Color(0xFFA5957E);
  static const Color primary = Color(0xFFFB9E11);
  static const Color primaryContainer = Color(0xFFFEDCAA);
  static const Color error = Color(0xFFFB1111);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.secondary,
        error: AppColors.error,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        surface: AppColors.white,
        surfaceTint: AppColors.surfaceTint,
      ),
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: 'EuclidCircularA',
      textTheme: TextTheme(
        displayLarge:
            TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700), // Bold
        displayMedium:
            TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600), // Semibold
        displaySmall:
            TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500), // Medium
        headlineLarge:
            TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600), // Semibold
        headlineMedium:
            TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500), // Medium
        headlineSmall:
            TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500), // Medium
        titleLarge:
            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600), // Semibold
        titleMedium:
            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500), // Medium
        titleSmall:
            TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500), // Medium
        bodyLarge:
            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400), // Regular
        bodyMedium:
            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400), // Regular
        bodySmall:
            TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400), // Regular
        labelLarge:
            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600), // Semibold
        labelMedium:
            TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500), // Medium
        labelSmall:
            TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500), // Medium
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'EuclidCircularA',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600, // Semibold
          color: AppColors.onSurface,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.onSurface,
        labelStyle: TextStyle(
          fontFamily: 'EuclidCircularA',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600, // Semibold
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'EuclidCircularA',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500, // Medium
        ),
      ),
    );
  }
}
