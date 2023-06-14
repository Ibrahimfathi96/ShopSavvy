import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_screen_controller.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => const Scaffold(
        body: SafeArea(child: HomeBottomNavBar()),
      ),
    );
  }
}

