import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/location_widgets/location_bottom_sheet.dart';

class AddLocationFAButton extends StatelessWidget {
  const AddLocationFAButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: AppColors.primaryDark,
      ),
      onPressed: () {
        Get.bottomSheet(AddLocationBottomSheet());
      },
      child: Text(
        "Continue",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
