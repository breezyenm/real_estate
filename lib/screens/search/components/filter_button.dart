import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_icons.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    super.key,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton>
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
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.onSurface.withValues(
                alpha: 0.08,
              ),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: SizedBox(
          width: 52.w,
          height: 52.h,
          child: IconButton(
            onPressed: () {},
            icon: AppIcons.filter(
              size: 24,
              color: AppColors.onSurface,
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
              shape: const CircleBorder(),
              minimumSize: const Size(52, 52),
              maximumSize: const Size(52, 52),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
