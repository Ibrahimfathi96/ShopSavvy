import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_up_controller.dart';
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
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              const CustomAuthTitleText(
                text: "Welcome Back",
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomAuthBodyText(
                text:
                "Sign Up with your Email & Password Or Continue With Social Media.",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomAuthTextFormField(
                validator: (val){
                  return validInput(val!, 5, 30, "username");
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: controller.fullNameController,
                hintText: "Enter Your FullName",
                labelText: "FullName",
                iconData: Icons.person_outline,
              ),
              CustomAuthTextFormField(
                validator: (val){
                  return validInput(val!, 11, 13, "phone");
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: controller.phoneController,
                hintText: "Enter Your Phone",
                labelText: "Phone",
                iconData: Icons.phone_android_outlined,
              ),
              CustomAuthTextFormField(
                validator: (val){
                  return validInput(val!, 5, 30, "email");
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                hintText: "Enter Your Email",
                labelText: "Email",
                iconData: Icons.email_outlined,
              ),
              CustomAuthTextFormField(
                validator: (val){
                  return validInput(val!, 8, 30, "password");
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordController,
                obscureText: true,
                hintText: "Enter Your Password",
                labelText: "Password",
                iconData: Icons.lock_outline,
              ),
              CustomAuthButton(
                onPressed: () {
                  controller.singUp();
                },
                text: "Sign Up",
              ),
              const SizedBox(
                height: 10,
              ),
              AuthNavButton(
                onTap: () {
                  controller.goToSignIn();
                },
                text1: "Already have an account! ",
                text2: "Sign In",
              ),
              const SizedBox(height: 26,),
              const CustomAuthORWidget(),
              AuthSocialsWidget(
                facebookOnPressed: (){},
                googleOnPressed: (){},
                twitterOnPressed: (){},
                githubOnPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

