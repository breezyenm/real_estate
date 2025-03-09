import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class BuyButton extends StatefulWidget {
  const BuyButton({
    super.key,
  });

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton>
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
    _animation = Tween<double>(begin: 0, end: 1034).animate(
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
          color: AppColors.primary,
          shape: BoxShape.circle,
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
                    'Buy',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              '${_animation.value.toInt()}',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: 40.sp,
                  ),
            ),
            Text(
              'offers',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.white,
                  ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
