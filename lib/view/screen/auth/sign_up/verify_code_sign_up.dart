import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_up_controller.dart';
import 'package:shop_savvy/controller/auth/sign_up_verify_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';
import 'package:shop_savvy/view/widget/auth/forget_password_texts.dart';
import 'package:shop_savvy/view/widget/auth/otp_text_field.dart';

class SignUpVerifyCode extends StatelessWidget {
  static const String routeName = '/verify-code-sign-up';

  const SignUpVerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpVerifyCodeControllerImp controller =
        Get.put(SignUpVerifyCodeControllerImp());
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
              height: 10,
            ),
            Text(
              controller.phone!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            OTPTextFields(
              onCompleted: (code) {
                debugPrint(code);
                controller.verifyOtp(code);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                    minimumSize: const Size(110, 50),
              ),
                onPressed: () {
                  SignUpControllerImp().verifyPhoneNumber(controller.phone!);
                },
                child: const Text("Re-send Code"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
