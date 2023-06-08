import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_up_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/functions/exit_app_alert.dart';
import 'package:shop_savvy/core/functions/valid_input.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_nav_button.dart';
import 'package:shop_savvy/view/widget/auth/auth_or_widget.dart';
import 'package:shop_savvy/view/widget/auth/auth_socials.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form_field.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';

class SignUp extends StatelessWidget {
  static const String routeName = "/sign-up";

  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "21".tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: WillPopScope(
        onWillPop: exitAppAlert,
        child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingRequests(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 16),
                    child: Form(
                      key: controller.formKey,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomAuthTitleText(
                            text: "13".tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomAuthBodyText(
                            text: "23".tr,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomAuthTextFormField(
                            validator: (val) {
                              return validInput(val!, 5, 30, "username");
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: controller.fullNameController,
                            hintText: "24".tr,
                            labelText: "25".tr,
                            iconData: Icons.person_outline,
                          ),
                          CustomAuthTextFormField(
                            validator: (val) {
                              return validInput(val!, 11, 13, "phone");
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            controller: controller.phoneController,
                            hintText: "26".tr,
                            labelText: "27".tr,
                            iconData: Icons.phone_android_outlined,
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
                          CustomAuthTextFormField(
                            validator: (val) {
                              return validInput(val!, 8, 30, "password");
                            },
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.passwordController,
                            onPressed: () {
                              controller.showPassword();
                            },
                            obscureText: controller.isVisible,
                            hintText: "17".tr,
                            labelText: "18".tr,
                            iconData: controller.isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          CustomAuthButton(
                            onPressed: () async {
                              controller.singUp();
                            },
                            text: "21".tr,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthNavButton(
                            onTap: () {
                              controller.goToSignIn();
                            },
                            text1: "28".tr,
                            text2: "12".tr,
                          ),
                          const SizedBox(
                            height: 20,
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
                )),
      ),
    );
  }
}
