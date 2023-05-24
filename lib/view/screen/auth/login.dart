import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/auth/auth_body_text.dart';
import 'package:shop_savvy/view/widget/auth/auth_title_text.dart';
import 'package:shop_savvy/view/widget/auth/custom_text_form.dart';

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
          children: const [
            SizedBox(
              height: 20,
            ),
            CustomAuthTitleText(
              text: "Welcome Back",
            ),
            SizedBox(
              height: 10,
            ),
            CustomAuthBodyText(
              text:
                  "Sign In with your Email & Password Or Continue With Social Media.",
            ),
            SizedBox(
              height: 65,
            ),
            CustomAuthTextFormField(
              // controller: emailController,
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
            ),
            CustomAuthTextFormField(
              // controller: emailController,
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
