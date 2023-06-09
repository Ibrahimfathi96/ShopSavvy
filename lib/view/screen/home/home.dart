import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home/home_controller.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_cashback_widget.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_custom_appbar.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            HomeCustomAppBar(),
            SizedBox(height: 4,),
            HomeCashBackWidget(),
          ],
        ),
      ),
    );
  }
}


