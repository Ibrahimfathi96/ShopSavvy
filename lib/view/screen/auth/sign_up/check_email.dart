import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/check_email_controller.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';
import 'package:shop_savvy/view/widget/auth/forget_password_texts.dart';

class CheckEmail extends StatelessWidget {
  static const String routeName = '/check-email';

  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("Check Email Address"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: ListView(
          children: [
            const SizedBox(height: 60,),
            const ForgetPasswordTexts(
              text1: "Account Created Successfully",
              text2: "Please Enter your email address to receive a verification code.",
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
          ],
        ),
      ),
    );
  }
}


