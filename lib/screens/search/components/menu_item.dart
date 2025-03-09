import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
      ),
      overlayColor: WidgetStateColor.transparent,
      iconColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primary;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primary;
          }
          return AppColors.onSurface.withValues(
            alpha: 0.5,
          );
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primary;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primary;
          }
          return AppColors.onSurface.withValues(
            alpha: 0.5,
          );
        },
      ),
    );
    return MenuItemButton(
      style: buttonStyle,
      onPressed: onTap,
      leadingIcon: icon,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
