import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class HomeCashBackWidget extends GetView<HomeControllerImp> {
  final String homeBannerTitle;
  final String homeBannerOffer;
  final String lottieFile;
  const HomeCashBackWidget({
    super.key, required this.homeBannerTitle, required this.homeBannerOffer, required this.lottieFile,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkColor,width: 2),
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            title: Text(
              homeBannerTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              homeBannerOffer,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -45,
          // right: controller.lang == "en"?-45:null,
          child: Container(
            height: 170,
            width: 160,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.darkColor,width: 2),
              color: const Color(0xFFbdc3c7),
              borderRadius: BorderRadius.circular(140),
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 18),
              child: LottieBuilder.asset(
                lottieFile,width: 100,height: 100,
              ),
            ),
          ),
        )
      ],
    );
  }
}
