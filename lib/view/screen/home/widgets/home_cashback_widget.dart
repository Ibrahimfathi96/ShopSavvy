import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';

class HomeCashBackWidget extends StatelessWidget {
  const HomeCashBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const ListTile(
            title: Text(
              "A Summer Surprise",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "Cashback 20%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -35,
          child: Container(
            height: 170,
            width: 160,
            decoration: BoxDecoration(
              color: const Color(0xFFbdc3c7),
              borderRadius: BorderRadius.circular(140),
            ),
            child: LottieBuilder.asset(
              AppImageFromAssets.cashBack,
              width: 500,
              height: 500,
            ),
          ),
        )
      ],
    );
  }
}
