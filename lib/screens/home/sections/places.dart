import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_theme.dart';
import 'package:real_estate/screens/home/components/place_card.dart';

class PlacesSection extends StatefulWidget {
  const PlacesSection({
    super.key,
  });

  @override
  State<PlacesSection> createState() => _PlacesSectionState();
}

class _PlacesSectionState extends State<PlacesSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    Future.delayed(
        Duration(
          seconds: 3,
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
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return DraggableScrollableSheet(
          initialChildSize: _slideAnimation.value,
          minChildSize: _slideAnimation.value,
          maxChildSize: 1,
          builder: (context, scrollController) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(22.r),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(8.w),
                controller: scrollController,
                children: [
                  PlaceCard(
                    place: 'Gladkova St.',
                    value: '25',
                    image: 'place-1',
                    expanded: true,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 400.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: PlaceCard(
                            place: 'Gubina St.',
                            value: '11',
                            image: 'place-2',
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: PlaceCard(
                                  place: 'Trefoleva St.',
                                  value: '43',
                                  image: 'place-3',
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Expanded(
                                child: PlaceCard(
                                  place: 'Sedova St.',
                                  value: '22',
                                  image: 'place-4',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
