import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/verify_code_controller.dart';

class OTPTextFields extends StatelessWidget {
  const OTPTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return OtpTextField(
      fieldWidth: 50,
      borderRadius: BorderRadius.circular(20),
      numberOfFields: 5,
      borderColor: const Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      onSubmit: (String verificationCode) {
        controller.goToResetPassword();
      }, // end onSubmit
    );
  }
}
