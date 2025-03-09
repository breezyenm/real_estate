import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_icons.dart';
import 'package:real_estate/core/theme/app_theme.dart';

import 'menu_item.dart';

class AnimatedPopupButton extends StatefulWidget {
  final Widget icon;

  const AnimatedPopupButton({
    super.key,
    required this.icon,
  });

  @override
  State<AnimatedPopupButton> createState() => AnimatedPopupButtonState();
}

class AnimatedPopupButtonState extends State<AnimatedPopupButton>
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
    return MenuAnchor(
      alignmentOffset: const Offset(0, 4),
      consumeOutsideTap: true,
      menuChildren: [
        MenuItem(
          icon: AppIcons.shield(
            size: 24.sp,
            color: AppColors.onSurface.withValues(
              alpha: 0.5,
            ),
          ),
          label: 'Cosy areas',
          onTap: () {},
        ),
        MenuItem(
          icon: AppIcons.wallet(
            size: 24.sp,
            color: AppColors.onSurface.withValues(
              alpha: 0.5,
            ),
          ),
          label: 'Price',
          onTap: () {},
        ),
        MenuItem(
          icon: AppIcons.cart(
            size: 24.sp,
            color: AppColors.onSurface.withValues(
              alpha: 0.5,
            ),
          ),
          label: 'Infrastructure',
          onTap: () {},
        ),
        MenuItem(
          icon: AppIcons.layer(
            size: 24.sp,
            color: AppColors.onSurface.withValues(
              alpha: 0.5,
            ),
          ),
          label: 'Without any layer',
          onTap: () {},
        ),
      ],
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.surfaceTint),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 8.h,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        alignment: AlignmentDirectional.bottomStart,
        surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        shadowColor: WidgetStatePropertyAll(Colors.black26),
        elevation: WidgetStatePropertyAll(12.sp),
      ),
      builder: (context, controller, child) {
        return ScaleTransition(
          scale: _scaleAnimation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: IconButton(
                onPressed: () {
                  controller.isOpen ? controller.close() : controller.open();
                },
                icon: widget.icon,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.white.withValues(
                    alpha: 0.5,
                  ),
                  minimumSize: const Size(48, 48),
                  maximumSize: const Size(48, 48),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
