import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_in_controller.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_logo.dart';
import 'package:shop_savvy/view/widget/auth/auth_nav_button.dart';
import 'package:shop_savvy/view/widget/auth/auth_or_widget.dart';
import 'package:shop_savvy/view/widget/auth/auth_socials.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form.dart';
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
          "Sign In",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
        child: ListView(
          children: [
            const AuthLogo(),
            const SizedBox(
              height: 6,
            ),
            const CustomAuthTitleText(
              text: "Welcome Back",
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomAuthBodyText(
              text:
                  "Sign In with your Email & Password Or Continue With Social Media.",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomAuthTextFormField(
              controller: controller.emailController,
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
            ),
            CustomAuthTextFormField(
              controller: controller.passwordController,
              obscureText: true,
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
            ),
            Text(
              "Forget Password?",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CustomAuthButton(
              onPressed: () {},
              text: "Sign In",
            ),
            const SizedBox(
              height: 10,
            ),
            AuthNavButton(
              onTap: () {
                controller.goToSignUP();
              },
              text1: "Don't have an account? ",
              text2: "Sign Up",
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
    );
  }
}

