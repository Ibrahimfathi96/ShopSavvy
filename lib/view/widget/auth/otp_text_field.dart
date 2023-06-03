import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shop_savvy/core/constants/color.dart';

class OTPTextFields extends StatelessWidget {
  final void Function(String) onCompleted;

  const OTPTextFields({
    super.key, required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      autoFocus: true,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.black12,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.primaryColor,
        selectedFillColor: Colors.white,
        borderWidth: 1,
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.black12,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: onCompleted,
      onChanged: (value) {
        print(value);
      },
    );
  }
}
