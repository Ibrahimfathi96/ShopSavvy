import 'package:shop_savvy/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shop_savvy/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName :(_)=> const LoginScreen(),
  OnBoarding.routeName :(_)=> const OnBoarding(),
};