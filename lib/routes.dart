import 'package:shop_savvy/view/screen/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shop_savvy/view/screen/auth/sign_up.dart';
import 'package:shop_savvy/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SignIn.routeName :(_)=> const SignIn(),
  SignUp.routeName :(_)=> const SignUp(),
  OnBoarding.routeName :(_)=> const OnBoarding(),
};