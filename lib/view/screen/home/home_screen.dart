import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_screen_controller.dart';
import 'package:shop_savvy/core/functions/exit_app_alert.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_bottom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          bottomNavigationBar: const CustomHomeBottomAppBar(),
          body: SafeArea(
            child: WillPopScope(
              onWillPop: exitAppAlertDialog,
              child: controller.pagesList[controller.currentPage],
            ),
          ),
        ),
      ),
    );
  }
}
