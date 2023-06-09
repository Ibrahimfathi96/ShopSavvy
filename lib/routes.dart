import 'package:get/get.dart';
import 'package:shop_savvy/core/middleware/middleware.dart';
import 'package:shop_savvy/view/screen/auth_view/forget_password/forget_password.dart';
import 'package:shop_savvy/view/screen/auth_view/forget_password/reset_password.dart';
import 'package:shop_savvy/view/screen/auth_view/forget_password/reset_password_success.dart';
import 'package:shop_savvy/view/screen/auth_view/forget_password/verify_code_forget_pass.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_in.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_up/sign_up.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_up/sign_up_successfully.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_up/verify_code_sign_up.dart';
import 'package:shop_savvy/view/screen/home_view/home_body.dart';
import 'package:shop_savvy/view/screen/home_view/home_screen.dart';
import 'package:shop_savvy/view/screen/items_view/items.dart';
import 'package:shop_savvy/view/screen/languages_view.dart';
import 'package:shop_savvy/view/screen/onboarding_view.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: Language.routeName, page: () => const Language(), middlewares: [
    MyMiddleWare(),
  ]),
  // GetPage(name: TestView.routeName, page: () => const TestView()),
  //AUTH
  GetPage(name: SignIn.routeName, page: () => const SignIn()),
  GetPage(name: SignUp.routeName, page: () => const SignUp()),
  GetPage(name: ForgetPassword.routeName, page: () => const ForgetPassword()),
  GetPage(
      name: ForgetPasswordVerifyCode.routeName,
      page: () => const ForgetPasswordVerifyCode()),
  GetPage(
      name: SignUpVerifyCode.routeName, page: () => const SignUpVerifyCode()),
  GetPage(name: ResetPassword.routeName, page: () => const ResetPassword()),
  GetPage(
      name: ResetPasswordSuccessfully.routeName,
      page: () => const ResetPasswordSuccessfully()),
  GetPage(
      name: SignUpSuccessfully.routeName,
      page: () => const SignUpSuccessfully()),
  //OnBoarding
  GetPage(name: OnBoarding.routeName, page: () => const OnBoarding()),
  //Home
  GetPage(name: HomeBody.routeName, page: () => const HomeBody()),
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  //items
  GetPage(name: ItemsView.routeName, page: () => const ItemsView()),
];
