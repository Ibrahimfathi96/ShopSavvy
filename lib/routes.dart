import 'package:shop_savvy/view/screen/auth/forget_password/forget_password.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password_success.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/check_email.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up_successfully.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/verify_code_forget_pass.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/verify_code_sign_up.dart';
import 'package:shop_savvy/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //AUTH
  SignIn.routeName                    :(_)=> const SignIn(),
  SignUp.routeName                    :(_)=> const SignUp(),
  ForgetPassword.routeName            :(_)=> const ForgetPassword(),
  ForgetPasswordVerifyCode.routeName  :(_)=> const ForgetPasswordVerifyCode(),
  SignUpVerifyCode.routeName          :(_)=> const SignUpVerifyCode(),
  ResetPassword.routeName             :(_)=> const ResetPassword(),
  ResetPasswordSuccessfully.routeName :(_)=> const ResetPasswordSuccessfully(),
  SignUpSuccessfully.routeName        :(_)=> const SignUpSuccessfully(),
  CheckEmail.routeName                :(_)=> const CheckEmail(),
  //OnBoarding
  OnBoarding.routeName                :(_)=> const OnBoarding(),
};