import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_icons.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class PropertyMarker extends StatefulWidget {
  final String value;
  const PropertyMarker({
    super.key,
    required this.value,
  });

  @override
  State<PropertyMarker> createState() => _PropertyMarkerState();
}

class _PropertyMarkerState extends State<PropertyMarker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  bool showIcon = false;

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

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showIcon = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      alignment: Alignment.bottomLeft,
      child: AnimatedContainer(
        height: 48.h,
        width: showIcon ? 48.h : (widget.value.length * 10.0 + 16).w,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
        ),
        alignment: Alignment.center,
        child: showIcon
            ? AppIcons.building(
                size: 24,
                color: AppColors.white,
              )
            : Text(
                widget.value,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
