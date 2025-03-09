import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';
import 'package:real_estate/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'Real Estate',
        theme: AppTheme.lightTheme,
        home: const MainNavigation(),
      ),
    );
  }
}
