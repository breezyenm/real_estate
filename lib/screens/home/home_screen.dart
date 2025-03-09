import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/theme/app_gradient.dart';

import 'components/location_card.dart';
import 'components/user_avatar.dart';
import 'sections/offer_buttons.dart';
import 'sections/places.dart';
import 'sections/welcome_phrase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradient(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationCard(),
                  UserAvatar(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: Column(
                          children: [
                            WelcomePhrase(),
                            SizedBox(
                              height: 32.h,
                            ),
                            Expanded(
                              child: OfferButtons(),
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                PlacesSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
