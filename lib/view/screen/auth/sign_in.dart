import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_in_controller.dart';
import 'package:shop_savvy/core/functions/exit_app_alert.dart';
import 'package:shop_savvy/core/functions/valid_input.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_forget_password.dart';
import 'package:shop_savvy/view/widget/auth/auth_logo.dart';
import 'package:shop_savvy/view/widget/auth/auth_nav_button.dart';
import 'package:shop_savvy/view/widget/auth/auth_or_widget.dart';
import 'package:shop_savvy/view/widget/auth/auth_socials.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form_field.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';

class SignIn extends StatelessWidget {
  static const String routeName = "/sign-in";

  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "12".tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: WillPopScope(
        onWillPop: exitAppAlert,
        child: GetBuilder<SignInControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
            child: Form(
              key: controller.formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const AuthLogo(),
                  const SizedBox(
                    height: 6,
                  ),
                  CustomAuthTitleText(
                    text: "13".tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomAuthBodyText(
                    text: "14".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAuthTextFormField(
                    validator: (val) {
                      return validInput(val!, 5, 30, "email");
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    hintText: "15".tr,
                    labelText: "16".tr,
                    iconData: Icons.email_outlined,
                  ),
                  GetBuilder<SignInControllerImp>(
                    builder: (controller) => CustomAuthTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      onPressed: () {
                        controller.showPassword();
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.passwordController,
                      obscureText: controller.isVisible,
                      hintText: "17".tr,
                      labelText: "18".tr,
                      iconData: controller.isVisible?Icons.visibility_off:Icons.visibility,
                    ),
                  ),
                  const AuthForgetPassword(),
                  CustomAuthButton(
                    onPressed: () {
                      controller.singIn();
                    },
                    text: "12".tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthNavButton(
                    onTap: () {
                      controller.goToSignUP();
                    },
                    text1: "20".tr,
                    text2: "21".tr,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const CustomAuthORWidget(),
                  AuthSocialsWidget(
                    facebookOnPressed: () {},
                    googleOnPressed: () {},
                    twitterOnPressed: () {},
                    githubOnPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        )


      ),
    );
  }
}
