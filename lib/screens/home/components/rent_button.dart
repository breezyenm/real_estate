import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class RentButton extends StatefulWidget {
  const RentButton({
    super.key,
  });

  @override
  State<RentButton> createState() => _RentButtonState();
}

class _RentButtonState extends State<RentButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 2212).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _animation.addListener(() {
      setState(() {});
    });

    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      _controller.forward();
    });
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    'Rent',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.secondary,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              '${_animation.value.toInt()}',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.secondary,
                    fontSize: 40.sp,
                  ),
            ),
            Text(
              'offers',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.secondary,
                  ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
