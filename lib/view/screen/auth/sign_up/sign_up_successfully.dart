import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_up_controller.dart';
import 'package:shop_savvy/view/widget/auth/cutom_auth_button.dart';

class SignUpSuccessfully extends StatelessWidget {
  static const String routeName = '/sign-up-successfully';

  const SignUpSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Signed-Up Successfully",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2,),
            const Icon(
              Icons.check_circle_outline_outlined,
              size: 200,
              color: Colors.deepOrangeAccent,
            ),
            const Text(
              "Email Verified Successfully.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            const Spacer(flex: 8,),
            CustomAuthButton(
              text: "Go To Sign-In",
              onPressed: () {
                controller.goToSignIn();
              },
            ),
            const Spacer(flex: 2,)
          ],
        ),
      ),
    );
  }
}
