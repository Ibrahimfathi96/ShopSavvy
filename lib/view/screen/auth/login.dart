import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_logo.dart';
import 'package:shop_savvy/view/widget/auth/auth_nav_button.dart';
import 'package:shop_savvy/view/widget/auth/auth_or_widget.dart';
import 'package:shop_savvy/view/widget/auth/auth_socials.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';

class LoginScreen extends StatelessWidget {
  // final TextEditingController emailController = TextEditingController();
  static const String routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const CustomAuthTextFormField(
              // controller: emailController,
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
            ),
            const CustomAuthTextFormField(
              // controller: emailController,
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
              onTap: () {},
              text1: "Don't have an account? ",
              text2: "Sign Up",
            ),
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

