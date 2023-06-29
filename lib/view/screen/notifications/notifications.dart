import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/notifications_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class NotificationsView extends StatelessWidget {
  static const String routeName = '/notifications';

  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsController controller = Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            ...List.generate(controller.data.length, (index) => Text(controller.data[index]['notifications_title']))
          ],
        ),
      ),
    );
  }
}
