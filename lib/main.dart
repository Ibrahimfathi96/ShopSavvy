import 'package:ecommerce_application/core/constants/color.dart';
import 'package:ecommerce_application/routes.dart';
import 'package:ecommerce_application/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const ShopSavvy());
}

class ShopSavvy extends StatelessWidget {
  const ShopSavvy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopSavvy',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "RobotoMono",
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            height: 2,
            fontSize: 18,
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const OnBoarding(),
      routes: routes,
    );
  }
}
