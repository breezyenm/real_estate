import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';

import 'core/theme/app_icons.dart';
import 'screens/home/home_screen.dart';
import 'screens/search/search_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation>
    with SingleTickerProviderStateMixin {
  int currentIndex = 2;
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeIn,
    ));
    Future.delayed(
      Duration(
        seconds: 4,
        milliseconds: 300,
      ),
      () {
        _slideController.forward();
      },
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  Widget _buildScreen(int index) {
    return SizedBox.expand(
      key: ValueKey<int>(index),
      child: switch (index) {
        0 => const SearchScreen(),
        2 => const HomeScreen(),
        _ => Container(),
      },
    );
  }

  Widget _buildIcon(Widget icon, int index) {
    final isSelected = currentIndex == index;
    return InkWell(
      borderRadius: BorderRadius.circular(200),
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: SizedBox(
        width: 56.w,
        height: 56.h,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isSelected ? 56.w : 48.w,
            height: isSelected ? 56.h : 48.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primary : AppColors.onSurface,
            ),
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildScreen(currentIndex),
          ),
          SlideTransition(
              position: _slideAnimation,
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(200),
                  ),
                  padding: EdgeInsets.all(4.w),
                  margin: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildIcon(AppIcons.search(), 0),
                      SizedBox(width: 4.w),
                      _buildIcon(AppIcons.chat(), 1),
                      SizedBox(width: 4.w),
                      _buildIcon(AppIcons.home(), 2),
                      SizedBox(width: 4.w),
                      _buildIcon(AppIcons.favorite(), 3),
                      SizedBox(width: 4.w),
                      _buildIcon(AppIcons.profile(), 4),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
