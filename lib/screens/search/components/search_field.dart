import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_icons.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField>
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
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          prefixIcon: AppIcons.searchOutlined(
            size: 24.sp,
            color: AppColors.onSurface,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 24.sp + 24.sp,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.secondary,
              ),
          fillColor: AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 20.w,
          ),
        ),
      ),
    );
  }
}
