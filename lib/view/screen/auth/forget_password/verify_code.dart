import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';
import 'package:shop_savvy/view/widget/auth/forget_password_texts.dart';
import 'package:shop_savvy/view/widget/auth/otp_text_field.dart';

class VerifyCode extends StatelessWidget {
  static const String routeName = '/verify-code';

  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: const Text("Verification Code"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: ListView(
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
            const ForgetPasswordTexts(
              text1: "Check Verification Code",
              text2: "Please Enter The Digit Code Sent To \n your email.",
            ),
            const SizedBox(
              height: 20,
            ),
            const OTPTextFields(),
          ],
        ),
      ),
    );
  }
}
