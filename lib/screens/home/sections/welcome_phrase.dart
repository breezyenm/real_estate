import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class WelcomePhrase extends StatefulWidget {
  const WelcomePhrase({
    super.key,
  });

  @override
  State<WelcomePhrase> createState() => _WelcomePhraseState();
}

class _WelcomePhraseState extends State<WelcomePhrase>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
    ));

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: Text(
            'Hi, Marina',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        ClipRect(
          child: SlideTransition(
            position: _slideAnimation,
            child: Text(
              'let\'s select your',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w400,
                    fontSize: 40.sp,
                  ),
            ),
          ),
        ),
        ClipRect(
          child: SlideTransition(
            position: _slideAnimation,
            child: Text(
              'perfect place',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w400,
                    fontSize: 40.sp,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
