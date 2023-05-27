import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_in_controller.dart';

class AuthForgetPassword extends StatelessWidget {
  const AuthForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return GestureDetector(
      onTap: (){
        controller.goToForgetPassword();
      },
      child: Text(
        "19".tr,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
