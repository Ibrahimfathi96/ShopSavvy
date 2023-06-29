import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/core/functions/handling_data.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/data/data_source/remote/notifications_data.dart';

class NotificationsController extends GetxController {
  MyServices services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  NotificationsData notificationsData = NotificationsData(Get.find());
  List data = [];

  getNotifications() async {
    statusRequest = StatusRequest.loading;
    var response =
        await notificationsData.getData(services.prefs.getString("id")!);
    debugPrint("=============NotificationsGetDataController=======\n$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}
