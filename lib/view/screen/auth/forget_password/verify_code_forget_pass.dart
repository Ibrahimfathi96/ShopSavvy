import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/fp_verify_code_controller.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';
import 'package:shop_savvy/view/widget/auth/forget_password_texts.dart';
import 'package:shop_savvy/view/widget/auth/otp_text_field.dart';

class ForgetPasswordVerifyCode extends StatelessWidget {
  static const String routeName = '/verify-code-fp';

  const ForgetPasswordVerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordVerifyCodeControllerImp controller =
        Get.put(ForgetPasswordVerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("29".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              AppImageFromAssets.verifyCodeLogo,
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            ForgetPasswordTexts(
              text1: "30".tr,
              text2: "31".tr,
            ),
            const SizedBox(
              height: 20,
            ),
            OTPTextFields(
              onCompleted: (code){
                //otpCode = code
                controller.goToResetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}
