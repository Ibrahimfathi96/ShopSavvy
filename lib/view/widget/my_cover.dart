import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/generated/assets.dart';

class MyCover extends StatelessWidget {
  const MyCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 4,
      width: Get.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesCover,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
