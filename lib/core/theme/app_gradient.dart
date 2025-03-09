import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppGradient extends LinearGradient {
  const AppGradient({
    super.colors = const [
      AppColors.white,
      AppColors.primaryContainer,
    ],
    super.begin = Alignment.topLeft,
    super.end = Alignment.bottomRight,
  }) : super();
}
