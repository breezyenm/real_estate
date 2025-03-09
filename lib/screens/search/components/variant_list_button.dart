import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_icons.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class VariantListButton extends StatefulWidget {
  const VariantListButton({
    super.key,
  });

  @override
  State<VariantListButton> createState() => _VariantListButtonState();
}

class _VariantListButtonState extends State<VariantListButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    Future.delayed(
      const Duration(milliseconds: 100),
      () => _controller.forward(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: TextButton.icon(
          onPressed: () {
            // Do something
          },
          icon: AppIcons.list(
            size: 18.sp,
          ),
          label: Text(
            'List of variants',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.white,
            iconColor: AppColors.white,
            backgroundColor: AppColors.white.withValues(
              alpha: 0.5,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
          ),
        ),
      ),
    );
  }
}
