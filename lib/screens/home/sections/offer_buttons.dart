import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/screens/home/components/buy_button.dart';
import 'package:real_estate/screens/home/components/rent_button.dart';

class OfferButtons extends StatelessWidget {
  const OfferButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: BuyButton(),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: RentButton(),
          ),
        ),
      ],
    );
  }
}
