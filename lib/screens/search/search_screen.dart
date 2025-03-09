import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_icons.dart';
import 'components/filter_button.dart';
import 'components/popup_button.dart';
import 'components/property_marker.dart';
import 'components/search_field.dart';
import 'components/variant_list_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Sample property markers
          Positioned(
            top: 240.sp,
            left: 80.sp,
            child: PropertyMarker(
              value: "10,3 mn ₽",
            ),
          ),
          Positioned(
            top: 300.sp,
            left: 100.sp,
            child: PropertyMarker(
              value: "11 mn ₽",
            ),
          ),
          Positioned(
            top: 320.sp,
            right: 80.sp,
            child: PropertyMarker(
              value: "7,8 mn ₽",
            ),
          ),
          Positioned(
            top: 440.sp,
            right: 80.sp,
            child: PropertyMarker(
              value: "8,5 mn ₽",
            ),
          ),
          Positioned(
            bottom: 360.sp,
            left: 40.sp,
            child: PropertyMarker(
              value: "13,3 mn ₽",
            ),
          ),
          Positioned(
            bottom: 260.sp,
            right: 120.sp,
            child: PropertyMarker(
              value: "6,95 mn ₽",
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  FilterButton()
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 56.h + 16.h + 8.h + 8.h,
                  left: 24.w,
                  right: 24.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedPopupButton(
                          icon: AppIcons.layer(
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        AnimatedPopupButton(
                          icon: AppIcons.send(
                            size: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: VariantListButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
