import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shop_savvy/controller/notifications_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/notifications_widgets/notifications_item.dart';

class NotificationsView extends StatelessWidget {
  static const String routeName = '/notifications';

  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: GetBuilder<NotificationsController>(
        builder: (controller) => Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ...List.generate(
                controller.data.length,
                (index) => NotificationItem(
                  title: "${controller.data[index]['notifications_title']}",
                  subTitle: "${controller.data[index]['notifications_body']}",
                  dateTime:
                      "${Jiffy.parse(controller.data[index]['notifications_datetime']).fromNow()}",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
