import 'package:get/get.dart';
import 'package:shop_savvy/core/middleware/middleware.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/forget_password.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password_success.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/verify_code_forget_pass.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up_successfully.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/verify_code_sign_up.dart';
import 'package:shop_savvy/view/screen/cart/cart_view.dart';
import 'package:shop_savvy/view/screen/home/home_body.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';
import 'package:shop_savvy/view/screen/items/items_view.dart';
import 'package:shop_savvy/view/screen/languages_view.dart';
import 'package:shop_savvy/view/screen/my_favorite.dart';
import 'package:shop_savvy/view/screen/onboarding_view.dart';
import 'package:shop_savvy/view/screen/product_details/product_details.dart';
import 'package:shop_savvy/view/screen/settings/settings.dart';

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
  GetPage(name: ProductDetails.routeName, page: () => const ProductDetails()),
  //Settings
  GetPage(name: SettingsView.routeName, page: () => const SettingsView()),
  //Favorite
  GetPage(name: MyFavoriteView.routeName, page: () => const MyFavoriteView()),
  //Cart
  GetPage(name: CartView.routeName, page: () => const CartView()),
];
