import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';

class PlaceCard extends StatelessWidget {
  final String place;
  final String value;
  final bool expanded;
  final String image;
  const PlaceCard({
    super.key,
    required this.place,
    required this.value,
    this.expanded = false,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/places/$image.png',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18.r),
        color: AppColors.primaryContainer,
      ),
      alignment: Alignment.bottomCenter,
      child: _Slider(
        expanded: expanded,
        place: place,
        value: value,
      ),
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({
    required this.expanded,
    required this.place,
    required this.value,
  });

  final bool expanded;
  final String place;
  final String value;

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  bool open = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
        milliseconds: 200,
      ),
      () {
        if (mounted) {
          setState(() {
            open = true;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.expanded ? 48.h : 40.h,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Stack(
          alignment: Alignment.centerRight,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 600,
                    ),
                    curve: Curves.easeIn,
                    padding: EdgeInsets.only(
                      left: 8.w,
                      right: widget.expanded ? 12.w : 40.w,
                    ),
                    height: widget.expanded ? 48.h : 40.h,
                    width: open ? width : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: AppColors.surfaceTint.withValues(
                        alpha: 0.7,
                      ),
                    ),
                    child: !open
                        ? null
                        : ClipRect(
                            child: OverflowBox(
                              maxWidth: width,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: widget.expanded
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      widget.place,
                                      style: TextStyle(
                                        color: AppColors.onSurface,
                                        fontSize:
                                            widget.expanded ? 14.sp : 12.sp,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    ', ${widget.value}',
                                    style: TextStyle(
                                      color: AppColors.onSurface,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeIn,
              right: open ? 0 : width - 16.w - 8.w,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  width: widget.expanded ? 40.w : 32.w,
                  height: widget.expanded ? 40.w : 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: widget.expanded
                        ? [
                            BoxShadow(
                              color: AppColors.onSurface.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 16,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                    style: IconButton.styleFrom(
                      alignment: Alignment.center,
                      maximumSize: const Size(20, 20),
                      minimumSize: const Size(20, 20),
                      iconSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
