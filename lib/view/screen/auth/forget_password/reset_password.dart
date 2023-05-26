import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/reset_password_controller.dart';
import 'package:shop_savvy/core/functions/valid_input.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form_field.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';

class ResetPassword extends StatelessWidget {
  static const String routeName = '/reset-password';

  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Reset Password"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const CustomAuthTitleText(
                text: "Create New Password",
              ),
              const CustomAuthBodyText(
                  text:
                      "Your New Password must be different from the previous used passwords."),
              const SizedBox(
                height: 20,
              ),
              CustomAuthTextFormField(
                validator: (val){
                 return validInput(val!, 8, 30, "password");
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Enter a new password",
                labelText: "New Password",
                iconData: Icons.lock_outline,
                controller: controller.newPassword,
              ),
              CustomAuthTextFormField(
                validator: (val){
                  return validInput(val!, 8, 30, "password");
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                hintText: "Re-Enter your Password",
                labelText: "Confirm Password",
                iconData: Icons.lock_outline,
                controller: controller.newPassword,
              ),
              CustomAuthButton(
                text: "Submit",
                onPressed: () {
                  controller.goToResetPasswordSuccessfully();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
