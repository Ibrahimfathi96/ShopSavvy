import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/forget_password_controller.dart';
import 'package:shop_savvy/view/widget/auth/auth_nav_button.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';
import 'package:shop_savvy/view/widget/auth/forget_password_icon.dart';
import 'package:shop_savvy/view/widget/auth/forget_password_texts.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = '/forget-password';

  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Forgotten Password"),
        leading: IconButton(
          onPressed: () {
            controller.goBackToSignIn();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: ListView(
          children: [
            const ForgetPasswordLockIcon(),
            const ForgetPasswordTexts(
              text1: "Forgot Your Password?",
              text2: "Please Enter your email address below to receive a verification code.",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomAuthTextFormField(
              hintText: "Enter your email",
              labelText: "Email",
              iconData: Icons.email_outlined,
              controller: controller.emailController,
            ),
            CustomAuthButton(
              text: "Check Email",
              onPressed: () {
                controller.goToVerifyCode();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AuthNavButton(
              text1: "Remember your email? ",
              text2: "Sign In",
              onTap: () {
                controller.goBackToSignIn();
              },
            )
          ],
        ),
      ),
    );
  }
}


